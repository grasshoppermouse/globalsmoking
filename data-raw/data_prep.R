
# Load packages

#+ load, warning=F, message=F

library(devtools)
library(tidyverse)
library(reshape2)
library(XML)
library(readxl)
library(haven)
library(countrycode)

### Read data ###

# iso 2 and 3 letter country designations
# https://github.com/lukes/ISO-3166-Countries-with-Regional-Codes/tree/master/slim-3

iso2 <- read.csv("data-raw/slim-2.csv", stringsAsFactors=FALSE)
iso2 <- dplyr::rename(iso2, iso2=alpha.2)

iso3 <- read.csv("data-raw/slim-3.csv", stringsAsFactors=FALSE)
iso3 <- dplyr::rename(iso3, iso3=alpha.3)

iso3 <- left_join(iso3, iso2[-1]) %>% select(name, country.code, iso2, iso3)

# Developing countries as defined in the GBD studies
developing <- read.csv('data-raw/region_country_developing.csv', stringsAsFactors=FALSE)

developing$iso3 <- countrycode(developing$country, 'country.name', 'iso3c')

# Our reference smoking data

smoking_age_sex <- read_excel('data-raw/UW_Age_sex tobacco prevalence.xlsx')

# http://ghdx.healthdata.org/record/global-smoking-prevalence-and-cigarette-consumption-1980-2012
# http://www.healthdata.org/sites/default/files/files/data_for_download/2014/Tobacco_January_2014_data.xlsx

ng_smoking <- read.delim("data-raw/Ng_Tobacco_January_2014_data.txt", quote="", stringsAsFactors=FALSE)
ng_smoking = rename(ng_smoking, iso3=iso)

# Total fertility rates

tfr = read_excel('data-raw/WPP2015_FERT_F04_TOTAL_FERTILITY.XLS', skip = 16)
tfr$Index <- NULL
tfr$Variant <- NULL
tfr$Notes <- NULL

names(tfr) <- c('country', 'iso_code', paste0('tfr', seq(1950, 2010, 5)))

# Start using countrycode package instead of iso3 data frame. Haven't converting everything yet.

tfr$iso3 <- countrycode(tfr$iso_code, 'un', 'iso3c')

# Taiwan is listed as "Other non-specified areas"
tfr$country[tfr$country == "Other non-specified areas"] <- 'Taiwan'
tfr$iso3[tfr$country == 'Taiwan'] <- countrycode('Taiwan', 'country.name', 'iso3c')

tfr <-
    tfr %>%
    dplyr::filter(!is.na(iso3)) %>%
    dplyr::select(country, iso3, tfr1950:tfr2010)

# Old
# tfr2 <-
#     tfr %>%
#     filter(iso_code %in% iso3$country.code) %>% # Strip regional values (e.g. "Africa")
#     left_join(iso3[, -1], by=c('iso_code'='country.code')) %>% # Add iso3 codes
#     dplyr::select(country, iso3, tfr1950:tfr2010)

# Missing TFR values for 2010-2015
# Andorra: 1.3 (http://data.un.org/CountryProfile.aspx?crName=Andorra)
# Dominica: 2.04 (https://www.cia.gov/library/publications/the-world-factbook/geos/do.html)
# Marshall Islands: 4.50 births per woman (2007)

# Convert to long
tfrlong <-
    tfr %>%
    dplyr::select(tfr1950:tfr2005, iso3) %>%
    gather(year, tfr, tfr1950:tfr2005) %>%
    mutate(year = extract_numeric(year))

# Age specific fertility rates 1950-2015

asfr = read_excel('data-raw/WPP2015_FERT_F07_AGE_SPECIFIC_FERTILITY.XLS', skip = 16)
asfr$Variant <- NULL
asfr$Index <- NULL
asfr$Notes <- NULL

names(asfr)[1:3] <- c('country', 'iso_code', 'year')

asfr$iso3 <- countrycode(asfr$iso_code, 'un', 'iso3c')

# Taiwan is listed as "Other non-specified areas"
asfr$country[asfr$country == "Other non-specified areas"] <- 'Taiwan'
asfr$iso3[asfr$country == 'Taiwan'] <- countrycode('Taiwan', 'country.name', 'iso3c')

asfr <- dplyr::filter(asfr, !is.na(iso3))

# Old
# asfr <-
#     asfr %>%
#     filter(iso_code %in% iso3$country.code) %>% # Strip regional values (e.g. "Africa")
#     left_join(iso3[, -1], by=c('iso_code'='country.code')) # Add iso3 codes

# Breastfeeding

breastfeeding = read_excel('data-raw/IYCF website with aggregates Nov 2015 submitted_653edc.xlsx', skip = 8)
breastfeeding <- breastfeeding[c(2:5, 16:17, 20:21, 24:25, 28:29, 32:33, 43:44, 56:57)]

names(breastfeeding) <-
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
breastfeeding <- filter(breastfeeding, iso3 %in% iso3$iso3)

