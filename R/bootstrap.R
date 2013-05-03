#' Bootstrap theme page
#' 
#' ...
#' 
#' @param theme bootstrap theme
#' @param ... see bootstrapPage(...)
#' @export
bootstrapThemePage <- function(theme = "amelia", ...) {

    url <- sprintf("http://netdna.bootstrapcdn.com/bootswatch/2.3.1/%s/bootstrap.min.css", theme)
    
    css <- tagList(
        tags$head(
            tags$link(rel = "stylesheet", type = "text/css",
                      href = url)
        )
    )
    
    bootstrapPage(css, ...)
    
}