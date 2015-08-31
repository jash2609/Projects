/*
* @author - Jash Mahipal
* Pulling original dataset, detstringing the data by parsing
* converting them to integers and for values represented by (*, -) we record
* them for missing values. Store the cleaned data in cleaned.dta
*/

clear
set more off

*Data construction
capture mkdir "../Constructed"

*Processes data in a String form
infile using cpsmar62dict.txt


*iterating over all variables, and destringing them, keeping track of N/A values (if any)

foreach variable of varlist _all {
	quietly destring `variable', ignore(* -) replace
}

*Saving cleaned data
save "../Constructed/cleaned.dta", replace
