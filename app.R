source("data/RelieverData.R")
library(markdown)
library(plotly)

ui <- navbarPage("Reliever Report",
  tabPanel("Leaderboard",             
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
tabPanel("Usage Report",
  sidebarLayout(
    sidebarPanel(
      selectInput("year2", "Year:",
                  c("2012" = "2012",
                    "2013" = "2013",
                    "2014" = "2014",
                    "2015" = "2015",
                    "2016" = "2016",
                    "2017" = "2017"
                  )),
      numericInput("li2", "LI:", 0, min = 0, max = 3, step = 0.1),
      numericInput("ip2", "IP:", 20, min = 0, max = 100, step = 1),
      checkboxInput("split2", "Split Teams", FALSE),
      selectInput("team2", "Team:",
                  c(sort(unique(as.character(relief_split$Team))))),
      selectInput("type", "Data Type", c("ADREIP", "xADREIP"))
    , width = 2),
      mainPanel(
        plotOutput('plot')
  
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

  output$plot <-
    renderPlot({
    data <- relief
    if (input$split){
      data <- relief_split
    } 
    data <- data[data$Season == input$year2,]
    data <- data[data$gmLI >= input$li2,]
    data <- data[data$IP >= input$ip2,]
    data <- data[data$Team == input$team2,]
    if (input$type == "ADREIP")
    {
    par(bty = 'l')
    plot(data$gmLI, data$ADREIP, xlab = "gmLI", ylab = "ADREIP")
    }
    if (input$type == "xADREIP")
    {
    par(bty = 'l')
    plot(data$gmLI, data$xADREIP, xlab = "gmLI", ylab = "xADREIP")
    }
    }
  )
}

# Run the application 
shinyApp(ui = ui, server = server)

