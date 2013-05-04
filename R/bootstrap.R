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

#' Github button
#' 
#' ...
#' 
#' @param user github user
#' @param repo github repo
#' @param type button type ("watch", "fork", "follow")
#' @param count show count (TRUE/FALSE)
#' @param small small size (TRUE/FALSE)
#' @export
githubButton <- function(user = "metagraf", repo = "sparkle", type = "watch", count = TRUE, small = TRUE) {
    
    if (small) {
        height <- 20
        if (count) {
            width <- switch(type, watch = 110, fork = 95, follow = 165)
        } else {
            width <- switch(type, watch = 62, fork = 53, follow = 132)
        }
    } else {
        height <- 30
        if (count) {
                width <- switch(type, watch = 170, fork = 147, follow = 255)
        } else {
            width <- switch(type, watch = 96, fork = 82, follow = 204)
        }
    }

    count_str <- if (count) "true" else "none"
    size <- if (small) "none" else "large"

    html <- sprintf("<iframe src=\"http://ghbtns.com/github-btn.html?user=%s&repo=%s&type=%s&count=%s&size=%s\" allowtransparency=\"true\" frameborder=\"0\" scrolling=\"0\" width=\"%s\" height=\"%s\"></iframe>", user, repo, type, count_str, size, width, height)
    HTML(html)
}

#' Share buttons
#' 
#' ...
#' 
#' @param style style type (1-7)
#' @export
shareButtons <- function(style = 1) {
    html <- paste(readLines(file.path(system.file(package = "sparkle"), "addthis", sprintf("style%s.html", style))), collapse = "")
    HTML(html)
}

