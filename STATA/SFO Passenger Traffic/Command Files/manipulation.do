/*
	* @author - Jash Mahipal
	* Pulling passenger formatted data, to run
	* manipulation operations.
	* Export excel sheets
*/


use "../Constructed/passengerformatdate.dta", clear

bys monthly operatingairline activitytypecode_cat: ///
	egen monthlytotal = total(passengercount) if activitytypecode_cat == 1
	
keep if activitytypecode_cat==1
keep year month operatingairline monthlytotal

*Saves yearly data to itrerate over every yea
save "../Constructed/passengeryearlydata.dta", replace

forvalues yr=2005/2014 {
	use if year==`yr' using "../Constructed/passengeryearlydata.dta", clear
	bys operatingairline month: keep if _n==1
	bys operatingairline: egen yearlytotal = total(monthlytotal)
	reshape wide monthlytotal, i(operatingairline) j(month)
	if year==2005 {
		gen monthlytotal1=.
		gen monthlytotal2=.
		gen monthlytotal3=.
		gen monthlytotal4=.
		gen monthlytotal5=.
		gen monthlytotal6=.
		order operatingairline monthlytotal1 monthlytotal2 monthlytotal3 ///
			monthlytotal4 monthlytotal5 monthlytotal6 monthlytotal7 ///
			monthlytotal8 monthlytotal9 monthlytotal10 monthlytotal11 ///
			monthlytotal12 yearlytotal
			
	}
	drop year
	*exports csv sheet in Command Files directory
	outsheet using `yr'.csv, comma replace
	}

