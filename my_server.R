library(mRkov)
library(dplyr)
library(DT)
my_server <- function(input, output) {
  # value holder
  v <- reactiveValues(data=NULL)
  v$tweet_data = NULL
  v$stopwords <- data.frame(word = character(),
                            stringsAsFactors = F)

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
  
  output$message <- renderText({
    # This block is like a function that will automatically rerun
    # when a referenced `input` value changes
    message_str <- "Waiting for twitter search..."
    if (!is.null(v$tweet_data)) {
      # Use the `username` key from `input` to create a value
      message_str <- paste0("Found ", length(v$tweet_data$text), " tweets!")
      
      # Return the value to be rendered by the UI
      
    }
    
    message_str
  })

  observeEvent(
    input$search, {
      v$tweet_data <- tweet_gettr(input$username)
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
      print("Re-making plot")
      print(v$stopwords$word)
      make_wordcloud(v$tweet_data,
                     pull(v$stopwords, word))
    }
  })
  
  observeEvent(
    input$add_stop_word, {
      v$stopwords <- rbind(v$stopwords, 
                           data.frame(word = input$stop_word, stringsAsFactors = F))
    }
  )
  
  output$stopwords <- DT::renderDataTable({
    datatable(v$stopwords, options = list(dom = "t"))
  })
  
  observeEvent(input$deleteRows,{
    
    if (!is.null(input$stopwords_rows_selected)) {
      print(input$stopwords_rows_selected)
      print(class(v$stopwords))
      v$stopwords <- data.frame(word = v$stopwords[-as.numeric(input$stopwords_rows_selected),],
                                stringsAsFactors = F)
      print(class(v$stopwords))
      }
  })

}
