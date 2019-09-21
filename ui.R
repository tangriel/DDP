library(shiny)
library(ggplot2)

dataset <- mtcars

shinyUI(pageWithSidebar(

     headerPanel("Cars Plotting"),

     sidebarPanel(

          sliderInput('sampleSize', 'Sample Size', min=10, max=nrow(dataset),
                      value=min(10, nrow(dataset)), step=5, round=0),

          selectInput('x', 'X', names(dataset)),
          selectInput('y', 'Y', names(dataset), names(dataset)[[2]]),
          selectInput('color', 'Color', c('None', names(dataset))),

          # checkboxInput('jitter', 'Jitter'),
          checkboxInput('smooth', 'Smooth'),

          selectInput('facet_row', 'Facet Row', c(None='.', names(dataset))),
          selectInput('facet_col', 'Facet Column', c(None='.', names(dataset)))
     ),

     mainPanel(
          plotOutput('plot')
     )
))