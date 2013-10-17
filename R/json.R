
to_json <- function(x) {
    toObj(toJSON(x))
}

# Solution borrowed from rCharts, thanks ramnathv!
toObj <- function(x){
  gsub('\"#!(.*?)!#\"', "\\1", x)
}