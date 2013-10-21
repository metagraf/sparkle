#' Bootstrap checkbox
#' 
#' ...
#' 
#' @param inputId input id
#' @param ... see selectInput()
#' @param options select 2 options
#' @export
bootstrapCheckbox <- function(inputId, ..., options = NULL) {
    
    suppressMessages(singleton(addResourcePath("sparkle", system.file("js", package = "sparkle"))))
    
    tagList(
        singleton(
            tags$head(
                tags$script(
                    src = "sparkle/bootstrap-checkbox/js/bootstrap-checkbox.js",
                    type = "text/javascript"
                )
            )
        ),
        singleton(
            tags$head(
                tags$link(
                    rel = "stylesheet",
                    type = "text/css",
                    href = "sparkle/bootstrap-checkbox/css/bootstrap-checkbox.css"
                )
            )
        ),
        checkboxInput(
            inputId = inputId,
            ...
        ),
        tags$script(
            sprintf(
                "$(document).ready(function() { $('#%s').checkbox(%s);});",
                inputId,
                to_json(options)
            )
        )
    )
}