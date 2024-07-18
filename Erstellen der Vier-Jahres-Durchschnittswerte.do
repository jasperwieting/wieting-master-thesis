* Arbeitsverzeichnis definieren 
cd "hier den Dateipfad eintragen"


* Einlesen des Datensatzes 
use Wieting_MA_Rohdaten, clear 


*Generieren von Dummyvariablen für die Region, die Einkommensgruppe und die Jahre, um evtl. Heterogenitäten im Sample zu untersuchen:
tab region_wb, gen (dum_)

rename dum_1 East_Asia_and_Pacific
rename dum_2 Europe_and_Central_Asia
rename dum_3 Latin_America_and_Caribbean_wb
rename dum_4 Middle_East_and_North_Africa
rename dum_5 North_America
rename dum_6 South_Asia
rename dum_7 Sub_Saharan_Africa_wb

tab region_sdg, gen (dum_)

rename dum_1 Central_and_Southern_Asia
rename dum_2 Eastern_and_South_Eastern_Asia
rename dum_3 Europe_and_Northern_America
rename dum_4 Latin_America_and_Caribbean_sdg
rename dum_5 Northern_Africa_and_Western_Asia
rename dum_6 Oceania
rename dum_7 Sub_Saharan_Africa_sdg

tab inc_gr, gen (dum_) 
rename dum_1 hic
rename dum_2 lic
rename dum_3 lmic
rename dum_4 umic


* Vierjahresdurschnitte berechnen
gen period = 4 * floor((year - 1974) / 4) + 1974

order country year period

collapse (mean)  gini_disp gini_mkt high20low20 top10bottom50 avg_16_omori sum_16_omori avg_domestic_omori sum_domestic_omori avg_efw sum_efw KAOPEN bank_superv eci eci_rank legor_uk legor_fr legor_ge legor_sc legor_so bankacc_per_1000 egaldem_scal avg_wgi sum_wgi schooling gdp_per_capita priv_credit gov_consumption infl_gdp_defl infl_cpi population_growth trade unemployment urban_pop crises East_Asia_and_Pacific Europe_and_Central_Asia Latin_America_and_Caribbean_wb Middle_East_and_North_Africa North_America South_Asia Sub_Saharan_Africa_wb Central_and_Southern_Asia Eastern_and_South_Eastern_Asia Europe_and_Northern_America Latin_America_and_Caribbean_sdg Northern_Africa_and_Western_Asia Oceania Sub_Saharan_Africa_sdg hic lic lmic umic, by (period country)

gen year = period

order country period year 

sort country period

replace year = 1 if period==1974
replace year = 2 if period==1978
replace year = 3 if period==1982
replace year = 4 if period==1986
replace year = 5 if period==1990
replace year = 6 if period==1994
replace year = 7 if period==1998
replace year = 8 if period==2002
replace year = 9 if period==2006
replace year = 10 if period==2010

label var year "4-yr period"
label define fouryr 1 "1974-77" 2 "1978-81" 3 "1982-85" 4 "1986-89" 5 "1990-93" 6 "1994-97" 7 "1998-01" 8 "2002-05" 9 "2006-09" 10 "2010-13"
label value year fouryr 

gen dum_crises = (crises > 0)
drop crises


*Dummyvariablen für die Perioden generieren
tab year, gen (yr_) 


*Variablen neu labeln wegen des collapse Befehls
label variable gini_disp "Post tax+transfer Gini from SWIID"
label variable gini_mkt "Pre tax+transfer Gini from SWIID"
label variable high20low20 "Ratio of top 20% to bottom 20% income, post tax+transfer"
label variable top10bottom50 "Ratio of top 10% to bottom 50% income, pre tax+transfer"
label variable avg_16_omori "Average of financial reform database dimensions 1 to 6"
label variable sum_16_omori "Sum of financial reform database dimensions 1 to 6"
label variable avg_domestic_omori "Average domestic financial reform dimensions"
label variable sum_domestic_omori "Sum of domestic financial reform dimensions"
label variable avg_efw "Average of selected economic freedom index sub-indices"
label variable sum_efw "Sum of selected economic freedom index sub-indices"
label variable KAOPEN "Chinn-Ito index for capital account openness"
label variable bank_superv "Banking supervision strength index"
label variable eci "Economic Complexity Index"
label variable eci_rank "Ranking based on the Economic Complexity Index"
label variable legor_uk "=1 if Legal origin United Kingdom"
label variable legor_fr "=1 if Legal origin France"
label variable legor_ge "=1 if Legal origin Germany"
label variable legor_sc "=1 if Legal origin Scandinavian"
label variable legor_so "=1 if Legal origin Soviet Union"
label variable bankacc_per_1000 "Bank accounts per 1,000 adults"
label variable egaldem_scal "Scaled V-Dem Egalitarian Index *100"
label variable avg_wgi "Average Worldwide Governance Indicators"
label variable sum_wgi "Sum of Worldwide Governance Indicators"
label variable schooling "School enrollment, secondary (% gross)"
label variable gdp_per_capita "GDP per capita growth (annual %)"
label variable priv_credit "Domestic credit to private sector (% of GDP)"
label variable gov_consumption "General government final consumption expenditure (% of GDP)"
label variable infl_gdp_defl "Inflation, GDP deflator (annual %)"
label variable infl_cpi "Inflation, consumer prices (annual %)"
label variable population_growth "Population growth (annual %)"
label variable trade "Trade (% of GDP)"
label variable unemployment "Unemployment, total (% of total labor force) (national estimate)"
label variable urban_pop "Urban population (% of total)"
label variable dum_crises "=1 if Banking Crises or Currency Crises or Debt Crises occured in the period"
label variable East_Asia_and_Pacific "World Bank regional classification"
label variable Europe_and_Central_Asia "World Bank regional classification"
label variable Latin_America_and_Caribbean_wb "World Bank regional classification"
label variable Middle_East_and_North_Africa "World Bank regional classification"
label variable North_America "World Bank regional classification"
label variable South_Asia "World Bank regional classification"
label variable Sub_Saharan_Africa_wb "World Bank regional classification"
label variable Central_and_Southern_Asia "SDGs (United Nations) regional classification"
label variable Eastern_and_South_Eastern_Asia "SDGs (United Nations) regional classification"
label variable Europe_and_Northern_America "SDGs (United Nations) regional classification"
label variable Latin_America_and_Caribbean_sdg "SDGs (United Nations) regional classification"
label variable Northern_Africa_and_Western_Asia "SDGs (United Nations) regional classification"
label variable Oceania "SDGs (United Nations) regional classification"
label variable Sub_Saharan_Africa_sdg "SDGs (United Nations) regional classification"
label variable hic "=1 if High income country (World Bank)"
label variable lic "=1 if Low income country (World Bank)"
label variable lmic "=1 if Lower middle income country (World Bank)"
label variable umic "=1 if Upper middle income country (World Bank)"
rename dum_crises crises
order crises, after(urban_pop)
order priv_credit, after(bankacc_per_1000)
order infl_cpi, after (crises)


