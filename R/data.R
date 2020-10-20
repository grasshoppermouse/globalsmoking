
#' ISO alpha 3 codes
#'
#' English name, numeric country code and alpha-3 code (e.g., NZL)
#'
#' @format A data frame with 249 rows and 3 variables:
#' \describe{
#'   \item{\code{name}}{character. ISO country name}
#'   \item{\code{iso3}}{character. ISO Alpha 3 code.}
#'   \item{\code{country.code}}{integer. ISO country code.}
#' }
#' @source \url{https://github.com/lukes/ISO-3166-Countries-with-Regional-Codes/tree/master/slim-3}
"iso3"


#' Developing countries 2012
#'
#' Developing countries as defined in the GBD studies, along with regions and super-regions.
#'
#' @format A data frame with 187 rows and 6 variables:
#' \describe{
#'   \item{\code{region}}{character. Global Burden of Disease region.}
#'   \item{\code{gbd.super.region}}{character. Global Burden of Disease super-region}
#'   \item{\code{country}}{character. Country name}
#'   \item{\code{developing}}{logical. Is country developing (T) or developed (F).}
#'   \item{\code{iso3}}{character. ISO Alpha 3.}
#'   \item{\code{country.code}}{integer. ISO country code.}
#' }
"developing"


#' National smoking prevalences by age, sex, and year 1980-2013
#'
#' National smoking prevalences from 1980-2013, by 5-year age
#' groups from 15-99, and by sex. This file was obtained
#' from Murray's group via email request.
#'
#' These are IHME results data from a global analysis of tobacco use
#' published in the Journal of the American Medical Association in January 2014.
#' The study, "Smoking Prevalence and Cigarette Consumption in 187 countries, 1980-2012,"
#' provides smoking prevalence, cigarette consumption, and annual rate of change
#' estimates by country and sex from 1980 to 2012.
#'
#' @format A data frame with 203456 rows and 7 variables:
#' \describe{
#'   \item{\code{iso3}}{character. ISO Alpha 3 code.}
#'   \item{\code{year}}{double. Year.}
#'   \item{\code{age_group}}{double. Age group.}
#'   \item{\code{sex}}{character. Sex}
#'   \item{\code{mean}}{double. Prevalence (fraction of the population, not percent).}
#'   \item{\code{lower}}{double. Lower 95\% CI}
#'   \item{\code{upper}}{double. Upper 95\% CI}
#' }
#' @source \url{http://dx.doi.org/10.1001/jama.2013.284692}
"smoking_age_sex"


#' National smoking prevalences by sex and year 1980-2012
#'
#' Smoking prevalence for 187 countries for 1980,
#' 1996, 2006, and 2012. These are the data that are reported
#' in Ng et al. (2014) Smoking Prevalence and Cigarette Consumption in 187 countries, 1980-2012. JAMA.
#'
#' @format A data frame with 187 rows and 10 variables:
#' \describe{
#'   \item{\code{country}}{character. Country name}
#'   \item{\code{iso3}}{character. ISO Alpha 3 code}
#'   \item{\code{f1980}}{double. Female smoking prevalence 1980}
#'   \item{\code{f1996}}{double. Female smoking prevalence 1996}
#'   \item{\code{f2006}}{double. Female smoking prevalence 2006}
#'   \item{\code{f2012}}{double. Female smoking prevalence 2012}
#'   \item{\code{m1980}}{double. Male smoking prevalence 1980}
#'   \item{\code{m1996}}{double. Male smoking prevalence 1996}
#'   \item{\code{m2006}}{double. Male smoking prevalence 2006}
#'   \item{\code{m2012}}{double. Male smoking prevalence 2012}
#' }
#' @source \url{http://dx.doi.org/10.1001/jama.2013.284692}
"ng_smoking"


#' Total Fertility Rates 1950-2015
#'
#' Total fertility rates computed by the UN Department of Economic and Social
#' Affairs, Population Division. World Population Prospects. The 2015 Revision.
#' \url{http://esa.un.org/unpd/wpp/publications/files/key_findings_wpp_2015.pdf}.
#' Years are
#'
#' @format A data frame with 200 rows and 16 variables:
#' \describe{
#'   \item{\code{country}}{character. Country name.}
#'   \item{\code{iso3}}{character. ISO Alpha 3.}
#'   \item{\code{tfr1950}}{double. TFR 1950-1955}
#'   \item{\code{tfr1955}}{double. TFR 1955-1960}
#'   \item{\code{tfr1960}}{double. TFR 1960-1965}
#'   \item{\code{tfr1965}}{double. TFR 1965-1970}
#'   \item{\code{tfr1970}}{double. TFR 1970-1975}
#'   \item{\code{tfr1975}}{double. TFR 1975-1980}
#'   \item{\code{tfr1980}}{double. TFR 1980-1985}
#'   \item{\code{tfr1985}}{double. TFR 1985-1990}
#'   \item{\code{tfr1990}}{double. TFR 1990-1995}
#'   \item{\code{tfr1995}}{double. TFR 1995-2000}
#'   \item{\code{tfr2000}}{double. TFR 2000-2005}
#'   \item{\code{tfr2005}}{double. TFR 2005-2010}
#'   \item{\code{tfr2010}}{double. TFR 2010-2015}
#' }
#' @source \url{http://esa.un.org/unpd/wpp/Download/Standard/Fertility/}
"tfr"


#' Total Fertility Rates 1950-2015 (long format)
#'
#' Total fertility rates computed by the UN Department of Economic and Social
#' Affairs, Population Division. World Population Prospects. The 2015 Revision.
#' \url{http://esa.un.org/unpd/wpp/publications/files/key_findings_wpp_2015.pdf}
#'
#' @format A data frame with 2400 rows and 3 variables:
#' \describe{
#'   \item{\code{iso3}}{character. ISO Alpha 3 country code.}
#'   \item{\code{year}}{double. Year.}
#'   \item{\code{tfr}}{double. Total fertility rate.}
#' }
#' @source \url{http://esa.un.org/unpd/wpp/Download/Standard/Fertility/}
"tfrlong"


#' Age-Specific Fertility Rates 1950-2015
#'
#' Age-specific fertility rates computed by the UN Department of Economic and Social
#' Affairs, Population Division. World Population Prospects. The 2015 Revision.
#' \url{http://esa.un.org/unpd/wpp/publications/files/key_findings_wpp_2015.pdf}
#'
#' @format A data frame with 2600 rows and 11 variables:
#' \describe{
#'   \item{\code{country}}{character. Country name.}
#'   \item{\code{iso_code}}{double. Country code}
#'   \item{\code{year}}{character. Year (in 5-year blocks from 1950-1955 to 2010-2015).}
#'   \item{\code{15-19}}{double. 15-19 year olds.}
#'   \item{\code{20-24}}{double. 20-24 year olds.}
#'   \item{\code{25-29}}{double. 25-29 year olds.}
#'   \item{\code{30-34}}{double. 30-34 year olds.}
#'   \item{\code{35-39}}{double. 35-39 year olds.}
#'   \item{\code{40-44}}{double. 40-44 year olds.}
#'   \item{\code{45-49}}{double. 45-50 year olds.}
#'   \item{\code{iso3}}{character. ISO Alpha 3 code.}
#' }
#' @source \url{http://esa.un.org/unpd/wpp/Download/Standard/Fertility/}
"asfr"


