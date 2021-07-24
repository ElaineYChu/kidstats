# kidstats

KidStats is a Shiny application to make subadult age estimations based on dental and skeletal development and skeletal diaphyseal metrics using mixed cumulative probit models.

The Shiny application is best accessed directly with an internet connection here: https://kyra-stull.shinyapps.io/kidstats/. 

Alternatively, KidStats works best with RStudio (https://www.rstudio.com), which works well with the `shiny` package and function *pandoc*. 

This application is one product of the research of Kyra Stull, PhD (http://www.kyrastull.weebly.com), an Assistant Professor in the Department of Anthropology at the University of Nevada, Reno. Associated citations / articles are linked at the bottom of this document. 

Please cite this application as: 
> K.E. Stull (2021). kidstats: Age Estimation. R package version 0.2.0. DOI: *TBD*

## Installation

To access KidStats offline, copy ("clone") this repository using one of the following two methods:
1. Access the repository through a terminal system by typing the following code:

``` console
cd "file/path/to/desired/repository/location"
git clone https://github.com/ElaineYChu/kidstats
```

2. Download the repository as a zipped file by clicking the green "CODE" button on the top-right side and select 'Download ZIP'

## Usage

Once the repository is cloned onto your local machine, open up RStudio. KidStats requires R version **3.2.1** or higher and will require the following packages in your local R system:
* shiny
* shinydashboard
* shinyjs
* tidyverse
* rmarkdown
* stringr
* yada

If you do not have one/some/all of the above packages in your local system, please set your working directory to the cloned repository and run the following code in your R console:

```r
setwd("file/path/to/desired/repository/location/kidstats")  # set working directory to kidstats or kidstats-main, depending on your folder name
source("setup.R")  # install required packages
```

After setting your working directory and ensuring all packages are installed, run the following code to access KidStats:

``` r
runApp()  # run KidStats

```




