source("data/RelieverData.R")
library(markdown)
library(plotly)
library(rvest)
library(plyr)
library(SDMTools)
library(ggplot2)

ui <- navbarPage("Reliever Report",
tabPanel("Leaderboard",
         sidebarLayout(
           sidebarPanel(
             selectInput("year2", "Year:",
                         c("All" = "All",
                           "2012" = "2012",
                           "2013" = "2013",
                           "2014" = "2014",
                           "2015" = "2015",
                           "2016" = "2016",
                           "2017" = "2017",
                           "2018" = "2018",
                           "2019" = "2019"
                         )),
             numericInput("li2", "LI:", 1.2, min = 0, max = 3, step = 0.1),
             numericInput("ip2", "IP:", 40, min = 0, max = 100, step = 1),
             selectInput("team2", "Team:",
                         c("All" = "All", sort(unique(as.character(relief$Team))))),
             downloadLink('downloadData2', 'Download')
             , width = 2),
           mainPanel(
             DT::dataTableOutput('tablenew')
)
)
)
,
tabPanel(("Comp Tool"),
         selectizeInput("player", "Player:",
                     c(sort(unique(as.character(relief2019_comp$Name))))),
         numericInput("comps", "Number Of comps:", 10, min = 1, max = 100, step = 1),
         textOutput("meanADREIP"),
         textOutput("std"),
                DT::dataTableOutput('tablecomp')
),
tabPanel(("Comps All"),
         DT::dataTableOutput('allcomps')
         ),
tabPanel(("Compare Chart"),
         selectizeInput("player1", "Player:",
                        c(sort(unique(as.character(relief2019_comp$Name))))),
         selectizeInput("player2", "Player:",
                        c(sort(unique(as.character(relief2019_comp$Name))))),
         plotOutput("chart")
)
)
server <- function(input, output) {
 output$tablenew <- DT::renderDataTable(DT::datatable({
   data <- reliefNew
   if(input$year2 != "All"){
     data <- data[data$Season == input$year2,]
   }
   data <- data[data$gmLI >= input$li2,]
   data <- data[data$IP >= input$ip2,]
   if(input$team2 != "All")
   {
     data <- data[data$Team == input$team2,]
   }
   data[,c(1,2,3,4,10,13,14)]
 },rownames=FALSE))
 output$downloadData2 <- downloadHandler(
   filename = function() {
     paste('relieverreport-', Sys.Date(), '.csv', sep='')
   },
   content = function(con2) {
     data <- reliefNew
     if(input$year2 != "All"){
       data <- data[data$Season == input$year2,]
     }
     data <- data[data$gmLI >= input$li2,]
     data <- data[data$IP >= input$ip2,]
     if(input$team2 != "All")
     {
       data <- data[data$Team == input$team2,]
     }
     data[,c(1,2,3,4,10,13,14)]
     write.csv(data, con2)
}
)
output$tablecomp <- DT::renderDataTable(DT::datatable({
   data <- player_comps(input$player, input$comps)
   data[,c(1,2,3,4,10,11,12)]
 },rownames=FALSE,options = list(pageLength = -1, searching = FALSE, lengthChange = FALSE)))

output$meanADREIP <- renderText({
  paste0("Comparable ADREIP is ",round(player_comps_sum(input$player),4))
})

output$std <- renderText({
  paste0("Standard Deviation of Comparable ADREIP is ",round(player_comps_std(input$player),4))
})

output$allcomps <- DT::renderDataTable(DT::datatable({
  data <- comps_all
  data
},rownames=FALSE))

output$chart <-  renderPlot({
  plot <- compare_chart(input$player1,input$player2)
})
}


# Run the application 
shinyApp(ui = ui, server = server)