#' Breastfeeding rates 2010-2015
#'
#' \itemize{
#' \item Early initiation of breastfeeding (<1hour, \%): Percentage of infants who are put to the breast within one hour of birth.
#' \item Exclusive breastfeeding (<6 months, \%): Percentage of children aged 0–5 months who are fed exclusively with breast milk in the 24 hours prior to the survey.
#' \item Introduction to solid, semi-solid or soft foods (6-8 months, \%): Percentage of children aged 6–8 months who received solid, semi-solid or soft foods in the 24 hours prior to the survey.
#' \item Breastfeeding at 1 year (12-15 months, \%): Percentage of children aged 12–15 months who received breast milk in the 24 hours prior to the survey.
#' \item Breastfeeding at age 2 (20-23 months, \%): Percentage of children aged 20–23 months who received breast milk in the 24 hours prior to the survey.
#' \item Minimum Diet Diversity (6-23 months, \%): Percentage of children 6–23 months of age who had ate from at least 4 (out of 7 pre-defined food groups) during the previous day.
#' \item Minimum Acceptable Diet (6-23 months, \%): Percentage of breastfed children 6–23 months of age who had at least the minimum dietary diversity and the minimum meal frequency during the previous day AND percentage of non-breastfed children 6–23 months of age who received at least 2 milk feedings and had at least the minimum dietary diversity not including milk feeds and the minimum meal frequency during the previous day.
#' }
#'
#' @format A data frame with 197 rows and 12 variables:
#' \describe{
#'   \item{\code{iso3}}{character. ISO Alpha 3 code}
#'   \item{\code{country}}{character. Country name.}
#'   \item{\code{year_initial}}{character. Reference year for data on breastfeeding initiation.}
#'   \item{\code{percent_initial}}{double. Percent breastfeeding initiation.}
#'   \item{\code{year_6_months}}{character. Reference year for data on exclusive breastfeeding at 6 months.}
#'   \item{\code{percent_6_months}}{double. Percent exclusive breastfeeding at 6 months.}
#'   \item{\code{year_food_intro}}{character. Reference year for data on introduction of solid food at 6-8 months.}
#'   \item{\code{percent_food_intro}}{double. Percent introduction of solid food at 6-8 months.}
#'   \item{\code{year_1_year}}{character. Reference year for data on exclusive breastfeeding at 1 year.}
#'   \item{\code{percent_1_year}}{double. Percent exclusive breastfeeding at 1 year}
#'   \item{\code{year_2_year}}{character. Reference year for data on exclusive breastfeeding at 2 years.}
#'   \item{\code{percent_2_year}}{double. Percent exclusive breastfeeding at 2 years}
#'   \item{\code{year_min_accept}}{character. Reference year for data on minimum acceptable diet 6-23 months.}
#'   \item{\code{percent_min_accept}}{double. Percent minimum acceptable diet 6-23 months.}
#'   \item{\code{year_min_diverse}}{character. Reference year for data on minimum diet diversity 6-23 months.}
#'   \item{\code{percent_min_diverse}}{double. Percent minimum diet diversity 6-23 months.}
#'   \item{\code{year_min_freq}}{character. Reference year for data on minimum meal frequency 6-23 months.}
#'   \item{\code{percent_min_freq}}{double. Percent minimum meal frequency 6-23 months.}
#' }
#'@source \url{http://data.unicef.org/nutrition/iycf.html}
"breastfeeding"


#' Contraceptive prevalence 1970-2030
#'
#' Percentage of married or in-union women aged 15 to 49 who are currently
#' using modern, traditional, or any method of contraception. Contraceptive prevalence
#' estimates and projections are based on the country-specific data compiled
#' in World Contraceptive Use 2015. Model results are as of March 2015.
#'
#' @format A data frame with 585 rows and 64 variables:
#' \describe{
#'   \item{\code{country}}{character. Country name}
#'   \item{\code{iso3}}{character. ISO Alpha 3 code}
#'   \item{\code{type}}{character. Modern, Traditional, or Any.}
#'   \item{\code{bc1970}}{double. Percent using contraception.}
#'   \item{\code{bc1971}}{double. Percent using contraception}
#'   \item{\code{bc1972}}{double. Percent using contraception}
#'   \item{\code{bc1973}}{double. Percent using contraception}
#'   \item{\code{bc1974}}{double. Percent using contraception}
#'   \item{\code{bc1975}}{double. Percent using contraception}
#'   \item{\code{bc1976}}{double. Percent using contraception}
#'   \item{\code{bc1977}}{double. Percent using contraception}
#'   \item{\code{bc1978}}{double. Percent using contraception}
#'   \item{\code{bc1979}}{double. Percent using contraception}
#'   \item{\code{bc1980}}{double. Percent using contraception}
#'   \item{\code{bc1981}}{double. Percent using contraception}
#'   \item{\code{bc1982}}{double. Percent using contraception}
#'   \item{\code{bc1983}}{double. Percent using contraception}
#'   \item{\code{bc1984}}{double. Percent using contraception}
#'   \item{\code{bc1985}}{double. Percent using contraception}
#'   \item{\code{bc1986}}{double. Percent using contraception}
#'   \item{\code{bc1987}}{double. Percent using contraception}
#'   \item{\code{bc1988}}{double. Percent using contraception}
#'   \item{\code{bc1989}}{double. Percent using contraception}
#'   \item{\code{bc1990}}{double. Percent using contraception}
#'   \item{\code{bc1991}}{double. Percent using contraception}
#'   \item{\code{bc1992}}{double. Percent using contraception}
#'   \item{\code{bc1993}}{double. Percent using contraception}
#'   \item{\code{bc1994}}{double. Percent using contraception}
#'   \item{\code{bc1995}}{double. Percent using contraception}
#'   \item{\code{bc1996}}{double. Percent using contraception}
#'   \item{\code{bc1997}}{double. Percent using contraception}
#'   \item{\code{bc1998}}{double. Percent using contraception}
#'   \item{\code{bc1999}}{double. Percent using contraception}
#'   \item{\code{bc2000}}{double. Percent using contraception}
#'   \item{\code{bc2001}}{double. Percent using contraception}
#'   \item{\code{bc2002}}{double. Percent using contraception}
#'   \item{\code{bc2003}}{double. Percent using contraception}
#'   \item{\code{bc2004}}{double. Percent using contraception}
#'   \item{\code{bc2005}}{double. Percent using contraception}
#'   \item{\code{bc2006}}{double. Percent using contraception}
#'   \item{\code{bc2007}}{double. Percent using contraception}
#'   \item{\code{bc2008}}{double. Percent using contraception}
#'   \item{\code{bc2009}}{double. Percent using contraception}
#'   \item{\code{bc2010}}{double. Percent using contraception}
#'   \item{\code{bc2011}}{double. Percent using contraception}
#'   \item{\code{bc2012}}{double. Percent using contraception}
#'   \item{\code{bc2013}}{double. Percent using contraception}
#'   \item{\code{bc2014}}{double. Percent using contraception}
#'   \item{\code{bc2015}}{double. Percent using contraception}
#'   \item{\code{bc2016}}{double. Percent using contraception}
#'   \item{\code{bc2017}}{double. Percent using contraception}
#'   \item{\code{bc2018}}{double. Percent using contraception}
#'   \item{\code{bc2019}}{double. Percent using contraception}
#'   \item{\code{bc2020}}{double. Percent using contraception}
#'   \item{\code{bc2021}}{double. Percent using contraception}
#'   \item{\code{bc2022}}{double. Percent using contraception}
#'   \item{\code{bc2023}}{double. Percent using contraception}
#'   \item{\code{bc2024}}{double. Percent using contraception}
#'   \item{\code{bc2025}}{double. Percent using contraception}
#'   \item{\code{bc2026}}{double. Percent using contraception}
#'   \item{\code{bc2027}}{double. Percent using contraception}
#'   \item{\code{bc2028}}{double. Percent using contraception}
#'   \item{\code{bc2029}}{double. Percent using contraception}
#'   \item{\code{bc2030}}{double. Percent using contraception}
#' }
#' @source \url{http://www.un.org/en/development/desa/population/theme/family-planning/cp_model.shtml}
#' @source \url{http://dx.doi.org/10.1016/S0140-6736(12)62204-1}
"contraception"


