
# Load packages

#+ load, warning=F, message=F

library(devtools)
library(dplyr)
library(tidyr)
library(reshape2)
library(XML)
library(readxl)
library(haven)

### Read data ###

# iso 3 letter country designations
# https://github.com/lukes/ISO-3166-Countries-with-Regional-Codes/tree/master/slim-3

iso3 = read.csv("data-raw/slim-3.csv", stringsAsFactors=FALSE)
iso3 = dplyr::rename(iso3, iso3=alpha.3)

# Developing countries as defined in the GBD studies
dev = read.csv('data-raw/region_country_developing.csv', stringsAsFactors=FALSE)
dev = left_join(dev, iso3, by=c('country'='name'))

# Total fertility rates

tfr2015 = read_excel('data-raw/WPP2015_FERT_F04_TOTAL_FERTILITY.XLS', skip = 16)
tfr2015$Index <- NULL
tfr2015$Variant <- NULL
tfr2015$Notes <- NULL

names(tfr2015) <- c('country', 'iso_code', paste0('tfr', seq(1950, 2010, 5)))

tfr2015 <-
    tfr2015 %>%
    filter(iso_code %in% iso3$country.code) %>% # Strip regional values (e.g. "Africa")
    left_join(iso3[, -1], by=c('iso_code'='country.code')) # Add iso3 codes

# Missing TFR values for 2010-2015
# Andorra: 1.3 (http://data.un.org/CountryProfile.aspx?crName=Andorra)
# Dominica: 2.04 (https://www.cia.gov/library/publications/the-world-factbook/geos/do.html)
# Marshall Islands: 4.50 births per woman (2007)

# Convert to long
tfr2015long <-
    tfr2015 %>%
    dplyr::select(tfr1950:tfr2005, iso3) %>%
    gather(year, tfr, tfr1950:tfr2005) %>%
    mutate(year = extract_numeric(year))

# Age specific fertility rates

asfr2015 = read_excel('data-raw/WPP2015_FERT_F07_AGE_SPECIFIC_FERTILITY.XLS', skip = 16)
asfr2015$Variant <- NULL
asfr2015$Index <- NULL
asfr2015$Notes <- NULL

names(asfr2015)[1:3] <- c('country', 'iso_code', 'year')

asfr2015 <-
    asfr2015 %>%
    filter(iso_code %in% iso3$country.code) %>% # Strip regional values (e.g. "Africa")
    left_join(iso3[, -1], by=c('iso_code'='country.code')) # Add iso3 codes

# Breastfeeding

breastfeeding2010_2015 = read_excel('data-raw/IYCF website with aggregates Nov 2015 submitted_653edc.xlsx', skip = 8)
breastfeeding2010_2015 <- breastfeeding2010_2015[c(2:5, 16:17, 20:21, 24:25, 28:29, 32:33, 43:44, 56:57)]

names(breastfeeding2010_2015) <-
    c(
        'iso3',
        'country',
        'year_initial',
        'percent_initial',
        'year_6_months',
        'percent_6_months',
        'year_food_intro',
        'percent_food_intro',
        'year_1_year',
        'percent_1_year',
        'year_2_year',
        'percent_2_year',
        'year_min_accept',
        'percent_min_accept',
        'year_min_diverse',
        'percent_min_diverse',
        'year_min_freq',
        'percent_min_freq'
    )
breastfeeding2010_2015 <- filter(breastfeeding2010_2015, iso3 %in% iso3$iso3)

# Write data
use_data(iso3, dev, tfr2015, tfr2015long, asfr2015, breastfeeding2010_2015, overwrite = T)


# World Bank data

doc = xmlRoot(xmlTreeParse("Data/world.bank.countries.xml"))
tmp = xmlSApply(doc, function(x) xmlSApply(x, xmlValue))
tmp = t(tmp)
row.names(tmp) = NULL
vars = colnames(tmp)
tmp.d = dim(tmp)
tmp = as.character(tmp)
dim(tmp) = tmp.d
colnames(tmp) = vars
worldbank = as.data.frame(tmp, stringsAsFactors=F)

worldbank$latitude = as.numeric(worldbank$latitude)
worldbank$longitude = as.numeric(worldbank$longitude)
worldbank = dplyr::rename(worldbank, iso2=iso2Code)

# Strip out "aggregates", e.g., Latin America, Africa
worldbank = worldbank[worldbank$region!='Aggregates',]

