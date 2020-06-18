library(shiny)
library(glue)

source("templates.R")

ui<- fluidPage(
  fluidRow(
    column(12,
      div(id = "header", align = "center",
        h1(icon("brain"), "M/EEG pre-registration template creator", icon("brain")),
        p("__________________________________"),
        p("This app helps you create more structured OSG template for M/EEG pre-registration.")
      ),
      column(5,
        div(id = "header",
            h2("Fill this form:"),
            selectInput("modality", "MODALITY", c("EEG", "MEG")),
            uiOutput("after_modality_form")
        )
      ),
      column(7,
        div(id = "output",
            h2("Generated template:"),
            p("Copy & Paste that into your OSF pre-registration template."),
            div(style = "width:80%;",
              verbatimTextOutput("template", placeholder = TRUE)
            )
        )
      )
    ),
    div(id = "footer", align="center",
        p("___"),
        p("This App has been created @ OHBM BrainHack 2020", 
           style = "color: white; background: grey;")
    )
  )
)


server <- function(input, output, session) {
  
  observeEvent(input$modality,{
    if (input$modality == "EEG"){
      output$template <- renderText(glue::glue(TEMPLATE_TEXT_EEG))
      output$after_modality_form <- renderUI(FORM_FIELDS_EEG)
    }
    if (input$modality == "MEG"){
      output$template <- renderText(glue::glue(TEMPLATE_TEXT_MEG))
      output$after_modality_form <- renderUI(FORM_FIELDS_MEG)
    }
  })

}

shinyApp(ui, server)
