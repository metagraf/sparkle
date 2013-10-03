library(shiny)
library(sparkle)

runApp(
    list(
        ui = bootstrapPage(
            bootstrapSelectInput("id", "label", c("Food", "Drinks"), icon = c("icon-heart", "icon-film"), liveSearch = T, subtext = c("subtext1...", "subtext2")),
            bootstrapSelectInput("id2", "label2", head(LETTERS), multiple = T, selected = head(LETTERS), style = "btn-success", selectedTextFormat = "count"),
            bootstrapSelectInput("id3", "label3", head(LETTERS), multiple = T),
            bootstrapSelectInput("id4", "label4", c("a", "b"), content = c("<img src=\"http://www.w3schools.com/images/compatible_safari.gif\" width = '20px' height = '20px' alt=\"Smiley face\">Safari", "<span class='label label-success'>Relish</span>")),
            select2Input("id5", "label5", 1:5),
            textOutput("test")
        ),
        server = function(input, output, session) {
            output$test <- renderText({
                paste(input$id, "\n", paste(input$id2, collapse = ", "))
            })
        }
    )
)