# Contraceptive use

contraception_any <- read_excel('data-raw/Table_Model-based_estimates_Countries_Run20150423.xls', sheet = 3, skip = 3)
contraception_modern <- read_excel('data-raw/Table_Model-based_estimates_Countries_Run20150423.xls', sheet = 4, skip = 3)
contraception_traditional <- read_excel('data-raw/Table_Model-based_estimates_Countries_Run20150423.xls', sheet = 5, skip = 3)

contraception_any$type <- 'any'
contraception_modern$type <- 'modern'
contraception_traditional$type <- 'traditional'

contraception <- rbind(contraception_any, contraception_modern, contraception_traditional)

names(contraception) <- c('country', 'country.code', 'estimate', paste0('bc', 1970:2030), 'type')
contraception <- dplyr::filter(contraception, estimate=='MEDIAN ESTIMATE')
contraception$estimate <- NULL
contraception <- left_join(contraception, iso3[-1])
contraception$country.code <- NULL
contraception <- contraception[c('country', 'iso3', 'type', paste0('bc', 1970:2030))]

country_centroids <-
    read_tsv('data-raw/country_centroids/country_centroids_primary.csv') %>%
    filter(FIPS10 != 'GZ') %>% # To avoid duplicated iso3 code, filter out Gaza Strip; use West Bank instead
    left_join(iso3, by=c('ISO3136'='iso2')) %>%
    dplyr::select(name, iso3, LAT, LONG)

# Infant mortality

infantmortality <-
    read_excel('data-raw/WPP2015_MORT_F01_1_IMR_BOTH_SEXES.XLS', sheet = 1, skip = 16) %>%
    left_join(iso3[c('country.code', 'iso3')], by=c('Country code' = 'country.code')) %>%
    filter(!is.na(iso3)) %>%
    select(country = `Major area, region, country or area *`, iso3, `1950-1955`:`2010-2015`)
names(infantmortality) <- c('country', 'iso3', paste0('im', seq(1950, 2010, 5)))

# Child mortality

u5mortality <-
    read_excel('data-raw/WPP2015_MORT_F01_2_Q5_BOTH_SEXES.XLS', sheet = 1, skip = 16) %>%
    left_join(iso3[c('country.code', 'iso3')], by=c('Country code' = 'country.code')) %>%
    filter(!is.na(iso3)) %>%
    select(country = `Major area, region, country or area *`, iso3, `1950-1955`:`2010-2015`)
names(u5mortality) <- c('country', 'iso3', paste0('u5m', seq(1950, 2010, 5)))

# Age at first birth

age_first_birth <- read_excel('data-raw/TABLE A.6. Mean age at first birth.xlsx', skip=2, na='..')
age_first_birth <- age_first_birth[1:5]
age_first_birth <-
    age_first_birth %>%
    left_join(iso3[c('iso3', 'country.code')], by = c('ISO code' = 'country.code')) %>%
    select(country = Country, iso3, period = Period, year_original = Year, age_first_birth = `Mean age at first birth`) %>%
    filter(!is.na(iso3))

# Recode year_original to avoid two year ranges, e.g., 1975-1976
# Choose either first or last year of range
# Choose year ending in 0 or 5, if possible, 1975-1976 -> 1975

age_first_birth <-
    within(age_first_birth, {
        year <- year_original
        year[year == '1975-1976'] <- '1975'
        year[year == '1976-1977'] <- '1976'
        year[year == '1977-1978'] <- '1978'
        year[year == '1979-1980'] <- '1980'
        year[year == '1980-1981'] <- '1980'
        year[year == '1981-1982'] <- '1982'
        year[year == '1988-1989'] <- '1988'
        year[year == '1989-1990'] <- '1990'
        year[year == '1990-1991'] <- '1990'
        year[year == '1992-1993'] <- '1993'
        year[year == '1994-1995'] <- '1995'
        year[year == '1995-1996'] <- '1995'
        year[year == '1996-1997'] <- '1997'
        year[year == '1998-1999'] <- '1999'
        year[year == '2000-2001'] <- '2000'
        year[year == '2003-2004'] <- '2004'
        year[year == '2005-2006'] <- '2005'
        year[year == '2006-2007'] <- '2007'
        year[year == '2007-2008'] <- '2008'
        year[year == '2008-2009'] <- '2009'
        year[year == '2009-2010'] <- '2010'
        year[year == '2010-2011'] <- '2010'
        year <- as.integer(year)
    })

# CIRI human rights data
# -999 Missing; -77 collapse of political authority; -66 e.g., occupation

# Several countries have same UNCTRY but different CTRY, e.g.
# Czechoslovakia (1981-1992) and Czech Republic (1993-2011)
# Yemen Arab Republic (1981-1990) and Yemen (1991-2011)
# Serbia and Montenegro, Yugoslavia, "Yugoslavia, Federal Republic of"

# Four countries do not have UNCTRY:
# Kosovo, Soviet Union, Taiwan, Yemen, South

