

library(shiny)
library(randomForest)
library(caret)
fit <- readRDS("data/rf.Rds")

shinyServer(function(input, output) {
  
  params <- reactive({
    req(
      input$weekend,
      input$ed_arrivals,
      input$icu_census,
      input$acute_census,
      input$surgeries
    )
    
    data.frame("WEEKEND_YN" = input$weekend,
               "ED_ARRIVALS" = input$ed_arrivals,
               "ICU_CENSUS" = input$icu_census,
               "ACUTE_CENSUS" = input$acute_census,
               "SURGERIES" = input$surgeries)
  })
  
  output$text1 <- renderText({
    round(predict(fit, params()))
  })
  
  output$text2 <- renderText({
    round(predict(fit, params()) / input$orders_per)
  })
})
