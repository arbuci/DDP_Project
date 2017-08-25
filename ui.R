

library(shiny)
library(shinythemes)

shinyUI(fluidPage(
  theme = shinytheme("cosmo"),
  headerPanel("Rx Staffing Prediction"),
  sidebarPanel(
    h3("Parameters"),
    h4("All parameters are required"),
    numericInput('acute_census', 'Acute Care Census', 165, min = 0),
    numericInput('icu_census', 'ICU Census', 50, min = 0),
    numericInput('surgeries', 'Scheduled Surgeries', 47, min = 0),
    numericInput('ed_arrivals', 'Yesterday ED Arrivals', 240, min = 0),
    radioButtons('weekend', "Weekend", choices = c("Y", "N"), selected = "N", inline = TRUE),
    numericInput('orders_per', 'Orders per Pharmacist', 350, min = 1)
  ),
  mainPanel(
    h3("Introduction"),
    p("One of the key productivity metrics for hospital inpatient pharmacies is the verification of new medication orders by a pharmacist. This has to be completed before the medication can be dispensed. This application predicts a number of orders that will require verification based on several inputs, and determines the number of pharmacists that will be required to fulfill all the verification tasks."),
    h3("Instructions"),
    p("Set values for the current day's censuses, previous day's ED arrivals, weekend flag, and expected surgeries to predict the number of orders requiring verification. Adjust the number of orders per pharmacist parameter to set the expected workload of each pharmacist and calculate how many pharmacists will be needed to address the predicted number of orders."),
    h3("Result"),
    "The model predicts ",
    strong(textOutput('text1', inline = TRUE)),
    " orders and a need for ",
    strong(textOutput('text2', inline = TRUE)),
    " pharmacists."
  )
))
