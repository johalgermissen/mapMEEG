FORM_FIELDS_EEG <- tagList(
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
TEMPLATE_TEXT_EEG ="
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

FORM_FIELDS_MEG <- tagList(
  textInput("device", "Recording device", placeholder = "Eg. Elekta"),
  textInput("cap", "Headset", placeholder = "Eg. System 10-20"),
  textAreaInput("filter", "Filtering", placeholder = "Eg. butter bandpass filter 0.5 - 70 Hz of order 5, notch filter"),
  textAreaInput("artef", "Artefact rejection", placeholder = "ICA was used"),
  textAreaInput("trial", "Trial split", placeholder = "From -1 to 2, baseline corrected"),
  textAreaInput("other", "Other")
)

TEMPLATE_TEXT_MEG ="
## Modality

{input$modality}

## Device

{input$device}

## Headset

{input$cap}

## Filtering

{input$filter}

## Artefacts

{input$artef}

## Trials

{input$trial}

## More details

{input$other}
" 
