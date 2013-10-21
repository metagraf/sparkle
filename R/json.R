
to_json <- function(x) {
    toObj(toJSON(x))
}

# Solution borrowed from rCharts, thanks ramnathv!
toObj <- function(x){
    res <- gsub('\"#!(.*?)!#\"', "\\1", x)
    #res <- gsub("\\\\", "\\", res)
    res <- shiny:::HTML(res)
    return(res)
}