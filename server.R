# kidstats2 server.R

library(shiny, quietly = TRUE)
library(shinydashboard, quietly = TRUE)
library(dplyr, quietly = TRUE)
# library(purrr, quietly = TRUE)
library(rmarkdown, quietly = TRUE)
library(yada, quietly = TRUE)
library(stringr, quietly = TRUE)
library(doParallel, quietly = TRUE)
#library(future, quietly = TRUE)

source("R/helpers.R")
source("R/model.R")

shinyServer(function(input, output, session){
  
  ############################ DATA #########################################
  ## This is where we are grabbing the user-entered data from the UI and building
  ## the 'case_data' data.frame for later use.
  ###########################################################################
  # Load var_info
  
  # Load the variable info file
  var_info <- reactive({
    var_info_path <- choose_var_info(input$refsamp)
    load_var_info(var_info_path)
  })
  
  # Create case_data as named vector
  case_data <- reactive({
    # data from longbone panel
    LB0 <- data.frame(
      "HDL_L" = as.numeric(input$HDL_L), "HDL_R" = as.numeric(input$HDL_R), 
      "HMSB_L" = as.numeric(input$HMSB_L), "HMSB_R" = as.numeric(input$HMSB_R), 
      "HPB_L" = as.numeric(input$HPB_L), "HPB_R" = as.numeric(input$HPB_R), 
      "HDB_L" = as.numeric(input$HDB_L), "HDB_R" = as.numeric(input$HDB_R), 
      #"HCB_L" = as.numeric(input$HCB_L), "HCB_R" = as.numeric(input$HCB_R), 
      #"HIB_L" = as.numeric(input$HIB_L), "HIB_R" = as.numeric(input$HIB_R),
      "RDL_L" = as.numeric(input$RDL_L), "RDL_R" = as.numeric(input$RDL_R), 
      "RMSB_L" = as.numeric(input$RMSB_L), "RMSB_R" = as.numeric(input$RMSB_R), 
      "RPB_L" = as.numeric(input$RPB_L), "RPB_R" = as.numeric(input$RPB_R), 
      "RDB_L" = as.numeric(input$RDB_L), "RDB_R" = as.numeric(input$RDB_R), 
      "UDL_L" = as.numeric(input$UDL_L), "UDL_R" = as.numeric(input$UDL_R), 
      "UMSB_L" = as.numeric(input$UMSB_L), "UMSB_R" = as.numeric(input$UMSB_R), 
      "FDL_L" = as.numeric(input$FDL_L), "FDL_R" = as.numeric(input$FDL_R), 
      "FMSB_L" = as.numeric(input$FMSB_L), "FMSB_R" = as.numeric(input$FMSB_R), 
      "FDB_L" = as.numeric(input$FDB_L), "FDB_R" = as.numeric(input$FDB_R), 
      #"FCB_L" = as.numeric(input$FCB_L), "FCB_R" = as.numeric(input$FCB_R), 
      #"FIB_L" = as.numeric(input$FIB_L), "FIB_R" = as.numeric(input$FIB_R),
      "TDL_L" = as.numeric(input$TDL_L), "TDL_R" = as.numeric(input$TDL_R), 
      "TMSB_L" = as.numeric(input$TMSB_L), "TMSB_R" = as.numeric(input$TMSB_R), 
      "TPB_L" = as.numeric(input$TPB_L), "TPB_R" = as.numeric(input$TPB_R), 
      "TDB_L" = as.numeric(input$TDB_L), "TDB_R" = as.numeric(input$TDB_R), 
      "FBDL_L" = as.numeric(input$FBDL_L), "FBDL_R" = as.numeric(input$FBDL_R)#, 
      #"PIH_L" = as.numeric(input$PIH_L), "PIH_R" = as.numeric(input$PIH_R), 
      #"PIB_L" = as.numeric(input$PIB_L), "PIB_R" = as.numeric(input$PIB_R)
    )
    
    # data from dentition panel
    DENT0 <- data.frame(
      "max_M3_L" = as.numeric(input$max_M3_L), "max_M2_L" = as.numeric(input$max_M2_L), "max_M1_L" = as.numeric(input$max_M1_L), 
      "max_PM2_L" = as.numeric(input$max_PM2_L), "max_PM1_L" = as.numeric(input$max_PM1_L),
      "max_C_L" = as.numeric(input$max_C_L), "max_I2_L" = as.numeric(input$max_I2_L), "max_I1_L" = as.numeric(input$max_I1_L),
      "max_M3_R" = as.numeric(input$max_M3_R), "max_M2_R" = as.numeric(input$max_M2_R), "max_M1_R" = as.numeric(input$max_M1_R), 
      "max_PM2_R" = as.numeric(input$max_PM2_R), "max_PM1_R" = as.numeric(input$max_PM1_R),
      "max_C_R" = as.numeric(input$max_C_R), "max_I2_R" = as.numeric(input$max_I2_R), "max_I1_R" = as.numeric(input$max_I1_R),
      "man_M3_L" = as.numeric(input$man_M3_L), "man_M2_L" = as.numeric(input$man_M2_L), "man_M1_L" = as.numeric(input$man_M1_L), 
      "man_PM2_L" = as.numeric(input$man_PM2_L), "man_PM1_L" = as.numeric(input$man_PM1_L),
      "man_C_L" = as.numeric(input$man_C_L), "man_I2_L" = as.numeric(input$man_I2_L), "man_I1_L" = as.numeric(input$man_I1_L),
      "man_M3_R" = as.numeric(input$man_M3_R), "man_M2_R" = as.numeric(input$man_M2_R), "man_M1_R" = as.numeric(input$man_M1_R), 
      "man_PM2_R" = as.numeric(input$man_PM2_R), "man_PM1_R" = as.numeric(input$man_PM1_R),
      "man_C_R" = as.numeric(input$man_C_R), "man_I2_R" = as.numeric(input$man_I2_R), "man_I1_R" = as.numeric(input$man_I1_R)
    )
    
    # data from fusion panel
    FUSE0 <- data.frame(
      "HH_Oss_L" = as.numeric(input$HH_Oss_L), "HH_Oss_R" = as.numeric(input$HH_Oss_R),
      "HGT_Oss_L" = as.numeric(input$HGT_Oss_L), "HGT_Oss_R" = as.numeric(input$HGT_Oss_R),
      "HLT_Oss_L" = as.numeric(input$HLT_Oss_L), "HLT_Oss_R" = as.numeric(input$HLT_Oss_R),
      "HPE_EF_L" = as.numeric(input$HPE_EF_L), "HPE_EF_R" = as.numeric(input$HPE_EF_R),
      "HC_Oss_L" = as.numeric(input$HC_Oss_L), "HC_Oss_R" = as.numeric(input$HC_Oss_R),
      "HT_Oss_L" = as.numeric(input$HT_Oss_L), "HT_Oss_R" = as.numeric(input$HT_Oss_R),
      "HLE_Oss_L" = as.numeric(input$HLE_Oss_L), "HLE_Oss_R" = as.numeric(input$HLE_Oss_R),
      "HDE_EF_L" = as.numeric(input$HDE_EF_L), "HDE_EF_R" = as.numeric(input$HDE_EF_R),
      "HME_EF_L" = as.numeric(input$HME_EF_L), "HME_EF_R" = as.numeric(input$HME_EF_R),
      # "HCE1_EF_L" = as.numeric(input$HCE1_EF_L), "HCE1_EF_R" = as.numeric(input$HCE1_EF_R),
      # "HCE2_EF_L" = as.numeric(input$HCE2_EF_L), "HCE2_EF_R" = as.numeric(input$HCE2_EF_R),
      "HDE_EF_L" = as.numeric(input$HDE_EF_L), "HDE_EF_R" = as.numeric(input$HDE_EF_R),
      "RPE_EF_L" = as.numeric(input$RPE_EF_L), "RPE_EF_R" = as.numeric(input$RPE_EF_R),
      "RDE_EF_L" = as.numeric(input$RDE_EF_L), "RDE_EF_R" = as.numeric(input$RDE_EF_R),
      "UPE_EF_L" = as.numeric(input$UPE_EF_L), "UPE_EF_R" = as.numeric(input$UPE_EF_R),
      "UDE_EF_L" = as.numeric(input$UDE_EF_L), "UDE_EF_R" = as.numeric(input$UDE_EF_R),
      "FH_EF_L" = as.numeric(input$FH_EF_L), "FH_EF_R" = as.numeric(input$FH_EF_R),
      "FGT_EF_L" = as.numeric(input$FGT_EF_L), "FGT_EF_R" = as.numeric(input$FGT_EF_R),
      "FLT_EF_L" = as.numeric(input$FLT_EF_L), "FLT_EF_R" = as.numeric(input$FLT_EF_R),
      "FDE_EF_L" = as.numeric(input$FDE_EF_L), "FDE_EF_R" = as.numeric(input$FDE_EF_R),
      "TPE_EF_L" = as.numeric(input$TPE_EF_L), "TPE_EF_R" = as.numeric(input$TPE_EF_R),
      "TDE_EF_L" = as.numeric(input$TDE_EF_L), "TDE_EF_R" = as.numeric(input$TDE_EF_R),
      "FBPE_EF_L" = as.numeric(input$FBPE_EF_L), "FBPE_EF_R" = as.numeric(input$FBPE_EF_R),
      "FBDE_EF_L" = as.numeric(input$FBDE_EF_L), "FBDE_EF_R" = as.numeric(input$FBDE_EF_R),
      "CT_EF_L" = as.numeric(input$CT_EF_L), "CT_EF_R" = as.numeric(input$CT_EF_R),
      "CC_Oss" = as.numeric(input$CC_Oss), "TC_Oss" = as.numeric(input$TC_Oss),
      ## Workaround to classify TC_Oss values of 1 as 2
      # "TC_Oss" =  ifelse(input$TC_Oss == 1, as.numeric(2), as.numeric(input$TC_Oss)),
      "ISPR_EF_L" = as.numeric(input$ISPR_EF_L), "ISPR_EF_R" = as.numeric(input$ISPR_EF_R),
      "ILIS_EF_L" = as.numeric(input$ILIS_EF_L), "ILIS_EF_R" = as.numeric(input$ILIS_EF_R),
      "PC_Oss_L" = as.numeric(input$PC_Oss_L), "PC_Oss_R" = as.numeric(input$PC_Oss_R)
    )
    
    # now we remove any empty columns using a helper function
    LB <- remove_empty_cols(LB0)
    DENT <- remove_empty_cols(DENT0)
    FUSE <- remove_empty_cols(FUSE0)
    # bind LB, DENT, and FUSE together into one data.frame
    result0 <- cbind(LB, DENT, FUSE)

    
    # make sure the data.frame is not empty and collapse sides using var_info approach
    if(length(result0) > 0) {
      result <- suppressWarnings(collapse_sides(result0, var_info()))
      
      #result <- suppressWarnings(collapse_sides(result0, approach = "Prefer Left"))
      
      
      # print(result) ## FOR DEBUG
      return(result)
    } else return(NA)
    
  })
  
  output$case_data <- renderTable(case_data())
  
  # Create xcalc from user input using commented out code in UI. Currently this
  # is disabled for user and is set by developer in model.R
  
  # xcalc <- reactive({
  #   result <- seq(input$age_plot_min, input$age_plot_max, by = .01)
  #   if (length(result) <= 1) return(NA) else return(result)
  # })
  
  
  ################# UI AND RENDERING ################
  
  # Reset inputs when input reset button is pressed
  observeEvent(input$reset, {
    shinyjs::reset("shiny-tab-inputTab")
    shinyjs::reset("caseid")
    shinyjs::reset("xknown")
  })
  
  observeEvent(input$resetSkeletal, {
    shinyjs::reset("longbone-panel")
  })
  
  observeEvent(input$resetDentition, {
    shinyjs::reset("dentition-panel")
  })
  
  observeEvent(input$resetFusion, {
    shinyjs::reset("fusion-panel")
  })
  
  # make run button active if case_data is not NA
  observe({
    shinyjs::toggleState("run", (!is.na(case_data())))
  })
  
  # update selectInputs if All is present: this is some UI trickery for when 
  # there are multiple reference samples exposed to the user.
  observe({
    if (length(input$refsamp) > 1 && last(input$refsamp) == "all") updateSelectInput(session, "refsamp", selected = "all")
    if (length(input$refsamp) > 1 && first(input$refsamp) == "all") updateSelectInput(session, "refsamp", selected = input$refsamp[-1])
  })
  
  # disabled code for when age plot options are exposed to the user.
  # observe({
  #   if (input$age_plot_min > input$age_plot_max) updateNumericInput(session, "age_plot_min", value = input$age_plot_max)
  # })
  
  
  ################ MODEL #################
  ## This is the code that runs the model when the 'RUN' button is pressed. ##  

  analysis <- eventReactive(input$run, {
    # show and hide UI elements after 'RUN' button is pressed
    shinyjs::show("wait")
    shinyjs::hide("post_panel")
    shinyjs::hide("post_plot")
    updateTabItems(session, "tabs", selected = "outputTab")
    
    ## Most of this code to run the model was provided by Michael ##
    case_data <- case_data()
    #print(case_data) # FOR DEBUG

    #cl <- makeCluster(detectCores())
    #registerDoParallel(cl)
    
    th_x <- load_th_x(input$refsamp)
    
    ref_model <- choose_model(case_data, input$refsamp)
    #print(length(ref_model)) # FOR DEBUG

    mod_spec <- ref_model$mod_spec
    if(length(ref_model) == 3) {
         th_y <- ref_model$multi_mcp$th_y
         problem <- ref_model$problem
    } else {
         th_y <- ref_model$th_y
         problem <- choose_model(case_data, input$refsamp)
    }
   
    # print(length(th_y))  # FOR DEBUG
    # print(th_y)  # FOR DEBUG
    
    if(length(ref_model) != 2) {
      var_names <- problem$var_names
      case_data <- reorder_df(case_data, var_names)
    }
    
    # print(case_data) # FOR DEBUG
    
    vv <- as.numeric(case_data[1,]) # case_data assigned to vv as a vector
    
    fv <- suppressWarnings(yada::calc_x_posterior(vv, th_x, th_y, mod_spec, xcalc))

    post <- yada::analyze_x_posterior(fv$x, fv$density, input$xknown)
    
    result <- list(input=vv, post=post)
    
    #stopCluster(cl)
    
    output$case <- renderTable({
      test_in <- is.null(names(case_data))
      if (test_in) data.frame(Variable = NA, Value = NA) else
        data.frame(Variable=names(case_data), Value=unname(unlist(case_data[1,])))
      #data.frame(Variable = names(case_data()), Value = unname(unlist(case_data()[1,])))
    })
    
    return(result)
    
  })
  
  # show and hide UI elements after model is returned
  observeEvent(analysis(), {
    shinyjs::hide("wait")
    shinyjs::show("post_panel")
    shinyjs::show("post_plot")
  })
  
  ############### PRINT ##################
  ## This section prepares the bits and pieces from the UI and the model for output ##
  
  output$report_case <- renderText({
    paste("Case ID:", input$caseid)
  })
  
  output$report_analyst <- renderText({
    paste("Analyst:", input$analyst)
  })
  
  output$report_datetime <- renderText({
    paste(Sys.time())
  })
  
  output$report_version <- renderText({
    paste("KidStats Version:", ks_version())
  })
  
  output$modsamp <- renderTable({
    data.frame("Reference" = input$refsamp)#, "Sex" = input$sexsamp, "Prior" = "uniform")
  })
  
  output$post <- renderTable({
    data.frame("Point" = analysis()$post$xmean, "Lower" = analysis()$post$xlo, "Upper" = analysis()$post$xhi)
  })
  
  output$post_plot <- renderPlot({
    yada::plot_x_posterior(analysis()$post, xlab="Age [years]", ylab="Posterior Density")
    if(is.na(input$xknown)) {
      legend("topright",
             c("Point Estimate", "95% Interval"),
             col=c("black", "grey"),
             lty=c(1, 1),
             lwd=c(2, 2))
    } else {
      legend("topright",
             c("Point Estimate", "95% Interval", "Known Age"),
             col=c("black", "grey", "green"),
             lty=c(1, 1, 1),
             lwd=c(2, 2, 2))
    }

  })
  
  ########## Report Generation ##########
  # report download handler
  output$downloadReport <- downloadHandler(
    filename = function(case = input$caseid) {
      if (case == "") return("KS-Report.docx") else name <- paste0("KS-Report_", case, ".docx")
      return(name)  
    },
    
    content = function(file) {
      src <- 'www/md/ks_report_template.Rmd'
      # temporarily switch to the temp dir, in case you do not have write
      # permission to the current working directory
      # owd <- setwd(tempdir())
      # on.exit(setwd(owd))
      file.copy(src, 'ks_report.Rmd', overwrite = TRUE)
      
      out <- rmarkdown::render('ks_report.Rmd', rmarkdown::word_document()
      )
      file.rename(out, file)
    }
  )
  
})
