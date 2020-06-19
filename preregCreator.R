library(shiny)
library(glue)

FORM_FIELDS <- tagList(
  # Start input
  selectInput("modality", "Modality:", c("EEG", "MEG", "Other")),
  # Inputs for data collection (EEG)
  textInput("device", "Recording device", placeholder = "Eg. Elekta"),
  textInput("cap", "Headset", placeholder = "Eg. System 10-20"),
  textInput("ground", "Ground electrode", placeholder = "on the chest"),
  textInput("reference", "Reference", placeholder = "linked mastoids"),
  selectInput("erm_group", "Empty-Room-Recording", c("None" = 1, "Before" = 2, "After" = 3, "Before & After" = 4)),
  # Inputs for data collection (MEG)
  selectInput("ch_types","Channel-types", c("Magnetometer"=1,"Gradiometer"=2,"EEG"=3)),
  textInput("digitization","Head-Digitization", placeholder = "e.g RPA, LPA, Nasion, 4 Coils, add. 100 Points"),
  #Inputs for data pre-processing
  textAreaInput("filter", "Filtering", placeholder = "Eg. butter bandpass filter 0.5 - 70 Hz of order 5, notch filter"),
  textAreaInput("artefaction_subtraction", "Artefact subtraction", placeholder = "ICA was used"),
  textAreaInput("trial", "Epoching", placeholder = "From -1 to 2, baseline corrected"),
  textAreaInput("downsamp","Downsampling",placeholder = "512 Hz sampling rate"),
  textInput("baseline","Baseline Correction", placeholder = "Eg., -100 - 0ms"),
  textAreaInput("reref", "Re-referencing", placeholder = "common average"),
  textAreaInput("ch_rej", "Channel rejection", placeholder = "common average"),
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

## Empty room recording
{input$erm_group}

## Channel type
{input$ch_types}

## Digitization
{input$digitization}

## Filtering
{input$filter}

## Baseline 
{input$baseline}

## Artefacts
{input$artefaction_subtraction}

## Trials
{input$trial}

## Downsampleing
{input$downsamp}

## Reference
{input$reref}

## Channel rejection
{input$ch_rej}

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
