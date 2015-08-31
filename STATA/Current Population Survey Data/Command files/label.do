*@author - Jash Mahipal
* use cleaned data and labels all variables

clear
set more off

use "../Constructed/cleaned.dta" 

* Assign labels to categorical variables using the data dictionary

label define agesexcolLbl 0 "whiteMale 14-15" 1 "whiteMale 16-17" 2 "whiteMale 18-19" 3 "whiteMale 20-24" 4 "whiteMale 25-29" 5 "whiteMale 30-34" 6 "whiteMale 35-39" 7 "whiteMale 40-44" 8 "whiteMale 45-49" 9 "whiteMale 50-54" 10 "whiteMale 55-59" 11 "whiteMale 60-64" 12 "whiteMale 65-69" 13 "whiteMale 70+" 14 "whiteFemale 14-15" 15 "whiteFemale 16-17" 16 "whiteFemale 18-19" 17 "whiteFemale 20-24" 18 "whiteFemale 25-29" 19 "whiteFemale 30-34" 20 "whiteFemale 35-39" 21 "whiteFemale 40-44" 22 "whiteFemale 45-49" 23 "whiteFemale 50-54" 24 "whiteFemale 55-59" 25 "whiteFemale 60-64" 26 "whiteFemale 65-69" 27 "whiteFemale 70+" 28 "NonwhiteMale 14-15" 29 "NonwhiteMale 16-17" 30 "NonwhiteMale 18-19" 31 "NonwhiteMale 20-24" 32 "NonwhiteMale 25-29" 33 "NonwhiteMale 30-34" 34 "NonwhiteMale 35-39" 35 "NonwhiteMale 40-44" 36 "NonwhiteMale 45-49" 37 "NonwhiteMale 50-54" 38 "NonwhiteMale 55-59" 39 "NonwhiteMale 60-64" 40 "NonwhiteMale 65-69" 41 "NonwhiteMale 70+" 42 "NonwhiteFemale 14-15" 43 "NonwhiteFemale 16-17" 44 "NonwhiteFemale 18-19" 45 "NonwhiteFemale 20-24" 46 "NonwhiteFemale 25-29" 47 "NonwhiteFemale 30-34" 48 "NonwhiteFemale 35-39" 49 "NonwhiteFemale 40-44" 50 "NonwhiteFemale 45-49" 51 "NonwhiteFemale 50-54" 52 "NonwhiteFemale 55-59" 53 "NonwhiteFemale 60-64" 54 "NonwhiteFemale 65-69" 55 "NonwhiteFemale 70+"
label values agesexcol agesexcolLbl

label define age2Lbl 0 "14-17" 1 "18-19" 2 "20-25" 3 "25-35" 4 "35-44" 5 "45-54" 6 "55-64" 7 "65+"
label values age2 age2Lbl

label define age3Lbl 0 "14-19" 1 "20-24"  2 "25-64" 3 "65+"
label values age3 age3Lbl

label define maritalLbl 0 "marriedWithSpouse" 1 "marriedWithoutSpouse" 2 "widowedDivorced" 3 "Single"
label values married maritalLbl

label define sexrelLbl 0 "maleHead" 1 "maleOther" 2 "femaleHead" 3 "wifeOfHead" 4 "femaleOther" 
label values sexrel sexrelLbl

label define colsexLbl 0 "maleWhite" 1 "femaleWhite" 2 "maleNonwhite" 3 "femaleNonwhite" 
label values colsex colsexLbl

label define raceLbl 0 "White" 1 "Negro" 2 "Other"
label values race raceLbl

label define farmsexLbl 0 "farmMale" 1 "farmFemale" 2 "nonfarmMale" 3 "nonfarmFemale"
label values farmsex farmsexLbl

label define resCPSLbl 0 "Urban" 1 "Nonfarm" 2 "Farm" 
label values resCPS resCPSLbl

label define vetStatLbl 0 "Veteran" 1 "Nonveteran"
label values vetStat vetStatLbl

label define selStateLbl 0 "otherState" 1 "selectedState" 
label values selState selStateLbl

