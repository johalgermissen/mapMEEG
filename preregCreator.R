library(shiny)
library(glue)

ui<- fluidPage(
  fluidRow(
    column(12, align="center",
      div(id = "header",
        h1(icon("brain"), "M/EEG pre-registration template creator", icon("brain")),
        p("___________")
      ),
      div(id = "header",
          p("TODO More elaborate description of the goal of the app..."),
          h2("Fill this form:"),
          selectInput("modality", "Modality:", c("EEG", "MEG", "Other")),
          textInput("device", "M/EEG recording device", placeholder = "Eg. Elekta"),
          textInput("cap", "M/EEG headset", placeholder = "Eg. System 10-20"),
          textInput("ground", "Ground electrode", placeholder = "on the chest"),
          textInput("reference", "Reference", placeholder = "linked mastoids"),
          textAreaInput("filter", "Filtering", placeholder = "Eg. butter bandpass filter 0.5 - 70 Hz of order 5, notch filter"),
          textAreaInput("artef", "Artefact rejection"),
          textAreaInput("trial", "Trial split"),
          textAreaInput("other", "Other"),
      ),
      div(id = "output",
          h2("Generated template:"),
          p("Copy & Paste that into your OSF pre-registration template."),
          div(align="left", style = "width:60%;",
            verbatimTextOutput("template", placeholder = TRUE)
          )
      ),
      div(id = "footer", style = "background:black;color:white;",
        p("This App has been created @ OHBM BrainHack 2020")
      )
    )
  )
)

template_text = "
## Modality

{input$modality}

## Device

{input$device}

## Headset

{input$cap}

## Ground

{input$ground}

## Reference

{input$reference}

## Filtering

{input$filter}

## Artefacts

{input$artef}

## Trials

{input$trial}

## More details

{input$other}
"

server <- function(input, output, session) {
  output$template <- renderText({
    glue::glue(template_text)
  })
}

shinyApp(ui, server)
