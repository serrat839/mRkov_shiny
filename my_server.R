library(mRkov)
my_server <- function(input, output) {
  # value holder
  v <- reactiveValues(data=NULL)
  v$tweet_data = NULL

  # Assign a value to the `message` key in the `output` list using
  # the renderText() method, creating a value the UI can display
  output$message <- renderText({
    # This block is like a function that will automatically rerun
    # when a referenced `input` value changes

    # Use the `username` key from `input` to create a value
    message_str <- paste0("Scraping ", input$username, "!")

    # Return the value to be rendered by the UI
    message_str
  })

  observeEvent(
    input$search, {
      v$tweet_data <- tweet_gettr(input$username)
      ?tweet_gettr
    }
  )

  output$sentence <- renderText({
    placeholder <- input$make_sentence
    if(!is.null(v$tweet_data)) {
      sentence <- make_sentence(v$tweet_data)
    } else {
      sentence <- "Waiting for a sentence to be generated..."
    }

    sentence
  })

  output$plot <- renderPlot({
    if (!is.null(v$tweet_data)) {
    make_wordcloud(v$tweet_data, "")
    }
  })

}
