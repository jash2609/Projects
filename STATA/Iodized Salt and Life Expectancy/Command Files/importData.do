/*
 * @author Jash Mahipal 
 * This file imports data from the "Original Data" directory,
 * Imports the data to a .dta file, which will be used for our
 * analysis. This makes sure that we do not modify the original 
 * dataset in case there is a need to refer to it.
 */
 
 clear
 set more off
 
 *Directory Creation to hold constructed data
 capture mkdir "../Constructed Data"
 
 *Importing Data
 import delimited using "../Original Data/WDI_decade3.csv"
 
 *Saving in a dta file
 save "../Constructed Data/WDI_dataset.dta"
 
 *end of file.
 
