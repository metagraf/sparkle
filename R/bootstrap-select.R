#' bootstrap-select Input
#' 
#' ...
#' 
#' @param inputId input id
#' @param ... see selectInput()
#' @param options options passed as json object (not sure if it works yet)
#' @export
bootstrapSelectInput <- function(
    inputId,
    label,
    choices,
    selected = NULL,
    multiple = FALSE,
    style = NULL,
    title = NULL,
    selectedTextFormat = NULL,
    header = NULL,
    icon = NULL,
    subtext = NULL,
    content = NULL,
    liveSearch = NULL,
    size = NULL,
    options = NULL) {
    
    hasSameLength <- function(var1, var2) {
        if (!is.null(var1) && length(var1) != length(var2)) {
            stop("Must equal to NULL or have the same length as choices")
        }
    }
    hasSameLength(icon, choices)
    hasSameLength(subtext, choices)
    hasSameLength(content, choices)
    
    suppressMessages(singleton(addResourcePath("sparkle", system.file("js", package = "sparkle"))))
    
    addAttr <- function(key, value) {
        if (!is.null(value)) {
            selectTag$attribs[[key]] <<- value
        }
    }
    
    choices <- shiny:::choicesWithNames(choices)
    if (is.null(selected) && !multiple) {
        selected <- names(choices)[[1]]
    }
    
    selectTag <- tags$select(id = inputId)
    if (multiple) selectTag$attribs$multiple <- "multiple"

    selectTag$attribs$class <- "selectpicker"

    addAttr("data-style", style)
    addAttr("title", title)
    addAttr("data-selected-text-format", selectedTextFormat)
    addAttr("data-header", header)
    addAttr("data-live-search", liveSearch)
    addAttr("data-size", size)
    
    choices_names <- names(choices)
    optionTags <- lapply(1:length(choices), function(i) {
        optionTag <- tags$option(value = choices[[i]], choices_names[[i]])
        if (choices_names[[i]] %in% selected) optionTag$attribs$selected = "selected"
        
        if (!is.null(icon[[i]])) optionTag$attribs$`data-icon` <- icon[[i]]
        if (!is.null(subtext[[i]])) optionTag$attribs$`data-subtext` <- subtext[[i]]
        if (!is.null(content[[i]])) optionTag$attribs$`data-content` <- content[[i]]
        
        optionTag
    })

    selectTag <- tagSetChildren(selectTag, list = optionTags)
    bootstrapSelectTags <- tagList(shiny:::controlLabel(inputId, label), selectTag)
    
    tagList(
        singleton(
            tags$head(
                tags$script(
                    src = "sparkle/bootstrap-select/bootstrap-select.min.js",
                    type= "text/javascript"
                )
            )
        ),
        singleton(
            tags$head(
                tags$link(
                    rel = "stylesheet",
                    type = "text/css",
                    href = "sparkle/bootstrap-select/bootstrap-select.min.css"
                )
            )
        ),
        bootstrapSelectTags,
        tags$script(
            sprintf(
                "$(document).ready(function() { $('.selectpicker').selectpicker(%s);});",
                toJSON(options)
            )
        )
    )
}