label define employ1Lbl 0 "workingFullTime" 1 "workingPartTime" 2 "With a job, not at work" 3 "lookingForWork" 4 "temporaryLaidOff" 5 "newJob" 6 "newJobSchool" 7 "House" 8 "School" 9 "Unable" 10 "Unpaid <15Hrs" 11 "Other"
label values employ1 employ1Lbl

label define employ2Lbl 0 "employedAgriculture" 1 "employedNonagriculture" 2 "Unemployed" 3 "House" 4 "School" 5 "Unable" 6 "Other"
label values employ2 employ2Lbl

label define employ3Lbl 0 "employedAgriculture" 1 "employedNonagriculture" 2 "Unemployed" 3 "Not in labor force"
label values employ3 employ3Lbl

label define majorActLbl 0 "Working" 1 "Looking" 2 "withJob" 3 "House" 4 "School" 5 "Unable" 6 "Other"
label values majorAct majorActLbl

label define unemployLbl 0 "notExperienced" 1 "Experienced"
label values unemploy unemployLbl

label define industryLbl 0 "workingAgriculture" 1 "workingNonagriculture"
label values industry industryLbl

label define region1Lbl 0 "South" 1 "notSouth" 
label values region1 region1Lbl

label define region2Lbl 0 "Northeast" 1 "North Central" 2 "South" 3 "West"
label values region2 region2Lbl

label define clswkr1Lbl 0 "agricultureWorker" 1 "agricultureSelfEmployed" 2 "agricultureUnpaid" 3 "nonagriculturePrivateHousehhold" 4 "nonagricultureOtherPrivate" 5 "nonagricultureGovt" 6 "nonagricultureSelfEmployed" 7 "nonagricultureUnpaid"
label values clswkr1 clswkr1Lbl

label define clswkr2Lbl 0 "privateWage" 1 "Govt" 2 "selfEmployed" 3 "Unpaid"
label values clswkr2 clswkr2Lbl

label define reasonpartLbl 0 "slackWork" 1 "materialShortage" 2 "plant/machine repairs" 3 "newJob" 4 "terminatedJob" 5 "Could find only" 6 "Holiday" 7 "laborDispute" 8 "badWeather" 9 "ownIllness" 10 "onVacation" 11 "too busy with house, school" 12 "Did not want" 13 "Full time peak season only" 14 "Other" 15 "nonworkers/ full time"
label values reasonpart reasonpartLbl

label define usualLbl 0 "Agriculture, usually full time" 1 "Agriculture, usually part time" 2 "Nonagriculture, usually full time" 3 "Nonagriculture, usually part time"
label values usual usualLbl

label define detHourLbl 0 "1-14 hours" 1 "15-21 hours" 2 "22-29 hours" 3 "30-34 hours" 4 "35-39 hours" 5 "40 hours" 6 "41-43 hours" 7 "44 hours" 8 "45-47 hours" 9 "48 hours" 10 "49-54 hours" 11 "55-59 hours" 12 "60-69 hours" 13 "70+ hours" 14 "Nonworkers"
label values detHour detHourLbl

label define intermHrlabel 0 "1-34 hours: Usually full time, economic" 1 "1-34 hours: Usually full time, other" 2 "1-34 hours: Usually part time, economic" 3 "1-34 hours: Usually part time, other" 4 "35-39 hours" 5 "40 hours" 6 "41-47 hours" 7 "48 hours" 8 "49+ hours" 9 "Nonworkers"
label values intermHr intermHrlabel

label define sumhourlabel 0 "1-34 hours: Usually full time, economic" 1 "1-34 hours: Usually full time, other" 2 "1-34 hours: Usually part time, economic" 3 "1-34 hours: Usually part time, other" 4 "35-40 hours" 5 "41+hours" 6 "Nonworkers"
label values sumhour sumhourlabel

label define duraEmpLbl 0 "Under 1 week" 1 "1 week" 2 "2 weeks" 3 "3 weeks" 4 "4 weeks" 5 "5 weeks" 6 "6 weeks" 7 "7-10 weeks" 8 "11-14 weeks" 9 "15-18 weeks" 10 "19-22 weeks" 11 "23-26 weeks" 12 "27-34 weeks" 13 "35-42 weeks" 14 "43-50 weeks" 15 "51-52 weeks" 16 "Over 52 weeks" 17 "Not unemployed"
label values duraEmp duraEmpLbl