#' Country centroids (latitude and longitude)
#'
#' Latitude and longitude coordinates in decimal degrees for the
#' geographic center (centroids) for each nation in the world.
#' This includes all independent countries and most dependent
#' entities and territories. Most of the data for the world was
#' extracted from the NGA's GEOnet Names Server (GNS). Since the
#' United States and its territories are not included in this resource,
#' data for those areas was downloaded from the USGS Geographic Names
#' Information System (GNIS).
#'
#' @format A data frame with 235 rows and 4 variables:
#' \describe{
#'   \item{\code{name}}{character. Country name}
#'   \item{\code{iso3}}{character. ISO Alpha 3}
#'   \item{\code{LAT}}{double. Latitude (decimal)}
#'   \item{\code{LONG}}{double. Longitude (decimal)}
#' }
#' @source \url{http://gothos.info/resource_files/country_centroids.zip}
#' @examples
#' # Distance matrix (in kilometers)
#' library(sp)
#' d <- spDists(as.matrix(country_centroids[c('LONG', 'LAT')]), longlat = T)
#' rownames(d) <- country_centroids$iso3
#' colnames(d) <- country_centroids$iso3
"country_centroids"


#' Infant mortality rate 1950-2015
#'
#' Infant deaths per 1000 live births. Probability of dying between birth and exact age 1.
#' Both sexes combined.
#'
#' @format A data frame with 200 rows and 15 variables:
#' \describe{
#'   \item{\code{country}}{character. Country name}
#'   \item{\code{iso3}}{character. ISO Alpha 3 code}
#'   \item{\code{im1950}}{double. Infant mortality 1950-1955}
#'   \item{\code{im1955}}{double. Infant mortality 1955-1960}
#'   \item{\code{im1960}}{double. Infant mortality 1960-1965}
#'   \item{\code{im1965}}{double. Infant mortality 1965-1970}
#'   \item{\code{im1970}}{double. Infant mortality 1970-1975}
#'   \item{\code{im1975}}{double. Infant mortality 1975-1980}
#'   \item{\code{im1980}}{double. Infant mortality 1980-1985}
#'   \item{\code{im1985}}{double. Infant mortality 1985-1990}
#'   \item{\code{im1990}}{double. Infant mortality 1990-1995}
#'   \item{\code{im1995}}{double. Infant mortality 1995-2000}
#'   \item{\code{im2000}}{double. Infant mortality 2000-2005}
#'   \item{\code{im2005}}{double. Infant mortality 2005-2010}
#'   \item{\code{im2010}}{double. Infant mortality 2010-2015}
#' }
#' @source \url{http://esa.un.org/unpd/wpp/Download/Standard/Mortality/}
"infantmortality"


#' Under 5 mortality rate 1950-2015
#'
#' Child deaths per 1000 live births. Probability of dying between birth and exact age 5.
#' Both sexes combined.
#'
#' @format A data frame with 200 rows and 15 variables:
#' \describe{
#'   \item{\code{country}}{character. Country name}
#'   \item{\code{iso3}}{character. ISO Alpha 3 code}
#'   \item{\code{u5m1950}}{double. Under 5 mortality 1950-1955}
#'   \item{\code{u5m1955}}{double. Under 5 mortality 1955-1960}
#'   \item{\code{u5m1960}}{double. Under 5 mortality 1960-1965}
#'   \item{\code{u5m1965}}{double. Under 5 mortality 1965-1970}
#'   \item{\code{u5m1970}}{double. Under 5 mortality 1970-1975}
#'   \item{\code{u5m1975}}{double. Under 5 mortality 1975-1980}
#'   \item{\code{u5m1980}}{double. Under 5 mortality 1980-1985}
#'   \item{\code{u5m1985}}{double. Under 5 mortality 1985-1990}
#'   \item{\code{u5m1990}}{double. Under 5 mortality 1990-1995}
#'   \item{\code{u5m1995}}{double. Under 5 mortality 1995-2000}
#'   \item{\code{u5m2000}}{double. Under 5 mortality 2000-2005}
#'   \item{\code{u5m2005}}{double. Under 5 mortality 2005-2010}
#'   \item{\code{u5m2010}}{double. Under 5 mortality 2010-2015}
#' }
#' @source \url{http://esa.un.org/unpd/wpp/Download/Standard/Mortality/}
"u5mortality"


#' Mean age at first birth 1970-2011
#'
#' Mean age at first birth
#'
#' @format A data frame with 588 rows and 5 variables:
#' \describe{
#'   \item{\code{Country}}{character. Country name.}
#'   \item{\code{iso3}}{character. ISO Alpha 3 code.}
#'   \item{\code{period}}{character. Earlier, Middle, Latest}
#'   \item{\code{year_original}}{character. Year of survey. Includes some ranges, e.g., 1975-1976.}
#'   \item{\code{age_first_birth}}{double. Mean age at first birth.}
#'   \item{\code{year}}{integer. Year of survey. Year ranges recoded to first or last year.}
#' }
#' @source World Fertility Report 2012
"age_first_birth"


#' CIRI Gender inequality indices 1981-2011
#'
#' Gender inequality indices from the Cingranelli-Richards (CIRI) data-set.
#'
#' WECON: A score of 0 indicates that there were no economic rights
#' for women in law and that systematic discrimination based on sex
#' may have been built into law. A score of 1 indicates that women
#' had some economic rights under law, but these rights were not
#' effectively enforced. A score of 2 indicates that women had some
#' economic rights under law, and the government effectively enforced
#' these rights in practice while still allowing a low level of
#' discrimination against women in economic matters. Finally, a score
#' of 3 indicates that all or nearly all of women’s economic rights
#' were guaranteed by law and the government fully and vigorously
#' enforces these laws in practice.
#'
#' WOPOL: A score of 0 indicates that women’s political rights were
#' not guaranteed by law during a given year. A score of 1 indicates
#' that women’s political rights were guaranteed in law, but severely
#' prohibited in practice. A score of 2 indicates that women’s political
#' rights were guaranteed in law, but were still moderately prohibited
#' in practice. Finally, a score of 3 indicates that women’s political
#' rights were guaranteed in both law and practice.
#'
#' @format A data frame with 5983 rows and 4 variables:
#' \describe{
#'   \item{\code{iso3}}{character. ISO Alpha 3 code}
#'   \item{\code{YEAR}}{integer. Year.}
#'   \item{\code{WECON}}{integer. Women's Economic Rights}
#'   \item{\code{WOPOL}}{integer. Women's Political Rights}
#' }
#' @source Cingranelli, David L., David L. Richards, and K. Chad Clay. 2014. "The CIRI Human Rights Dataset."  \url{http://www.humanrightsdata.com}. Version 2014.04.14
#' @source \url{http://www.humanrightsdata.com/p/data-documentation.html}
"ciri"