# Geonames data

geonames = read.csv('Data/geonames.org.country.info.csv', na.strings='', stringsAsFactors=FALSE)
geonames = dplyr::rename(geonames, iso2=alpha2, iso3=alpha3)

# Add iso3 to worldbank
worldbank = left_join(worldbank, geonames[,c('iso2', 'iso3')])

lat.long = worldbank[,c('iso2', 'iso3', 'latitude', 'longitude')]

# Add lat, long for Taiwan (new) and Palestine (missing)
google.lat.long = read.csv('Data/Country Lat Long Google.csv', stringsAsFactors=FALSE, na.strings='')

palestine = google.lat.long[google.lat.long$country=='PS',]
lat.long$latitude[lat.long$iso2=='PS'] = palestine$latitude
lat.long$longitude[lat.long$iso2=='PS'] = palestine$longitude

taiwan = google.lat.long[google.lat.long$country=='TW',]
lat.long = rbind(lat.long, list('TW', 'TWN', taiwan$latitude, taiwan$longitude))

# Edited these country names so they were the same in both files

# [1] "BHS Bahamas"
# [1] "BRN Brunei Darussalam"
# [1] "CIV C̫te d'Ivoire"
# [1] "COD Democratic Republic of Congo"
# [1] "GMB Gambia"
# [1] "KOR Korea"
# [1] "LAO Lao People's Democratic Republic"
# [1] "MDA Republic of Moldova"
# [1] "PRK Democratic Peoples Republic of Korea"
# [1] "RUS Russian Federation"
# [1] "SYR Syrian Arab Republic"
# [1] "VNM Viet Nam"


# Separate Oceania into separate 'super region'
dev$gbd.super.region.2 = as.character(dev$gbd.super.region)
dev$gbd.super.region.2[dev$region=='Oceania'] = 'Oceania'
dev$gbd.super.region.2[dev$gbd.super.region.2=='Southeast Asia-East Asia-Oceania'] = 'Southeast Asia-East Asia'

# Our reference smoking data

age_sex_prev = read.csv('Data/UW_Age_sex tobacco prevalence.csv', stringsAsFactors=FALSE)

# http://ghdx.healthdata.org/record/global-smoking-prevalence-and-cigarette-consumption-1980-2012
# http://www.healthdata.org/sites/default/files/files/data_for_download/2014/Tobacco_January_2014_data.xlsx

ng_age = read.csv("Data/prevalence.age.csv", stringsAsFactors=FALSE)
ng <- read.delim("Data/Ng_Tobacco_January_2014_data.txt", quote="", stringsAsFactors=FALSE)
ng = rename(ng, iso3=iso)
ng = merge(ng, dev[,-3], by='iso3') # remove country from dev


# Numerous data sets compiled by Melissa
d = read.delim('Data/Data collaboration/Data_collaboration_hagen.tsv', na.strings=c('.', '', ' ', '?'), stringsAsFactors=FALSE)

# Remove 2 unknown countries and 5 unofficial countries
d$countries[is.na(d$iso_code)]
d = d[!is.na(d$iso_code),]
# heatmap(is.na(d) * 1, scale='none') # Red is non-missing

# Convert factor to numeric (set "<1" = 0)

less_to_zero = function(x){

    x = as.character(x)
    x[x=='<1'] = '0'
    as.numeric(x)

}

d$Female_current_cigarette_use_tobacco_atlas = less_to_zero(d$Female_current_cigarette_use_tobacco_atlas)
d$Female_current_tobacco_products_WHO = less_to_zero(d$Female_current_tobacco_products_WHO)
d$Female_daily_use_WHO = less_to_zero(d$Female_daily_use_WHO)
d$Smokingprevalence_female_AUS = less_to_zero(d$Smokingprevalence_female_AUS)
d$Female_current_tobacco_use_tobacco_atlas = less_to_zero(d$Female_current_tobacco_use_tobacco_atlas)
d$Female_current_cigarette_WHO = less_to_zero(d$Female_current_cigarette_WHO)
d$Female_daily_cigarette_WHO = less_to_zero(d$Female_daily_cigarette_WHO)
d$Female_current_tobacco_products_new = less_to_zero(d$Female_current_tobacco_products_new)
d$Female_current_tobacco_products_new2 = less_to_zero(d$Female_current_tobacco_products_new2)