label define intDuraEmpLbl 0 "Under 4 weeks" 1 "4 weeks" 2 "5-6 weeks" 3 "7-10 weeks" 4 "11-14 weeks" 5 "15-26 weeks" 6 "Over 26 weeks" 7 "Not unemployed"
label values intDuraEmp intDuraEmpLbl

label define singleWkUnempLbl 0 "0 weeks unemployed" 1 "1 weeks unemployed" 2 "2 weeks unemployed" 3 "3 weeks unemployed" 4 "4 weeks unemployed" 5 "5 weeks unemployed" 6 "6 weeks unemployed" 7 "7 weeks unemployed" 8 "8 weeks unemployed" 9 "9 weeks unemployed" 10 "10 weeks unemployed" 11 "11 weeks unemployed" 12 "12 weeks unemployed" 13 "13 weeks unemployed" 14 "14 weeks unemployed" 15 "15 weeks unemployed" 16 "16 weeks unemployed" 17 "17 weeks unemployed" 18 "18 weeks unemployed" 19 "19 weeks unemployed" 20 "20 weeks unemployed" 21 "21 weeks unemployed" 22 "22 weeks unemployed" 23 "23 weeks unemployed" 24 "24 weeks unemployed" 25 "25 weeks unemployed" 26 "26 weeks unemployed" 27 "27 weeks unemployed" 28 "28 weeks unemployed" 29 "29 weeks unemployed" 30 "30 weeks unemployed" 31 "31 weeks unemployed" 32 "32 weeks unemployed" 33 "33 weeks unemployed" 34 "34 weeks unemployed" 35 "35 weeks unemployed" 36 "36 weeks unemployed" 37 "37 weeks unemployed" 38 "38 weeks unemployed" 39 "39 weeks unemployed" 40 "40 weeks unemployed" 41 "41 weeks unemployed" 42 "42 weeks unemployed" 43 "43 weeks unemployed" 44 "44 weeks unemployed" 45 "45 weeks unemployed" 46 "46 weeks unemployed" 47 "47 weeks unemployed" 48 "48 weeks unemployed" 49 "49 weeks unemployed" 50 "50 weeks unemployed" 51 "51 weeks unemployed" 52 "52 weeks unemployed" 53 "53 weeks unemployed" 54 "54 weeks unemployed" 55 "55 weeks unemployed" 56 "56 weeks unemployed" 57 "57 weeks unemployed" 58 "58 weeks unemployed" 59 "59 weeks unemployed" 60 "60 weeks unemployed" 61 "61 weeks unemployed" 62 "62 weeks unemployed" 63 "63 weeks unemployed" 64 "64 weeks unemployed" 65 "65 weeks unemployed" 66 "66 weeks unemployed" 67 "67 weeks unemployed" 68 "68 weeks unemployed" 69 "69 weeks unemployed" 70 "70 weeks unemployed" 71 "71 weeks unemployed" 72 "72 weeks unemployed" 73 "73 weeks unemployed" 74 "74 weeks unemployed" 75 "75 weeks unemployed" 76 "76 weeks unemployed" 77 "77 weeks unemployed" 78 "78 weeks unemployed" 79 "79 weeks unemployed" 80 "80 weeks unemployed" 81 "81 weeks unemployed" 82 "82 weeks unemployed" 83 "83 weeks unemployed" 84 "84 weeks unemployed" 85 "85 weeks unemployed" 86 "86 weeks unemployed" 87 "87 weeks unemployed" 88 "88 weeks unemployed" 89 "89 weeks unemployed" 90 "90 weeks unemployed" 91 "91 weeks unemployed" 92 "92 weeks unemployed" 93 "93 weeks unemployed" 94 "94 weeks unemployed" 95 "95 weeks unemployed" 96 "96 weeks unemployed" 97 "97 weeks unemployed" 98 "98 weeks unemployed" 99 "99 weeks unemployed" 100 "Not unemployed"
label values singleWkUnemp singleWkUnempLbl

