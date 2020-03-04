library(shiny)
library(mRkov)
# The UI is the result of calling the `fluidPage()` layout function
my_ui <- fluidPage(
  #theme = "lux.css",
  # A static content element: a 2nd level header that displays text
  titlePanel("mRkov: A fun toolbox"),

  sidebarLayout(position = "left",
                sidebarPanel("Options",
                             # A widget: a text input box (save input in the `username` key)
                             textInput(inputId = "username", label = "Insert Twitter handle (@)"),
                             
                             # a button to activate a twitter search
                             actionButton(inputId = "search", label = "Search Twitter!"),
                             
                             # An output element: a text output (for the `message` key)
                             textOutput(outputId = "message"),
                             textOutput(outputId = "tweets_found"),
                             ),
                mainPanel(
                  tabsetPanel(type = "tabs",
                              # Sentence Generation
                              tabPanel("Markov Chain",
                                       h2("Sentence Options"),
                                       fluidRow(
                                          column(3,
                                            numericInput(inputId = "num_sentences", label = "Number of sentences",  value = 1)
                                            ),
                                          column(8,
                                            textInput(inputId = "prompt", label = "Sentence Prompt")
                                            )
                                       ),
                                       actionButton(inputId = "make_sentence", label = "Make a Sentence!"),
                                       # An output element: a text output (for the `message` key)
                                       htmlOutput(outputId = "sentence"),
                                       ),
                              # Word Cloud and word cloud settings
                              tabPanel("Word Cloud", 
                                       # Outputting a wordcloud
                                       plotOutput("plot", width = "2%"), # edited 
                                       h2("Wordcloud filter"),
                                       fluidRow(
                                         column(5,
                                                textInput(inputId = "stop_word", label = NULL)
                                         ),
                                         column(6,
                                                actionButton(inputId = "add_stop_word", label = "Add Word"),
                                         ),
                                         column(9,
                                                numericInput(inputId = "num_words", label = "Wordcloud size", value = 20))
                                         ),
                                       DT::dataTableOutput("stopwords"),
                                       actionButton(inputId = "deleteRows", label = "Delete Rows")),
                              # Markov Chain Explanation
                              tabPanel("What is going on?", 
                                       h2("What is a Markov Chain?"),
                                       p("A Markov Chain is a stochastic model describing sequences
                                         of possible events where each event depends on the previous event.
                                         
                                         When being used to generate sentences, this is the same as picking randomly
                                         from a vector of words [x] that come after a given word y. 
                                         
                                         *note, check in with Bryan to make sure these descriptions are accurate")
                                       )
                              
                  ),
                  
                  
                  )
                )
  

)