d = merge(d, iso, by.x='iso_code', by.y='country.code', all=T)

# Demographic data

bf = read.csv('Data/Worldbank breastfeeding sh.sta.bfed.zs_Indicator_en_csv_v2//most_recent_breastfeeding.csv', stringsAsFactors=FALSE)
birthcontrol = read.csv('Data/birthcontrol.csv', stringsAsFactors=FALSE)

#

tfr.1 = tfr %>%
    dplyr::select(tfr1980:tfr2005, iso3) %>%
    gather(year, tfr, tfr1980:tfr2005) %>%
    mutate(year = extract_numeric(year))

tfr.2 = tfr %>%
    dplyr::select(tfr1950:tfr1975, iso3) %>%
    gather(lag, tfr.lag, tfr1950:tfr1975) %>%
    mutate(lag = extract_numeric(lag)) %>%
    mutate(year = lag+30)

tfr.long = left_join(tfr.1, tfr.2)

# Merge tfr with ng

ng = left_join(ng, dplyr::select(tfr, tfr1950:tfr2005, iso3), by='iso3')

# Under 5 mortality rate

colnames = c('iso', 'country', 'quantile', paste('mr', (1950:2012 + .5), sep=''))
u5mr = read.csv('Data/U5MR.csv', stringsAsFactors=FALSE, col.names=colnames)
u5mr$quantile = NULL

# Data for Taiwan
# http://www.hpa.gov.tw/English/file/ContentFile/201306210517437956/Health%20Promotion%20in%20Taiwan.pdf
# Under 5 mortality rate = 6.3/1000 (year not clear: late 2000's)
# This value NOT entered in u5mr data frame

# Convert to long
u5mr = dplyr::rename(u5mr, iso3 = iso)

u5mr.1 = u5mr %>%
    dplyr::select(iso3, mr1985.5:mr2010.5) %>%
    gather(year, u5mr, -iso3) %>%
    mutate(year = extract_numeric(year))

u5mr.2 = u5mr %>%
    dplyr::select(iso3, mr1955.5:mr1980.5) %>%
    gather(lag, u5mr.lag, -iso3) %>%
    mutate(lag = extract_numeric(lag)) %>%
    mutate(year = lag+30)

u5mr.long = left_join(u5mr.1, u5mr.2)
u5mr.long$year = as.integer(u5mr.long$year)
u5mr.long$lag = as.integer(u5mr.long$lag)

# Age at first birth

age_first_birth <- read_excel('Data/TABLE A.6. Mean age at first birth.xlsx', skip=2, na='..')
age_first_birth <- age_first_birth[1:5]
age_first_birth <- rename(age_first_birth, country.code=`ISO code`)
age_first_birth <- left_join(age_first_birth, iso[c('iso3', 'country.code')], by='country.code')

# merge with age_sex_prev

asp = age_sex_prev %>%
    filter(year %in% seq(1985,2010,5), age_group==30) %>%
    left_join(u5mr.long, by=c('iso3', 'year')) %>%
    mutate(year=year-5) %>% # To match coding of year in tfr data, where fertility is across a 5-year period
    left_join(tfr.long, by=c('iso3', 'year')) %>%
    left_join(dev[,c('iso3', 'developing', 'gbd.super.region', 'gbd.super.region.2', 'region')], by='iso3') %>%
    left_join(lat.long, by='iso3') %>%
    dplyr::select(iso3, year, sex, mean, tfr, tfr.lag, u5mr, u5mr.lag, developing, gbd.super.region, gbd.super.region.2, region)

asp$fyear = factor(asp$year)
asp$developing = factor(asp$developing)
asp$gbd.super.region = factor(asp$gbd.super.region)
asp$gbd.super.region.2 = factor(asp$gbd.super.region.2)
asp$iso3 = factor(asp$iso3)
asp$sex = factor(asp$sex)

# CIRI human rights data
# -999 Missing; -77 collapse of political authority; -66 e.g., occupation

# Several countries have same UNCTRY but different CTRY, e.g.
# Czechoslovakia (1981-1992) and Czech Republic (1993-2011)
# Yemen Arab Republic (1981-1990) and Yemen (1991-2011)
# Serbia and Montenegro, Yugoslavia, "Yugoslavia, Federal Republic of"

# Four countries do not have UNCTRY:
# Kosovo, Soviet Union, Taiwan, Yemen, South

