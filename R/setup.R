##########################################
##
##      Script to install required
##    packages for KidStats (v.0.2.0)
##
##########################################

## Vector of required packages for KidStats
required_packages <- c("shiny","shinydashboard",
                       "shinyjs","tidyverse",
                       "rmarkdown","stringr",
                       "devtools","yada","DT","doParallel")

## Loop through required packages and 
## install those that are not in the local system
if (!all(required_packages %in% .packages(all=TRUE))) {
  
  for (i in required_packages) {
    
    if (!(i %in% .packages(all=TRUE))) {
      
      if (i != "yada") {
        install.packages(i)
      } else {
        devtools::install_github("MichaelHoltonPrice/yada", ref="dev")
      }

    } else {
      next
    }
  }
}



# install.packages("shiny")
# install.packages("shinydashboard")
# install.packages("shinyjs")
# install.packages("tidyverse")
# install.packages("rmarkdown")
# install.packages("stringr")
# install.packages("doParallel")
# install.packages("devtools")

# devtools::install_github("MichaelHoltonPrice/yada",ref="dev")


