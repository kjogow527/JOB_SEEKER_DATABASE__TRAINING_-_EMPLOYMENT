## app.R ##  
library(shinydashboard)
library(shinyjs)
library(DT)
library(shinythemes)
library(shinyWidgets)
library(shiny)
library(bslib)
library(cookies)

# shinyjs::hide(selector = "a[data-value='tab3']" )

  # https://rstudio.github.io/shinydashboard/structure.html
#

# here is a test


ui <- add_cookie_handlers(
 
  dashboardPage(skin = "blue",
            # use javascript
            

  
  dashboardHeader(title = "Job Seeker Database - Training & Employment",
                  dropdownMenuOutput("messageMenu")
                  
                  
                  
                  
                  ),
  dashboardSidebar(
    ## Sidebar content
    dashboardSidebar(
      sidebarMenu(
        menuItem("LOGIN", tabName = "login", icon = icon("cog", lib = "glyphicon")),
       # menuItem("Home", tabName = "Home", icon = icon("th")),
       ## menuItem("upload offline data", tabName = "datainput", icon = icon("th")),
       # menuItem("Export copy of database", tabName = "dataoutput", icon = icon("th")),
       # menuItem("Manual Data entry", tabName = "manualinput", icon = icon("th")),  
       # menuItem("Upload database profile", tabName = "profile", icon = icon("th")),
        #menuItem("Download templates", tabName = "asset", icon = icon("th")),
        
        menuItemOutput("Home"),
        menuItemOutput("datainput"),
        menuItemOutput("dataoutput"),
        menuItemOutput("manualinput"),
        menuItemOutput("profile"),
        menuItemOutput("visual"),
        menuItemOutput("search"),
        menuItemOutput("asset"),
        menuItemOutput("account"),
        menuItemOutput("admin")
       
       
       
      )
    )
    
  ),
  
  
  body <- dashboardBody(
    
    useShinyjs(),
  
    # Home tab________________________________________________________________________________________________________________
    tabItems(
      
      tabItem(tabName = "Home",
              
              h2("Welcome TO THE MH INDIGENOUS EMPLOYMENT DATABASE "),
              p("", style = "font-size:18px"),
              p("INSTRUCTIONS:", style = "font-size:22px"),
              p("1. Canadate Search tab runs reports to find capable candidates", style = "font-size:18px"),
              p("2. Upload offline data tab allows for you to manually upload data to dataset", style = "font-size:18px"),
              p("3. Export copy of database tab allows for users to make a duplicate of the employment database", style = "font-size:18px"),
              p("4. Manual input tab allows for users to enter data to dataset manually", style = "font-size:18px"),
              p("5. upload database profile tab allows for job profiles to be installed", style = "font-size:18px"),
              p("6. Download templates tab has assets requried for uploading data", style = "font-size:18px")
      ),
      
      # Login Page
      tabItem(tabName = "login",
              
              tabsetPanel(type = "tabs", id = "login",
                   
              tabPanel("LOGIN" ,           
             # h2("MH INDIGENOUS EMPLOYMENT DATABASE"),
              p(""),
             fluidRow(
              column(5,
                  #   box(title = "LOGIN", width = NULL, solidHeader = TRUE, status = "primary",
              textInput("username", "Username: ", value = ""),
              passwordInput("password", "Password: ", value = ""),
              #textOutput("selected_var"),
              actionButton("button1", "Login"),
              actionButton("adminlogin", "Admin login"),
              
              
              actionButton("create_account", "No account? Create account here"),
              
              checkboxInput("cookies_browser", label = "Remember browser", value = TRUE), 
              textOutput("textfail"),
              p(""),
              p(""),
              
              # random image goes here
          #img(src= print(paste("image_",floor(runif(1, min = 0, max = 10)),".jpg",sep = "")),align = "below"),
             
              ),
              column(8,),
          
                 img(src= "image_9.jpg",align = "below", height = "90%", width = "100%"),
                 p("Image Credit: MB hydro") 
             )
          
          
          ),
          
          tabPanel("SETTINGS" ,           
                   # h2("MH INDIGENOUS EMPLOYMENT DATABASE"),
                   p(""),
                   fluidRow(
                     column(1,),
                     column(5,
                     #1111
                     box(title = "Cookies Preferences", width = NULL, solidHeader = TRUE, status = "primary",
                     actionButton("remove_cookies", "Remove automatic sign in"),
                     textOutput("text_cookie"), 
                     ),
                    # box(title = "Version Info", width = NULL, solidHeader = TRUE, status = "primary",
                    #     p(paste("version: ", version1("version"), sep = "")), 
                    #     p(version1("stable")),
                    # )
                     ),
                     column(6,)
                   )
                   
          ),
        )
      ),
      # Search tab ____________________________________________________________________________________________________________
      tabItem(tabName = "search",
              #h2(""),
              
         tabsetPanel(type = "tabs", id = "search_tb",     
              
              #789789
              
              tabPanel("browse", 
              
              fluidPage(
                fluidPage(
                  
                  box(title = "WELCOME!", width = NULL, solidHeader = TRUE, status = "primary",
                   
                      p("Welcome the the manitoba hydro indegenous employment database! This Database aims to offer Indigenous Manitobans increased access to quality employment!"),
                      span(p(paste("Warning: you can only search for for people within your granted data region, contact the site admin for details!",sep = "")), style = "color:red")
                      
                  ),
                  
                 
                  column(4,
                  
                         box(title = "Search By job type", width = NULL, solidHeader = TRUE, status = "primary",
                             
                            # Required Information 
                            
                            p("Search by job type takes pre-determined roles and ranks candidates by suitability and fundamental skills requirements."),
                            actionButton("s_b_job", "Search now!"),
                            actionButton("s_b_job_profile", "Create Job profile")
                             
                             
                         )
                        
                         
                  ),
                  column(4,
                           
                           
                         box(title = "Search by skills", width = NULL, solidHeader = TRUE, status = "primary",
                             
                              # required Information 
                          
                             span(p("Search helps filter candidates by required and preferred skills of choice."), style = "color:black"),
                             p(""),
                             actionButton("s_b_skill", "Search now!")
                             
                         )
                         
                           
                           
                           
                           
                           
                           
                  ),
                  column(4,
                         
                         box(title = "search by name", width = NULL, solidHeader = TRUE, status = "primary",
                             
                             # Required Information
                             
                             p("Search for applicant based on first and or last name"),
                             p(""),
                             p(""),
                             actionButton("s_b_name", "Search now!")
                         )
                         
                         
                         
                         
                  ),
                  
                  img(src= "image_9.jpg",align = "below", height = "90%", width = "90%")
                  
                )
              )
            )
         )
             
              
      ),
      # offline data upload tab_________________________________________________________________________________________________
      tabItem(tabName = "datainput",
              #h2("Update Data"),
              box(title = "Add Data options", width = NULL, solidHeader = TRUE, status = "primary",
              tabsetPanel(type = "tabs",
                          
                          tabPanel("EDUCATION", 
                          
              fluidRow(
                column(1,),
                column(6,
                      # h2("Add Education option"),
                       
                       box(title = "ADD EDUCATION OPTION", width = NULL, solidHeader = TRUE, status = "primary",
                       
                       DTOutput("tableeducation"),
                       span(p("ONCE ADDED IT CAN NOT BE REMOVED WITHOUT ADMIN: USE CAUTION"), style = "color:red"),
                       textInput("addeducation","Add new eduction option:"),
                       actionButton("save_education", "Save Changes"),
                       textOutput("education_save_confirm"),
                       ),
                ),
                
              column(5,)
              )
              
                          ),
              
              tabPanel("JOB INTEREST'S",
                       
                       fluidRow(
                         column(1,),
                         column(6,
                               # h2("Add Job Interest Option"),
                                
                                box(title = "ADD JOB INTEREST OPTION", width = NULL, solidHeader = TRUE, status = "primary",
                                DTOutput("tablejob_interest"),
                                span(p("ONCE ADDED IT CAN NOT BE REMOVED WITHOUT ADMIN: USE CAUTION"), style = "color:red"),
                                textInput("addjob_interest","Add new job interest option:"),
                                actionButton("save_job_interest", "Save Changes"),
                                textOutput("job_interest_save_confirm"),
                                ),
                         ),
                         
                         column(5,)
                       )
              
                       
                       
              ),# End of tab panel job interests
              
                # community
              tabPanel("LOCATIONS",
                       
                       fluidRow(
                         column(1,),
                         column(6,
                               # h2("Add Community option"),
                                
                               box(title = "ADD COMMUNITY OPTION", width = NULL, solidHeader = TRUE, status = "primary",
                                DTOutput("tablelocation"),
                                span(p("ONCE ADDED IT CAN NOT BE REMOVED WITHOUT ADMIN: USE CAUTION"), style = "color:red"),
                                textInput("addlocation","Add new community option:"),
                                actionButton("save_location", "Save Changes"),
                                textOutput("location_save_confirm"),
                               ),
                         ),
                         
                         column(5,)
                       )
             
                       
                       
              ),# End tab panel LOCATIONS
              
              tabPanel("APPRENTICESHIP TRADE LEVEL",
                       
                       fluidRow(
                         column(1,),
                         column(6,
                               # h2("Add apprenticeship trade level option"),
                                
                               box(title = "ADD APPRENTICESHIP Trade level option", width = NULL, solidHeader = TRUE, status = "primary",
                                DTOutput("tablelevel"),
                                span(p("ONCE ADDED IT CAN NOT BE REMOVED WITHOUT ADMIN: USE CAUTION"), style = "color:red"),
                                textInput("addlevel","Add new apprenticeship trade level option:"),
                                actionButton("save_level", "Save Changes"),
                                textOutput("level_save_confirm"),
                               ),
                         ),
                         
                         column(5,)
                       )    
             
                       
                       
              ), # End of apprenticeship trade level tab panel
              
              tabPanel("PROJECT INTEREST",
                       
                       fluidRow(
                         column(1,),
                         column(6,
                              #  h2("Add project interest option"),
                                
                              box(title = "ADD PROJECT INTEREST OPTION", width = NULL, solidHeader = TRUE, status = "primary",
                                DTOutput("tableinterest"),
                                span(p("ONCE ADDED IT CAN NOT BE REMOVED WITHOUT ADMIN: USE CAUTION"), style = "color:red"),
                                textInput("addinterest","Add new project interest option:"),
                                actionButton("save_interest", "Save Changes"),
                                textOutput("interest_save_confirm"),
                              ),
                         ),
                         
                         column(5,)
                       ) 
                       
                       
                       
              )
              
              
              
                          )
              )
      ),
      # data output________________________________________________________________________________________________________________
        tabItem(tabName = "dataoutput",
                h2("Database export"),
                p("Databse exported as .csv", style = "font-size:18px"),
                # download button
                
                downloadButton("downloadData1","Download Dataset"),
                #downloadButton("downloadzip","zip files") #999
        ),
      # Manual input________________________________________________________________________________________________________________
      tabItem(tabName = "manualinput",
              
              tabsetPanel(type = "tabs", id = "manualentry",
                          
                          tabPanel("APPLICATION" ,
              #h2("Manually enter data"),
              
              box(title = "CREATE JOB APPLICATION", width = NULL, solidHeader = TRUE, status = "primary",
              fluidRow(
              column(4,
                     
                     
                     
                     
              
              # First Name (B)
              textInput("firstname", "First Name: ", value = ""),
              
              # Last Name (A)
              textInput("lastname", "Last Name: ", value = ""),
              
              # Middle Inital (C)
              textInput("middleinital", "Middle Inital: ", value = ""),
              
              #Email input (D)
              textInput("email", "Email: ", value = ""),
              
              #Phone (E)
              textInput("phone", "Phone: (xxx) xxx-xxx ", value = ""),
              
              # First Nation Community (F)
              
              selectInput(
                "community",
               label = "First nation Community",
                choices = read.csv("list/LOCATIONS.csv"), # testname
                multiple = FALSE
              ),
              
              
              # City / Town of residence (G)
              textInput("location", "City / Town of Residence: ", value = ""),
              
              
              # Current Address
              
              textInput("current_address", "Current Address: (Address + postal code) ", value = ""),
              
              
              # Home_address
              
              textInput("home_address", "Home Address: (address + postal code) ", value = ""),
              
              # highest education (H) List variable will go here
              
              selectInput(
                "education",
                label = "Education",
                choices = read.csv("list/EDUCATION.csv"), # Blah education
                multiple = FALSE
              ),
              
              
              # Apprenticeship Trade / Levels Completed
              
              selectInput(
                "apprenticeship",
                label = "Apprenticeship level",
                choices = read.csv("list/APPRENTICESHIP_TRADE_LEVEL.csv"), # blah
                multiple = FALSE
              ),
              
              
              textAreaInput(
                "apprenticeship_detail",
                "Apprenticeship details",
                value = "",
                width = NULL,
                height = NULL,
                cols = NULL,
                rows = NULL,
                placeholder = NULL,
                resize = "vertical"
              ),
              
              
              
              #Trade / job interest 
              
              selectInput(
                "job_interest",
                label = "Job interests",
                choices = read.csv("list/JOB_INTEREST.csv"), # blah
                multiple = TRUE
              ),
              
              # engagement event attend
              radioButtons(
                "ME_female",
                "Are you female?",
                choices = c("yes","NO"),
                selected = "NO",
                inline = TRUE,
                width = NULL,
                choiceNames = NULL,
                choiceValues = NULL
                
              ), 
              
              
              
              # project interests
              
              selectInput(
                "project_interest",
                label = "project interests",
                choices = read.csv("list/PROJECT_INTEREST.csv"), #blah
                multiple = TRUE
              ),
              
              # previous MH job experience (yes / No)
              
              radioButtons(
                "ME_previous",
                "Do you have previous job experiance with Manitoba Hydro?",
                choices = c("yes","NO"),
                selected = "NO",
                inline = TRUE,
                width = NULL,
                choiceNames = NULL,
                choiceValues = NULL
              ), 
              
              
              # If yes, details
              textInput("MHexperiance", "if yes, provide details", value = ""),
             # tags$textarea(id="MHexperiance", rows=5, "if yes, provide details"),
              
              
             
             
             
              # willing to join job workshop?
              
            #  radioButtons(
            #    "ME_workshop",
            #    "Are you willing to join a job workshop?",
            #    choices = c("yes","Unsure","NO"),
            #    selected = "NO",
            #    inline = TRUE,
            #    width = NULL,
            #    choiceNames = NULL,
            #    choiceValues = NULL
            #  ), 
              
              
             # tags$textarea(id="ME_notes", rows=5, "Any notes or comments go here"),
            
             # textInput("ME_notes", "Notes:", value = ""),
              # work availability
            
            textAreaInput(
              "ME_notes",
              "Notes:",
              value = NULL,
              width = NULL,
              height = NULL,
              cols = NULL,
              rows = NULL,
              placeholder = NULL,
              resize = "vertical"
            ),
            
            
              
              radioButtons(
                "ME_availability",
                "Are you currently available to work?",
                choices = c("yes","Soon","NO"),
                selected = "NO",
                inline = TRUE,
                width = NULL,
                choiceNames = NULL,
                choiceValues = NULL
              ), 
              
             dateInput("available","When are you available to start working?",format = "yyyy-mm-dd"),
              
              # Disability Yes / No    
              radioButtons(
                "ME_disability",
                "Do you require accommodation for a disability?",
                choices = c("yes","NO"),
                selected = "NO",
                inline = TRUE,
                width = NULL,
                choiceNames = NULL,
                choiceValues = NULL
              ), 
              
              # Disability Details
              
             # textInput("ME_Disability_Details", "If you have a disability please provide details", value = ""),
              
            textAreaInput(
              "ME_Disability_Details",
              "If you have a disability please provide details",
              value = NULL,
              width = NULL,
              height = NULL,
              cols = NULL,
              rows = NULL,
              placeholder = NULL,
              resize = "vertical"
            ),  
              
              # Input: Select a file ----
              fileInput("resume", "Upload Resume",
                        multiple = FALSE,
                        accept = c(".PDF",".docx")),
             
             
             fileInput("certificates", "Upload Education Certificates (multiple accepted)",
                       multiple = TRUE,
                       accept = c(".PDF",".docx"))
              
              
             
              ),
              column(4,
                
                
                          
               # Lets put the skill questions here      
                    
                 
               
                  
               # Truck Driver license
               
               # class 5    
               
               radioButtons(
                 "ME_class_5",
                 "Which drivers license do you have? (choose highest achevement)",
                 choices = c("None","Class 5","Class 4","class 3","class 2","class 1"),
                 selected = "None",
                 inline = TRUE,
                 width = NULL,
                 choiceNames = NULL,
                 choiceValues = NULL
               ),
               
               
               radioButtons(
                 "ME_truck_driver_detail",
                 "Do you have your air brakes endorsement?",
                 choices = c("yes","Working Toward","Willing to complete","NO"),
                 selected = "NO",
                 inline = FALSE,
                 width = NULL,
                 choiceNames = NULL,
                 choiceValues = NULL
               ),
               
               
               # ME_truck_driver
               
               radioButtons(
                 "ME_confined",
                 "Are you willing to work in a confined space?",
                 choices = c("yes","NO"),
                 selected = "NO",
                 inline = TRUE,
                 width = NULL,
                 choiceNames = NULL,
                 choiceValues = NULL
               ),
               
              
                
               # Operate seasonal vehicle?
               
               
               selectInput(
                 "ME_operate_seasonal_vehicle",
                 label = "What seasonal vehicles are you able to operate?",
                 choices = c("snowmobile","Boat","ATV"), # testname
                 multiple = TRUE
               ),
               
               
               
                     
               # CPR
               
               radioButtons(
                 "ME_cpr",
                 " Are you first aid / CPR certified?",
                 choices = c("yes","Previously","NO"),
                 selected = "NO",
                 inline = TRUE,
                 width = NULL,
                 choiceNames = NULL,
                 choiceValues = NULL
               ),
               
               # Travel
               
               radioButtons(
                 "ME_travel",
                 " Are you willing to travel for work?",
                 choices = c("yes","Potentially","NO"),
                 selected = "NO",
                 inline = TRUE,
                 width = NULL,
                 choiceNames = NULL,
                 choiceValues = NULL
               ),
               
               # Travel airplane boat
               
               radioButtons(
                 "ME_travel_airplane_boat",
                 " Are you able to travel by airplane or boat?",
                 choices = c("None","Airplane only", "Boat only", "Airplane and boat"),
                 selected = "None",
                 inline = TRUE,
                 width = NULL,
                 choiceNames = NULL,
                 choiceValues = NULL
               ),
               
               # safety
               
               radioButtons(
                 "ME_safety",
                 " Do you have any previous experience with workplace safety?",
                 choices = c("Lots","Some","NO"),
                 selected = "NO",
                 inline = TRUE,
                 width = NULL,
                 choiceNames = NULL,
                 choiceValues = NULL
               ),
               
               # construction
               
               radioButtons(
                 "ME_construction",
                 "Do you have construction experience?",
                 choices = c("4+ Years","3 Years","2+ Years","2 Years","NO"),
                 selected = "NO",
                 inline = FALSE,
                 width = NULL,
                 choiceNames = NULL,
                 choiceValues = NULL
               ),
               
               # road construction
               
               radioButtons(
                 "ME_road_construction",
                 "Do you have road construction experience?",
                 choices = c("4+ Years","3 Years","2+ Years","2 Years","NO"),
                 selected = "NO",
                 inline = FALSE,
                 width = NULL,
                 choiceNames = NULL,
                 choiceValues = NULL
               ),
               
               radioButtons(
                 "ME_forestry",
                 "Do you have previous forestry experience?",
                 choices = c("yes","Willing to learn","NO"),
                 selected = "NO",
                 inline = TRUE,
                 width = NULL,
                 choiceNames = NULL,
                 choiceValues = NULL
               ),
               
               # outdoor hot
               
               radioButtons(
                 "ME_outdoor_hot",
                 "Are you able to work in a hot outdoor environment?",
                 choices = c("For extended periods of time","Less then full time","NO"),
                 selected = "NO",
                 inline = FALSE,
                 width = NULL,
                 choiceNames = NULL,
                 choiceValues = NULL
               ),
               
               # outdoor cold
               
               radioButtons(
                 "ME_outdoor_cold",
                 "Are you able to work in a cold outdoor environment?",
                 choices = c("For extended periods of time","Less then full time","NO"),
                 selected = "NO",
                 inline = FALSE,
                 width = NULL,
                 choiceNames = NULL,
                 choiceValues = NULL
               ),
               
               # height
               
               radioButtons(
                 "ME_height",
                 "Are you comfortable working at heights?",
                 choices = c("yes","Somewhat comfortable","NO"),
                 selected = "NO",
                 inline = TRUE,
                 width = NULL,
                 choiceNames = NULL,
                 choiceValues = NULL
               ),
               
               # heavy lifting
               
               radioButtons(
                 "ME_heavy_lifting",
                 "Are you able to lift up to 50lbs?",
                 choices = c("yes","NO"),
                 selected = "NO",
                 inline = TRUE,
                 width = NULL,
                 choiceNames = NULL,
                 choiceValues = NULL
               ),
               
             
               
               # heavy equipment
               
               radioButtons(
                 "ME_heavy_equiptment",
                 "Are you a heavy equipment operator?",
                 choices = c("Through work experience","Certificate program","NO"),
                 selected = "NO",
                 inline = FALSE,
                 width = NULL,
                 choiceNames = NULL,
                 choiceValues = NULL
               ),
               
               # concrete
               
               radioButtons(
                 "ME_concrete",
                 "Do you have experience working with concrete?",
                 choices = c("yes","Willing to learn","NO"),
                 selected = "NO",
                 inline = TRUE,
                 width = NULL,
                 choiceNames = NULL,
                 choiceValues = NULL
               ),
               
               # power tools
               
              
               
               selectInput(
                 "ME_power_tool",
                 label = "What tools do you have experience with?",
                 choices = c("Hand tools","Air tools","Power tools"), # testname
                 selected = NULL,
                 multiple = TRUE
               ),
               
               
               # attention to detail
               
               
               
               
               textAreaInput(
                 "ME_detail",
                 "List tools you have experience with.",
                 value = "",
                 width = NULL,
                 height = NULL,
                 cols = NULL,
                 rows = NULL,
                 placeholder = NULL,
                 resize = "vertical"
               ),
               
               # problem solving
               
             #  radioButtons(
             #    "ME_problem_solving",
            #     "Do you have strong problem solving skills?",
           #      choices = c("Creative solutions to most problems","Ability to identify some unique solutions","Tough time solving daily problems","NO"),
           #      selected = "NO",
          #       inline = FALSE,
            #     width = NULL,
            #     choiceNames = NULL,
           #      choiceValues = NULL
           #    ),
               
               # pressure
               
               radioButtons(
                 "ME_pressure",
                 "Are you comfortable working in a high stress environment?",
                 choices = c("yes","occasionally","NO"),
                 selected = "NO",
                 inline = TRUE,
                 width = NULL,
                 choiceNames = NULL,
                 choiceValues = NULL
               ),
               
               # independent
               
               radioButtons(
                 "ME_independent",
                 "Do you prefer working with others?",
                 choices = c("yes","NO","Occasionally"),
                 selected = "NO",
                 inline = FALSE,
                 width = NULL,
                 choiceNames = NULL,
                 choiceValues = NULL
               )
               
               # independent
               
               
               
              
              ), # end of second column
              
              column(4,
                     
                     img(src= 'data_privacy.PNG',align = "below", height = "100%", width = "100%"),
                     
                     
                     p(""),
                    # span(p("Your contact information, qualifications, and resume will be shared with Manitoba Hydro’s Project Services Department and will be used to notify you of future training initiatives and programs that may be of interest to you.  Manitoba hydro is authorized to collect this information under section 36(1)(b) of The Freedom of Information and Protection of Privacy Act as the information relates directly to and is necessary to a program, services or activity of Manitoba Hydro.  If you have any questions about the collection and use of your personal information by Manitoba Hydro, please contact Mike Pagtakhan, Project Liaison Officer, Project Services Department at Manitoba Hydro, 360 Portage Avenue, Winnipeg MB  R3C 0J8, 204-794-4473, email: mpagtakhan@hydro.mb.ca"), style = "color:blue"),
                     p(""),
                     
                     
                     p(""),
                     downloadLink("agreement", label = "Agreement", class = NULL),
                     p(""),
                     p("Clicking agree is considered the same as signing the paper document. Your name will be digitally signed onto the document above."),
                     checkboxInput("agree","I Accept the Agreement"),
                     p(""),
                     actionButton("submit_applicaiton", "Submit application"),   
                     textOutput("submission_confirmation"),
                     p("")
                     
              ) # end of third column
              
              )
               
               
            ) # End of box
            
                          )
              )
      ),
      # data output________________________________________________________________________________________________________________
      tabItem(tabName = "profile",
              h2("View and update Data"),
              fluidRow(
                tabsetPanel(id = "tab",type = "tabs",
                            
                            tabPanel("View Data", 
              column(2,
                    box(title = "TOOLS", width = NULL, solidHeader = TRUE, status = "primary",
                  selectInput(
                    "last_changed",
                    label = "Time Since last profile Update",
                    choices = c("Show all profiles","1 Day","1 Week", "1 month","3 Months","6 Months","1 Year","2+ years"), # May make this a editable list later, but probably now
                    multiple = FALSE
                  ),
                  
                  selectInput(
                    "tabletype",
                    label = "Choose table type",
                    choices = c("Edit Table","See version history"), # May make this a editable list later, but probably now
                    multiple = FALSE
                  ),
                  
                  
                    ),
                  
                  box(title = "EXPORT COPY OF DATABASE", width = NULL, solidHeader = TRUE, status = "primary",
                      selectInput(
                        "export_type",
                        label = "Choose Export Type",
                        choices = c("DOWNLOAD MOST RECENT DATA", "DOWNLOAD DATA INCLUDING ALL VERSIONS"), # May make this a editable list later, but probably now
                        multiple = FALSE
                      ),
                      downloadButton("downloaddatabase_type",".CSV")
                      
                      
                  ),
                  
                  box(title = "Download AI generated application summary", width = NULL, solidHeader = TRUE, status = "primary",
                      
                      downloadButton("download_candidate",".docx"),
                      textOutput("candidate_text")
                      
                  )
                  
                  
                  
              
              ),# end of column
              column(10,
                     
               box(title = "SELECT ROW TO VIEW DETAILS AND MAKE EDITS", width = NULL, solidHeader = TRUE, status = "primary",      
              DTOutput("updatetable1"),
              span(p("SELECT ROW"), style = "color:red"),
               ),
              
              box(title = "DETAILS", width = NULL, solidHeader = TRUE, status = "primary",
              DTOutput("updatetable2"),
              actionButton("updateedits", "Edit Data"),
              textOutput("edit_data")
              ),
              # Input: Select a file ----
             
              ), # end of colunm  
             # column(1,)
        ), # tab panel
        
          
        #"text/csv", "text/comma-separated-values,text/plain",".csv"
                )
              )
      ),
      # asset________________________________________________________________________________________________________________
      tabItem(tabName = "asset",
              h2("download templates"),
              p("templates exported as .csv", style = "font-size:18px"),
              # download button
              
              downloadButton("downloadprofile","profile template"),
              downloadButton("downloadData","data upload template")
      ),
      # visual______________________________________________________________________________________________________________________
      tabItem(tabName = "visual",
              #h2("Data visualisation"),
              fluidRow(
                column(8,
                #555
                
                box(title = "Applicants By Region", width = NULL, solidHeader = TRUE, status = "primary",
                    DTOutput("visualtable1"),   
                )
                ),
                column(4,
                       
                )
              )
      ),
      
      # Account____________________________________________________________________________________________________
      tabItem(tabName = "account",
           #   h2("Create account"),
           #   p("Username and password must be greater than 8 characters", style = "font-size:18px"),
           #   textInput("crfirst", "First Name:", value = ""),
           #   textInput("crlast", "Last Name",value = ""),
            #  textInput("crusername", "Username: ", value = ""),
            #  passwordInput("crpassword", "Password: ", value = ""),
            #  textOutput("create_account_message"),
            #  actionButton("createaccount", "Create Account")
              
      )
      
      # # ADMIN PANEL
      # tabItem(tabName = "admin",
      #         h2("Admin Portal"),
      #         fluidRow(
      #      tabsetPanel(type = "tabs",
      #           
      #         tabPanel("Create temp account",                
      #         
      #         # Give home screen access
      #         box(title = "SELECT ACCESS YOU WISH TO GRANT USER", width = NULL, solidHeader = TRUE, status = "primary",
      #         column(4,
      #                
      #                p(""),
      #                p(""),
      #                #p("Select access you wish to grant user"),
      #                
      #         radioButtons(
      #           "accesshome",
      #           "Give access to the HOME page? (instructions)",
      #           choices = c("yes","NO"),
      #           selected = NULL,
      #           inline = TRUE,
      #           width = NULL,
      #           choiceNames = NULL,
      #           choiceValues = NULL
      #         ),
      #         
      #         # Give data input screen access
      #         
      #         radioButtons(
      #           "accessdatainput",
      #           "Give access to the edit data options page?",
      #           choices = c("yes","NO"),
      #           selected = NULL,
      #           inline = TRUE,
      #           width = NULL,
      #           choiceNames = NULL,
      #           choiceValues = NULL
      #         ),
      #         
      #         # Give dataoutput screen access
      #         
      #         radioButtons(
      #           "accessdataoutput",
      #           "Give access to the export database page (no longer needed)?",
      #           choices = c("yes","NO"),
      #           selected = NULL,
      #           inline = TRUE,
      #           width = NULL,
      #           choiceNames = NULL,
      #           choiceValues = NULL
      #         ),
      #         
      #         # Give manualinput screen access
      #         
      #         radioButtons(
      #           "accessmanualinput",
      #           "Give access to the job application page?",
      #           choices = c("yes","NO"),
      #           selected = NULL,
      #           inline = TRUE,
      #           width = NULL,
      #           choiceNames = NULL,
      #           choiceValues = NULL
      #         ),
      #         
      #         # Give profile screen access
      #         
      #         radioButtons(
      #           "accessprofile",
      #           "Give access to the Data update page (Allows user to update existing job applications)?",
      #           choices = c("yes","NO"),
      #           selected = NULL,
      #           inline = TRUE,
      #           width = NULL,
      #           choiceNames = NULL,
      #           choiceValues = NULL
      #         ),
      #         
      #         # Give visual screen access
      #         
      #         radioButtons(
      #           "accessvisual",
      #           "Give access to the data insights page (Nothing here yet)?",
      #           choices = c("yes","NO"),
      #           selected = NULL,
      #           inline = TRUE,
      #           width = NULL,
      #           choiceNames = NULL,
      #           choiceValues = NULL
      #         )
      #         
      #         ),
      #         
      #         column(4,
      #                
      #                p(""),
      #                p(""),
      #                p(""),
      #         
      #         # Give search screen access
      #         
      #         radioButtons(
      #           "accesssearch",
      #           "Give access to the Candidate Search page (not done, intended to find candidate)?",
      #           choices = c("yes","NO"),
      #           selected = NULL,
      #           inline = TRUE,
      #           width = NULL,
      #           choiceNames = NULL,
      #           choiceValues = NULL
      #         ),
      #         
      #         # Give asset download screen access
      #         
      #         radioButtons(
      #           "accessasset",
      #           "Give access to the asset download page (no longer needed, here for future)?",
      #           choices = c("yes","NO"),
      #           selected = NULL,
      #           inline = TRUE,
      #           width = NULL,
      #           choiceNames = NULL,
      #           choiceValues = NULL
      #         ),
      #     
      #         selectInput(
      #           "datalocation",
      #           label = "Select Data region user can access (user will only be able to interact and view data from this region)",
      #           choices = read.csv("list/LOCATIONS.csv"), # testname
      #           multiple = TRUE
      #         ),
      #         
      #    
      #            
      #         actionButton("createkey", "Create Temp account creation key"),
      #         
      #         textOutput("outputkey")
      #         
      #     ),
      #     
      #         ),
      #     column(4,)
      #         ),
      #          
      #         
      #         tabPanel("Account Managment",
      #         
      #         p(""),
      #         p(""),
      #         DTOutput('tbl'),
      #         actionButton("deleteuser", "Delete selected accounts"),
      #         actionButton("makeadmin", "give selected accounts admin access"),
      #         p(""),
      #         textOutput("action"),
      #         actionButton("verifyaction", "Confirm action"),
      #         textOutput("actioncomplete")
      #         
      #         ),
      #     
      #         
      #     
      #         tabPanel("Login History",
      #                  
      #                  p(""),
      #                  p(""),
      #                  column(1,),
      #                  column(8,
      #                  box(title = "Login History", width = NULL, solidHeader = TRUE, status = "primary",
      #                  datatable(read.csv("list/LOGIN_HISTORY.csv"),options= list(scrollX = TRUE))
      #                  ),
      #                  ),
      #                  column(3,)
      #                  
      #                  
      #                  
      #         ),
      #     
      #         
      #                  
      #                  tabPanel("Export / Update Application",
      #                           
      #                           column(1,),
      #                           
      #                           column(7,
      #                           
      #                          
      #                           box(title = "EXPORT ALL APP DATA", width = NULL, solidHeader = TRUE, status = "primary",
      #                               span(p("PRESS ZIP ENTIRE DATABASE TO CREATE UPDATE FILE"), style = "color:red"),
      #                           downloadButton("downloadzip","Zip entire Database"), #999
      #                           textOutput("zip_progress"),
      #                           ),
      #                           #p(""),
      #                           #p(""),
      #                           #p(""),
      #                          
      #                             box(title = "UPDATE APPLICATION", width = NULL, solidHeader = TRUE, status = "primary",
      #                                   span(p("UPLOAD APP update file: PRESS SUBMIT BUTTON AFTER UPLOAD IS COMPLETE"), style = "color:red"),
      #                                   fileInput("Update", "Upload app backup",
      #                                   multiple = TRUE,
      #                                   accept = c(".zip",".zip")),
      #                                   actionButton("updatesubmit","SUBMIT"),
      #                                   textOutput("updatetext"),
      #                             ),
      #                            ),
      #                           column(4,)
      #                  ),
      #     
      #                 tabPanel("PUSH UPDATE VIA GITHUB",
      #                          column(1,),
      #                          column(7,
      #                             box(title = "PUSH GITHUB REPO UPDATE", width = NULL, solidHeader = TRUE, status = "primary",   
      #                                # things go in box here 
      #                             
      #                                 actionButton("pullgithub","Update"),
      #                             
      #                              ),
      #                            ),
      #                          column(4,)
      #                 )
      #     
      #     
      #     
      #     
      #                 
      #      ) # end of tab panel
      #    ) # end of fluid row   
      # )# End of tab item (admin)
    ) # End of tab items
  ) # End of dashboard body
 ) # End of UI
)

