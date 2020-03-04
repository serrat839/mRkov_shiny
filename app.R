source("my_ui.R")
source("my_server.R")
library(mRkov)
library(dplyr)

mRkov::setup_twitteR()
shinyApp(ui = my_ui, server = my_server)

