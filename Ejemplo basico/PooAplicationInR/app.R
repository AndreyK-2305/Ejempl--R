library(shiny)

ui<-fluidPage(
  titlePanel("Ejemplo de POO en R"),
  
  sidebarLayout(
    sidebarPanel(
      numericInput( inputId = "n" , "Tamaño de datos", value =  100),
      checkboxInput("Verificador" , label = "¿Añadir linea de datos?", value = TRUE)
             
    ),
    mainPanel(
      plotOutput(outputId = "histograma")
    )
  )
)

server<-function(input,output){
  
  output$histograma <- renderPlot({
    set.seed(111)
    hist(rnorm(input$n) , freq=FALSE, col="blue",
      main="Histograma de los datos" ,
      xlab="Datos mostrados")
  
    if(input$Verificador==T){
      curve(dnorm(x,0,1), add=TRUE, lwd=3, col="red")
    }
  })
  
  
}
shinyApp(ui=ui,server = server)





# FUNCIONES
# numericInput("num", label = h3("Numeric input"), value = 1),     ->     entrada numerica