#' Global Gender Gap Index 2014
#'
#' Through the Global Gender Gap Report 2014, the World Economic Forum
#' quantifies the magnitude of gender-based disparities and tracks their
#' progress over time. While no single measure can capture the complete
#' situation, the Global Gender Gap Index presented in this Report seeks
#' to measure one important aspect of gender equality: the relative gaps
#' between women and men across four key areas: health, education, economy
#' and politics.
#'
#' @format A data frame with 142 rows and 3 variables:
#' \describe{
#'   \item{\code{Country}}{character. Country name.}
#'   \item{\code{iso3}}{character. ISO Alpha 3 code}
#'   \item{\code{GGGI}}{double. Global Gender Gap Index. Higher scores indicate more gender equality.}
#' }
#' @source \url{http://reports.weforum.org/global-gender-gap-report-2014/}
"gggi"


#' Gender Empowerment Measure 2009
#'
#' The Gender Empowerment Measure (GEM) is a composite indicator that captures
#' gender inequality in three key areas: the extent of women's political
#' participation and decision-making, economic participation and decision
#' making-power and the power exerted by women over economic resources.
#'
#' @format A data frame with 109 rows and 4 variables:
#' \describe{
#'   \item{\code{country}}{character. Country name.}
#'   \item{\code{iso3}}{character. ISO Alpha 3 code}
#'   \item{\code{gem}}{double. Gender Empowerment Measure. Higher values indicate greater gender equality.}
#' }
#' @source \url{http://hdr.undp.org/sites/default/files/reports/269/hdr_2009_en_complete.pdf}
"gem"


#' Tobacco agriculture land use 1961-2013
#'
#' Land use for tobacco production  from the Food and Agriculture Organization (FAO) of the United Nations.
#'
#' @format A data frame with 45026 rows and 8 variables:
#' \describe{
#'   \item{\code{iso3}}{character. Country code.}
#'   \item{\code{Item Code}}{integer. FAO code for item measured.}
#'   \item{\code{Item}}{character. Item measured}
#'   \item{\code{Year}}{integer. Year}
#'   \item{\code{Unit}}{character. Unit of measurement.}
#'   \item{\code{Value}}{double. Value of measurement}
#'   \item{\code{Flag}}{character. Data source}
#'   \item{\code{Flag Description}}{character. Data source.}
#' }
#' @source \url{http://www.fao.org/statistics/en/}
"land"


#' Tobacco production 1961-2013
#'
#' Tobacco production from the Food and Agriculture Organization (FAO) of the United Nations.
#'
#' Measurements
#' * Area harvested: Data refer to the area from which a crop is gathered. Area harvested, therefore, excludes the area from which, although sown or planted, there was no harvest due to damage, failure, etc. It is usually net for temporary crops and some times gross for permanent crops. Net area differs from gross area insofar as the latter includes uncultivated patches, footpaths, ditches, headlands, shoulders, shelterbelts, etc.If the crop under consideration is harvested more than once during the year as a consequence of successive cropping (i.e. the same crop is sown or planted more than once in the same field during the year), the area is counted as many times as harvested. On the contrary, area harvested will be recorded only once in the case of successive gathering of the crop during the year from the same standing crops. With regard to mixed and associated crops, the area sown relating to each crop should be reported separately. When the mixture refers to particular crops, generally grains, it is recommended to treat the mixture as if it were a single crop; therefore, area sown is recorded only for the crop reported. Source: FAO Statistics Division
#' * Production: Figures relate to the total domestic production whether inside or outside the agricultural sector, i.e. it includes non-commercial production and production from kitchen gardens. Unless otherwise indicated, production is reported at the farm level for crop and livestock products (i.e. in the case of crops, excluding harvesting losses) and in terms of live weight for fish items (i.e. the actual ex-water weight at the time of the catch). All data shown relate to total meat production from both commercial and farm slaughter. Data are expressed in terms of dressed carcass weight, excluding offal and slaughter fats. Production of beef and buffalo meat includes veal; mutton and goat meat includes meat from lambs and kids; pig meat includes bacon and ham in fresh equivalent. Poultry meat includes meat from all domestic birds and refers, wherever possible, to ready-to-cook weight. Source: FAO Statistics Division
#' * Yield: Harvested production per unit of harvested area for crop products. In most of the cases yield data are not recorded but obtained by dividing the production data by the data on area harvested. Data on yields of permanent crops are not as reliable as those for temporary crops either because most of the area information may correspond to planted area, as for grapes, or because of the scarcity and unreliability of the area figures reported by the countries, as for example for cocoa and coffee. Source: FAO Statistics Division
#'
#' Units
#' * Ha: hectares
#' * Hg/Ha: hectogrammes per hectare
#' * tonnes: metric tons
#'
#' @format A data frame with 19813 rows and 8 variables:
#' \describe{
#'   \item{\code{iso3}}{integer. Country code}
#'   \item{\code{Element Code}}{integer. FAO codes for data types.}
#'   \item{\code{Element}}{character. "Area harvested", "Production", "Yield".}
#'   \item{\code{Year}}{integer. Year.}
#'   \item{\code{Unit}}{character. Unit of measurement.}
#'   \item{\code{Value}}{double. Value of measurement.}
#'   \item{\code{Flag}}{character. Data source.}
#'   \item{\code{Flag Description}}{character. Data source.}
#' }
#' @source \url{http://www.fao.org/statistics/en/}
"production"



