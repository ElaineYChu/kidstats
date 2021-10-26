# kidstats2 ui.R

library(shiny, quietly = TRUE)
library(shinydashboard, quietly = TRUE)
library(shinyjs, quietly = TRUE)
library(markdown, quietly = TRUE)
library(yada, quietly = TRUE)

source("R/helpers.R")
source("R/panel_records.R", local = TRUE)
source("R/panel_longbone.R", local = TRUE)
source("R/panel_dentition.R", local = TRUE)
source("R/panel_fusion.R", local = TRUE)

# # Load Data  # depreciated step
# us_data <- read.csv('www/csv/US.csv')



# HEADER
header <- dashboardHeader(title = div(icon("child"), paste0("kidstats", " v", ks_version())), titleWidth = 300)

# SIDEBAR
sidebar <- dashboardSidebar(width = 230,
            useShinyjs(),
            includeCSS("www/css/styles.css"), includeCSS("www/css/main.css"),
            # Tabs
            sidebarMenu( id = "tabs",
              menuItem("Input", tabName = "inputTab", icon = icon("edit")),
              menuItem("Output", tabName = "outputTab", icon = icon("file")),
              menuItem("About", tabName = "aboutTab", icon = icon("info-circle"))
            ),
            # Case Inputs
            textInput("analyst", "Analyst", placeholder = "Name"),
            textInput("caseid", "Case ID"),
            numericInput("xknown", "Known Age", value=NA),
            hr(),
            # Model Options
            h4("Model Options", style = "padding-left: 10px; font-weight: bold"),
            selectInput("refsamp", "Reference Sample", choices = c("Global" = "all", "USA" = "US"), selected = "US", multiple = TRUE)
            # selectInput("sexsamp", "Sex", choices = c("Pooled" = "pool", "Females" = "F", "Males" = "M"), selected = "pool", multiple = FALSE)
            # selectInput("ageprior", "Age Prior", choices = c("Uniform (Conservative)" = "uniform"), selected = "uniform", multiple = FALSE)
            # h5(strong("Age Plot Min/Max"), style = "margin-left: 15px; margin-top: 30px; margin-bottom: 0px; padding-bottom: 0px"),
            # fluidRow(
            #   splitLayout(cellWidths = 100, cellArgs = list(style = "margin-left: 15px; margin-right: 0px; margin-top: 0px; padding-bottom: 0px; padding-right: 0px"),
            #     numericInput("age_plot_min", label = NULL, value = 0, min = 0, max = 30, step = 1),
            #     numericInput("age_plot_max", label = NULL, value = 25, min = 0, max = 30, step = 1)
            #   ))
)

# BODY
body <- dashboardBody(
  useShinyjs(),
  # Load custom.css
  tags$head(
    tags$link(rel = "stylesheet", type = "text/css", href = "css/custom.css"),
    tags$link(rel = "stylesheet", type = "text/css", href = "css/styles.css")
  ),
  
  # Tab items
  tabItems(
    
    # Input tab
    tabItem("inputTab",
            # buttons and messages
            fluidRow(
              shinyjs::hidden(h3("Generating report...", style = "padding-left: 25px", id = "waitInput")),
              splitLayout(cellWidths = c(200, 200), cellArgs = list(style = "padding: 10px"),
                actionButton("reset", "Reset Inputs", width = "100%", icon = icon("trash", lib = "glyphicon")),
                shinyjs::disabled(actionButton("run", "Run Analysis", width = "100%", icon = icon("ok", lib = "glyphicon")))
              )),
            fluidRow(align="center",
                     h6(tags$b("Check Your Input: ")),
                     tableOutput("case_data")),
            tags$div(class = "row", longbone_panel, dentition_panel, fusion_panel)
    ),
    # Output tab
    tabItem("outputTab",
            # radioButtons('format', 'Report Format', c('HTML', 'Word'), inline = TRUE),
            downloadButton('downloadReport', label = 'Download Report'),
            hr(),
            shinyjs::hidden(h3("Generating results, please wait...", id = "wait")),
            textOutput("report_case"),
            textOutput("report_analyst"),
            textOutput("report_datetime"),
            textOutput("report_version"),
            br(),
            shinyjs::hidden(wellPanel(
              h5("Age Estimation"),
              tableOutput("post"),
              id = "post_panel"
            )),
            shinyjs::hidden(plotOutput("post_plot")),
            br(),
            wellPanel(
              h5("Model Info"),
              tableOutput("modsamp"),
              br(),
              "Trained using the following variables: ",
              textOutput("model_vars")
            ),
            wellPanel(
              h5("Case Data"),
              tableOutput("case")
            )
            
    ),
    # Info tab
    tabItem("aboutTab",
            includeMarkdown("www/md/KidStats-About.Rmd")
    )
  )
)

# BUILD DASHBOARD
shinyUI(
  dashboardPage(header, sidebar, body, skin = "purple", title = "kidstats")
)
