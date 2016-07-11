library(shiny)
shinyServer(function(input,output,session){
  myValues <- reactiveValues()
  
  observe({
    if(input$Submit > 0){
      isolate({
        num <- input$numSam
        numP <- input$numPos
        numN <-  input$numNeg
        myValues$myDf <- (num-numN)/(numP-numN)
        if(myValues$myDf > 1) {myValues$myDf <- 1
        } else if(myValues$myDf < 0) {myValues$myDf <- 0}
        else {myValues$myDf <- myValues$myDf}
        
        
      })
      updateNumericInput(session, "numNeg","Mean Negative Controls", numN)
      updateNumericInput(session, "numPos","Mean Positive Controls", numP)
      updateNumericInput(session, "numSam","Mean Sample",num)
    }
  })
  
  output$Fraction <- renderPrint({
    myValues$myDf
  })
  
})