* Natürlichen Logarithmus für jede Variable berechnen, um Ausreißern besser zu begegnen 
gen ln_gini_disp = ln(gini_disp)
gen ln_gini_mkt = ln(gini_mkt)
gen ln_high20low20 = ln(high20low20)
gen ln_top10bottom50 = ln(top10bottom50)
gen ln_avg_16_omori = ln(avg_16_omori)
gen ln_sum_16_omori = ln(sum_16_omori)
gen ln_avg_domestic_omori = ln(avg_domestic_omori)
gen ln_sum_domestic_omori = ln(sum_domestic_omori)
gen ln_avg_efw = ln(avg_efw)
gen ln_sum_efw = ln(sum_efw)
gen ln_KAOPEN = ln(KAOPEN)
gen ln_bank_superv = ln(bank_superv)
gen ln_bankacc_per_1000 = ln(bankacc_per_1000)
gen ln_priv_credit = ln(priv_credit)
gen ln_egaldem_scal = ln(egaldem_scal)
gen ln_avg_wgi = ln(avg_wgi)
gen ln_sum_wgi = ln(sum_wgi)
gen ln_schooling = ln(schooling)
gen ln_gdp_per_capita = ln(gdp_per_capita)
gen ln_gov_consumption = ln(gov_consumption)
gen ln_infl_gdp_defl = ln(infl_gdp_defl)
gen ln_population_growth = ln(population_growth)
gen ln_trade = ln(trade)
gen ln_unemployment = ln(unemployment)
gen ln_urban_pop = ln(urban_pop)
gen ln_infl_cpi = ln(infl_cpi)


* ln Variablen labeln
label variable ln_gini_disp "Post tax+transfer Gini from SWIID"
label variable ln_gini_mkt "Pre tax+transfer Gini from SWIID"
label variable ln_high20low20 "Ratio of top 20% to bottom 20% income, post tax+transfer"
label variable ln_top10bottom50 "Ratio of top 10% to bottom 50% income, pre tax+transfer"
label variable ln_avg_16_omori "Average of financial reform database dimensions 1 to 6"
label variable ln_sum_16_omori "Sum of financial reform database dimensions 1 to 6"
label variable ln_avg_domestic_omori "Average domestic financial reform dimensions"
label variable ln_sum_domestic_omori "Sum of domestic financial reform dimensions"
label variable ln_avg_efw "Average of selected economic freedom index sub-indices"
label variable ln_sum_efw "Sum of selected economic freedom index sub-indices"
label variable ln_KAOPEN "Chinn-Ito index for capital account openness"
label variable ln_bank_superv "Banking supervision strength index"
label variable ln_bankacc_per_1000 "Bank accounts per 1,000 adults"
label variable ln_egaldem_scal "Scaled V-Dem Egalitarian Index *100"
label variable ln_avg_wgi "Average Worldwide Governance Indicators"
label variable ln_sum_wgi "Sum of Worldwide Governance Indicators"
label variable ln_schooling "School enrollment, secondary (% gross)"
label variable ln_gdp_per_capita "GDP per capita growth (annual %)"
label variable ln_priv_credit "Domestic credit to private sector (% of GDP)"
label variable ln_gov_consumption "General government final consumption expenditure (% of GDP)"
label variable ln_infl_gdp_defl "Inflation, GDP deflator (annual %)"
label variable ln_infl_cpi "Inflation, consumer prices (annual %)"
label variable ln_population_growth "Population growth (annual %)"
label variable ln_trade "Trade (% of GDP)"
label variable ln_unemployment "Unemployment, total (% of total labor force) (national estimate)"
label variable ln_urban_pop "Urban population (% of total)"


* Festlegen der Paneldatenstruktur
encode country, generate(country_id)
order country_id country
xtset country_id year

