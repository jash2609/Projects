/*
 * @author Jash Mahipal
 * This file creates the necessary dataset by cleaning data
 * and keeping the necessary variables. The data currently
 * has 1,175 variables and we need to keep it to 7 variables
 * for a particular decade. The file further creates tab files
 * summarizing all variables in the results folder.
 */
 
 clear
 set more off
 
 *Accessing data file
 use "../Constructed Data/WDI_dataset.dta"
 
 *Creating a dataset by keeping the variables of interest
 keep isocode decade sn_itk_salt_zs ny_gdp_pcap_cd sp_dyn_le00_in ///
	sh_xpd_pcap sh_med_phys_zs
	
*Assigning undertandable names to variables	
rename sn_itk_salt_zs saltConsumption
rename ny_gdp_pcap_cd gdpPerCapita
rename sp_dyn_le00_in lifeExpectancy
rename sh_med_phys_zs physicians
rename sh_xpd_pcap healthExpenditure

*Assigning undertandable names to variables	
label var saltConsumption "Consumption of iodized salt (%of households)"
label var gdpPerCapita "GDP per capita (current US$)"
label var lifeExpectancy "Life expectancy at birth (years)"
label var physicians "Physicians (per 1,000 people)"
label var healthExpenditure "Health expenditure per capita (current US$)"
label var isocode "Code of each country"

*Converting string to int
encode decade, gen (decade_cat)
label var decade_cat "Categorizing decade ex. 1970s = 2, 2000s = 5"

*Keeping data for decade 2000's
keep if decade_cat == 5

drop decade

*saving the constructed/cleaned data file
save "../Constructed Data/cleanedData.dta", replace

*Store a log file summarizing all variables kept
capture log close
capture mkdir "../Results"
log using "../Results/datasetSummary.log", replace
use "../Constructed Data/cleanedData.dta"

foreach var of varlist _all {
	describe `var'
}

*Close the log file
log close

*End Of File