ciri = read.csv('Data/CIRI.csv', stringsAsFactors=FALSE, na.strings=c('-999', '-66', '-77'))

ciri.2 = ciri[!is.na(ciri$UNCTRY),c('YEAR', 'UNCTRY', 'WECON', 'WOPOL')]
ciri.2 = left_join(ciri.2, iso[,-1], by=c('UNCTRY'='country.code'))
ciri.2010 = na.omit(ciri.2[ciri.2$YEAR==2010,])
ciri.2011 = na.omit(ciri.2[ciri.2$YEAR==2011,-(1:2)])
# tmp = melt(ciri.2, id.vars=c('UNCTRY', 'YEAR', 'iso3'), measure.vars=c('WECON', 'WOPOL'))
# ciri.wide = dcast(tmp, UNCTRY ~ variable + YEAR) # Two rows have NA countries

# Another gender inequality measure
gggi = read.csv('Data/GGGI_2014.csv', stringsAsFactors=FALSE)

# Gender empowerment measure 2009
gem = read.csv('Data/gem2009.csv', stringsAsFactors=FALSE)

# Add gender inequality measures to ng
ng = left_join(ng, ciri.2011)
ng = left_join(ng, gggi[,-1]) # Omit country name
ng = left_join(ng, gem[,-c(1,4)]) # Omit country name and code


# Cross-sectional analysis of 2010 smoking (called 2005 to match tfr 2005-2010)
asp2005 = filter(asp, year==2005)

# Add lat, long

asp2005 = left_join(asp2005, lat.long, by=c('iso3'='iso3'))

# Add women's economic and political rights for 2010

asp2005 = left_join(asp2005, ciri.2[ciri.2$YEAR==2010,], by='iso3')
asp2005$fWECON = factor(asp2005$WECON)
asp2005$fWOPOL = factor(asp2005$WOPOL)

asp2005 = left_join(asp2005, gem[,c('iso3', 'gem')], by='iso3')
asp2005 = left_join(asp2005, gggi[,c('iso3', 'GGGI')], by='iso3')

asp2005.2 = asp2005 # Make copy
asp2005.2$u5mr.lag = NULL # Lots of missing values
asp2005.2$gem = NULL # Lots of missing values
asp2005.2$GGGI = NULL
asp2005.2 = na.omit(asp2005.2)

asp2005.2$longitude[asp2005.2$iso3=='TON'] = 185 # Because Tonga is an outlier on longitude

# Model female prevalence controlling for male prevalence
asp2005.wide = spread(asp2005.2, sex, mean)

## Data to update Hitchman and Fong to 2012

who2008 = read_excel('Data/WHO smoking 2008.xlsx', na='. . .')
who2008$GSR = who2008$female/who2008$male
gini2012 = read_excel('Data/GINI World Bank 2.9_Distribution_of_income_or_consumption.xlsx', na='..')
gni = read_excel('Data/ny.gnp.pcap.pp.cd_Indicator_en_excel_v2.xls', sheet='Data', skip=3)
gni = rename(gni, iso3=`Country Code`)

# Some GNI PPP data are missing in the World Bank table, but available from
# other organizations for 2011
#
# Andora 2011: 43977.8 (http://hdr.undp.org/en/countries/profiles/AND)
# Argentina 2011: 22049.6 (http://hdr.undp.org/en/countries/profiles/ARG)
# Cuba 2011: 7301 (http://hdr.undp.org/en/countries/profiles/CUB)
# Djibouti: 3276.2 (http://hdr.undp.org/en/countries/profiles/DJI)
# Myanmar: 4607.7 (http://hdr.undp.org/en/countries/profiles/MMR)
# North Korea: NA
# Somalia: NA
# Syria: 2728.2 (http://hdr.undp.org/en/countries/profiles/SYR)
# Taiwan: 40777.48 (http://www.indexmundi.com/taiwan/gdp_per_capita_(ppp).html)

# missing_gni_iso <- c("AND", "ARG", "CUB", "DJI", "MMR", "PRK", "SOM", "SYR", "TWN")
# missing_gni <- c(43977.8, 22049.6, 7301, 3276.2, 4607.7, NA, NA, 2728.2, 40777.48)
# gni$`2012`[which(gni$iso3 %in% missing_gni_iso)] <- missing_gni

