Peer Assesment for Getting and Cleaning Data
=========================================================

Files in Repository
----------------------------

* README.md - this file
* CodeBook.md - a file describing the data this repository will generate
* run_analysis.R - an R script which, when run with a working directory containing the UCI HAR Dataset, will product a tidy data set summary.

How to run this code
----------------------------

This code requires that the UCI HAR Dataset be in the working directory. It also uses the 
[rattle](http://cran.r-project.org/web/packages/rattle/index.html)package to normalize variable names.
From the command line, it can be run as follows:

      % R --no-save < run_analysis.R 
      
On my computer (a relatively recent)