#' Total population by country and year
#'
#' ( 1 ) United Nations Population Division. World Population Prospects,
#' ( 2 ) Census reports and other statistical publications from national statistical offices,
#' ( 3 ) Eurostat: Demographic Statistics,
#' ( 4 ) United Nations Statistical Division. Population and Vital Statistics Report ( various years ),
#' ( 5 ) U.S. Census Bureau: International Database, and
#' ( 6 ) Secretariat of the Pacific Community: Statistics and Demography Programme.
#'
#' @format A data frame with 264 rows and 60 variables:
#' \describe{
#'   \item{\code{Country Name}}{character. Country name.}
#'   \item{\code{Country Code}}{character. ISO 3 country code.}
#'   \item{\code{Indicator Name}}{character. World Bank indicator name.}
#'   \item{\code{Indicator Code}}{character. World Bank indicator code.}
#'   \item{\code{1960}}{double. Year.}
#'   \item{\code{1961}}{double. Year.}
#'   \item{\code{1962}}{double. Year.}
#'   \item{\code{1963}}{double. Year.}
#'   \item{\code{1964}}{double. Year.}
#'   \item{\code{1965}}{double. Year.}
#'   \item{\code{1966}}{double. Year.}
#'   \item{\code{1967}}{double. Year.}
#'   \item{\code{1968}}{double. Year.}
#'   \item{\code{1969}}{double. Year.}
#'   \item{\code{1970}}{double. Year.}
#'   \item{\code{1971}}{double. Year.}
#'   \item{\code{1972}}{double. Year.}
#'   \item{\code{1973}}{double. Year.}
#'   \item{\code{1974}}{double. Year.}
#'   \item{\code{1975}}{double. Year.}
#'   \item{\code{1976}}{double. Year.}
#'   \item{\code{1977}}{double. Year.}
#'   \item{\code{1978}}{double. Year.}
#'   \item{\code{1979}}{double. Year.}
#'   \item{\code{1980}}{double. Year.}
#'   \item{\code{1981}}{double. Year.}
#'   \item{\code{1982}}{double. Year.}
#'   \item{\code{1983}}{double. Year.}
#'   \item{\code{1984}}{double. Year.}
#'   \item{\code{1985}}{double. Year.}
#'   \item{\code{1986}}{double. Year.}
#'   \item{\code{1987}}{double. Year.}
#'   \item{\code{1988}}{double. Year.}
#'   \item{\code{1989}}{double. Year.}
#'   \item{\code{1990}}{double. Year.}
#'   \item{\code{1991}}{double. Year.}
#'   \item{\code{1992}}{double. Year.}
#'   \item{\code{1993}}{double. Year.}
#'   \item{\code{1994}}{double. Year.}
#'   \item{\code{1995}}{double. Year.}
#'   \item{\code{1996}}{double. Year.}
#'   \item{\code{1997}}{double. Year.}
#'   \item{\code{1998}}{double. Year.}
#'   \item{\code{1999}}{double. Year.}
#'   \item{\code{2000}}{double. Year.}
#'   \item{\code{2001}}{double. Year.}
#'   \item{\code{2002}}{double. Year.}
#'   \item{\code{2003}}{double. Year.}
#'   \item{\code{2004}}{double. Year.}
#'   \item{\code{2005}}{double. Year.}
#'   \item{\code{2006}}{double. Year.}
#'   \item{\code{2007}}{double. Year.}
#'   \item{\code{2008}}{double. Year.}
#'   \item{\code{2009}}{double. Year.}
#'   \item{\code{2010}}{double. Year.}
#'   \item{\code{2011}}{double. Year.}
#'   \item{\code{2012}}{double. Year.}
#'   \item{\code{2013}}{double. Year.}
#'   \item{\code{2014}}{double. Year.}
#'   \item{\code{2015}}{double. Year.}
#' }
#' @source \url{http://data.worldbank.org/indicator/SP.POP.TOTL}
"population"



