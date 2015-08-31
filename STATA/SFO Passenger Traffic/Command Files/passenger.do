/*
* @author - Jash Mahipal
* Pulling original dataset, detstringing the data by parsing
* encoding them to categorical variables, saving in contsructed. 
*/


clear 
set more off

*Data construction
capture mkdir "../Constructed"

*Processes data
import delimited using "../Importable data/MonthlyPassengerData_200507_to_201412.csv"



*All variables have meaningful label

*Encoding string variable to categorical

local stringvariables operatingairline operatingairlineiatacode publishedairline publishedairlineiatacode geosummary georegion activitytypecode pricecategorycode terminal boardingarea

foreach var of varlist `stringvariables' {
	encode `var', gen(`var'_cat)
}

*Saving formatted data
save "../Constructed/passenger.dta", replace


*end of do file
