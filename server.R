
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
require(dplyr)
require(Hmisc)

require(rCharts)

train <- read.csv('train.csv', stringsAsFactors = F)
nb <- length(train$Survived)

train$Sex <- as.factor(train$Sex)
train$Pclass <- as.factor(train$Pclass) 
train$Age <- as.integer(train$Age)

train$AgeSlice <- cut2(train$Age, cuts = c(0, 18, 35, 60, 90))
train$FareSlice <- cut2(train$Fare) 

shinyServer(function(input, output) {  

  output$myChart <- renderChart2({  
        
    totals <- train %>%
      group_by_(g1 = input$g1, g2 = input$g2) %>%
      summarise(total = sum(Survived), len = length(Survived), ratio = total / len)
    
    totals <- totals[complete.cases(totals), ]    
    print(totals)
    
    n1 <- nPlot(ratio ~ g1, group = 'g2', data = totals, type = 'multiBarChart')
    n1
  })  
})
