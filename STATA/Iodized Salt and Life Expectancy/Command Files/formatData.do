/*
 * @author Jash Mahipal 
 * This file creates two new variables based on GDP per capita
 * which is used for further analysis.
 */
 
 clear
 set more off
 
 use "../Constructed Data/cleanedData.dta"
 
 /* Create an indicator variable poor
  * If a country's GDP > $755 poor = 0 
  * If a country's GDP < $755 poor = 1 
  */
  
  gen poor = 0
  replace poor = 1 if gdpPerCapita <755
  
 * Create an interaction term 
 gen poorSaltConsumption = poor*saltConsumption
 
 /* Create an indicator variable rich
  * If a country's GDP > $755 rich = 1 
  * If a country's GDP < $755 rich = 0 
  */
  gen rich = 0
  replace rich = 1 if gdpPerCapita >755
  
 * Create an interaction term 
 gen richSaltConsumption = rich*saltConsumption
  
 
 label var poor "Indicator variable 0:gdpPerCapita>$755 else 1"
 label var poorSaltConsumption "Salt consumption of a poor country"
 label var rich "Indicator variable 1:gdpPerCapita>$755 else 0"
 label var richSaltConsumption "Salt consumption of a rich country"
 
 save "../Constructed Data/toUseData.dta", replace
 
 *end of file