ciri <-
    read.csv('data-raw/CIRI.csv', stringsAsFactors=FALSE, na.strings=c('-999', '-66', '-77')) %>%
    filter(!is.na(UNCTRY)) %>%
    left_join(iso3[c('country.code', 'iso3')], by=c('UNCTRY'='country.code')) %>%
    select(iso3, YEAR, WECON, WOPOL) %>%
    filter(!is.na(iso3))

# Another gender inequality measure
gggi = read.csv('data-raw/GGGI_2014.csv', stringsAsFactors=FALSE)

# Gender empowerment measure 2009
gem = read.csv('data-raw/gem2009.csv', stringsAsFactors=FALSE)
gem$country.code <- NULL
gem <- gem[c('country', 'iso3', 'gem')]

# Global tobacco production

# land_use <- read_excel('data-raw/Growing-Map.xlsx', sheet = 2, skip = 5)[2:5]
# names(land_use) <- c('country', 'iso3', 'land_use', 'arable_land', 'percent_land_use')

fao_codes <- read_csv('data-raw/FAO country codes.csv')
production <-
    read_csv('data-raw/FAO tobacco production.csv', n_max = 42268) %>%
    left_join(fao_codes[c('ISO3', 'FAOSTAT')], by=c('Country Code' = 'FAOSTAT')) %>%
    select(iso3 = ISO3, 5:6, 10:14)

land <-
    read_csv('data-raw/FAO land area.csv') %>%
    left_join(fao_codes[c('ISO3', 'FAOSTAT')], by=c('Country Code' = 'FAOSTAT')) %>%
    select(iso3 = ISO3, 7,8, 10:14)

# Population by country by year, from 1960 to 2015
# Data from World Bank
# http://data.worldbank.org/indicator/SP.POP.TOTL

population <- read_csv('data-raw/API_SP.POP.TOTL_DS2_en_csv_v2.csv', skip = 4)
population$`2016` <- NULL # No data for 2016
population$X62 <- NULL # X62 due to comma at end of header row

# Country economic data by year, from 1980 - 2021 (Estimated data for very recent and future years)
# From World Economic Outlook database 2016
# http://www.imf.org/external/pubs/ft/weo/2016/02/weodata/WEOOct2016all.xls

weo <- read_tsv('data-raw/WEOOct2016all.xls', na = c('', 'NA', 'n/a', '--'), n_max = 8404)
weo <- dplyr::rename(weo, iso3 = ISO) # To match other data tables

# Create table of subject codes, descriptors, and notes
subject_code_table <-
    weo %>%
    dplyr::filter(iso3 == 'AFG') %>%
    dplyr::select(`WEO Subject Code`, `Subject Descriptor`, `Subject Notes`, `Units`, `Scale`)


# Global Burden of Disease smoking prevalence 1980-2015 -------------------

# http://ghdx.healthdata.org/record/ihme-data/gbd-2015-smoking-prevalence-1980-2015

gbd2015smoking <-
    read_csv('data-raw/IHME_GBD_2015_SMOKING_PREVALENCE_1980_2015_1/IHME_GBD_2015_SMOKING_PREVALENCE_1980_2015_Y2017M04D05.CSV') %>%
    rename(year = year_id) %>%
    mutate(
        iso3 = countrycode(location_name, origin='country.name', destination='iso3c'),
        age_center = 5 * age_group_id - 23
    ) %>%
    dplyr::filter(
        !is.na(iso3),
        age_group_name != 'All Ages'
    ) %>%
    dplyr::select(
        -age_group_id,
        -location_id,
        -sex_id,
        -measure
    ) %>%
    relocate(iso3) %>%
    relocate(age_center, .after = age_group_name) %>%
    relocate(year, .after = location_name)



# Write data
# file.remove(file.path('data', list.files('data'))) # First clear the data directory

use_data(
    iso3,
    developing,
    tfr,
    tfrlong,
    asfr,
    breastfeeding,
    smoking_age_sex,
    ng_smoking,
    contraception,
    country_centroids,
    infantmortality,
    u5mortality,
    age_first_birth,
    ciri,
    gggi,
    gem,
    production,
    land,
    population,
    weo,
    gbd2015smoking,
    overwrite = F
)

stop('Done')

# Quick comparison of gni values
gni_weo_long <-
    weo %>%
    dplyr::filter(`WEO Subject Code` == 'PPPPC') %>%
    dplyr::select(iso3, `1980`:`2016`) %>%
    tidyr::gather(key = year, value = PPPPC, `1980`:`2016`)

gni_long <-
    gni %>%
    dplyr::select(`Country Code`, `1990`:`2014`) %>%
    tidyr::gather(key = year, value = gni, `1990`:`2014`) %>%
    left_join(gni_weo_long, by = c('Country Code' = 'iso3', 'year' = 'year'))

ggplot(gni_long, aes(log(gni), log(PPPPC))) + geom_point()

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
