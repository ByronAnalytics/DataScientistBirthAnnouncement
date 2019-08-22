
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("Population Dynamics of Site 2031-2"),

  # Sidebar with a slider input for number of bins
  tabsetPanel(
    tabPanel('Home', 
             h3("Introduction"),
             p("Understanding the population dynamics of microhabitats can have an
                important role in properly managing the site. Ensure proper resources
                are available ensures populations of various species in the habit can maintain
                healthy levels."),
             h3("Study Overview"),
             p("Site was sampled regularly over the past 11 months and a population model was build based 
                on health and condition of species within the study area. All sampling was non-destructive 
                and care was made to preserve the health of subjects given relatively low abundances of 
                each species and researcher's desire to not anger financial backers."),
             h3("Site Overview"),
             p("Site 2031-2 is characterized as a concreate enclosed habitat with the abilities to 
               self-regulate it's climate. It is neighbored by numerous similar sites, however physical structures
               and community dynamics make emigration or immigration insignificant in the overall population dynamics. 
               Site is approximately 140 sq meters with a uniform substrate. Temperature range for site 22 (+/- 8) 
               degrees celsius"),
             img(src="images/SiteMap.png")),
    tabPanel('Diversity', 
             sidebarLayout(position = "left",
                           sidebarPanel("",
                                        radioButtons("divSelected", 
                                                     "Diversity Plots", 
                                                     c("Richness",
                                                       "Simpsons",
                                                       "Shannon"))
                                                     ),
                           mainPanel(
                             plotOutput("DivPlot")
                           ))),
    
    tabPanel('Abundance', 
             sidebarLayout(position = "left",
                           sidebarPanel("",
                                        radioButtons("abundSelected", 
                                                     "abundance Plots", 
                                                     c("Total",
                                                       "Species",
                                                       "Age"))
                           ),
                           mainPanel(
                             plotOutput("AbunPlot")
                           ))),
    
    tabPanel('Conclusion',              
             h3("Results"),
             p("Site 2031-2 was characterized by low abundance and low diversity. Two species were identified, Felis catus and Homo Sapiens. 
               Examination of abundance by species suggests the fecundity of H. Sapiens is increasing, leading to a shift from uniform 
               diversity indices."),
             h3("Conclusion"),
             p("Site is characterized by a mix atmosphere of Joy, Panic, and Disbelieve. Significant concerns exist over the ability 
                of the site to maintain increased population levels. Declaration of superfund status may be necessary to ensure healthy 
                population development... or researcher could pick up instead of completing overly-complex analysis"),
             actionButton("show", "Additional Data"), 
             p(""),
             a("Github Repository:", href= 'https://github.com/ByronAnalytics/DataScientistBirthAnnouncement/wiki/Population-Model-as-a-Birth-Announcement'),
             target = '_blank')
    )
))