server <- function(input, output, session) {
  
  
  options(shiny.maxRequestSize=10000*1024^2)
  # sourcing the files needed to run app
  source("employment_functions.R")
  
  # Variables that will be used in server application (Reactive variables)
  vals <- reactiveValues()
  observe({
    
  vals$actionvar <-FALSE
  vals$listpass <- NULL
  vals$choice <- NULL
  vals$refresh <- FALSE
  vals$currentuser <- NULL
  
  vals$id <- NULL
  vals$instance <- NULL
  vals$resumepth <- ""
  vals$upload = FALSE
  vals$resumeprimary <- ""
  vals$downloaded <- NULL
  vals$col <- input$theme_col
  vals$login <- FALSE
  vals$destruct <- FALSE
  
  vals$certificate <- ""
  vals$certificate_name <- ""
  
  vals$Ecertificate <- ""
  vals$Ecertificate_name <- ""
  
  vals$cert_edit <- ""
  })
  
  # code for cookies being used in the future_______________________________________
  
 


  
  
  
  
  
  
  
  #__________________________________________________________________________________
  
  output$downloadData1 <- downloadHandler(
    filename = function() {"Employmentdatabase.csv"},
    content = function(file) {
      write.csv(get_database(vals$currentuser), file)
    }
  )
  
  
  output$downloaddatabase_type <- downloadHandler(
    filename = function() {"Employmentdatabase.csv"},
    content = function(file) {
      write.csv(database_download_exporter(input$export_type,vals$currentuser), file)
    }
  )
  
  # this will download candidate information
  output$download_candidate <- downloadHandler(
    filename = function() {"user.docx"},
    content = function(file) {
      print(paste("row selected ",input$updatetable1_rows_selected, sep = ""))
      print(paste("current user ",vals$currentuser, sep = ""))
      print(secondary_df(input$updatetable1_rows_selected,input$last_changed,vals$currentuser,input$tabletype))
      file.copy(Create_candidate_report(secondary_df(input$updatetable1_rows_selected,input$last_changed,vals$currentuser,input$tabletype)), file)
    
    }
  
  )
  
  # this will download candidate information
  output$profile_backup <- downloadHandler(
    filename = function() {"backup.employment"},
    content = function(file) {
      file.copy("temp/backup.employment", file)
      vals$downloaded <- TRUE
      # file.copy("sample_file.docx", file)
    }
    
  )
  
  
  output$agreement <- downloadHandler(
    filename = function() {"employment_data_privacy_statment.pdf"},
    content = function(file) {
      file.copy("legal/documents/employment_data_privacy_statment.pdf", file)
      print("")
      # file.copy("sample_file.docx", file)
    }
    
  )
  

  
  
  
  output$downloadzip <- downloadHandler(
    
    
    
    filename <- function() {
      paste("App_backup", "zip", sep=".")
    },
    
    content <- function(file) {
      print("starting")
      output$zip_progress <- renderText({ 
        "zip file is being created"
      })
      
      file.copy(paste(getwd(),backup_database(),sep = "/"), file)
      
      print("complete")
     isolate( output$zip_progress <- renderText({ 
        "Complete, download is starting"
      }))
    },
    
    contentType = "application/zip"
  )
  
  
  #_________________Here we handle everything with add feature tables______________________________________________________________________
  
  
  output$tableeducation <- renderDT({
    datatable(read.csv("list/EDUCATION.csv"), editable = FALSE, selection = 'none')
  })
  
  output$tablejob_interest <- renderDT({
    datatable(read.csv("list/JOB_INTEREST.csv"), editable = FALSE, selection = 'none')
  })
  
  output$tablelocation <- renderDT({
    datatable(read.csv("list/LOCATIONS.csv"), editable = FALSE, selection = 'none')
  })
  
  output$tablelevel <- renderDT({
    datatable(read.csv("list/APPRENTICESHIP_TRADE_LEVEL.csv"), editable = FALSE, selection = 'none')
  })
  
  output$tableinterest <- renderDT({
    datatable(read.csv("list/PROJECT_INTEREST.csv"), editable = FALSE, selection = 'none')
  })
  
  
  
  observeEvent(input$save_education,{
    #write.csv(input$tableeducation, "list/EDUCATION.csv"  )
   
    
    (add_option("1",input$addeducation))
    
    
    output$tableeducation <- renderDT({
      datatable(read.csv("list/EDUCATION.csv"), editable = FALSE, selection = 'none')
    })
    
  })
   # Buttom for Job Interest
  observeEvent(input$save_job_interest,{
    #write.csv(input$tableeducation, "list/EDUCATION.csv"  )
    
    
    (add_option("2",input$addjob_interest))
    
    
    output$tablejob_interest <- renderDT({
      datatable(read.csv("list/JOB_INTEREST.csv"), editable = FALSE, selection = 'none')
    })
    
  })
  
  # Button for community
  observeEvent(input$save_location,{
    #write.csv(input$tableeducation, "list/EDUCATION.csv"  )
    
    
    (add_option("4",input$addlocation))
    
    
    output$tablelocation <- renderDT({
      datatable(read.csv("list/LOCATIONS.csv"), editable = FALSE, selection = 'none')
    })
    
    
    updateSelectInput(
      session,
      "community",
      label = "First nation Community",
      choices = read.csv("list/LOCATIONS.csv")
      
    )
    
    updateSelectInput(
      session,
      "ME_power_tool",
      label = "What tools do you have experience with?",
      choices = c("Hand tools","Air tools","Power tools")
      
    )
    
    
  })
  
  #button for trade level
  observeEvent(input$save_level,{
    #write.csv(input$tableeducation, "list/EDUCATION.csv"  )
    
    
    (add_option("3",input$addlevel))
    
    
    output$tablelevel <- renderDT({
      datatable(read.csv("list/APPRENTICESHIP_TRADE_LEVEL.csv"), editable = FALSE, selection = 'none')
    })
    
  })
  
  #button for project interest
  observeEvent(input$save_interest,{
    #write.csv(input$tableeducation, "list/EDUCATION.csv"  )
    
    
    (add_option("5",input$addinterest))
    
    
    output$tableinterest <- renderDT({
      datatable(read.csv("list/PROJECT_INTEREST.csv"), editable = FALSE, selection = 'none')
    })
    
  })
  
  
#_______________________________________________________________________________________________________
  
  observeEvent(input$button1, {
    
    # before sending function to verify entry, check that it is at least length 8 char user and password
    
    print(paste("login value : ",vals$login, sep = ""))
   
    
      
    if(vals$login == FALSE){
   
      print("login__________________________________________________")
        
        
    
    verification <- authpassword(tolower(input$username),input$password)
     
      
      
    if(verification == TRUE){
      
      vals$login <- TRUE
      
      #backup_database()
      if(input$cookies_browser == TRUE){
      cookies::set_cookie(
        cookie_name = "sso_cookie",
        cookie_value = cookie_login_add(tolower(input$username))
      )
      }
      
     
      
      vals$currentuser <- tolower(input$username)
      
      df <-get_user_access(tolower(input$username))
      
      #print(df)
      
    
      # Data table for update pages ______________________________________________________________________________
      
      output$updatetable1 <- renderDT({
        datatable(time_since(input$last_changed,vals$currentuser), editable = FALSE, selection = 'single',options=list(pageLength = 5, lengthMenu = c(5,10,15,20),autoWidth = TRUE,scrollX = TRUE,columnDefs = list(list(visible=FALSE, targets=c(3,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45)))))
      })
      
      output$updatetable2 <- renderDT({
        
        datatable(secondary_df(input$updatetable1_rows_selected,input$last_changed,vals$currentuser,input$tabletype), editable = TRUE, selection = 'none',options=list(pageLength = 5, lengthMenu = c(5,10,15,20),autoWidth = TRUE,scrollX = TRUE)) #3333
      })
      
      # Data table for visual
      output$visualtable1 <- renderDT({
        
        datatable(visualise_data_region(vals$currentuser), editable = FALSE, selection = 'none', options=list(scrollX = TRUE)) #3333
      })
      
    
   # ___________________________________________________________________________________________________________________
      # Home screen
      if(df$HOME[1] == TRUE){
    output$Home <- renderMenu({
      menuItem("Home", tabName = "Home", icon = icon("th"))
      
    })
    
  
      }
      
      # Candidate search 
    if(df$SEARCH[1] == TRUE){
    output$search <- renderMenu({
      menuItem("Candidate Search", tabName = "search", icon = icon("th"))
      
    })
    }
    
    
    # Upload offline Data
      if(df$DATAINPUT[1] == TRUE){
    output$datainput <- renderMenu({
      menuItem("Edit Data Options", tabName = "datainput", icon = icon("th"))
      
    })
      }
      
      
   # Data output
      if(df$DATAOUTPUT[1] == TRUE){
    output$dataoutput <- renderMenu({
      menuItem("Export copy of database", tabName = "dataoutput", icon = icon("th"))
      
    })
      }
      
    # Manual Data Entry
      if(df$MANUALINPUT[1] == TRUE){
    output$manualinput <- renderMenu({
      menuItem("Create Job Application", tabName = "manualinput", icon = icon("th"))
      
    })
      }
    
    # Profile
      if(df$PROFILE[1] == TRUE){
        
        showNotification(paste("you have ", get_time_since_length(vals$currentuser), " profiles which havent been updated in over a month!", sep = ""))
        text <- as.character(paste("you have ", get_time_since_length(vals$currentuser)," profiles which",sep = ""))
                # print(text)
        output$messageMenu <- renderMenu({
         
          dropdownMenu(type = "notifications", badgeStatus = "warning",
                       notificationItem(icon = icon("users"), status = "info",
                                        text = tags$b(text,
                                                      tags$br(),
                                                      "have not been updated in over a month!")
                                        
                       )
          )
                     
        })
        
        
    output$profile <- renderMenu({
      menuItem("Update Existing Data", tabName = "profile", icon = icon("th"))
      
    })
      }
      
    # Assets
      if(df$ASSET[1] == TRUE){
    output$asset <- renderMenu({
      menuItem("Download Templates", tabName = "asset", icon = icon("th"))
      
    })
      }
      
    # data visualizations
      if(df$VISUAL[1] == TRUE){
        
                   output$Data<-DT::renderDataTable({DT::datatable(get_database(vals$currentuser),selection = 'single',options = list(autoWidth = TRUE,scrollX = TRUE))})
        
                   output$visual <- renderMenu({
                        menuItem("Data Insights", tabName = "visual", icon = icon("th"))
      
                     })
      }
    
   
    
    
    output$selected_var <- renderText({ 
           paste("Log in success! Welcome ", df$FIRST,",",sep = "") 
      
      })
   print("should do action")
    
    insertTab(inputId = "login",
              tabPanel("LOGOUT",
                       p(""),
                       p(""),
                       textOutput("selected_var"),
                       actionButton("logoutbutton","logout"),
                       
                       p(""),
                       
                       #img(src= print(paste("image_",floor(runif(1, min = 0, max = 10)),".jpg",sep = "")),align = "below"),
                       img(src= 'image_9.jpg',align = "below"),
                       p("Image Credit: MB hydro") 
                       
              ),
    )
    
    updateTabsetPanel(
      session,
      inputId = "login",
      selected = "LOGOUT"
    )
    
    hideTab(inputId = "login", target = "LOGIN")
    
    
    
      
    }else{
      
          output$textfail <- renderText({ 
             "Authentication Failed! (username or password is incorrect)"
           })
    }
    
    
    
    
    #_________________________________________________________________________________________________________________

    
    
    
    print("running")
    
    
    
    
    } # End of login verification  
     
 })
  
  observeEvent(input$updatesubmit, {
      
      print("starting update")
    
      output$updatetext <- renderText({ 
         "starting update"
       })
    
     update_app(input$Update$datapath)
    
      output$updatetext <- renderText({ 
         "update complete!"
      })
    
    
  })
  
  
  observeEvent(input$adminlogin, {
    
    # before sending function to verify entry, check that it is at least length 8 char user and password
    
    
    verification <- authpasswordadmin(tolower(tolower(input$username)),input$password)
    
    
    
    if(verification == TRUE){
      
      # data visualizations
      output$visual <- renderMenu({

        
        
      }) 
        
        #insert admin tab here
      
      
        insertTab(inputId = "login",
                  tabPanel("Admin Portal", #1234
                           
                          # h2("Admin Portal"),
                           
                           fluidRow(
                             tabsetPanel(type = "tabs",
                                         
                                         tabPanel("Admin Portal",                
                                                  
                                                  # Give home screen access
                                                  box(title = "SELECT ACCESS YOU WISH TO GRANT USER", width = NULL, solidHeader = TRUE, status = "primary",
                                                      column(4,
                                                             
                                                             p(""),
                                                             p(""),
                                                             #p("Select access you wish to grant user"),
                                                             
                                                             radioButtons(
                                                               "accesshome",
                                                               "Give access to the HOME page? (instructions)",
                                                               choices = c("yes","NO"),
                                                               selected = NULL,
                                                               inline = TRUE,
                                                               width = NULL,
                                                               choiceNames = NULL,
                                                               choiceValues = NULL
                                                             ),
                                                             
                                                             # Give data input screen access
                                                             
                                                             radioButtons(
                                                               "accessdatainput",
                                                               "Give access to the edit data options page?",
                                                               choices = c("yes","NO"),
                                                               selected = NULL,
                                                               inline = TRUE,
                                                               width = NULL,
                                                               choiceNames = NULL,
                                                               choiceValues = NULL
                                                             ),
                                                             
                                                             # Give dataoutput screen access
                                                             
                                                             radioButtons(
                                                               "accessdataoutput",
                                                               "Give access to the export database page (no longer needed)?",
                                                               choices = c("yes","NO"),
                                                               selected = NULL,
                                                               inline = TRUE,
                                                               width = NULL,
                                                               choiceNames = NULL,
                                                               choiceValues = NULL
                                                             ),
                                                             
                                                             # Give manualinput screen access
                                                             
                                                             radioButtons(
                                                               "accessmanualinput",
                                                               "Give access to the job application page?",
                                                               choices = c("yes","NO"),
                                                               selected = NULL,
                                                               inline = TRUE,
                                                               width = NULL,
                                                               choiceNames = NULL,
                                                               choiceValues = NULL
                                                             ),
                                                             
                                                             # Give profile screen access
                                                             
                                                             radioButtons(
                                                               "accessprofile",
                                                               "Give access to the Data update page (Allows user to update existing job applications)?",
                                                               choices = c("yes","NO"),
                                                               selected = NULL,
                                                               inline = TRUE,
                                                               width = NULL,
                                                               choiceNames = NULL,
                                                               choiceValues = NULL
                                                             ),
                                                             
                                                             # Give visual screen access
                                                             
                                                             radioButtons(
                                                               "accessvisual",
                                                               "Give access to the data insights page (Nothing here yet)?",
                                                               choices = c("yes","NO"),
                                                               selected = NULL,
                                                               inline = TRUE,
                                                               width = NULL,
                                                               choiceNames = NULL,
                                                               choiceValues = NULL
                                                             )
                                                             
                                                      ),
                                                      
                                                      column(4,
                                                             
                                                             p(""),
                                                             p(""),
                                                             p(""),
                                                             
                                                             # Give search screen access
                                                             
                                                             radioButtons(
                                                               "accesssearch",
                                                               "Give access to the Candidate Search page (not done, intended to find candidate)?",
                                                               choices = c("yes","NO"),
                                                               selected = NULL,
                                                               inline = TRUE,
                                                               width = NULL,
                                                               choiceNames = NULL,
                                                               choiceValues = NULL
                                                             ),
                                                             
                                                             # Give asset download screen access
                                                             
                                                             radioButtons(
                                                               "accessasset",
                                                               "Give access to the asset download page (no longer needed, here for future)?",
                                                               choices = c("yes","NO"),
                                                               selected = NULL,
                                                               inline = TRUE,
                                                               width = NULL,
                                                               choiceNames = NULL,
                                                               choiceValues = NULL
                                                             ),
                                                             
                                                             selectInput(
                                                               "datalocation",
                                                               label = "Select Data region user can access (user will only be able to interact and view data from this region)",
                                                               choices = read.csv("list/LOCATIONS.csv"), # testname
                                                               multiple = TRUE
                                                             ),
                                                             
                                                             
                                                             
                                                             actionButton("createkey", "Create Temp account creation key"),
                                                             
                                                             textOutput("outputkey")
                                                             
                                                      ),
                                                      
                                                  ),
                                                  column(4,)
                                         ),
                                         
                                         
                                         tabPanel("Account Managment",
                                                  
                                                  p(""),
                                                  p(""),
                                                  DTOutput('tbl'),
                                                  actionButton("deleteuser", "Delete selected accounts"),
                                                  actionButton("makeadmin", "give selected accounts admin access"),
                                                  p(""),
                                                  textOutput("action"),
                                                  actionButton("verifyaction", "Confirm action"),
                                                  textOutput("actioncomplete")
                                                  
                                         ),
                                         
                                         
                                         
                                         tabPanel("Login History",
                                                  
                                                  p(""),
                                                  p(""),
                                                  column(1,),
                                                  column(8,
                                                         box(title = "Login History", width = NULL, solidHeader = TRUE, status = "primary",
                                                             datatable(read.csv("list/LOGIN_HISTORY.csv"),options= list(scrollX = TRUE))
                                                         ),
                                                  ),
                                                  column(3,)
                                                  
                                                  
                                                  
                                         ),
                                         
                                         
                                         
                                         tabPanel("Export / Update Application",
                                                  
                                                  column(1,),
                                                  
                                                  column(7,
                                                         
                                                         
                                                         box(title = "EXPORT ALL APP DATA", width = NULL, solidHeader = TRUE, status = "primary",
                                                             span(p("PRESS ZIP ENTIRE DATABASE TO CREATE UPDATE FILE"), style = "color:red"),
                                                             downloadButton("downloadzip","Zip entire Database"), #999
                                                             textOutput("zip_progress"),
                                                         ),
                                                         #p(""),
                                                         #p(""),
                                                         #p(""),
                                                         
                                                         box(title = "UPDATE APPLICATION", width = NULL, solidHeader = TRUE, status = "primary",
                                                             span(p("UPLOAD APP update file: PRESS SUBMIT BUTTON AFTER UPLOAD IS COMPLETE"), style = "color:red"),
                                                             fileInput("Update", "Upload app backup",
                                                                       multiple = FALSE,
                                                                       accept = c(".zip",".zip")),
                                                             actionButton("updatesubmit","SUBMIT"),
                                                             span(p("after pressing submit wait for update completion confirmation!"), style = "color:red"),
                                                             textOutput("updatetext"),
                                                             
                                                         ),
                                                  ),
                                                  column(4,)
                                         ),
                                         
                                         tabPanel("PUSH UPDATE VIA GITHUB",
                                                  column(1,),
                                                  column(7,
                                                         box(title = "PULL UPDATE VIA GITHUB REPO ", width = NULL, solidHeader = TRUE, status = "primary",   
                                                             # things go in box here 
                                                             span(p("This button should only be used by people specifically instructed. This action can be a potenetially destructive action. USE CAUTION: DATABASE BACKUP RECOMMENDED! "), style = "color:red"),
                                                             span(p("If the app crashes this is because the github repository has been set to private. contact kwog@hydro.mb.ca for a solution"), style = "color:red"),
                                                             actionButton("pullgithub","Update"),
                                                             
                                                             textOutput("githubcomplete")
                                                             
                                                         ),
                                                  ),
                                                  column(4,)
                                         ),
                                         
                                         tabPanel("LOGOUT OF ADMIN PORTAL",
                                                  
                                                  
                                                  
                                                  column(4,),
                                                  column(4,
                                                         box(title = "", width = NULL, solidHeader = TRUE, status = "primary",
                                                         actionButton("logout","Logout of Admin Portal"),       
                                                          ),
                                                          ),
                                                  column(4,),
                                                  
                                                  )
                                         
                                         
                                         
                                         
                                         
                             ) # end of tab panel
                           ) # end of fluid row  
                           
                  ))
        
        output$tbl = renderDT(
          getusers(),selection = 'single'
        )
        
        
        # hide unwanted tabs from login / settings panel
        hideTab(inputId = "login", target = "LOGIN")
        hideTab(inputId = "login", target = "SETTINGS")
        
        
        
      
      
      output$selected_var <- renderText({ 
       # "Admin Panel unlocked"
        ""
      })
      
      
      
    }else{
      
      output$textfail <- renderText({ 
        "Authentication failed, please select login if you do not have admin access"
      })
    }
      
      
      
    })  
    
  
  # Action button to log out of admin portal
  
  observeEvent(input$logout,{

    showTab(inputId = "login", target = "SETTINGS", session = getDefaultReactiveDomain())
    showTab(inputId = "login", target = "LOGIN", session = getDefaultReactiveDomain())
    removeTab(inputId = "login", target = "Admin Portal", session = getDefaultReactiveDomain())
    
    
  })
      
  # Generate update table from button
  
  observeEvent(input$updatetable,{
 
    
    output$updatetable2 <- renderDT({
      
     
      datatable(secondary_df(input$updatetable1_rows_selected,input$last_changed,vals$currentuser,input$tabletype), editable = TRUE, selection = 'none') #3333
    })
    
  })
      
  
  
  observeEvent(input$create_account,{
    
    verificationkey <- verify_temp_key(input$password)
    
    if(verificationkey == TRUE){
    
    
    insertTab(inputId = "login",
              tabPanel("Create Account", #1234
                
                       h2("Create account"),
                       p("Username and password must be greater than 8 characters", style = "font-size:18px"),
                       textInput("crfirst", "First Name:", value = ""),
                       textInput("crlast", "Last Name",value = ""),
                       textInput("crusername", "Username: ", value = ""),
                       passwordInput("crpassword", "Password: ", value = ""),
                       passwordInput("crpasswordverify", "verify Password: ", value = ""),
                       textOutput("create_account_message"),
                       actionButton("createaccount", "Create Account")
                       
                       
                       
              ))
    
    hideTab(inputId = "login", target = "LOGIN")
    hideTab(inputId = "login", target = "SETTINGS")
    
    
    
    
    output$selected_var <- renderText({ 
      "Please select Create Account tab to proceed"
    })
    }else{
      output$selected_var<- renderText({ 
        "Enter Valid Temp key in the password, Contact kwog@hydro.mb.ca for access"
      })
    }
  })
  
 
  
  observeEvent(input$createaccount, {
    
    
    lengthusername <-  nchar(input$crusername)
    lengthpassword <-  nchar(input$crpassword)
    lengthenough <- FALSE
    
    if(lengthusername >= 8 && lengthpassword >= 8 ){
       lengthenough = TRUE 
    }
    
    
   
   if(input$crpassword == input$crpasswordverify){
   
      if(lengthenough == TRUE){
     
          verify <- isolate(createpassword(input$password,tolower(input$crusername),input$crpassword,input$crfirst,input$crlast)) 
     
           if(verify == TRUE){
     
     
     
               output$create_account_message <- renderText({ 
                   "Success!"
               })
     
     #9876
               showTab(inputId = "login", target = "SETTINGS")
               showTab(inputId = "login", target = "LOGIN")
               hideTab(inputId = "login", target = "Create Account")
     
               # here we are going to remove tempkey from the keylist
                input$password
                remove_temp_key(input$password)
    
       }else{
     
           output$create_account_message <- renderText({ 
            "Username Already in use! Please try again!"
           })
     
      }
    }else{
        output$create_account_message <- renderText({ 
         "Username and password muse be greater than 8 characters"
     })
     
     
     
   }
     
   }else{
     output$create_account_message <- renderText({ 
       "Password's must match"
     })
     
   }
    
   
   
  })
    
  # Generate key button and taking all input preferences into token
  observeEvent(input$createkey, {
    # Calling function to generate the key with account access preferences
    textoutput <- create_temp_key(input$accesshome,input$accessdatainput,input$accessdataoutput,input$accessmanualinput,input$accessprofile,input$accessvisual,input$accesssearch,input$accessasset,input$datalocation)
    
    output$outputkey <- renderText({ 
      textoutput
    })
    
  })
  
  # This function prepares a statment before deleting users from the program
  observeEvent(input$deleteuser,{
    
    vals$listpass <- input$tbl_rows_selected
    vals$actionvar <- TRUE
    vals$choice <- FALSE
    # Let the user know what is going to happen before confirmation
    output$action <- renderText({ 
      remove_user(vals$listpass,FALSE)
    }) 

    
    
    
  })
  
  # this statment makes a statment for making people a admin of the program
  observeEvent(input$makeadmin, {
    
    vals$listpass <- input$tbl_rows_selected
    vals$actionvar <- TRUE
    vals$choice <- TRUE
    output$action <- renderText({ 
      upgrade_user(vals$listpass,FALSE)
    })
    
    
   
    
  })
  
  # This is the action button for making a database entry (New entry)
  
  observeEvent(input$submit_applicaiton,{
    #987
    print(paste("agree:",input$agree,sep = " "))
    
    if(input$agree == TRUE){
      
    
    
    isolate(print(vals$resumeprimary))
    print(input$ME_female)
    isolate(submit_entry(input$lastname,input$firstname,input$middleinital,input$email,input$phone,input$community,input$location,input$current_address,input$home_address,input$education,input$apprenticeship,input$job_interest,input$ME_female,input$project_interest,input$ME_previous,input$MHexperiance,"NULL",input$ME_notes,input$ME_availability,certificate_handler(vals$certificate,vals$certificate_name),vals$resumeprimary,input$ME_disability,input$ME_Disability_Details,input$ME_class_5,input$ME_confined,input$ME_truck_driver_detail,input$ME_operate_seasonal_vehicle,input$ME_cpr,input$ME_travel,input$ME_travel_airplane_boat,input$ME_safety,input$ME_construction,input$ME_outdoor_hot,input$ME_outdoor_cold,input$ME_height,input$ME_heavy_lifting,input$ME_road_construction,input$ME_heavy_equiptment,input$ME_concrete,input$ME_power_tool,input$ME_detail,as.character(input$available),input$ME_pressure,input$ME_independent,input$ME_forestry,vals$currentuser))
    output$submission_confirmation <- renderText({  
      
     # isolate(paste(input$firstname, " ", input$lastname, "'s application has been ", (submit_entry(input$firstname,input$lastname,input$middleinital,input$email,input$phone,input$community,input$location,input$current_address,input$home_address,input$education,input$apprenticeship,input$job_interest,input$ME_engagement,input$project_interest,input$ME_previous,input$MHexperiance,input$ME_workshop,input$ME_notes,input$ME_availability,vals$resumeprimary,input$ME_disability,input$ME_Disability_Details,input$ME_class_5,input$ME_truck_driver,input$ME_truck_driver_detail,input$ME_operate_seasonal_vehicle,input$ME_cpr,input$ME_travel,input$ME_travel_airplane_boat,input$ME_safety,input$ME_construction,input$ME_outdoor_hot,input$ME_outdoor_cold,input$ME_height,input$ME_heavy_lifting,input$ME_road_construction,input$ME_heavy_equiptment,input$ME_concrete,input$ME_power_tool,input$ME_detail,input$ME_problem_solving,input$ME_pressure,input$ME_independent,input$ME_forestry,vals$currentuser)), sep = ""))
    
      
      #91
     
  
    })
    
    hideTab(inputId = "manualentry", target = "APPLICATION")
    
    
    
    
    
    
    isolate(vals$resumeprimary <- "")
    isolate(vals$certificate <- "")
    isolate(vals$certificate_name <- "")
    
    # reset first name
    updateTextInput(session,"firstname", "First Name: ", value = "")
    # reset last name
    updateTextInput(session,"lastname", "Last Name: ", value = "")
    # Middle name update
    updateTextInput(session,"middleinital", "Middle Inital: ", value = "")
    # reset email
    updateTextInput(session, "email", "Email: ", value = "")
    # reset phone
    updateTextInput(session,"phone", "Phone: (xxx) xxx-xxx ", value = "")
    #location
    updateTextInput(session,"location", "City / Town of Residence: ", value = "")
    #current Address
    updateTextInput(session,"current_address", "Current Address: (Address + postal code) ", value = "")
    #home address
    updateTextInput(session,"home_address", "Home Address: (address + postal code) ", value = "")
    #disability
    updateTextInput(session,"ME_Disability_Details", "If you have a disability please provide details", value = "")
    #notes
    updateTextInput(session,"ME_notes", "Notes:", value = "")
    #### END OF RESETING TEXT INPUTS
    
    
    # Here we will update select inputs
    
    updateCheckboxInput(
      session = getDefaultReactiveDomain(),
      "agree",
      label = "I Accept the Agreement",
      value = FALSE
    )
    
    
    # community selector
    updateSelectInput(
      session,
      "community",
      label = "First nation Community",
      choices = read.csv("list/LOCATIONS.csv")
      
    )
    
    
    updateSelectInput(
      session,
      "education",
      label = "Education",
      choices = read.csv("list/EDUCATION.csv")
    )
    
    updateSelectInput(
      session,
      "apprenticeship",
      label = "Apprenticeship level",
      choices = read.csv("list/APPRENTICESHIP_TRADE_LEVEL.csv")
    )
    
    updateSelectInput(
      session,
      "job_interest",
      label = "Job interests",
      choices = read.csv("list/JOB_INTEREST.csv")
    )
    
    updateSelectInput(
      session,
      "project_interest",
      label = "project interests",
      choices = read.csv("list/PROJECT_INTEREST.csv")
    )
    
    
    ##### End of select input updates
    
    
    # Here we will update radio button
    updateRadioButtons(
      session,
      "ME_female",
      "Are you female?",
      choices = c("yes","NO"),
      selected = "NO",
      inline = TRUE,
      choiceNames = NULL,
      choiceValues = NULL
      
    )
    
    updateRadioButtons(
      session,
      "ME_previous",
      "Do you have previous job experiance with Manitoba Hydro?",
      choices = c("yes","NO"),
      selected = "NO",
      inline = TRUE,
      choiceNames = NULL,
      choiceValues = NULL
    )
    
    # no longer exists
    
   # updateRadioButtons(
    #  session,
     # "ME_workshop",
      #"Are you willing to join a job workshop?",
    #  choices = c("yes","Unsure","NO"),
     # selected = "NO",
      #inline = TRUE,
    #  choiceNames = NULL,
     # choiceValues = NULL
  #  )
    
    updateRadioButtons(
      session,
      "ME_availability",
      "Are you currently available to work?",
      choices = c("yes","Soon","NO"),
      selected = "NO",
      inline = TRUE,
      choiceNames = NULL,
      choiceValues = NULL
    )
    
    updateRadioButtons(
      session,
      "ME_disability",
      "Do you require accommodation for a disability?",
      choices = c("yes","NO"),
      selected = "NO",
      inline = TRUE,
      choiceNames = NULL,
      choiceValues = NULL
    )
    
    
    # These variables now come from the second column
    
    updateRadioButtons(
      session,
      "ME_confined",
      "Are you willing to work in a confined space?",
      choices = c("yes","NO"),
      selected = "NO",
      inline = TRUE,
      choiceNames = NULL,
      choiceValues = NULL
    )
    
    updateRadioButtons(
      session,
      "ME_operate_seasonal_vehicle",
      "Are you able to Operate Seasonal a Vehicle (1/2 ton, van)",
      choices = c("yes","Unsure","NO"),
      selected = "NO",
      inline = TRUE,
      choiceNames = NULL,
      choiceValues = NULL
    )
    
    updateSelectInput(
      session,
      "ME_operate_seasonal_vehicle",
      label = "What seasonal vehicles are you able to operate?",
      choices = c("snowmobile","Boat","ATV"), # testname
    )
    
    updateRadioButtons(
      session,
      "ME_cpr",
      " Are you first aid / CPR certified?",
      choices = c("yes","Previously","NO"),
      selected = "NO",
      inline = TRUE,
      choiceNames = NULL,
      choiceValues = NULL
    )
    
    updateRadioButtons(
      session,
      "ME_travel",
      " Are you willing to travel for work?",
      choices = c("yes","Potentially","NO"),
      selected = "NO",
      inline = TRUE,
      choiceNames = NULL,
      choiceValues = NULL
    )
    
    updateRadioButtons(
      session,
      "ME_travel_airplane_boat",
      " Are you able to travel by airplane or boat?",
      choices = c("None","Airplane only", "Boat only", "Airplane and boat"),
      selected = "None",
      inline = TRUE,
      choiceNames = NULL,
      choiceValues = NULL
    )
    
    updateRadioButtons(
      session,
      "ME_safety",
      " Do you have any previous experience with workplace safety?",
      choices = c("Lots","Some","NO"),
      selected = "NO",
      inline = TRUE,
      choiceNames = NULL,
      choiceValues = NULL
    )
    
    updateRadioButtons(
      session,
      "ME_construction",
      "Do you have construction experience?",
      choices = c("4+ Years","3 Years","2+ Years","2 Years","NO"),
      selected = "NO",
      inline = FALSE,
      choiceNames = NULL,
      choiceValues = NULL
    )
    
    updateRadioButtons(
      session,
      "ME_outdoor_hot",
      "Are you able to work in a hot outdoor environment?",
      choices = c("For extended periods of time","Less then full time","NO"),
      selected = "NO",
      inline = FALSE,
      choiceNames = NULL,
      choiceValues = NULL
    )
    
    updateRadioButtons(
      session,
      "ME_outdoor_cold",
      "Are you able to work in a cold outdoor environment?",
      choices = c("For extended periods of time","Less then full time","NO"),
      selected = "NO",
      inline = FALSE,
      choiceNames = NULL,
      choiceValues = NULL
    )
    
    updateRadioButtons(
      session,
      "ME_height",
      "Are you comfortable working at heights?",
      choices = c("yes","Somewhat comfortable","NO"),
      selected = "NO",
      inline = TRUE,
      choiceNames = NULL,
      choiceValues = NULL
    )
    
    updateRadioButtons(
      session,
      "ME_heavy_lifting",
      "Are you able to lift up to 50lbs?",
      choices = c("yes","NO"),
      selected = "NO",
      inline = TRUE,
      choiceNames = NULL,
      choiceValues = NULL
    )
    
    updateRadioButtons(
      session,
      "ME_road_construction",
      "Do you have road construction experience?",
      choices = c("4+ Years","3 Years","2+ Years","2 Years","NO"),
      selected = "NO",
      inline = FALSE,
      choiceNames = NULL,
      choiceValues = NULL
    )
    
    updateRadioButtons(
      session,
      "ME_heavy_equiptment",
      "Are you a heavy equipment operator?",
      choices = c("Through work experience","Certificate program","NO"),
      selected = "NO",
      inline = FALSE,
      choiceNames = NULL,
      choiceValues = NULL
    )
    
    updateRadioButtons(
      session,
      "ME_concrete",
      "Do you have experience working with concrete?",
      choices = c("yes","Willing to learn","NO"),
      selected = "NO",
      inline = TRUE,
      choiceNames = NULL,
      choiceValues = NULL
    )
    
    updateRadioButtons(
      session,
      "ME_power_tool",
      "What tools do you have experience with?",
      choices = c("yes","Willing to learn","NO"),
      selected = "NO",
      inline = TRUE,
      choiceNames = NULL,
      choiceValues = NULL
    )
    
    updateRadioButtons(
      session,
      "ME_detail",
      "Do you have a strong attention to detail?",
      choices = c("Detail Oriented","picks up on some details","picks up on few details","NO"),
      selected = "NO",
      inline = FALSE,
      choiceNames = NULL,
      choiceValues = NULL
    )
    
    updateTextAreaInput(session, "ME_detail", label = "list tools you have experience with", value = "")
   
    updateTextAreaInput(session, "ME_notes", label = "NOTES:", value = "")
    
    updateTextAreaInput(session, "ME_Disability_Details", label = "If you have a disability please provide details", value = "")
    
  

    
    updateRadioButtons(
      session,
      "ME_pressure",
      "Are you comfortable working in a high stress environment?",
      choices = c("yes","occasionally","NO"),
      selected = "NO",
      inline = TRUE,
      choiceNames = NULL,
      choiceValues = NULL
    )
    
    updateRadioButtons(
      session,
      "ME_independent",
      "Do you prefer working with others?",
      choices = c("yes","NO","Occasionally"),
      selected = "NO",
      inline = FALSE,
      choiceNames = NULL,
      choiceValues = NULL
    )
    
    updateRadioButtons(
      session,
      "ME_forestry",
      "Do you have previous forestry experience?",
      choices = c("yes","Willing to learn","NO"),
      selected = "NO",
      inline = TRUE,
      choiceNames = NULL,
      choiceValues = NULL
    )
    
    updateRadioButtons(
      session,
      "ME_truck_driver_detail",
      "Do you have your air brakes endorsement?",
      choices = c("yes","Working Toward","Willing to complete","NO"),
      selected = "NO",
      inline = FALSE,
      choiceNames = NULL,
      choiceValues = NULL
    )
    
    updateRadioButtons(
      session,
      "ME_class_5",
      "Which drivers license do you have? (choose highest achevement)",
      choices = c("None","Class 5","Class 4","class 3","class 2","class 1"),
      selected = "None",
      inline = TRUE,
      choiceNames = NULL,
      choiceValues = NULL
    )
    
    
    
    ###### End of updating radio button
    
    
    #81
    
    insertTab(inputId = "manualentry",
              tabPanel("APPLICATION SUCCESS",
                       column(8,
                       box(title = "your job application has been successfully been submitted!", width = NULL, solidHeader = TRUE, status = "primary",
                           
                           downloadButton("profile_backup","DOWNLOAD your job APPLICATION BACKUP"),
                           span(p("You can download the job application backup if you wish"), style = "color:red"),
                           
                           p(""),
                           actionButton("entry_next","Next"),
                           textOutput("nexttext")
                       ),
                       
                       
                           
                           
                       ),
                       column(4,)
              )
    )
    
    updateTabsetPanel(
      session,
      inputId = "manualentry",
      selected = "APPLICATION SUCCESS"
    )
                       
    output$submission_confirmation <- renderText({  
      
      
      ""
    })
    
    
                   
    }else{
      
      output$submission_confirmation <- renderText({  
        
        
        "Accept the agreement to submit your application!"
      })
      
      
    }
   
    
    
  })
  
  
  observeEvent(input$pullgithub,{
    print(github_update())
    
    
    output$githubcomplete <- renderText({ 
      "Complete!"
    })
    
    
  })
  
  
  
  # this event calls the function of making final change to either deletion or admin account access
  observeEvent(input$verifyaction,{
   
    if(vals$actionvar == TRUE){
     
      if(vals$choice == FALSE){
        
        output$action <- renderText({ 
          remove_user(vals$listpass,TRUE)
        })
      }
         
      if(vals$choice == TRUE){
        
        output$action <- renderText({ 
          upgrade_user(vals$listpass,TRUE)
        })
      }
      
      vals$actionvar <- FALSE
      
    }else{
      
      output$action <- renderText({ 
        "Create action before confiming action"
      })
      
    }
    
    output$tbl = renderDT(
      getusers(),selection = 'single'
    )
    
  })
  
  
  
  # output users in data table. (Admin managment page ) - will be legacy and updated
  
  output$tbl = renderDT(
    getusers(), selection = 'single'
  )
  
  
  observeEvent(input$updateedits,{
    
    
   if(input$tabletype == "Edit Table"){
     if(is.null(input$updatetable1_rows_selected) == FALSE){
       
       
       df <-  secondary_df(input$updatetable1_rows_selected,input$last_changed,vals$currentuser,input$tabletype)
         vals$cert_edit <- df$CERTIFICATE[1]
         vals$id <-df$ID[1]
         vals$instance <-df$INSTANCE[1]
         vals$resumepth <- df$RESUME_PATH[1]
         print(paste("seasonal vehicle ",df$OPERATE_SEASONAL_VEHICLE[1], sep = ""))
      # job_interest <- df$JOB_INTERESTS[1]
      # job_interest <- eval(parse(text=paste('list(',job_interest,')')))
       
  insertTab(inputId = "tab",
              tabPanel("EDIT",
                       
                       box(title = "Edit Profile", width = NULL, solidHeader = TRUE, status = "primary",
                           fluidRow(
                             column(4,
                                    
                                    # First Name (B)
                                    textInput("Efirstname", "First Name: ", value = df$LAST_NAME[1]),
                                    
                                    # Last Name (A)
                                    textInput("Elastname", "Last Name: ", value = df$FIRST_NAME[1]),
                                    
                                    # Middle Inital (C)
                                    textInput("Emiddleinital", "Middle Inital: ", value = df$MIDDLE_INITIAL[1]),
                                    
                                    #Email input (D)
                                    textInput("Eemail", "Email: ", value = df$EMAIL[1]),
                                    
                                    #Phone (E)
                                    textInput("Ephone", "Phone: (xxx) xxx-xxx ", value = df$PHONE[1]),
                                    
                                    # First Nation Community (F)
                                    
                                    selectInput(
                                      "Ecommunity",
                                      label = "First nation Community",
                                      selected = df$FIRST_NATION_COMMUNITY[1],
                                      choices = read.csv("list/LOCATIONS.csv"), # testname
                                      
                                      multiple = FALSE
                                    ),
                                    
                                    
                                    # City / Town of residence (G)
                                    textInput("Elocation", "City / Town of Residence: ", value = df$CITY_TOWN_RESIDENCE[1]),
                                    
                                    
                                    # current address
                                    textInput("Ecurrent_address", "Current Address: (address + postal code)", value = df$CURRENT_ADDRESS[1]),
                                    
                                    # home address
                                    textInput("Ehome_address", "Home Address: (address + postal code)", value = df$HOME_ADDRESS[1]),
                                    
                                    # highest education (H) List variable will go here
                                    
                                    selectInput(
                                      "Eeducation",
                                      label = "Education",
                                      selected = df$HIGHEST_EDUCATION[1],
                                      choices = read.csv("list/EDUCATION.csv"), # Blah education
                                      multiple = FALSE
                                    ),
                                    
                                 
                                    # Apprenticeship Trade / Levels Completed
                                    
                                    selectInput(
                                      "Eapprenticeship",
                                      label = "Apprenticeship level",
                                      selected = df$APPRENTICESHIP_TRADE_LEVEL[1],
                                      choices = read.csv("list/APPRENTICESHIP_TRADE_LEVEL.csv"), # blah
                                      multiple = FALSE
                                    ),
                                    
                                    
                                    
                                    
                                    #Trade / job interest 
                                    
                                    selectInput(
                                      "Ejob_interest",
                                      label = "Job interests",
                                      selected = make_list(df$JOB_INTERESTS[1])[[1]],
                                      choices = read.csv("list/JOB_INTEREST.csv"), # blah
                                      multiple = TRUE
                                    ),
                                    
                                    # engagement event attend
                                    radioButtons(
                                      "EME_female",
                                      "Are you female?",
                                      choices = c("yes","NO"),
                                      selected = df$ENGAGEMENT_EVENT_ATTENDED[1],
                                      inline = TRUE,
                                      width = NULL,
                                      choiceNames = NULL,
                                      choiceValues = NULL
                                    ), 
                                    
                                   
                                    
                                    
                                    
                                    # project interests
                                    
                                    selectInput(
                                      "Eproject_interest",
                                      label = "project interests",
                                      selected = make_list(df$PROJECT_INTERESTS[1])[[1]],
                                      choices = read.csv("list/PROJECT_INTEREST.csv"), #blah
                                      multiple = TRUE
                                    ),
                                    
                                    # previous MH job experience (yes / No)
                                    
                                    radioButtons(
                                      "EME_previous",
                                      "Do you have previous job experiance with Manitoba Hydro?",
                                      choices = c("yes","NO"),
                                      selected = df$PREVIOUS_MH_PROJECT_EXPERIENCE[1],
                                      inline = TRUE,
                                      width = NULL,
                                      choiceNames = NULL,
                                      choiceValues = NULL
                                    ), 
                                    
                                    
                                    # If yes, details
                                    
                                    textInput("EME_previous_details", "if yes, provide details", value = df$PREVIOUS_PROJECT_EXPERIENCE_DETAILS[1]),
                                    
                                    
                                    
                                    # willing to join job workshop?
                                    
                                #    radioButtons(
                                #      "EME_workshop",
                                #      "Are you willing to join a job workshop?",
                                #      choices = c("yes","Unsure","NO"),
                                #      selected = df$JOB_WORKSHOP[1],
                                #      inline = TRUE,
                                #      width = NULL,
                                #      choiceNames = NULL,
                                #      choiceValues = NULL
                                #    ), 
                                    
                                    # Notes
                                   # p("Notes"),
                                   # tags$textarea(id="EME_notes", rows=5, df$NOTES[1]),
                                
                                textAreaInput(
                                  "EME_notes",
                                  "Notes:",
                                  value = df$NOTES[1],
                                  width = NULL,
                                  height = NULL,
                                  cols = NULL,
                                  rows = NULL,
                                  placeholder = NULL,
                                  resize = "vertical"
                                ),
                                    
                                    # work availability
                                    
                                    radioButtons(
                                      "EME_availability",
                                      "Are you currently available to work?",
                                      choices = c("yes","Soon","NO"),
                                      selected = df$WORK_AVAILABILITY[1],
                                      inline = TRUE,
                                      width = NULL,
                                      choiceNames = NULL,
                                      choiceValues = NULL
                                    ), 
                                    
                                    dateInput("EME_available","When are you available to start working?", value = df$AVAILABLE_TO_WORK_DATE[1],format = "yyyy-mm-dd"),
                                    
                                   
                                    
                                    
                                    # Disability Yes / No    
                                    radioButtons(
                                      "EME_disability",
                                      "",
                                      choices = c("yes","NO"),
                                      selected = df$DISABILITY[1],
                                      inline = TRUE,
                                      width = NULL,
                                      choiceNames = NULL,
                                      choiceValues = NULL
                                    ), 
                                    
                                    # Disability Details
                                    
                                  #  textInput("EME_Disability_Details", "If you have a disability please provide details", value = df$DISABILITY_DETAILS[1]),
                                    
                                   textAreaInput(
                                      "EME_Disability_Details",
                                      "If you have a disability please provide details",
                                      value = df$DISABILITY_DETAILS[1],
                                      width = NULL,
                                      height = NULL,
                                      cols = NULL,
                                      rows = NULL,
                                      placeholder = NULL,
                                      resize = "vertical"
                                    ),     
                                    
                                    
                                    # Input: Select a file ----
                                 fileInput("Eresume", "Upload Resume",
                                              multiple = FALSE,
                                              accept = c(".PDF",".docx")),
                                 
                                 fileInput("Ecertificates", "Upload New Education Certificates (Multiple accepted)",
                                           multiple = TRUE,
                                           accept = c(".PDF",".docx"))
                                    
                                    
                                    
                             ),
                             column(4,
                                    
                                    
                                    
                                    # Lets put the skill questions here      
                                    
                                    
                                    
                                    
                                    # Truck Driver license
                                    
                                    radioButtons(
                                      "EME_class_5",
                                      "Which drivers license do you have? (choose highest achevement)",
                                      choices = c("None","Class 5","Class 4","class 3","class 2","class 1"),
                                      selected = df$CLASS_5[1],
                                      inline = TRUE,
                                      width = NULL,
                                      choiceNames = NULL,
                                      choiceValues = NULL
                                    ),
                                    
                                    
                                    radioButtons(
                                      "EME_air_brake",
                                      "Do you have your air brake license?",
                                      choices = c("yes","Working Toward","Willing to complete","NO"),
                                      selected = df$AIR_BRAKE[1],
                                      inline = FALSE,
                                      width = NULL,
                                      choiceNames = NULL,
                                      choiceValues = NULL
                                    ),
                                    
                                    radioButtons(
                                      "EME_confined",
                                      "Are you willing to work in a confined space?",
                                      choices = c("yes","Working Toward","NO"),
                                      selected = df$TRUCK_DRIVER[1],
                                      inline = TRUE,
                                      width = NULL,
                                      choiceNames = NULL,
                                      choiceValues = NULL
                                    ),
                                    
                                    
                                  
                                    
                                    # Operate seasonal vehicle?
                                    
                                    
                                    
                                    
                                    selectInput(
                                      "EME_operate_seasonal_vehicle",
                                      label = "What seasonal vehicles are you able to operate?",
                                      choices = c("snowmobile","Boat","ATV"), # testname
                                      selected = make_list(df$OPERATE_SEASONAL_VEHICLE[1])[[1]],
                                      multiple = TRUE
                                    ),
                                    
                                    
                                    
                                    # CPR
                                    
                                    radioButtons(
                                      "EME_cpr",
                                      " Are you first aid / CPR certified?",
                                      choices = c("yes","Previously","NO"),
                                      selected = df$CPR[1],
                                      inline = TRUE,
                                      width = NULL,
                                      choiceNames = NULL,
                                      choiceValues = NULL
                                    ),
                                    
                                    # Travel
                                    
                                    radioButtons(
                                      "EME_travel",
                                      " Are you willing to travel for work?",
                                      choices = c("yes","Potentially","NO"),
                                      selected = df$TRAVEL[1],
                                      inline = TRUE,
                                      width = NULL,
                                      choiceNames = NULL,
                                      choiceValues = NULL
                                    ),
                                    
                                    # Travel airplane boat
                                    
                                    radioButtons(
                                      "EME_travel_airplane_boat",
                                      " Are you able to travel by airplane or boat?",
                                      choices = c("None","Airplane only", "Boat only", "Airplane and boat"),
                                      selected = df$TRAVEL_AIRPLANE_BOAT[1],
                                      inline = TRUE,
                                      width = NULL,
                                      choiceNames = NULL,
                                      choiceValues = NULL
                                    ),
                                    
                                    # safety
                                    
                                    radioButtons(
                                      "EME_safety",
                                      " Do you have any previous experience with workplace safety?",
                                      choices = c("Lots","Some","NO"),
                                      selected = df$SAFETY[1],
                                      inline = TRUE,
                                      width = NULL,
                                      choiceNames = NULL,
                                      choiceValues = NULL
                                    ),
                                    
                                    # construction
                                    
                                    radioButtons(
                                      "EME_construction",
                                      "Do you have construction experience?",
                                      choices = c("4+ Years","3 Years","2+ Years","2 Years","NO"),
                                      selected = df$CONSTRUCTION[1],
                                      inline = FALSE,
                                      width = NULL,
                                      choiceNames = NULL,
                                      choiceValues = NULL
                                    ),
                                    
                                    # road construction
                                    
                                    radioButtons(
                                      "EME_road_construction",
                                      "Do you have road construction experience?",
                                      choices = c("4+ Years","3 Years","2+ Years","2 Years","NO"),
                                      selected = df$ROAD_CONSTRUCTION[1],
                                      inline = FALSE,
                                      width = NULL,
                                      choiceNames = NULL,
                                      choiceValues = NULL
                                    ),
                                    
                                    radioButtons(
                                      "EME_forestry",
                                      "Do you have previous forestry experience?",
                                      choices = c("yes","Willing to learn","NO"),
                                      selected = df$FORESTRY[1],
                                      inline = TRUE,
                                      width = NULL,
                                      choiceNames = NULL,
                                      choiceValues = NULL
                                    ),
                                    
                                    # outdoor hot
                                    
                                    radioButtons(
                                      "EME_outdoor_hot",
                                      "Are you able to work in a hot outdoor environment?",
                                      choices = c("For extended periods of time","Less then full time","NO"),
                                      selected = df$OUTDOOR_HOT[1],
                                      inline = FALSE,
                                      width = NULL,
                                      choiceNames = NULL,
                                      choiceValues = NULL
                                    ),
                                    
                                    # outdoor cold
                                    
                                    radioButtons(
                                      "EME_outdoor_cold",
                                      "Are you able to work in a cold outdoor environment?",
                                      choices = c("For extended periods of time","Less then full time","NO"),
                                      selected = df$OUTDOOR_COLD[1],
                                      inline = FALSE,
                                      width = NULL,
                                      choiceNames = NULL,
                                      choiceValues = NULL
                                    ),
                                    
                                    # height
                                    
                                    radioButtons(
                                      "EME_height",
                                      "Are you comfortable working at heights?",
                                      choices = c("yes","Somewhat comfortable","NO"),
                                      selected = df$HEIGHTS[1],
                                      inline = TRUE,
                                      width = NULL,
                                      choiceNames = NULL,
                                      choiceValues = NULL
                                    ),
                                    
                                    # heavy lifting
                                    
                                    radioButtons(
                                      "EME_heavy_lifting",
                                      "Are you able to lift up to 50lbs?",
                                      choices = c("yes","NO"),
                                      selected = df$HEAVY_LIFTING[1],
                                      inline = TRUE,
                                      width = NULL,
                                      choiceNames = NULL,
                                      choiceValues = NULL
                                    ),
                                    
                                    
                                    
                                    # heavy equipment
                                    
                                    radioButtons(
                                      "EME_heavy_equiptment",
                                      "Are you a heavy equipment operator?",
                                      choices = c("Through work experience","Certificate program","NO"),
                                      selected = df$HEAVY_EQUIPTMENT[1],
                                      inline = FALSE,
                                      width = NULL,
                                      choiceNames = NULL,
                                      choiceValues = NULL
                                    ),
                                    
                                    # concrete
                                    
                                    radioButtons(
                                      "EME_concrete",
                                      "Do you have experience working with concrete?",
                                      choices = c("yes","Willing to learn","NO"),
                                      selected = df$CONCRETE[1],
                                      inline = TRUE,
                                      width = NULL,
                                      choiceNames = NULL,
                                      choiceValues = NULL
                                    ),
                                    
                                    # power tools
                                    
                                    selectInput(
                                      "EME_power_tool",
                                      label = "What tools do you have experience with?",
                                      choices = c("Hand tools","Air tools","Power tools"), # testname
                                      selected = make_list(df$POWER_TOOL[1])[[1]],
                                      multiple = TRUE
                                    ),
                                    
                                    
                                    # attention to detail
                                    
                                    
                                    
                                    textAreaInput(
                                      "EME_detail",
                                      "List tools you have experience with.",
                                      value = df$DETAIL[1],
                                      width = NULL,
                                      height = NULL,
                                      cols = NULL,
                                      rows = NULL,
                                      placeholder = NULL,
                                      resize = "vertical"
                                    ),
                                    
                                  
                                    
                                    # problem solving
                                    
                                  #  radioButtons(
                                  #    "EME_problem_solving",
                                   #   "Do you have strong problem solving skills?",
                                  #    choices = c("Creative solutions to most problems","Ability to identify some unique solutions","Tough time solving daily problems","NO"),
                                  #    selected = df$PROBLEM_SOLVING[1],
                                  #    inline = FALSE,
                                 #     width = NULL,
                                  #    choiceNames = NULL,
                                 #     choiceValues = NULL
                                 #   ),
                                    
                                    # pressure
                                    
                                    radioButtons(
                                      "EME_pressure",
                                      "Are you comfortable working in a high stress environment?",
                                      choices = c("yes","occasionally","NO"),
                                      selected = df$PRESSURE[1],
                                      inline = TRUE,
                                      width = NULL,
                                      choiceNames = NULL,
                                      choiceValues = NULL
                                    ),
                                    
                                    # independent
                                    
                                    radioButtons(
                                      "EME_independent",
                                      "Do you prefer working with others?",
                                      choices = c("yes","NO","Occasionally"),
                                      selected = df$INDEPENDENT[1],
                                      inline = FALSE,
                                      width = NULL,
                                      choiceNames = NULL,
                                      choiceValues = NULL
                                    )
                                    
                                    # independent
                                    
                                    
                                    
                                    
                             ), # end of second column
                             
                             column(4,
                                    
                                    actionButton("submit_profile_edits", "Submit Edits"),   
                                    textOutput("Esubmission_confirmation")
                                    
                             ) # end of third column
                             
                           )
                           
                           
                       ) # End of box       
                       
                       
                 
                       
                       
                       
                             
                       
              ),
              target = "View Data"
    )
  

    
  hideTab(inputId = "tab", target = "View Data")
     }else{
       output$edit_data <- renderText({ 
         "You must select a row in the first table"
         
       })
     }
   }else{
    
     output$edit_data <- renderText({ 
       "To Edit you must choose Edit Table in the tool panel"
       
     })
     
   }
  
   
  })
  
  
  observeEvent(input$submit_profile_edits,{
    
    
    print(paste("value is being uploaded as: ",vals$upload))
    submit_entry_edit(vals$upload,vals$resumepth,vals$id,vals$instance,input$Efirstname,input$Elastname,input$Emiddleinital,input$Eemail,input$Ephone,input$Ecommunity,input$Elocation,input$Ecurrent_address,input$Ehome_address,input$Eeducation,input$Eapprenticeship,input$Ejob_interest,input$EME_female,input$Eproject_interest,input$EME_previous,input$EME_previous_details,"NULL",input$EME_notes,input$EME_availability,certificate_handler_edit(vals$Ecertificate,vals$Ecertificate_name,vals$cert_edit),input$Eresume$datapath,input$EME_disability,input$EME_Disability_Details,input$EME_class_5,input$EME_confined,input$EME_air_brake,input$EME_operate_seasonal_vehicle,input$EME_cpr,input$EME_travel,input$EME_travel_airplane_boat,input$EME_safety,input$EME_construction,input$EME_outdoor_hot,input$EME_outdoor_cold,input$EME_height,input$EME_heavy_lifting,input$EME_road_construction,input$EME_heavy_equiptment,input$EME_concrete,input$EME_power_tool,input$EME_detail,as.character(input$EME_available),input$EME_pressure,input$EME_independent,input$EME_forestry,vals$currentuser)
    #
    isolate(vals$resumepth <- "")
    isolate(vals$Ecertificate <- "")
    isolate(vals$Ecertificate_name <- "")
    isolate(vals$upload <- FALSE)
    vals$cert_edit <- ""
    
    
    output$updatetable1 <- renderDT({
      datatable(time_since(input$last_changed,vals$currentuser), editable = FALSE, selection = 'single',options=list(pageLength = 5, lengthMenu = c(5,10,15,20),autoWidth = TRUE,scrollX = TRUE,columnDefs = list(list(visible=FALSE, targets=c(3,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45)))))
    })
    
    showTab(inputId = "tab", target = "View Data", select = TRUE, session = getDefaultReactiveDomain())
    removeTab(inputId = "tab", target = "EDIT", session = getDefaultReactiveDomain())
    
    output$profile <- renderMenu({
      menuItem("Update Existing Data", tabName = "profile", icon = icon("th"))
     
    })
  })
  
  
  observeEvent(input$Eresume,{
    
    vals$upload <- TRUE
  })
 
  observeEvent(input$resume,{
    isolate(vals$resumeprimary <- input$resume$datapath)
    print(vals$resumeprimary)
  })
  
  observeEvent(input$certificates,{ # get the current certificate path
    
    isolate(vals$certificate <- input$certificates$datapath)
    isolate(vals$certificate_name <- input$certificates$name)

    
  })
  
  
  observeEvent(input$Ecertificates,{ # get the current certificate path
    
    isolate(vals$Ecertificate <- input$Ecertificates$datapath)
    isolate(vals$Ecertificate_name <- input$Ecertificates$name)
    
    
     
    
  })
  
  observeEvent(input$entry_next,{
    
    
      # Here we have a success on download completion
      showTab(inputId = "manualentry", target = "APPLICATION")
      
      removeTab(inputId = "manualentry", target = "APPLICATION SUCCESS", session = getDefaultReactiveDomain())
      
      
      vals$downloaded = NULL
    
    
    
  })
  
  
  
  # Automatic entry on cookie verification
  
  
  
  
  
isolate(observe( 
  
  
 if(is.null(get_cookie("sso_cookie")) == FALSE ){ 
   
   isolate(if(vals$login == FALSE && vals$destruct == FALSE){
     
     
   
  isolate( vals$currentuser <- tolower(cookie_login_verify(get_cookie("sso_cookie"))))
   
   df <-get_user_access(tolower(cookie_login_verify(get_cookie("sso_cookie"))))
   
    verification <- TRUE
  
  if(verification == TRUE){
    
    #backup_database()
    
    vals$destruct <- TRUE
    vals$login <- TRUE
    
    
    
    #print(df)
    
    
    # Data table for update pages ______________________________________________________________________________
    
    output$updatetable1 <- renderDT({
      datatable(time_since(input$last_changed,vals$currentuser), editable = FALSE, selection = 'single',options=list(pageLength = 5, lengthMenu = c(5,10,15,20),autoWidth = TRUE,scrollX = TRUE,columnDefs = list(list(visible=FALSE, targets=c(3,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45)))))
    })
    
    output$updatetable2 <- renderDT({
      
      datatable(secondary_df(input$updatetable1_rows_selected,input$last_changed,vals$currentuser,input$tabletype), editable = TRUE, selection = 'none',options=list(pageLength = 5, lengthMenu = c(5,10,15,20),autoWidth = TRUE,scrollX = TRUE)) #3333
    })
    
    # Data table for visual
    output$visualtable1 <- renderDT({
      
      datatable(visualise_data_region(vals$currentuser), editable = FALSE, selection = 'none', options=list(scrollX = TRUE)) #3333
    })
    
    
    # ___________________________________________________________________________________________________________________
    # Home screen
    if(df$HOME[1] == TRUE){
      output$Home <- renderMenu({
        menuItem("Home", tabName = "Home", icon = icon("th"))
        
      })
      
     
      
    }
    
    # Candidate search 
    if(df$SEARCH[1] == TRUE){
      output$search <- renderMenu({
        menuItem("Candidate Search", tabName = "search", icon = icon("th"))
        
      })
    }
    
    
    # Upload offline Data
    if(df$DATAINPUT[1] == TRUE){
      output$datainput <- renderMenu({
        menuItem("Edit Data Options", tabName = "datainput", icon = icon("th"))
        
      })
    }
    
    
    # Data output
    if(df$DATAOUTPUT[1] == TRUE){
      output$dataoutput <- renderMenu({
        menuItem("Export copy of database", tabName = "dataoutput", icon = icon("th"))
        
      })
    }
    
    # Manual Data Entry
    if(df$MANUALINPUT[1] == TRUE){
      output$manualinput <- renderMenu({
        menuItem("Create Job Application", tabName = "manualinput", icon = icon("th"))
        
      })
      
      
      
    }
    
    # Profile
    if(df$PROFILE[1] == TRUE){
      
      showNotification(paste("you have ", get_time_since_length(vals$currentuser), " profiles which havent been updated in over a month!", sep = ""))
      text <- as.character(paste("you have ", get_time_since_length(vals$currentuser)," profiles which",sep = ""))
      # print(text)
      output$messageMenu <- renderMenu({
        
        dropdownMenu(type = "notifications", badgeStatus = "warning",
                     notificationItem(icon = icon("users"), status = "info",
                                      text = tags$b(text,
                                                    tags$br(),
                                                    "have not been updated in over a month!")
                                      
             )
        )
        
      })
      
      
      output$profile <- renderMenu({
        menuItem("Update Existing Data", tabName = "profile", icon = icon("th"))
        
      })
    }
    
    # Assets
    if(df$ASSET[1] == TRUE){
      output$asset <- renderMenu({
        menuItem("Download Templates", tabName = "asset", icon = icon("th"))
        
      })
    }
    
    # data visualizations
    if(df$VISUAL[1] == TRUE){
      
      output$Data<-DT::renderDataTable({DT::datatable(get_database(vals$currentuser),selection = 'single',options = list(autoWidth = TRUE,scrollX = TRUE))})
      
      output$visual <- renderMenu({
        menuItem("Data insights", tabName = "visual", icon = icon("th"))
        
        
      })
    }
    
  
    
    
    output$selected_var <- renderText({ 
      paste("Log in success! Welcome ", df$FIRST,",",sep = "") 
      
    })
    
 print("should do action")
    
    insertTab(inputId = "login",
              tabPanel("LOGOUT",
                       p(""),
                       p(""),
                       textOutput("selected_var"),
                       actionButton("logoutbutton","logout"),  
                       
                       p(""),
                       
                      # img(src= print(paste("image_",floor(runif(1, min = 0, max = 10)),".jpg",sep = "")),align = "below"),
                       img(src= "image_9.jpg",align = "below", height = "90%", width = "90%"),
                       p("Image Credit: MB hydro") 
                       
                       
              ),
    )
    
    hideTab(inputId = "login", target = "LOGIN")
    
    updateTabsetPanel(
      session,
      inputId = "login",
      selected = "LOGOUT"
    )
    
    
    
    
    
    
       
  }else{
    
    output$textfail <- renderText({ 
      "Authentication Failed! (username or password is incorrect)"
    })
  }
  
    
    
   

   })
 } 
)
)

# Remove cookies 

    observeEvent(input$remove_cookies,{
         remove_cookie("sso_cookie", session = shiny::getDefaultReactiveDomain())
  
        output$text_cookie <- renderText({ 
            "Cookie Has been Removed, Website will no longer automatically sign in. To prevent this in the future uncheck the remember browser box when logging in!"
        })
  
    })
    
    
    observeEvent(input$logoutbutton,{
    
    
          # Home
      
    
           output$Home <- renderMenu({
              shinyjs::hide(selector = "a[data-value='Home']" )
        
            })
      
          # Candidate search 
  
            output$search <- renderMenu({
              
              shinyjs::hide(selector = "a[data-value='search']" )
              
            })
    
          
          
          # Upload offline Data
          
            output$datainput <- renderMenu({
              shinyjs::hide(selector = "a[data-value='datainput']" )
              
            })
          
          
          
          # Data output
      
            output$dataoutput <- renderMenu({
              shinyjs::hide(selector = "a[data-value='dataoutput']" )
              
            })
          
          
          # Manual Data Entry
    
            output$manualinput <- renderMenu({
              shinyjs::hide(selector = "a[data-value='manualinput']" )
              
            })
          
          
          # Profile
  
            output$profile <- renderMenu({
              shinyjs::hide(selector = "a[data-value='profile']" )
              
            })
          
            
          # Assets
          
            output$asset <- renderMenu({
              shinyjs::hide(selector = "a[data-value='asset']" )
              
            })
          
          
          # data visualizations
          
            output$visual <- renderMenu({
              shinyjs::hide(selector = "a[data-value='visual']" )
              
              
            })

          
          # Remove cookie so it will not log back in
            remove_cookie("sso_cookie", session = shiny::getDefaultReactiveDomain())
          
            showTab(inputId = "login", target = "LOGIN", session = getDefaultReactiveDomain())
           
            removeTab(inputId = "login", target = "LOGOUT", session = getDefaultReactiveDomain())
            
            updateTabsetPanel(
              session,
              inputId = "login",
              selected = "LOGIN"
            )
            
            vals$login <- FALSE
            print(paste("login val is: ",vals$login,sep = ""))
            
    })
    
    
    
    
      # Tabs which will be used for anything search related _________________________________ insert and removing tabs
    
    
    
    # Search by job
          observeEvent(input$s_b_job,{
               print("s_b_job")
      
                hideTab(inputId = "search_tb", target = "browse")
      
                insertTab(inputId = "search_tb",
                          tabPanel("Search",
                                   
                                   
                          actionButton("back", "Return") ,
                          
                          
                          
                          fluidRow(
                            
                            column(4,
                                   
                                   box(title = "Search Tools", width = NULL, solidHeader = TRUE, status = "primary",  
                                       
                                       selectInput("profile_to_use", "Choose profile to rank by:",as.list(read.csv("job_profiles/profile_list.csv")$Profiles) , multiple = FALSE), 
                                       
                                       
                                       
                                       
                                       
                                   ),
                                   
                                   
                                   box(title = "Reports", width = NULL, solidHeader = TRUE, status = "primary",  
                                       
                                       downloadButton("download_report_excel", "Export Results to Excel"),
                                       downloadButton("download_report_docx", "Export selected candidate information to docx")
                                       
                                       
                                       
                                       
                                       
                                   )
                                   
                                 
                                   
                                     
                             ),column(8,
                                     
                                    
                                      box(title = "Select Candidate From table to run report", width = NULL, solidHeader = TRUE, status = "primary",  
                                          
                                          DTOutput("search_profile"),
                                          span(p("SELECT ROW to view candidate information"), style = "color:red"),
                                        
                            
                                      ),
                                      
                                      box(title = "Report Details", width = NULL, solidHeader = TRUE, status = "primary",  
                                          
                                          
                                      )
                                     
                                     
                             )
                          
                          )
                          
                          
                          ) # end of tabpanel
                ) # end of insert Tab
      
                
                updateTabsetPanel(session, "search_tb",
                                  selected = "Search"
                )
      
         })
          
          
          
          observeEvent(input$s_b_job_profile,{
            
            hideTab(inputId = "search_tb", target = "browse")
            
            insertTab(inputId = "search_tb",
                      tabPanel("Search",
                               
                               
                               actionButton("back", "Return") ,
                               
                               
                               
                               fluidRow(
                                 column(1,),
                                 column(10, 
                                
                                        
                                          box(title = "Welcome to the job profile creation tab", width = NULL, solidHeader = TRUE, status = "primary",  
                                            
                                          p("Job profiles serve the purpose of having the computer do the tough work in finding sutable applicants.  "),
                                            
                                          p("The search algorithm takes 2 major factors into account: "),
                                          p("First allows you to rank how much you value specific skills."),
                                          p("And declare absolute values which the job can not be completed without"),
                                          
                                          p("For example a person might have great skills but if they want to be a truck driver without a license it is impossible. In this case a drivers license would be an absolute skill which makes all other skills useless without having the credentials.")
                                          
                                          
                                        
                                 
                                 
                               ),
                              
                               box(title = "Welcome to the job profile creation tab", width = NULL, solidHeader = TRUE, status = "primary",
                                   
                                  # position title 
                                   #6969
                                  
                                  
                                  
                                  
                                  
                                  column(6,
                                        
                                         
                                         textInput("pos_name", "Name of position ", value = ""),
                                         
                                         
                                         p("Value Based Skills"),
                                         
                                         
                                         sliderInput("value_mh_exp", "Previous MH experience:",
                                                     min = 0, max = 1,
                                                     value = 0),
                                         
                                         sliderInput("value_driver_license", "Driving license:",
                                                     min = 0, max = 1,
                                                     value = 0),
                                         
                                         sliderInput("value_air_brakes", "Air Brakes License:",
                                                     min = 0, max = 1,
                                                     value = 0),
                                         
                                         sliderInput("value_confined_space", "Comfortable working in confined space:",
                                                     min = 0, max = 1,
                                                     value = 0),
                                         
                                         sliderInput("value_boat", "Ability to operate a boat:",
                                                     min = 0, max = 1,
                                                     value = 0),
                                         
                                         sliderInput("value_atv", "Ability to operate an atv",
                                                     min = 0, max = 1,
                                                     value = 0),
                                         
                                         sliderInput("value_snowmobile", "Ability to operate a snowmobile:",
                                                     min = 0, max = 1,
                                                     value = 0),

                                  
                                         sliderInput("value_First_aid", "Has current or previous first aid certification:",
                                                      min = 0, max = 1,
                                                      value = 0),
                                  
                                         sliderInput("value_travel", "Willing to travel for work:",
                                                     min = 0, max = 1,
                                                      value = 0),
                                  
                                         sliderInput("value_tb_airplane", "willing to travel by airplane:",
                                                      min = 0, max = 1,
                                                     value = 0),
                                  
                                         sliderInput("value_tb_boat", "Willing to travel by boat:",
                                                     min = 0, max = 1,
                                                     value = 0),
                                  
                                         sliderInput("value_workplace_safety", "Has previous experience with workplace safety:",
                                                      min = 0, max = 1,
                                                      value = 0),
                                  
                                         sliderInput("value_workplace_construction", "Has previous construction experience",
                                                      min = 0, max = .25,
                                                      value = 0),
                                         
                                         sliderInput("value_hot", "Candidate is comfortable working in a hot outdoor environment",
                                                     min = 0, max = .5,
                                                     value = 0),
                                         
                                         sliderInput("value_cold", "Candidate is comfortable working in a cold outdoor environment",
                                                     min = 0, max = .5,
                                                     value = 0),
                                      
                                         sliderInput("value_height", "Candidate is comfortable working from heights",
                                                     min = 0, max = .5,
                                                     value = 0),
                                         
                                         sliderInput("value_heavy_equip", "Candidate is a heavy equipment opperator",
                                                     min = 0, max = .5,
                                                     value = 0),
                                         
                                         sliderInput("value_heavy_lift", "Candidate is comfortable lifting objects over 50 pounds",
                                                     min = 0, max = .5,
                                                     value = 0),
                                         
                                         sliderInput("value_forestry", "Candidate has experience doing forestry work",
                                                     min = 0, max = .5,
                                                     value = 0),
                                         
                                         sliderInput("value_stress", "Candidate indicates they are comfortable in high stress environments",
                                                     min = 0, max = .5,
                                                     value = 0),
                                         
                                          
                                           
                                  ),
                                  
                                  column(6,
                                         
                                         p("Absolute Skills"),
                                         
                                         checkboxInput("absolute_mh_exp", "Previous MH experience:", value = FALSE),
                                         checkboxInput("absolute_driver_license", "Drivers License:", value = FALSE),
                                         checkboxInput("absolute_air_brakes", "Air Brakes License:", value = FALSE),
                                         checkboxInput("absolute_confined_space", "Comfortable working in confined space:", value = FALSE),
                                         checkboxInput("absolute_boat", "Ability to operate a boat:", value = FALSE),
                                         checkboxInput("absolute_atv", "Ability to operate an atv", value = FALSE),
                                         checkboxInput("absolute_snowmobile", "Ability to operate a snowmobile:", value = FALSE),
                                         checkboxInput("absolute_First_aid", "Has current or previous first aid certification:", value = FALSE),
                                         checkboxInput("absolute_travel", "Willing to travel for work:", value = FALSE),
                                         checkboxInput("absolute_tb_airplane", "willing to travel by airplane:", value = FALSE),
                                         checkboxInput("absolute_tb_boat", "Willing to travel by boat:", value = FALSE),
                                         checkboxInput("absolute_workplace_safety", "Has previous experience with workplace safety:", value = FALSE),
                                         checkboxInput("absolute_workplace_construction", "Has previous construction experience", value = FALSE),
                                         checkboxInput("absolute_hot", "Candidate is comfortable working in a hot outdoor environment", value = FALSE),
                                         checkboxInput("absolute_cold", "Candidate is comfortable working in a cold outdoor environment", value = FALSE),
                                         checkboxInput("absolute_height", "Candidate is comfortable working from heights", value = FALSE),
                                         checkboxInput("absolute_heavy_equip", "Candidate is a heavy equipment opperator", value = FALSE),
                                         checkboxInput("absolute_heavy_lift", "Candidate is comfortable lifting objects over 50 pounds", value = FALSE),
                                         checkboxInput("absolute_forestry", "Candidate has experience doing forestry work", value = FALSE),
                                         checkboxInput("absolute_stress", "Candidate indicates they are comfortable in high stress environments", value = FALSE),
                                         
                                         
                                         actionButton("submit_profile", "Submit Profile") 
                                         
                                         
                                         )
                                  
                                
                                  
                                   
                                   
                                   
                                   
                               )
                               
                               ),column(1,)
                               
                               )
                      ) # end of tabpanel
            ) # end of insert Tab
            
            
            updateTabsetPanel(session, "search_tb",
                              selected = "Search"
            )
            
            
            
          })
          
          
          
          
          
    
    # Search by skill
          
          observeEvent(input$s_b_skill,{
               print("s_b_skill")
      
                hideTab(inputId = "search_tb", target = "browse")
            
                insertTab(inputId = "search_tb",
                          tabPanel("Search",
                                   
                                   
                                   
                          actionButton("back", "Return")         
                          ) # end of tabpanel
                ) # end of insert Tab
      
                
                updateTabsetPanel(session, "search_tb",
                                  selected = "Search"
                )
      
         })
          
          
          
      # Search by name
          
          observeEvent(input$s_b_name,{
            print("s_b_name")
          
              hideTab(inputId = "search_tb", target = "browse")
              
              insertTab(inputId = "search_tb",
                        tabPanel("Search",
                                 
                                 
                                 
                         actionButton("back", "Return"),     
                         
                         
                         fluidRow(
                           
                           column(4,
                                  
                                  box(title = "Search Tools", width = NULL, solidHeader = TRUE, status = "primary",  
                                      
                                      span(p("You can search by either first name, last name, or both. If you only know the first name, leave last name blank. Same goes for last name."), style = "color:blue"),
                                      
                                      textInput("SB_FIRST", "First Name:", value = "", width = NULL, placeholder = NULL) ,  
                                      textInput("SB_LAST", "Last Name:", value = "", width = NULL, placeholder = NULL)   
                                      
                                      
                                      
                                      
                                  ),
                                  
                                  
                                  box(title = "Reports", width = NULL, solidHeader = TRUE, status = "primary",  
                                      
                                      downloadButton("download_report_excel", "Export Results to Excel"),
                                      downloadButton("download_report_docx", "Export selected candidate information to docx")
                                      
                                      
                                      
                                      
                                      
                                  )
                                  
                                  
                                  
                                  
                           ),column(8,
                                    
                                    
                                    box(title = "Select Candidate From table to run report", width = NULL, solidHeader = TRUE, status = "primary",  
                                        
                                        DTOutput("search_table_name"),
                                        span(p("SELECT ROW to view candidate information"), style = "color:red"),
                                        
                                        
                                    ),
                                    
                                    box(title = "Report Details", width = NULL, solidHeader = TRUE, status = "primary",  
                                        
                                        
                                    )
                                    
                                    
                           )
                           
                         )
                         
                        ) # end of tabpanel
              ) # end of insert Tab
            
              
              updateTabsetPanel(session, "search_tb",
                                selected = "Search"
              )
            
          })
          
          
          
          # event observer to revert back to innital page
          
          
          observeEvent(input$back,{
                 
             showTab("seatch_tb","browse")  
            
            showTab(inputId = "search_tb", target = "browse", select = TRUE, session = getDefaultReactiveDomain())
            removeTab(inputId = "search_tb", target = "Search", session = getDefaultReactiveDomain())
             
          })
          

          observeEvent(input$available,{
            
            print(input$available)
          })
          
          
          
          
          #______________________________Search tables rendered here__________________________________________________
          
          # Search by name tables___________________________________________
          
          
          output$search_table_name <- renderDT({
           # datatable(time_since(input$last_changed,vals$currentuser), editable = FALSE, selection = 'single',options=list(pageLength = 5, lengthMenu = c(5,10,15,20),autoWidth = TRUE,scrollX = TRUE,columnDefs = list(list(visible=FALSE, targets=c(3,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45)))))
            datatable(search_by_name(vals$currentuser, input$SB_FIRST,input$SB_LAST), editable = FALSE, selection = 'single',options=list(pageLength = 5, lengthMenu = c(5,10,15,20),autoWidth = TRUE,scrollX = TRUE,columnDefs = list(list(visible=FALSE, targets=c(3,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45)))))
          })
          
          output$search_profile <- renderDT({
            # datatable(time_since(input$last_changed,vals$currentuser), editable = FALSE, selection = 'single',options=list(pageLength = 5, lengthMenu = c(5,10,15,20),autoWidth = TRUE,scrollX = TRUE,columnDefs = list(list(visible=FALSE, targets=c(3,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45)))))
            datatable(rank_by_job(vals$currentuser,input$profile_to_use), editable = FALSE, selection = 'single',options=list(pageLength = 5, lengthMenu = c(5,10,15,20),autoWidth = TRUE,scrollX = TRUE,columnDefs = list(list(visible=FALSE, targets=c(3,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45)))))
          })
          
          
          
          
          
          observeEvent(input$search_table_name_rows_selected,{
            
            print(secondary_df(input$search_table_name_rows_selected,"Show all profiles",vals$currentuser,"Edit Table"))
            
          })
          
          observeEvent(input$submit_profile,{
          
         data <- list( "value_mh_exp" = input$value_mh_exp,
                       "value_driver_license" = input$value_driver_license,
          "air_brakes" = input$value_air_brakes,
          "confined_space" = input$value_confined_space,
          "boat" = input$value_boat,
          "atv" = input$value_atv,
          "snowmobile" = input$value_snowmobile,
          "first_aid" = input$value_First_aid,
          "travel" = input$value_travel,
          "airplane" = input$value_tb_airplane,
          "tb_boat" = input$value_tb_boat,
          "workplace_safety" = input$value_workplace_safety,
          "workplace_construction" = input$value_workplace_construction,
          "value_hot" =  input$value_hot,
          "value_cold" = input$value_cold,
          "height" = input$value_height,
          "heavy_equip" = input$value_heavy_equip,
          "heavy_lift" = input$value_heavy_lift,
          "forestry" = input$value_forestry,
          "stress" = input$value_stress)
         
         data2 <- list( "absolute_mh_exp" = input$absolute_mh_exp,
                        "absolute_driver_license" = input$absolute_driver_license,
                       "absolute_air_brakes" = input$absolute_air_brakes,
                       "absolute_confined_space" = input$absolute_confined_space,
                       "absolute_boat" = input$absolute_boat,
                       "absolute_atv" = input$absolute_atv,
                       "absolute_snowmobile" = input$absolute_snowmobile,
                       "absolute_First_aid" = input$absolute_First_aid,
                       "absolute_travel" = input$absolute_travel,
                       "absolute_tb_airplane" = input$absolute_tb_airplane,
                       "absolute_tb_boat" = input$absolute_tb_boat,
                       "absolute_workplace_safety" = input$absolute_workplace_safety,
                       "absolute_workplace_construction" = input$absolute_workplace_construction,
                       "absolute_hot" = input$absolute_hot,
                       "absolute_cold" = input$absolute_cold,
                       "absolute_height" = input$absolute_height,
                       "absolute_heavy_equip" = input$absolute_heavy_equip,
                       "absolute_heavy_lift" = input$absolute_heavy_lift,
                       "absolute_forestry" = input$absolute_forestry,
                       "absolute_stress" = input$absolute_stress)
         
          create_job_profile(data,data2,input$pos_name)
            
            
          })
}



shinyApp(ui, server)

