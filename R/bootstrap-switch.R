#' Bootstrap switch
#' 
#' ...
#' 
#' @param inputId input id
#' @param ... see checkboxInput()
#' @param size size (e.g. 'switch-mini')
#' @export
bootstrapSwitch <- function(inputId, dataLabelIcon = "", dataOnLabel = "On", dataOffLabel = "Off", type = "make-switch", size = "switch-mini") {
    
    suppressMessages(singleton(addResourcePath("sparkle", system.file("js", package = "sparkle"))))
    
    tagList(
        singleton(
            tags$head(
                tags$script(
                    src = "sparkle/bootstrap-switch/bootstrap-switch.min.js",
                    type = "text/javascript"
                )
            )
        ),
        singleton(
            tags$head(
                tags$link(
                    rel = "stylesheet",
                    type = "text/css",
                    href = "sparkle/bootstrap-switch/bootstrap-switch.css"
                )
            )
        ),
        #tags$div(class = type,
        HTML(
            sprintf(
                '<div class="%s" data-on-label="%s" data-off-label="%s" data-label-icon="%s"><input id="%s" type="checkbox" checked></div>',
                type, dataOnLabel, dataOffLabel, dataLabelIcon, inputId
            )
        ),
        #),
        tags$script(
            sprintf(
                "$(document).ready(function() { $('#%s').bootstrapSwitch('setSizeClass', '%s');",
                type,
                to_json(size)
            )
        )
    )
}