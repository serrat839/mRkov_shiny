# The UI is the result of calling the `fluidPage()` layout function
my_ui <- fluidPage(
  theme = "mrkov.css",
  # A static content element: a 2nd level header that displays text
  titlePanel("mRkov: Simulate and replicate Twitter data"),

  sidebarLayout(position = "left",
                sidebarPanel("Options",
                             textInput(inputId = "username", label = "Insert Twitter handle (@)"),

                             # a button to activate a twitter search
                             actionButton(inputId = "search", label = "Search Twitter!"),

                             # An output element: a text output (for the `message` key)
                             textOutput(outputId = "message"),
                             textOutput(outputId = "tweets_found"),

                             # checkbox to include retweets
                             checkboxInput(inputId = "includeRts",
                                           label = "Include Retweets"),
                             checkboxInput(inputId = "includeReplies",
                                           label = "Include Replies"),
                             numericInput(inputId = "ngram",
                                          label = "N-gram size",  value = 1),
                             # Paragraph detailing issues
                             p("Our servers are overloaded right now due to heavy traffic. You can run the app locally by following the instructions in the \"Test Locally\" tab."),
                             br(),
                             p("Developed by:"),
                             p("Thomas Serrano (",
                               a("@thomas_is_srs", href="https://twitter.com/thomas_is_srs"),
                               ")"),
                             p("Bryan D Martin (",
                             a("@BryanDMartin_", href="https://twitter.com/BryanDMartin_"),
                             ")"),
                             ),
                mainPanel(
                  tabsetPanel(type = "tabs",
                              # Sentence Generation
                              tabPanel("Markov Chain",
                                       h2("Sentence Options"),
                                       fluidRow(
                                          column(5,
                                            numericInput(inputId = "num_sentences", label = "Number of sentences",  value = 1)
                                            ),
                                          column(5,
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
                              tabPanel("Test Locally",
                                       h2("Right now, we are experiencing extremely high traffic
                                          that exceeds the capacities of our server!"),
                                       p("We are working on a fix for the issue. In the meantime,
                                         you may experience issues."),
                                       h3("Option 1:"),
                                       p("Buy us a fancy new server."),
                                       h3("Option 2:"),
                                       p("If you have R installed, you can download the tool on your
                                       own computer and you don't need to rely on our server!"),
                                       h4("Step 1:"),
                                       code('remotes::install_github("serrat839/mRkov")'),
                                       h4("Step 2:"),
                                       code('shiny::runGitHub("mRkov_shiny", username="serrat839")'),
                                       p(""),
                                       h5("Note:"),
                                       p("If this is your first time using R or you don't have certain packages
                                         installed, you may see an error such as"),
                                       code("Error in library(...) : there is no package called '...'"),
                                       p("To fix this, you can install whatever dependency you need via
                                         any/all of the following (if you encounter another dependency not
                                         listed here, please post it as an issue so we can add it!):"),
                                       code('install.packages("remotes")'),
                                       p(""),
                                       code('install.packages("DT")'),
                                       p(""),
                                       code('install.packages("shiny")')
                              )

                  ),


                  )
                )


)