label define reasonNtWorkLbl 0 "Illness" 1 "Vacation" 2 "Weather" 3 "laborDispute" 4 "Other" 
label values reasonNtWork reasonNtWorkLbl

label define incawageLbl 0 "NotAllocated" 1 "Allocated" 
label values incawage incawageLbl

label define incanfarmLbl 0 "NotAllocated" 1 "Allocated" 
label values incanfarm incanfarmLbl

label define incafarmLbl 0 "NotAllocated" 1 "Allocated" 
label values incafarm incafarmLbl

label define incaotherLbl 0 "NotAllocated" 1 "Allocated" 
label values incaother incaotherLbl

label define popstatusLbl 0 "Civilian14+" 1 "ArmedForces" 2 "ChildUnder14" 3 "Inmates"
label values popstatus popstatusLbl

label define famnumLbl 0 "OtherPersons" 1 "PersonsInSubfamilies or SecondaryFamilies" 2 "PersonsInSubFamilies or SecondaryFamilies" 3 "PersonsInSubFamilies or SecondaryFamilies" 4 "PersonsInSubFamilies or SecondaryFamilies" 5 "PersonsInSubFamilies or SecondaryFamilies" 6 "PersonsInSubFamilies or SecondaryFamilies" 
label values famnum famnumLbl

label define famrelLbl 0 "Head" 1 "Wife" 2 "Child Under 18" 3 "OtherRelative"
label values famrel famrelLbl

label define typeoffamLbl 0 "PrimaryFamily" 1 "Subfamily" 2 "SecondaryFamily" 3 "PrimaryIndividual" 4 "Secondaryindividual"
label values typeoffam typeoffamLbl

label define hhrelaLbl 0 "Head" 1 "Wife" 2 "Child" 3 "Other relative" 4"Nonrelative with no own relative" 5 "Nonrelative with own relative"
label values hhrela hhrelaLbl

label define marital3Lbl 0 "Married, spouse present" 1 "Married, spouse absent - AF" 2 "Married, spouse absent-other" 3 "Widowed" 4 "Divorced" 5 "Separated" 6 "Never married"
label values marital3 marital3Lbl

label define samehsLbl 0 "No" 1 "Yes"
label values samehouse samehsLbl

label define samecountyLbl 0 "No" 1 "Yes"
label values samecounty samecountyLbl

label define whichStateLbl 0 "ThisState" 1 "DifferentState" 2 "Abroad" 
label values whichState whichStateLbl

label define secondwageLbl 0 "None" 1 "Loss + $1-$499" 2 "$500-$999" 3 "$1,000-$1,499" 4 "$1,500-$1,999" 5 "$2,000-$2,499" 6 "$2,500-$2,999" 7 "$3,000-$3,499" 8 "$3,500-$3,999" 9 "$4,000-$4,499" 10 "$4,500-$4,999"11 "$5,000-$5,999" 12 "$6,000-$6,999" 13 "$7,000-$7,999" 14 "$8,000-$9,999" 15 "$10,000-$14,999" 16 "$15,000-$24,999" 17 "$25,000+" 18 "NA" 19 "Not in Income Sample"
label values secondwage secondwageLbl

label define secondnfincLbl 0 "None" 1 "Loss + $1-$499" 2 "$500-$999" 3 "$1,000-$1,499" 4 "$1,500-$1,999" 5 "$2,000-$2,499" 6 "$2,500-$2,999" 7 "$3,000-$3,499" 8 "$3,500-$3,999" 9 "$4,000-$4,499" 10 "$4,500-$4,999"11 "$5,000-$5,999" 12 "$6,000-$6,999" 13 "$7,000-$7,999" 14 "$8,000-$9,999" 15 "$10,000-$14,999" 16 "$15,000-$24,999" 17 "$25,000+" 18 "NA" 19 "Not in Income Sample"
label values secondnfinc secondnfincLbl

