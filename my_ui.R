library(shiny)
library(mRkov)
# The UI is the result of calling the `fluidPage()` layout function
my_ui <- fluidPage(
  #theme = "lux.css",
  # A static content element: a 2nd level header that displays text
  h2("mRkov: A fun toolbox"),

  # A widget: a text input box (save input in the `username` key)
  textInput(inputId = "username", label = "Insert Twitter handle (@)"),

  # a button to activate a twitter search
  actionButton(inputId = "search", label = "Search Twitter!"),
  actionButton(inputId = "make_sentence", label = "Make a Sentence!"),

  # An output element: a text output (for the `message` key)
  textOutput(outputId = "message"),

  # An output element: a text output (for the `message` key)
  textOutput(outputId = "sentence"),

  # Outputting a wordcloud
  plotOutput("plot")

)
