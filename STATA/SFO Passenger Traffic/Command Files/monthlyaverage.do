/*
* @author - Jash Mahipal
* Pulling consstructed dta file.
* Writing operation to generate time-series data
*/


clear
set more off

capture log close

log using "monthlyaverage.log", replace

use "../Constructed/passenger.dta"

tostring activityperiod, replace

*date
gen datevar = date(activityperiod, "YM")
format datevar %tm
order datevar, first


gen month = month(datevar)
gen year = year(datevar)
gen monthly = ym(year, month)
format monthly %tm

save "../Constructed/passengerformatdate.dta", replace

bys monthly operatingairline geosummary activitytypecode_cat: ///
	egen monthlytotal = total(passengercount) if activitytypecode_cat == 2


keep if activitytypecode_cat == 2
	
bys operatingairline geosummary: egen monthlyaverage = mean(monthlytotal)
egen airlinesector = group(operatingairline geosummary)
*tsset airlinesector monthly
preserve 

bys operatingairline geosummary: keep if _n==1
keep operatingairline geosummary monthlyaverage airlinesector

gsort geosummary -monthlyaverage
list operatingairline geosummary airlinesector if _n <6

gsort -geosummary -monthlyaverage
list operatingairline geosummary airlinesector if _n <6

restore

/* 
     +--------------------------------------------------------+
     |                 operatingairline   geosum~y   airlin~r |
     |--------------------------------------------------------|
  1. | United Airlines - Pre 07/01/2013   Domestic         74 |
  2. |                  United Airlines   Domestic         72 |
  3. |                American Airlines   Domestic         16 |
  4. |                 SkyWest Airlines   Domestic         62 |
  5. |                   Virgin America   Domestic         76 |
     +--------------------------------------------------------+

     +-------------------------------------------------------------+
     |                 operatingairline      geosummary   airlin~r |
     |-------------------------------------------------------------|
  1. |                  United Airlines   International         73 |
  2. | United Airlines - Pre 07/01/2013   International         75 |
  3. |                      Air Canada    International          6 |
  4. |        Lufthansa German Airlines   International         46 |
  5. |                  British Airways   International         22 |
     +-------------------------------------------------------------+

*/
sort monthly airlinesector
twoway (line monthlytotal monthly if airlinesector==74) ///
	   (line monthlytotal monthly if airlinesector==72) ///
	   (line monthlytotal monthly if airlinesector==16) ///
	   (line monthlytotal monthly if airlinesector==62) ///
	   (line monthlytotal monthly if airlinesector==76), ///
	   title (Domestic) xtitle(Month) ytitle(Num Passenger) ///
	   legend(order (1 "Pre United" 2 "United" 3 "American" 4 "SkyWest" 5 "Virgin"))
	   
graph export "../Constructed/domesticplot.png", replace

twoway (line monthlytotal monthly if airlinesector==73) ///
	   (line monthlytotal monthly if airlinesector==75) ///
	   (line monthlytotal monthly if airlinesector==6) ///
	   (line monthlytotal monthly if airlinesector==46) ///
	   (line monthlytotal monthly if airlinesector==22), ///
	   title (International) xtitle(Month) ytitle(Num Passenger) ///
	   legend(order (1 "United" 2 "Pre United" 3 "Air Canada" 4 "Lufthansa" 5 "British"))
	   
graph export "../Constructed/internationalplot.png", replace
	   

log close


