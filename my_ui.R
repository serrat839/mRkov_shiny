library(shiny)
library(mRkov)
# The UI is the result of calling the `fluidPage()` layout function
my_ui <- fluidPage(
  #theme = "lux.css",
  # A static content element: a 2nd level header that displays text
  titlePanel("mRkov: A fun toolbox"),

  sidebarLayout(position = "left",
                sidebarPanel("Options",
                             h2("Wordcloud filter"),
                             fluidRow(
                               column(5,
                                 textInput(inputId = "stop_word", label = NULL)
                               ),
                               column(6,
                                 actionButton(inputId = "add_stop_word", label = "Add Word"),
                              )                                 ),
                             DT::dataTableOutput("stopwords"),
                             actionButton(inputId = "deleteRows", label = "Delete Rows")),
                mainPanel(
                  # A widget: a text input box (save input in the `username` key)
                  textInput(inputId = "username", label = "Insert Twitter handle (@)"),
                  
                  # a button to activate a twitter search
                  actionButton(inputId = "search", label = "Search Twitter!"),
                  actionButton(inputId = "make_sentence", label = "Make a Sentence!"),
                  
                  # An output element: a text output (for the `message` key)
                  textOutput(outputId = "message"),
                  textOutput(outputId = "tweets_found"),
                  
                  # An output element: a text output (for the `message` key)
                  textOutput(outputId = "sentence"),
                  
                  # Outputting a wordcloud
                  plotOutput("plot")
                  )
                )
  

)
