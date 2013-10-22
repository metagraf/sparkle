library(shiny)
library(sparkle)

# Define UI for dataset viewer application
shinyUI(bootswatchTheme("united", bootstrapPage(
    
    # Application title
    headerPanel("Tabsets"),
    
    # Sidebar with controls to select the random distribution type
    # and number of observations to generate. Note the use of the br()
    # element to introduce extra vertical spacing
    sidebarPanel(
        bootstrapSwitch("switch_in"),
        bootstrapSwitch("switch2", dataLabelIcon="icon-fullscreen", dataOnLabel="<i class='icon-ok icon-white'></i>", dataOffLabel="<i class='icon-remove'></i>"),
        textOutput("switch_out"),
        bootstrapCheckbox("checkbox", "", options = list(checkedClass = "icon-off", uncheckedClass = "icon-fast-forward")),
        textOutput("checkbox"),
        #trip("dist", "n"),
        trip("tripid", "click to trip", list(list(sel = "#! $('.well') !#", content = "test content"), list(sel = "#! $('#tripid') !#", content = "test content 2"))),
        githubButton(user = "metagraf", repo = "shinySparkle", type = "watch", count = TRUE, small = TRUE),
        githubButton(user = "metagraf", repo = "shinySparkle", type = "follow", count = TRUE, small = TRUE),
        githubButton(user = "metagraf", repo = "shinySparkle", type = "fork", count = TRUE, small = TRUE),
        #shareButtons(1),
        #shareButtons(2),
        #shareButtons(3),
        shareButtons(1),
        #shareButtons(5),
        #shareButtons(6),
        #shareButtons(7),
        followButtons(small = T, vertical = F, twitter = "thorei", facebook = "thomas.reinholdsson", linkedin_company = "mycompany", linkedin = "thomasreinholdsson"),
        
        radioButtons("dist", "Distribution type:",
                     list("Normal" = "norm",
                          "Uniform" = "unif",
                          "Log-normal" = "lnorm",
                          "Exponential" = "exp")),
        br(),
        
        sliderInput("n", 
                    "Number of observations:", 
                    value = 500,
                    min = 1, 
                    max = 1000)
    ),
    
    # Show a tabset that includes a plot, summary, and table view
    # of the generated distribution
    mainPanel(
        tabsetPanel(
            tabPanel("Plot", plotOutput("plot")), 
            tabPanel("Summary", verbatimTextOutput("summary")), 
            tabPanel("Table", tableOutput("table"))
            
        ),shareButtons(1)
    )
)))