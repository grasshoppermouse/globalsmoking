
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

#' Developing countries
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
"dev"


#' Total Fertility Rates
#'
#' Total fertility rates computed by the UN Department of Economic and Social
#' Affairs, Population Division. World Population Prospects. The 2015 Revision.
#' \url{http://esa.un.org/unpd/wpp/publications/files/key_findings_wpp_2015.pdf}
#'
#' @format A data frame with 200 rows and 16 variables:
#' \describe{
#'   \item{\code{country}}{character. Country name.}
#'   \item{\code{iso_code}}{double. ISO country code.}
#'   \item{\code{tfr1950}}{double. TFR 1950.}
#'   \item{\code{tfr1955}}{double. TFR 1955}
#'   \item{\code{tfr1960}}{double. TFR 1960}
#'   \item{\code{tfr1965}}{double. TFR 1965}
#'   \item{\code{tfr1970}}{double. TFR 1970}
#'   \item{\code{tfr1975}}{double. TFR 1975}
#'   \item{\code{tfr1980}}{double. TFR 1980}
#'   \item{\code{tfr1985}}{double. TFR 1985}
#'   \item{\code{tfr1990}}{double. TFR 1990}
#'   \item{\code{tfr1995}}{double. TFR 1995}
#'   \item{\code{tfr2000}}{double. TFR 2000}
#'   \item{\code{tfr2005}}{double. TFR 2005}
#'   \item{\code{tfr2010}}{double. TFR 2010}
#'   \item{\code{iso3}}{character. ISO Alpha 3.}
#' }
#' @source \url{http://esa.un.org/unpd/wpp/Download/Standard/Fertility/}
"tfr2015"


#' Total Fertility Rates (long format)
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
"tfr2015long"


#' Age-Specific Fertility Rates
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
"asfr2015"

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
"breastfeeding2010_2015"
