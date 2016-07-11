library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("Moment estimation of mixture fraction"),
  sidebarPanel(h5("Enter means to optain fraction and press submit"),
               numericInput(inputId="numNeg", 
                            label = h3("Mean Negative Controls"),
                            value=NA,min=0),
               numericInput(inputId="numPos", 
                            label = h3("Mean Positive Controls"),
                            value=NA,min=0),
               numericInput(inputId="numSam", 
                            label = h3("Mean Sample"),
                            value=NA,min=0),
               br(),
               actionButton("Submit","Submit")),
  mainPanel(h3("Fraction"),textOutput("Fraction"))
))