hf = left_join(who2008, gini2012[,-1], by='iso3')
hf = left_join(hf, gni[,c('iso3', '2008')], by='iso3')
hf = left_join(hf, gem[,2:3], by='iso3')
hf = left_join(hf, tfr[,c('iso3', 'tfr1975', 'tfr2005')])
hf = rename(hf, GNI2008=`2008`, GEM=gem, TFR1980=tfr1975, TFR2010=tfr2005)

hf.long = gather(hf, key=Sex, value=Prevalence2008, male, female)

# Hitchman and Fong data file

HF = read_sav('Data/hitchman.gem.sav')
iso.hitchman = read.csv('Data/iso.hitchman.csv', stringsAsFactors = F)

HF = left_join(HF, iso.hitchman)
HF$iso3[44] = 'CIV' # Ivory Coast

# Add TFR to HF
HF = left_join(HF, tfr[,c('iso3', 'tfr1975', 'tfr2005')])
HF = rename(HF, TFR1980=tfr1975, TFR2010=tfr2005, GEM=Gemp_2006, GNI2008=GNI_PPP, Male=MSmk_C, Female=FSmk_C)

HF.long = gather(HF, key=Sex, value=Prevalence2008, Male, Female)
HF.long$Sex = factor(HF.long$Sex, levels=c('Female', 'Male'))

# ### Looking for discrepancies ###
#
# # GSR
# gsr1 = (na.omit(hf$GSR))
# gsr2 = (na.omit(HF$GSR))
#
# # No real difference
# summary(sort(gsr1) - sort(gsr2))
#
# # GEM
# gem1 = na.omit(hf$GEM)
# gem2 = na.omit(HF$Gemp_2006)
#
# # No real difference
# summary(sort(gem1) - sort(gem2))
#
# # GNI
#
# gni.tmp = left_join(gni, HF[,c('iso3', 'GNI_PPP')])
#
# ### DONE with discrepancies ###

# Add GINI and GNI to ng

ng = left_join(ng, gini2012[,-1])
ng = left_join(ng, gni[,c('iso3', '2012')])
ng = rename(ng, GNI2012=`2012`, GEM=gem, TFR1980=tfr1975, TFR2010=tfr2005)

# Convert ng to long

ng.long = ng %>%
    dplyr::select(iso3, f2012, m2012, region, gbd.super.region, gbd.super.region.2, developing, TFR1980, TFR2010, WECON, WOPOL, GGGI, GEM, GINI2012, GNI2012) %>%
    dplyr::rename(male=m2012, female=f2012) %>%
    mutate(developing = factor(developing)) %>%
    gather(key=Sex, value=Prevalence2012, female, male) %>%
    mutate(Sex=factor(Sex))

ng.long2 <- gather(ng.long, key=TFR_YEAR, value=TFR, TFR1980, TFR2010)

# Create asp.wide, which has pre- and postmenopausal smoking prevalence
asp.wide = age_sex_prev %>%
    filter(year==2012) %>% # To match f2012 and m2012 from Ng et al. 2014
    #     mutate(logmean=log10(mean)) %>%
    dplyr::select(iso3, sex, age_group, mean) %>%
    spread(age_group, mean) %>%
    left_join(dev[,c('iso3', 'developing', 'gbd.super.region', 'gbd.super.region.2', 'region')], by='iso3') %>%
    left_join(tfr[,c('iso3', 'tfr1975', 'tfr2005')], by='iso3') %>%
    rename(TFR1980=tfr1975, TFR2010=tfr2005) %>%
    left_join(ciri.2011[,c('iso3', 'WECON', 'WOPOL')], by='iso3') %>%
    left_join(gggi[,c('iso3', 'GGGI')]) %>%
    left_join(gem[,c('iso3', 'gem')]) %>%
    rename(GEM=gem) %>%
    left_join(gni[,c('iso3', '2012')]) %>%
    rename(GNI2012=`2012`) %>%
    left_join(gini2012[,-1])

asp.wide$Sex = factor(asp.wide$sex)
asp.wide$developing = factor(asp.wide$developing, labels = c('Developed', 'Developing'))

# rename columns
cn = colnames(asp.wide)
cn[3:18] = paste('y', cn[3:18], sep='')
colnames(asp.wide) = cn

# Compare smoking at age 45/50 to age 25/30

asp.wide = asp.wide %>%
    mutate(premenopause = 100*(y25+y30+y35)/3, postmenopause = 100*(y45+y50+y55)/3)