#' World Economic Outlook 1980-2021
#'
#' The World Economic Outlook (WEO) database is created during the biannual WEO exercise, which begins in January and June of each year and results in the April and September/October WEO publication. Selected series from the publications are available in a database format.
#' \tabular{lllll}{
#'  Subject code \tab Description                                                                            \tab Notes                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  \tab Units                                              \tab Scale   \cr
#'  NGDP_R       \tab Gross domestic product, constant prices                                                \tab Expressed in billions of national currency units; the base year is country-specific. Expenditure-based GDP is total final expenditures at purchasers? prices (including the f.o.b. value of exports of goods and services), less the f.o.b. value of imports of goods and services. [SNA 1993]                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         \tab National currency                                  \tab Billions\cr
#'  NGDP_RPCH    \tab Gross domestic product, constant prices                                                \tab Annual percentages of constant price GDP are year-on-year changes; the base year is country-specific . Expenditure-based GDP is total final expenditures at purchasers? prices (including the f.o.b. value of exports of goods and services), less the f.o.b. value of imports of goods and services. [SNA 1993]                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       \tab Percent change                                     \tab NA      \cr
#'  NGDP         \tab Gross domestic product, current prices                                                 \tab Expressed in billions of national currency units . Expenditure-based GDP is total final expenditures at purchasers? prices (including the f.o.b. value of exports of goods and services), less the f.o.b. value of imports of goods and services. [SNA 1993]                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           \tab National currency                                  \tab Billions\cr
#'  NGDPD        \tab Gross domestic product, current prices                                                 \tab Values are based upon GDP in national currency converted to U.S. dollars using market exchange rates (yearly average). Exchange rate projections are provided by country economists for the group of other emerging market and developing countries. Exchanges rates for advanced economies are established in the WEO assumptions for each WEO exercise. Expenditure-based GDP is total final expenditures at purchasers? prices (including the f.o.b. value of exports of goods and services), less the f.o.b. value of imports of goods and services. [SNA 1993]                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    \tab U.S. dollars                                       \tab Billions\cr
#'  NGDP_D       \tab Gross domestic product, deflator                                                       \tab The GDP deflator is derived by dividing current price GDP by constant price GDP and is considered to be an alternate measure of inflation. Data are expressed in the base year of each country's national accounts.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    \tab Index                                              \tab NA      \cr
#'  NGDPRPC      \tab Gross domestic product per capita, constant prices                                     \tab GDP is expressed in constant national currency per person. Data are derived by dividing constant price GDP by total population.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        \tab National currency                                  \tab Units   \cr
#'  NGDPPC       \tab Gross domestic product per capita, current prices                                      \tab GDP is expressed in current national currency per person. Data are derived by dividing current price GDP by total population.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          \tab National currency                                  \tab Units   \cr
#'  NGDPDPC      \tab Gross domestic product per capita, current prices                                      \tab GDP is expressed in current U.S. dollars per person. Data are derived by first converting GDP in national currency to U.S. dollars and then dividing it by total population.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           \tab U.S. dollars                                       \tab Units   \cr
#'  NGAP_NPGDP   \tab Output gap in percent of potential GDP                                                 \tab Output gaps for advanced economies are calculated as actual GDP less potential GDP as a percent of potential GDP. Estimates of output gaps are subject to a significant margin of uncertainty. For a discussion of approaches to calculating potential output, see Paula R. De Masi, IMF Estimates of Potential Output: Theory and Practice, in Staff Studies for the World Economic Outlook (Washington: IMF, December 1997), pp. 40-46.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              \tab Percent of potential GDP                           \tab NA      \cr
#'  PPPGDP       \tab Gross domestic product based on purchasing-power-parity (PPP) valuation of country GDP \tab These data form the basis for the country weights used to generate the World Economic Outlook country group composites for the domestic economy.   The IMF is not a primary source for purchasing power parity (PPP) data. WEO weights have been created from primary sources and are used solely for purposes of generating country group composites. For primary source information, please refer to one of the following sources: the Organization for Economic Cooperation and Development, the World Bank, or the Penn World Tables.   For further information see Box A2 in the April 2004 World Economic Outlook, Box 1.2 in the September 2003 World Economic Outlook for a discussion on the measurement of global growth and Box A.1 in the May 2000 World Economic Outlook for a summary of the revised PPP-based weights, and Annex IV of the May 1993 World Economic Outlook. See also Anne Marie Gulde and Marianne Schulze-Ghattas, Purchasing Power Parity Based Weights for the World Economic Outlook, in Staff Studies for the World Economic Outlook (Washington: IMF, December 1993), pp. 106-23.                                                                                                                 \tab Current international dollar                       \tab Billions\cr
#'  PPPPC        \tab Gross domestic product based on purchasing-power-parity (PPP) per capita GDP           \tab Expressed in GDP in PPP dollars per person. Data are derived by dividing GDP in PPP dollars by total population. These data form the basis for the country weights used to generate the World Economic Outlook country group composites for the domestic economy.   The IMF is not a primary source for purchasing power parity (PPP) data. WEO weights have been created from primary sources and are used solely for purposes of generating country group composites. For primary source information, please refer to one of the following sources: the Organization for Economic Cooperation and Development, the World Bank, or the Penn World Tables.  For further information see Box A2 in the April 2004 World Economic Outlook, Box 1.2 in the September 2003 World Economic Outlook for a discussion on the measurement of global growth and Box A.1 in the May 2000 World Economic Outlook for a summary of the revised PPP-based weights, and Annex IV of the May 1993 World Economic Outlook. See also Anne Marie Gulde and Marianne Schulze-Ghattas, Purchasing Power Parity Based Weights for the World Economic Outlook, in Staff Studies for the World Economic Outlook (Washington: IMF, December 1993), pp. 106-23. \tab Current international dollar                       \tab Units   \cr
#'  PPPSH        \tab Gross domestic product based on purchasing-power-parity (PPP) share of world total     \tab Expressed in percent of world GDP in PPP dollars. These data form the basis for the country weights used to generate the World Economic Outlook country group composites for the domestic economy.   The IMF is not a primary source for purchasing power parity (PPP) data. WEO weights have been created from primary sources and are used solely for purposes of generating country group composites. For primary source information, please refer to one of the following sources: the Organization for Economic Cooperation and Development, the World Bank, or the Penn World Tables.  For further information see Box A2 in the April 2004 World Economic Outlook, Box 1.2 in the September 2003 World Economic Outlook for a discussion on the measurement of global growth and Box A.1 in the May 2000 World Economic Outlook for a summary of the revised PPP-based weights, and Annex IV of the May 1993 World Economic Outlook. See also Anne Marie Gulde and Marianne Schulze-Ghattas, Purchasing Power Parity Based Weights for the World Economic Outlook, in Staff Studies for the World Economic Outlook (Washington: IMF, December 1993), pp. 106-23.                                                                \tab Percent                                            \tab NA      \cr
#'  PPPEX        \tab Implied PPP conversion rate                                                            \tab Expressed in national currency per current international dollar. These data form the basis for the country weights used to generate the World Economic Outlook country group composites for the domestic economy.   The IMF is not a primary source for purchasing power parity (PPP) data. WEO weights have been created from primary sources and are used solely for purposes of generating country group composites. For primary source information, please refer to one of the following sources: the Organization for Economic Cooperation and Development, the World Bank, or the Penn World Tables.  For further information see Box A2 in the April 2004 World Economic Outlook, Box 1.2 in the September 2003 World Economic Outlook for a discussion on the measurement of global growth and Box A.1 in the May 2000 World Economic Outlook for a summary of the revised PPP-based weights, and Annex IV of the May 1993 World Economic Outlook. See also Anne Marie Gulde and Marianne Schulze-Ghattas, Purchasing Power Parity Based Weights for the World Economic Outlook, in Staff Studies for the World Economic Outlook (Washington: IMF, December 1993), pp. 106-23.                                                 \tab National currency per current international dollar \tab NA      \cr
#'  NID_NGDP     \tab Total investment                                                                       \tab Expressed as a ratio of total investment in current local currency and GDP in current local currency. Investment or gross capital formation is measured by the total value of the gross fixed capital formation and changes in inventories and acquisitions less disposals of valuables for a unit or sector. [SNA 1993]                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               \tab Percent of GDP                                     \tab NA      \cr
#'  NGSD_NGDP    \tab Gross national savings                                                                 \tab Expressed as a ratio of gross national savings in current local currency and GDP in current local currency. Gross national saving is gross disposable income less final consumption expenditure after taking account of an adjustment for pension funds. [SNA 1993] For many countries, the estimates of national saving are built up from national accounts data on gross domestic investment and from balance of payments-based data on net foreign investment.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      \tab Percent of GDP                                     \tab NA      \cr
#'  PCPI         \tab Inflation, average consumer prices                                                     \tab Expressed in averages for the year, not end-of-period data. A consumer price index (CPI) measures changes in the prices of goods and services that households consume. Such changes affect the real purchasing power of consumers? incomes and their welfare. As the prices of different goods and services do not all change at the same rate, a price index can only reflect their average movement. A price index is typically assigned a value of unity, or 100, in some reference period and the values of the index for other periods of time are intended to indicate the average proportionate, or percentage, change in prices from this price reference period. Price indices can also be used to measure differences in price levels between different cities, regions or countries at the same point in time. [CPI Manual 2004, Introduction] For euro countries, consumer prices are calculated based on harmonized prices. For more information see http://epp.eurostat.ec.europa.eu/cache/ITY_OFFPUB/KS-BE-04-001/EN/KS-BE-04-001-EN.PDF.]                                                                                                                                                                              \tab Index                                              \tab NA      \cr
#'  PCPIPCH      \tab Inflation, average consumer prices                                                     \tab Annual percentages of average consumer prices are year-on-year changes.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                \tab Percent change                                     \tab NA      \cr
#'  PCPIE        \tab Inflation, end of period consumer prices                                               \tab Expressed in end of the period, not annual average data. A consumer price index (CPI) measures changes in the prices of goods and services that households consume. Such changes affect the real purchasing power of consumers? incomes and their welfare. As the prices of different goods and services do not all change at the same rate, a price index can only reflect their average movement. A price index is typically assigned a value of unity, or 100, in some reference period and the values of the index for other periods of time are intended to indicate the average proportionate, or percentage, change in prices from this price reference period. Price indices can also be used to measure differences in price levels between different cities, regions or countries at the same point in time. [CPI Manual 2004, Introduction] For euro countries, consumer prices are calculated based on harmonized prices. For more information see http://epp.eurostat.ec.europa.eu/cache/ITY_OFFPUB/KS-BE-04-001/EN/KS-BE-04-001-EN.PDF.                                                                                                                                                                                  \tab Index                                              \tab NA      \cr
#'  PCPIEPCH     \tab Inflation, end of period consumer prices                                               \tab Annual percentages of end of period consumer prices are year-on-year changes.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          \tab Percent change                                     \tab NA      \cr
#'  FLIBOR6      \tab Six-month London interbank offered rate (LIBOR)                                        \tab NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     \tab Percent                                            \tab NA      \cr
#'  TM_RPCH      \tab Volume of imports of goods and services                                                \tab Percent change of volume of imports refers to the aggregate change in the quantities of total imports whose characteristics are unchanged. The goods and services and their prices are held constant, therefore changes are due to changes in quantities only. [Export and Import Price Index Manual: Theory and Practice, Glossary]                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   \tab Percent change                                     \tab NA      \cr
#'  TMG_RPCH     \tab Volume of Imports of goods                                                             \tab Percent change of volume of imports of goods refers to the aggregate change in the quantities of imports of goods whose characteristics are unchanged. The goods and their prices are held constant, therefore changes are due to changes in quantities only. [Export and Import Price Index Manual: Theory and Practice, Glossary]                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    \tab Percent change                                     \tab NA      \cr
#'  TX_RPCH      \tab Volume of exports of goods and services                                                \tab Percent change of volume of exports refers to the aggregate change in the quantities of total exports whose characteristics are unchanged. The goods and services and their prices are held constant, therefore changes are due to changes in quantities only. [Export and Import Price Index Manual: Theory and Practice, Glossary]                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   \tab Percent change                                     \tab NA      \cr
#'  TXG_RPCH     \tab Volume of exports of goods                                                             \tab Percent change of volume of exports of goods refers to the aggregate change in the quantities of exports of goods whose characteristics are unchanged. The goods and their prices are held constant, therefore changes are due to changes in quantities only. [Export and Import Price Index Manual: Theory and Practice, Glossary]                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    \tab Percent change                                     \tab NA      \cr
#'  LUR          \tab Unemployment rate                                                                      \tab Unemployment rate can be defined by either the national definition, the ILO harmonized definition, or the OECD harmonized definition. The OECD harmonized unemployment rate gives the number of unemployed persons as a percentage of the labor force (the total number of people employed plus unemployed). [OECD Main Economic Indicators, OECD, monthly] As defined by the International Labour Organization, unemployed workers are those who are currently not working but are willing and able to work for pay, currently available to work, and have actively searched for work. [ILO, http://www.ilo.org/public/english/bureau/stat/res/index.htm]                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             \tab Percent of total labor force                       \tab NA      \cr
#'  LE           \tab Employment                                                                             \tab Employment can be defined by either the national definition, the ILO harmonized definition, or the OECD harmonized definition. Persons who during a specified brief period such as one week or one day, (a) performed some work for wage or salary in cash or in kind, (b) had a formal attachment to their job but were temporarily not at work during the reference period, (c) performed some work for profit or family gain in cash or in kind, (d) were with an enterprise such as a business, farm or service but who were temporarily not at work during the reference period for any specific reason. [Current International Recommendations on Labour Statistics, 1988 Edition, ILO, Geneva, page 47]                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         \tab Persons                                            \tab Millions\cr
#'  LP           \tab Population                                                                             \tab For census purposes, the total population of the country consists of all persons falling within the scope of the census. In the broadest sense, the total may comprise either all usual residents of the country or all persons present in the country at the time of the census. [Principles and Recommendations for Population and Housing Censuses, Revision 1, paragraph 2.42]                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     \tab Persons                                            \tab Millions\cr
#'  GGR          \tab General government revenue                                                             \tab Revenue consists of taxes, social contributions, grants receivable, and other revenue. Revenue increases government?s net worth, which is the difference between its assets and liabilities (GFSM 2001, paragraph 4.20). Note: Transactions that merely change the composition of the balance sheet do not change the net worth position, for example, proceeds from sales of nonfinancial and financial assets or incurrence of liabilities.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          \tab National currency                                  \tab Billions\cr
#'  GGR_NGDP     \tab General government revenue                                                             \tab Revenue consists of taxes, social contributions, grants receivable, and other revenue. Revenue increases government?s net worth, which is the difference between its assets and liabilities (GFSM 2001, paragraph 4.20). Note: Transactions that merely change the composition of the balance sheet do not change the net worth position, for example, proceeds from sales of nonfinancial and financial assets or incurrence of liabilities.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          \tab Percent of GDP                                     \tab NA      \cr
#'  GGX          \tab General government total expenditure                                                   \tab Total expenditure consists of total expense and the net acquisition of nonfinancial assets. Note: Apart from being on an accrual basis, total expenditure differs from the GFSM 1986 definition of total expenditure in the sense that it also takes the disposals of nonfinancial assets into account.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                \tab National currency                                  \tab Billions\cr
#'  GGX_NGDP     \tab General government total expenditure                                                   \tab Total expenditure consists of total expense and the net acquisition of nonfinancial assets. Note: Apart from being on an accrual basis, total expenditure differs from the GFSM 1986 definition of total expenditure in the sense that it also takes the disposals of nonfinancial assets into account.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                \tab Percent of GDP                                     \tab NA      \cr
#'  GGXCNL       \tab General government net lending/borrowing                                               \tab Net lending (+)/ borrowing (?) is calculated as revenue minus total expenditure. This is a core GFS balance that measures the extent to which general government is either putting financial resources at the disposal of other sectors in the economy and nonresidents (net lending), or utilizing the financial resources generated by other sectors and nonresidents (net borrowing). This balance may be viewed as an indicator of the financial impact of general government activity on the rest of the economy and nonresidents (GFSM 2001, paragraph 4.17). Note: Net lending (+)/borrowing (?) is also equal to net acquisition of financial assets minus net incurrence of liabilities.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      \tab National currency                                  \tab Billions\cr
#'  GGXCNL_NGDP  \tab General government net lending/borrowing                                               \tab Net lending (+)/ borrowing (?) is calculated as revenue minus total expenditure. This is a core GFS balance that measures the extent to which general government is either putting financial resources at the disposal of other sectors in the economy and nonresidents (net lending), or utilizing the financial resources generated by other sectors and nonresidents (net borrowing). This balance may be viewed as an indicator of the financial impact of general government activity on the rest of the economy and nonresidents (GFSM 2001, paragraph 4.17). Note: Net lending (+)/borrowing (?) is also equal to net acquisition of financial assets minus net incurrence of liabilities.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      \tab Percent of GDP                                     \tab NA      \cr
#'  GGSB         \tab General government structural balance                                                  \tab The structural budget balance refers to the general government cyclically adjusted balance adjusted for nonstructural elements beyond the economic cycle. These include temporary financial sector and asset price movements as well as one-off, or temporary, revenue or expenditure items. The cyclically adjusted balance is the fiscal balance adjusted for the effects of the economic cycle; see, for example, A. Fedelino. A. Ivanova and M. Horton ?Computing Cyclically Adjusted Balances and Automatic Stabilizers? IMF Technical Guidance Note No. 5, http://www.imf.org/external/pubs/ft/tnm/2009/tnm0905.pdf.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             \tab National currency                                  \tab Billions\cr
#'  GGSB_NPGDP   \tab General government structural balance                                                  \tab The structural budget balance refers to the general government cyclically adjusted balance adjusted for nonstructural elements beyond the economic cycle. These include temporary financial sector and asset price movements as well as one-off, or temporary, revenue or expenditure items. The cyclically adjusted balance is the fiscal balance adjusted for the effects of the economic cycle; see, for example, A. Fedelino. A. Ivanova and M. Horton ?Computing Cyclically Adjusted Balances and Automatic Stabilizers? IMF Technical Guidance Note No. 5, http://www.imf.org/external/pubs/ft/tnm/2009/tnm0905.pdf.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             \tab Percent of potential GDP                           \tab NA      \cr
#'  GGXONLB      \tab General government primary net lending/borrowing                                       \tab Primary net lending/borrowing is net lending (+)/borrowing (?) plus net interest payable/paid (interest expense minus interest revenue).                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               \tab National currency                                  \tab Billions\cr
#'  GGXONLB_NGDP \tab General government primary net lending/borrowing                                       \tab Primary net lending/borrowing is net lending (+)/borrowing (?) plus net interest payable/paid (interest expense minus interest revenue).                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               \tab Percent of GDP                                     \tab NA      \cr
#'  GGXWDN       \tab General government net debt                                                            \tab Net debt is calculated as gross debt minus financial assets corresponding to debt instruments. These financial assets are: monetary gold and SDRs, currency and deposits, debt securities, loans, insurance, pension, and standardized guarantee schemes, and other accounts receivable.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               \tab National currency                                  \tab Billions\cr
#'  GGXWDN_NGDP  \tab General government net debt                                                            \tab Net debt is calculated as gross debt minus financial assets corresponding to debt instruments. These financial assets are: monetary gold and SDRs, currency and deposits, debt securities, loans, insurance, pension, and standardized guarantee schemes, and other accounts receivable.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               \tab Percent of GDP                                     \tab NA      \cr
#'  GGXWDG       \tab General government gross debt                                                          \tab Gross debt consists of all liabilities that require payment or payments of interest and/or principal by the debtor to the creditor at a date or dates in the future. This includes debt liabilities in the form of SDRs, currency and deposits, debt securities, loans, insurance, pensions and standardized guarantee schemes, and other accounts payable. Thus, all liabilities in the GFSM 2001 system are debt, except for equity and investment fund shares and financial derivatives and employee stock options. Debt can be valued at current market, nominal, or face values (GFSM 2001, paragraph 7.110).                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     \tab National currency                                  \tab Billions\cr
#'  GGXWDG_NGDP  \tab General government gross debt                                                          \tab Gross debt consists of all liabilities that require payment or payments of interest and/or principal by the debtor to the creditor at a date or dates in the future. This includes debt liabilities in the form of SDRs, currency and deposits, debt securities, loans, insurance, pensions and standardized guarantee schemes, and other accounts payable. Thus, all liabilities in the GFSM 2001 system are debt, except for equity and investment fund shares and financial derivatives and employee stock options. Debt can be valued at current market, nominal, or face values (GFSM 2001, paragraph 7.110).                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     \tab Percent of GDP                                     \tab NA      \cr
#'  NGDP_FY      \tab Gross domestic product corresponding to fiscal year, current prices                    \tab Gross domestic product corresponding to fiscal year is the country?s GDP based on the same period during the year as their fiscal data. In the case of countries whose fiscal data are based on a fiscal calendar (e.g., July to June), this series would be the country?s GDP over that same period. For countries whose fiscal data are based on a calendar year (i.e., January to December), this series will be the same as their GDP in current prices.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           \tab National currency                                  \tab Billions\cr
#'  BCA          \tab Current account balance                                                                \tab Current account is all transactions other than those in financial and capital items. The major classifications are goods and services, income and current transfers. The focus of the BOP is on transactions (between an economy and the rest of the world) in goods, services, and income.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            \tab U.S. dollars                                       \tab Billions\cr
#'  BCA_NGDPD    \tab Current account balance                                                                \tab Current account is all transactions other than those in financial and capital items. The major classifications are goods and services, income and current transfers. The focus of the BOP is on transactions (between an economy and the rest of the world) in goods, services, and income.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            \tab Percent of GDP                                     \tab NA
#' }
#'
#' @format A data frame with 8404 rows and 52 variables:
#' \describe{
#'   \item{\code{WEO Country Code}}{integer. WEO country code.}
#'   \item{\code{iso3}}{character. ISO alpha 3 code.}
#'   \item{\code{WEO Subject Code}}{character. Economic indicator code.}
#'   \item{\code{Country}}{character. Country.}
#'   \item{\code{Subject Descriptor}}{character. Description of economic indicator.}
#'   \item{\code{Subject Notes}}{character. Notes on economic indicator.}
#'   \item{\code{Units}}{character. Units of economic indicator.}
#'   \item{\code{Scale}}{character. E.g., millions or billions.}
#'   \item{\code{Country/Series-specific Notes}}{character. Country-specific notes for indicator.}
#'   \item{\code{1980}}{double. Indicator year.}
#'   \item{\code{1981}}{double. Indicator year.}
#'   \item{\code{1982}}{double. Indicator year.}
#'   \item{\code{1983}}{double. Indicator year.}
#'   \item{\code{1984}}{double. Indicator year.}
#'   \item{\code{1985}}{double. Indicator year.}
#'   \item{\code{1986}}{double. Indicator year.}
#'   \item{\code{1987}}{double. Indicator year.}
#'   \item{\code{1988}}{double. Indicator year.}
#'   \item{\code{1989}}{double. Indicator year.}
#'   \item{\code{1990}}{double. Indicator year.}
#'   \item{\code{1991}}{double. Indicator year.}
#'   \item{\code{1992}}{double. Indicator year.}
#'   \item{\code{1993}}{double. Indicator year.}
#'   \item{\code{1994}}{double. Indicator year.}
#'   \item{\code{1995}}{double. Indicator year.}
#'   \item{\code{1996}}{double. Indicator year.}
#'   \item{\code{1997}}{double. Indicator year.}
#'   \item{\code{1998}}{double. Indicator year.}
#'   \item{\code{1999}}{double. Indicator year.}
#'   \item{\code{2000}}{double. Indicator year.}
#'   \item{\code{2001}}{double. Indicator year.}
#'   \item{\code{2002}}{double. Indicator year.}
#'   \item{\code{2003}}{double. Indicator year.}
#'   \item{\code{2004}}{double. Indicator year.}
#'   \item{\code{2005}}{double. Indicator year.}
#'   \item{\code{2006}}{double. Indicator year.}
#'   \item{\code{2007}}{double. Indicator year.}
#'   \item{\code{2008}}{double. Indicator year.}
#'   \item{\code{2009}}{double. Indicator year.}
#'   \item{\code{2010}}{double. Indicator year.}
#'   \item{\code{2011}}{double. Indicator year.}
#'   \item{\code{2012}}{double. Indicator year.}
#'   \item{\code{2013}}{double. Indicator year.}
#'   \item{\code{2014}}{double. Indicator year.}
#'   \item{\code{2015}}{double. Indicator year.}
#'   \item{\code{2016}}{double. Indicator year.}
#'   \item{\code{2017}}{double. Indicator year.}
#'   \item{\code{2018}}{double. Indicator year.}
#'   \item{\code{2019}}{double. Indicator year.}
#'   \item{\code{2020}}{double. Indicator year.}
#'   \item{\code{2021}}{double. Indicator year.}
#'   \item{\code{Estimates Start After}}{integer. Year after which indicator values are estimates.}
#' }
"weo"

