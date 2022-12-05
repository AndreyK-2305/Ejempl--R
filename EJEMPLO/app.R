library(shiny)
library(psych)


ui<-fluidPage(
  titlePanel("Ejemplo Propio de POO en R"),
  
  sidebarLayout(
    sidebarPanel(
      #Valor de la edad
      numericInput( inputId = "edad" , "Tamaño de datos", value =  15),
      #Deslizador
      sliderInput("deslizador" , label=h3("Rango de edad"), min=0, max=30, value=15 ),
      #Selecciones
      radioButtons("Opciones", label = h3("Origen"), choices = list("Entrada"=1 , "Deslizador"=2, "Archivo"=3)),
      
    ),
    mainPanel(
      plotOutput(outputId = "histograma"),
      tableOutput(outputId = "Tabla")
      
    )
  )
)

server<-function(input,output){
  
  output$histograma <- renderPlot({
    set.seed(111)
    
    if(input$Opciones == 1){
      hist(rnorm(input$edad) , freq=FALSE, col="blue",
      main="Histograma de la entrada" ,
      xlab="Datos aleatorios")
      curve(dnorm(x,0,1), add=TRUE, lwd=3, col="red")
    }
    if(input$Opciones == 2){
      hist(rnorm(input$deslizador) , freq=FALSE, col="green",
      main="Histograma del deslizador" ,
      xlab="Datos aleatorios")
      curve(dnorm(x,0,1), add=TRUE, lwd=3, col="blue")
    }
    if(input$Opciones == 3){
      hist(Encuesta_pedagogía_respuestas_$`¿Cuántos años tienes?` , freq=FALSE, col="orange",
      main="Histograma del Archivo Excel" ,
      xlab="Datos del arciho excel")
      curve(dnorm(x,0,1), add=TRUE, lwd=3, col="black")

    }
    
  })
  
}
shinyApp(ui=ui,server = server)