label define secondfincLbl 0 "None" 1 "Loss + $1-$499" 2 "$500-$999" 3 "$1,000-$1,499" 4 "$1,500-$1,999" 5 "$2,000-$2,499" 6 "$2,500-$2,999" 7 "$3,000-$3,499" 8 "$3,500-$3,999" 9 "$4,000-$4,499" 10 "$4,500-$4,999"11 "$5,000-$5,999" 12 "$6,000-$6,999" 13 "$7,000-$7,999" 14 "$8,000-$9,999" 15 "$10,000-$14,999" 16 "$15,000-$24,999" 17 "$25,000+" 18 "NA" 19 "Not in Income Sample"
label values secondfinc secondfincLbl

label define secondUneincLbl 0 "None" 1 "Loss + $1-$499" 2 "$500-$999" 3 "$1,000-$1,499" 4 "$1,500-$1,999" 5 "$2,000-$2,499" 6 "$2,500-$2,999" 7 "$3,000-$3,499" 8 "$3,500-$3,999" 9 "$4,000-$4,499" 10 "$4,500-$4,999"11 "$5,000-$5,999" 12 "$6,000-$6,999" 13 "$7,000-$7,999" 14 "$8,000-$9,999" 15 "$10,000-$14,999" 16 "$15,000-$24,999" 17 "$25,000+" 18 "NA" 19 "Not in Income Sample" 
label values seconduneinc secondUneincLbl

label define secondtincLbl 0 "None" 1 "L$1-$499" 2 "$500-$999" 3 "$1,000-$1,499" 4 "$1,500-$1,999" 5 "$2,000-$2,499" 6 "$2,500-$2,999" 7 "$3,000-$3,499" 8 "$3,500-$3,999" 9 "$4,000-$4,499" 10 "$4,500-$4,999"11 "$5,000-$5,999" 12 "$6,000-$6,999" 13 "$7,000-$7,999" 14 "$8,000-$9,999" 15 "$10,000-$14,999" 16 "$15,000-$24,999" 17 "$25,000+" 18 "NA" 19 "Not in Income Sample"
label values secondtinc secondtincLbl

label define febMarLbl 0 "Match" 1 "NoMatch"
label values febMar febMarLbl

label define uninctypLbl 0 "socialSecurityOnly" 1 "interestOnly" 2 "rentOnly" 3 "otherAndCombination"
label values uninctyp uninctypLbl

label define wksLbl 2 "None" 3 "1-4 weeks" 4 "5-10 weeks" 5 "11-14 weeks" 6 "15-26 weeks" 7 "Over 26 weeks"
label values wklayoff wksLbl 
label values wksSick wksLbl 
label values wksUnpAbs wksLbl  
label values wksHome wksLbl
label values wksSchool wksLbl
label values wksElse wksLbl

label define lvleducLbl 0 "None" 1 "Elementary" 2 "HighSchool" 3 "College" 
label values lvlofeduc lvleducLbl

label define gradattLbl 0 "None" 1 "1stYear" 2 "2ndYear" 3 "3rdYear" 4 "4thYear" 5 "5thYear" 6 "6thYear" 7 "7thYear" 8 "8thYear"
label values gradAtten gradattLbl

label define ageatfmarLbl 0 "14 Years" 1 "15 Years" 2 "16 Years" 3 "17 Years" 4 "18 Years" 5 "19 Years" 6 "20 Years" 7 "21 Years" 8 "22 Years" 9 "23 Years" 10 "24 Years" 11 "25 Years" 12 "26 Years" 13 "27 Years" 14 "28 Years" 15 "29 Years" 16 "30 Years" 17 "31 Years" 18 "32 Years" 19 "33 Years" 20 "34 Years" 21 "35 Years" 22 "36 Years" 23 "37 Years" 24 "38 Years" 25 "39 Years" 26 "40 Years" 27 "41 Years" 28 "42 Years" 29 "43 Years" 30 "44 Years" 31 "45+ Years" 
label values ageatfmar agefmarLbl


*SAVE THE FINAL CLEANED DATA SET 
*WITH THE NAME CPS62.dta
save "../Constructed/CPS62.dta", replace
