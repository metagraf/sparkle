#' Bootswatch theme
#' 
#' ...
#' 
#' @param theme bootstrap theme
#' @param list tagList (e.g. pageWithSidebar())
#' @export
bootswatchTheme <- function(theme = "amelia", list, version = "2.3.1") {
    
    url <- sprintf("http://netdna.bootstrapcdn.com/bootswatch/%s/%s/bootstrap.min.css", version, theme)
    
    css <- tagList(
        tags$head(
            tags$link(rel = "stylesheet", type = "text/css",
                      href = url)
        )
    )
    
    tagList(list, css)
    
}
