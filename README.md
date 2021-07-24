# kidstats

KidStats is a Shiny application to make subadult age estimations based on dental and skeletal development and skeletal diaphyseal metrics using mixed cumulative probit models.

The Shiny application is best accessed directly with an internet connection here: https://kyra-stull.shinyapps.io/kidstats/. 

Alternatively, KidStats works best with RStudio (https://www.rstudio.com), which works well with the `shiny` package and function *pandoc*. 

This application is one product of the research of Kyra Stull, PhD (http://www.kyrastull.weebly.com), an Assistant Professor in the Department of Anthropology at the University of Nevada, Reno. Associated citations / articles are linked at the bottom of this document. 

Please cite this application as: 
> K.E. Stull (2021). kidstats: Age Estimation. R package version 0.2.0. DOI: *TBD*

## Installation

KidStats requires R version **3.2.1** or higher. 

``` r
install.packages("devtools")  # install package if not already in library

devtools::install_github("ElaineYChu/kidstats")
```

## Usage

To use KidStats in RStudio, type the following in your R console:

``` r
library(kidstats)
kidstats()
```
