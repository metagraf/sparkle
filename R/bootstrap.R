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

#' Follow buttons
#' 
#' ...
#' 
#' @param style style type (1-7)
#' @export
followButtons <- function(small = TRUE, vertical = FALSE, facebook = NULL, twitter = NULL, linkedin = NULL, linkedin_company = NULL, google = NULL, youtube = NULL, flickr = NULL, vimeo = NULL, pinterest = NULL, instagram = NULL, foursquare = NULL, tumblr = NULL, rss = NULL) {
    
    link <- function(type, user, company = FALSE) {
        if (!is.null(type)) {
            company <- if (company) 'addthis:usertype="company"' else ""
            html <- sprintf('<a class="addthis_button_%s_follow" addthis:userid="%s" %s></a>', type, user, company)
            return(html)
        } else {
            return(NULL)
        }
    }
    
    small <- if (small) "" else " addthis_32x32_style"
    vertical <- if (vertical) "vertical" else "default"
    
    html <- sprintf('<div class="addthis_toolbox%s addthis_%s_style">\n
    %s\n
    </div>
    <script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=xa-5183f22a1209020b"></script>\n', 
    small, vertical, paste(
        link("facebook", facebook),
        link("twitter", twitter),
        link("linkedin", linkedin),
        link("linkedin", linkedin_company, company = T),
        link("google", google),
        link("youtube", youtube), 
        link("flickr", flickr),
        link("vimeo", vimeo),
        link("pinterest", pinterest),
        link("instagram", instagram),
        link("foursquare", foursquare),
        link("tumblr", tumblr),
        link("rss", rss),
        collapse = "\n")
    )
    HTML(html)
}

