/*
@author - Jash Mahipal
*/

clear
set more off

use "../Constructed/CPS62.dta"

*CREATE THE TEXT LOG FILE WITH THE NAME CPS62-tabulations.log
log using "../CPS62-results.log", text


foreach var of varlist _all {
	tab `var'
}


*SAVE THE FINAL CLEANED DATA SET 
log close
