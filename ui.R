library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Hello Shiny!"),
  
  # Sidebar with a slider input for the number of bins
  sidebarLayout(
    sidebarPanel(
      sliderInput("edad",
                  "Edad:",
                  min = 1,
                  max = 85,
                  value = 20),
      radioButtons("sexo", label = h3("Genero"),
                   choices = list("Hombre" = "M", "Mujer" = "F"), 
                   selected = "F"),
      selectInput("ocupacion", "ocupacion:",choices = levels(as.list(unique(usuarios$ocupacion))[[1]]),selected="student")
      ),
    mainPanel(
      h4("Recomendaciones de peliculas",width=8),
      tableOutput("tablaPelis")
    )
  )
))