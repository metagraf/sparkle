#' Trip help
#' 
#' ...
#' 
#' @export
trip <- function(inputId, label, objects, options = "") {
    
    suppressMessages(singleton(addResourcePath("sparkle", system.file("js", package = "sparkle"))))
    
    tagList(
        singleton(
            tags$head(
                tags$script(
                    src = "sparkle/trip/src/trip.min.js",
                    type = "text/javascript"
                )
            )
        ),
        singleton(
            tags$head(
                tags$link(
                    rel = "stylesheet",
                    type = "text/css",
                    href = "sparkle/trip/src/trip.min.css"
                )
            )
        ),
        actionButton(inputId = inputId, label = label),
        tags$script(
            sprintf(
                'var trip = new Trip(%s, {});
                $("#%s").on("click", function() { trip.start(); });',
                to_json(objects),
                #to_json(options),
                inputId
            )
        )
    )
}