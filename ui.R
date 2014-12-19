
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
require(rCharts)

groups <- c('Sex' = "Sex", 'Passenger Class' = "Pclass", Age = "AgeSlice", "Number of Siblings/Spouses Aboard" = 'SibSp',
            'Number of Parents/Children Aboard' = 'Parch', "Passenger Fare" = 'FareSlice')

shinyUI(
  navbarPage("Titanic Survivor Explorer",
    tabPanel("Plot",
      sidebarLayout(
        sidebarPanel(
          h3('Group selection'),
          selectInput(inputId = "g1",         
                      label = "Group 1:", 
                      choices = groups,
                      selected = "Sex"),
          selectInput(inputId = "g2",         
                      label = "Group 2:",
                      choices = groups,
                      selected = "Pclass"),
          hr(),
          h3('Titanic Survivor Explorer'),
          h5('by A. Ph. Clement'),
          p('This dynamic chart allows you to visualize the survival rate vs a set of biological and socio-economic groups.'),
          p('The dataset is from the', 
            tags$a(href = "https://www.kaggle.com/c/titanic-gettingStarted/data", target = '_blank', 'Titanic Kaggle competition')
          ),          
          p('This app is the final project for the Data Science specialization offered by Coursera and the \
            Johns Hopkins Bloomberg School of Public Health.')
         
        ),                        
        # Show a plot of the generated distribution
        mainPanel(
          showOutput("myChart", "nvd3")         
         
        )
      )
    ), 
    tabPanel("About")    
  )
)
