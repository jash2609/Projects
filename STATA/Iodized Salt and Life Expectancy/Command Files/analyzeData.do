/*
 * @author Jash Mahipal
 * This file runs regressions and exports graphs to Results
 */
 
 clear
 set more off
 
 use "../Constructed Data/toUseData.dta"
 
 capture log close
 log using "../Results/regressionResults.log", replace
 
 *Generate two regression tables
 
 ************** Basic Analysis ********************
 * LifeExpectancy = A + B(saltConsumption) + Control(Phsyicians, Expd) + E
 reg lifeExpectancy saltConsumption physicians healthExpenditure
 
 ************** GDP Analysis ***************
 * LifeExpectancy = A + B(saltConsumption) + B(poor) + C(poorSaltConsumption)+ E
 reg lifeExpectancy saltConsumption poor poorSaltConsumption
 
 log close
 
 scatter lifeExpectancy poorSaltConsumption if poorSaltConsumption >0 || ///
	lfit lifeExpectancy poorSaltConsumption
	
 graph export "../Results/poorCountry.png", replace
 
 scatter lifeExpectancy richSaltConsumption if richSaltConsumption >0 || ///
	lfit lifeExpectancy richSaltConsumption
	
 graph export "../Results/richCountry.png", replace
 
 *end of file
