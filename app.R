library(shiny)
library(mRkov)
library(dplyr)
library(DT)
source("my_ui.R")
source("my_server.R")
source("html.R")

shinyApp(ui = my_ui, server = my_server)
