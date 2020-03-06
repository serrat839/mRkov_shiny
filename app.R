source("my_ui.R")
source("my_server.R")
source("html.R")
library(mRkov)
library(dplyr)

shinyApp(ui = my_ui, server = my_server)
