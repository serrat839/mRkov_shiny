source("my_ui.R")
source("my_server.R")

mRkov::setup_twitteR()
library(dplyr)
# To start running your app, pass the variables defined in previous
# code snippets into the `shinyApp()` function
shinyApp(ui = my_ui, server = my_server)

