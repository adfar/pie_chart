library(shiny)
library(tidyverse)

ui <- fluidPage(
#   HTML(r"(
#       <h1 style=text-align:center;>Don't Use Pie Charts</h1>
#     )"
#   )
# )
  fluidRow(
    plotOutput("pie", height = "50em")
  )
)


server <- function(input, output, session) {
  data <- tibble(group = c("a", "b", "c", "d", "e", "f", "g", "h"), nums = c(1, 2, 3, 5, 9, 17, 23, 30))
  
  output$pie <- renderPlot(
    data |> 
      ggplot(aes(x = "", y = nums, fill = group)) +
      geom_bar(stat = "identity", width = 1, color = "white") +
      coord_polar("y", start = 0) +
      theme_void() +
      theme(legend.position = "none") +
      scale_color_brewer("clarity")
  )
}

shinyApp(ui, server)