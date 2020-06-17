library(shiny)
library(glue)

FORM_FIELDS <- tagList(
  selectInput("modality", "Modality:", c("EEG", "MEG", "Other")),
  textInput("device", "Recording device", placeholder = "Eg. Elekta"),
  textInput("cap", "Headset", placeholder = "Eg. System 10-20"),
  textInput("ground", "Ground electrode", placeholder = "on the chest"),
  textInput("reference", "Reference", placeholder = "linked mastoids"),
  textAreaInput("filter", "Filtering", placeholder = "Eg. butter bandpass filter 0.5 - 70 Hz of order 5, notch filter"),
  textAreaInput("artef", "Artefact rejection", placeholder = "ICA was used"),
  textAreaInput("trial", "Trial split", placeholder = "From -1 to 2, baseline corrected"),
  textAreaInput("other", "Other")
)

#' here the content will be replaced by the input to the elements from FORM_FIELDS
#' add placeholder for this input following this pattern: {input$<name-of-ui-element>}
TEMPLATE_TEXT = "
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
          FORM_FIELDS
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


server <- function(input, output, session) {
  output$template <- renderText({
    glue::glue(TEMPLATE_TEXT)
  })
}

shinyApp(ui, server)
