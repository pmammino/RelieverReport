source("data/RelieverData.R")
library(markdown)
library(plotly)

ui <- navbarPage("Reliever Report",
  tabPanel("Leaderboard V01",
  sidebarLayout(
    sidebarPanel(
      selectInput("year", "Year:",
              c("All" = "All",
                "2012" = "2012",
                "2013" = "2013",
                "2014" = "2014",
                "2015" = "2015",
                "2016" = "2016",
                "2017" = "2017"
                )),
        numericInput("li", "LI:", 1.2, min = 0, max = 3, step = 0.1),
        numericInput("ip", "IP:", 40, min = 0, max = 100, step = 1),
        checkboxInput("split", "Split Teams", FALSE),
        selectInput("team", "Team:",
                    c("All" = "All", sort(unique(as.character(relief_split$Team))))),
        downloadLink('downloadData', 'Download')
  , width = 2),
  mainPanel(
        DT::dataTableOutput('table')
    )
  )
  ),
tabPanel("Leaderboard V02",
         sidebarLayout(
           sidebarPanel(
             selectInput("year2", "Year:",
                         c("All" = "All",
                           "2012" = "2012",
                           "2013" = "2013",
                           "2014" = "2014",
                           "2015" = "2015",
                           "2016" = "2016",
                           "2017" = "2017"
                         )),
             numericInput("li2", "LI:", 1.2, min = 0, max = 3, step = 0.1),
             numericInput("ip2", "IP:", 40, min = 0, max = 100, step = 1),
             selectInput("team2", "Team:",
                         c("All" = "All", sort(unique(as.character(relief_split$Team))))),
             downloadLink('downloadData2', 'Download')
             , width = 2),
           mainPanel(
             DT::dataTableOutput('tablenew')
)
)
),
tabPanel("About",includeMarkdown("about.md")
)
)

server <- function(input, output) {
     output$table <- DT::renderDataTable(DT::datatable({
     data <- relief
     if (input$split){
       data <- relief_split
     }
     if(input$year != "All"){
       data <- data[data$Season == input$year,]
     }
     data <- data[data$gmLI >= input$li,]
     data <- data[data$IP >= input$ip,]
     if(input$team != "All")
     {
       data <- data[data$Team == input$team,]
     }
     data
   },rownames=FALSE))
   output$downloadData <- downloadHandler(
 		filename = function() {
 		 paste('relieverreport-', Sys.Date(), '.csv', sep='')
 		   },
 		 content = function(con) {
 		   data <- relief
 		   if (input$split){
 		     data <- relief_split
 		   }
 		   if(input$year != "All"){
 		     data <- data[data$Season == input$year,]
 		   }
 		   data <- data[data$gmLI >= input$li,]
 		   data <- data[data$IP >= input$ip,]
 		   if(input$team != "All")
 		   {
 		     data <- data[data$Team == input$team,]
 		   }
 		   data
 		write.csv(data, con)
 		   }
 		 )

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
   data
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
     data
     write.csv(data, con2)
}
)
}

# Run the application 
shinyApp(ui = ui, server = server)

