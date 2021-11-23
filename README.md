# kidstats

KidStats is a Shiny application to make subadult age estimations based on dental and skeletal development and skeletal diaphyseal metrics using mixed cumulative probit models.

<!--The Shiny application is best accessed directly with an internet connection here: https://bit.ly/KidStats. -->

<!--Alternatively, -->KidStats works best with RStudio (https://www.rstudio.com), which works well with the `shiny` package and function *pandoc*. 

This application is one product of the research of Kyra Stull, PhD (http://www.kyrastull.weebly.com), an Assistant Professor in the Department of Anthropology at the University of Nevada, Reno. Associated citations / articles are linked at the bottom of this document. 

Please cite this application as: 
> Stull, Kyra E., & Chu, Elaine Y. (2021). KidStats: a GUI to estimate components of the subadult biological profile (v0.2.2). Zenodo. https://doi.org/10.5281/zenodo.5601936	

## Installation

To access KidStats offline, copy ("clone") this repository using one of the following two methods:
1. Access the repository through a terminal system by typing the following code:

``` console
cd "file/path/to/desired/repository/location"
git clone https://github.com/ElaineYChu/kidstats
```

2. Download the repository as a zipped file by clicking the green "CODE" button on the top-right side and select 'Download ZIP'

## Usage

**TO RUN KIDSTATS IN RSTUDIO: ** 
1. Locate the "kidstats" folder in your system and the file called "ui.R".
2. Open the file with RStudio.
3. Locate and press the "Run App" button at the top-right corner of the "ui.R" script.

**TO RUN KIDSTATS IN BASE R: **
1. Set the working directory
``` r
setwd("file/path/to/kidstats")  # set working directory
```
2. Run the application
``` r
shiny::runApp()  # run KidStats
```

KidStats requires R version **3.2.1** or higher and will require the following packages in your local R system:
* shiny
* shinydashboard
* shinyjs
* tidyverse
* rmarkdown
* stringr
* doParallel
* yada

If you do not have one/any/all of these packages, KidStats will automatically install them for you, prior to running the application. This may require additional inputs from the user, such as pressing the [ENTER] button to allow packages to install.



