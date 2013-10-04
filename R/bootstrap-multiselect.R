#' Bootstrap multiselect
#' 
#' ...
#' 
#' @param inputId input id
#' @param ... see selectInput()
#' @param options select 2 options
#' @export
multiselectInput <- function(inputId, ..., options = NULL) {
    
    suppressMessages(singleton(addResourcePath("sparkle", system.file("js", package = "sparkle"))))
    
    tagList(
        singleton(
            tags$head(
                tags$script(
                    src = "sparkle/bootstrap-multiselect/bootstrap-multiselect.js",
                    type = "text/javascript"
                )
            )
        ),
        singleton(
            tags$head(
                tags$link(
                    rel = "stylesheet",
                    type = "text/css",
                    href = "sparkle/bootstrap-multiselect/bootstrap-multiselect.css"
                )
            )
        ),
        selectInput(
            inputId = inputId,
            ...
        ),
        tags$script(
            sprintf(
                "$(document).ready(function() { $('#%s').multiselect(%s);});",
                inputId,
                toJSON(options)
            )
        )
    )
}