#' @title Global Burden of Disease Study 2015 (GBD 2015) Smoking Prevalence 1980-2015
#' @description The Global Burden of Disease Study 2015 (GBD 2015), coordinated by the Institute for Health Metrics and Evaluation (IHME), estimated the burden of diseases, injuries, and risk factors at the global, regional, national, territorial, and, for a subset of countries, subnational level. As part of this study, estimates for daily smoking prevalence and smoking-attributable mortality and disease burden, as measured by disability-adjusted life years (DALYs), were produced by sex, age group, and year for 195 countries and territories. Estimates for deaths and DALYs (1990-2015) are available from the GBD Results Tool. Files available in this record include daily smoking prevalence (1980-2015) and annualized rate of change estimates. Study results were published in The Lancet in April 2017 in "Smoking prevalence and attributable disease burden in 195 countries and territories, 1990–2015: a systematic analysis from the Global Burden of Disease Study 2015.
#' @format A data frame with 673917 rows and 10 variables:
#' \describe{
#'   \item{\code{iso3}}{character Country code (iso3c)}
#'   \item{\code{location_name}}{character Country name}
#'   \item{\code{year}}{double Year}
#'   \item{\code{sex}}{character Sex}
#'   \item{\code{age_group_name}}{character Age group}
#'   \item{\code{age_center}}{double Center age of age_group}
#'   \item{\code{metric}}{character Number smoking or percent smoking}
#'   \item{\code{mean}}{double Mean smoking (number or percent)}
#'   \item{\code{lower}}{double Lower confidence interval}
#'   \item{\code{upper}}{double Upper confidence interval}
#'}
#' @details Global Burden of Disease Study 2015. Global Burden of Disease Study 2015 (GBD 2015) Smoking Prevalence 1980-2015. Seattle, United States: Institute for Health Metrics and Evaluation (IHME), 2017.
"gbd2015smoking"
