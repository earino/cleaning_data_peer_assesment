Peer Assesment for Getting and Cleaning Data
=========================================================

Files in Repository
----------------------------

* [README.md](https://github.com/earino/cleaning_data_peer_assesment/blob/master/README.md) - this file
* [CodeBook.md](https://github.com/earino/cleaning_data_peer_assesment/blob/master/Codebook.md) - a file describing the data this repository will generate
* [run_analysis.R](https://github.com/earino/cleaning_data_peer_assesment/blob/master/run_analysis.R) - an R script which, when run with a working directory containing the UCI HAR Dataset, will product a tidy data set summary.

How to run this code
----------------------------

This code requires that the UCI HAR Dataset be in the working directory. It also uses the 
[rattle](http://cran.r-project.org/web/packages/rattle/index.html) package to normalize variable names.
From the command line, it can be run as follows:

      % R --no-save < run_analysis.R 
      
On my computer (a digital ocean $10/month droplet) the process takes this long:

      real    1m4.011s
      user    1m2.427s
      sys     0m0.580s
      
This process creates a file named uci_har_tidy.txt with the following characteristics:

      % ls -al uci_har_tidy.txt
      -rw-r--r-- 1 ed ed 918248 Apr 23 20:28 uci_har_tidy.txt
      % wc -l uci_har_tidy.txt 
      15481 uci_har_tidy.txt
