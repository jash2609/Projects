Authored by Jash Mahipal

 Current Population Survery Data is used for this project. This data set was created over fifty years ago. The data is in what's called a fixed width format which was the standard in the era of punch cards and mainframe computing and still in use in many legacy data collection and reporting processes. The goal is to produce a clean and ready to analyze dataset in Stata format.

The datafile CPS62-results.txt in this folder is created by using STATA/IC. For more results use STATA/MP***

This directory contains the following subdirectories and files:

1. Command Files: All do files, need to be executed in Stata in the order described within. 
2. Constructed: Datasets that were modified during analysis. This ensures we do not modify
the original dataset. (dta formats) 
3. Importable Data: Dataset that we import. (CSV format)
4. Results: Log files and graph that exhibit our results.
5. CPS61-Errata: explaining any inconsisitencies within the data


***[NOTE] - The tabulate.do does not process all values in Stata/IC however it does processes values in STATA/MP.
The folder does not have a directory called Original Data due ot size constraints. The data is imported from Importable Data
The contructed folder does not has a cleaned.dta due to size constraints, can be recreated simply by executing parsing.do
It has CPS62-assignment.dta though

Navigate and set the working directory to Command Files to begin. 