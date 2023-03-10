library(digest)
library(officer)
library(dplyr)
library(bcrypt)
#library(utils)
library(zip)


#library(archive)
#install_github( "ajdamico/lodown" , dependencies = TRUE )
#https://archive.r-lib.org/

#createpassword("testuser","testuser")
#authpassword("testawdawduwadwdser","teswadawdwadawdtuser")

authpassword <- function(username, password){
  verification <- FALSE

  username <- tolower(username)
  #password <- digest(password , "md5", serialize = FALSE) - Changed
  #password <- hashps(password)
  
  passwords_users<- read.csv("codes/Codes.csv")
  login_history <- read.csv("list/LOGIN_HISTORY.csv")

  length <- (nrow(passwords_users))

  for(i in 1:length){
  
    if(passwords_users$Username[i] == username) {
     if(checkpw(password,passwords_users$Password[i]) == TRUE){
        verification = TRUE
      }
    } 
  }


# Add username to log

if(verification == TRUE){
  
  login_history[nrow(login_history) + 1,] <- c(username,as.character(Sys.Date()),as.character(format(Sys.time(), "%H:%M:%S")))
  write.csv(login_history,"list/LOGIN_HISTORY.csv", row.names = FALSE)
}


return(verification)
}



#createpassword("31-18-38-68","testuser","asoijdoaisjd","Kyle","Wog")

createpassword <- function(key,username,password,first,last){
verification <- FALSE  
  
lengthusername <-  nchar(username)
lengthpassword <-  nchar(password)

  username <- tolower(username)
  
  #password <- digest(password , "md5", serialize = FALSE) - changed
  password <- hashpw(password)
  

  passwords_users<- read.csv("codes/Codes.csv")
  
  # Check for duplicate username password
  
  length <- (nrow(passwords_users))
  
  for(i in 1:length){
    if(passwords_users$Username[i] == username) {
      verification = TRUE
    } 
  }
  
  if(verification == TRUE){
    
    return(FALSE)
    
  }else{
    
    
  
  
  
  
  passwords_users[nrow(passwords_users) + 1,] <- c(username,password,FALSE)
  
  write.csv(passwords_users,"codes/Codes.csv",row.names = FALSE)
  
  
  # transfer profile to new account________________________________________________________________________________________
  
  
  access <- read.csv("Account_profile/accesstemplate.csv")
  
  indexuser <- get_user_profile(key)
  
  temp <- read.csv("codes/temp.csv")
 # print(indexuser)
  # Getting variables from the temp account
  home <- temp$HOME[indexuser]
  datainput <- temp$DATAINPUT[indexuser]
  dataoutput <- temp$DATAOUTPUT[indexuser]
  manualinput <- temp$MANUALINPUT[indexuser]
  profile <- temp$PROFILE[indexuser]
  visual <- temp$VISUAL[indexuser]
  search <- temp$SEARCH[indexuser]
  asset <- temp$ASSET[indexuser]
  dataaccess <- temp$DATAACCESS[indexuser]
  
  
  
  
  access[nrow(access) + 1,] <- c(first,last,home,datainput,dataoutput,manualinput,profile,visual,search,asset,dataaccess)
  
  # Transfer profile to new account____________________________________________________________________________________
  
  name <- paste("Account_profile/", digest(username, "md5", serialize = FALSE),".hydro", sep = "")
  write.csv(access, name, row.names = FALSE)
  
  return(TRUE)
  }
} # good


getusers <- function(){
  
  passwords_users<- read.csv("codes/Codes.csv")
  return(passwords_users)
  
}

#print(get_user_access("test_user2"))

get_user_access <- function(username){
  username <- tolower(username)
  

  name <- paste("Account_profile/", digest(username, "md5", serialize = FALSE),".hydro", sep = "")
  
  df <- read.csv(name)
  
  return(df)
  
}

authpasswordadmin <- function(username, password){
  verification <- FALSE
  
  username <- tolower(username)
  
  #password <- digest(password , "md5", serialize = FALSE)
  
  passwords_users<- read.csv("codes/Codes2.csv")
  
  
  length <- (nrow(passwords_users))
  
  for(i in 1:length){
    
    if(passwords_users$Username[i] == username) {
      if(checkpw(password,passwords_users$Password[i]) == TRUE){
      verification = TRUE
      }
    } 
  }
  
  
  
  
  return(verification)
} # Good


createpasswordadmin <- function(username, password){
  verification <- FALSE  
  
  
  lengthusername <-  nchar(username)
  lengthpassword <-  nchar(password)
  
  username <- tolower(username)
  
  #password <- digest(password , "md5", serialize = FALSE) - changed
  password <- hashpw(password)
  
  
  passwords_users<- read.csv("codes/Codes2.csv")
  
  # Check for duplicate username password
  
  length <- (nrow(passwords_users))
  
  for(i in 1:length){
    if(passwords_users$Username[i] == username) {
      verification = TRUE
    } 
  }
  
  if(verification == TRUE){
    
    return(FALSE)
    
  }else{
    
    
    
    
    
    
    passwords_users[nrow(passwords_users) + 1,] <- c(username,password)
    
    write.csv(passwords_users,"codes/Codes.csv",row.names = FALSE)
    return(TRUE)
  }
} # Good

#

create_temp_key <- function(home,datainput,dataoutput,manualinput,profile,visual,search,asset,dataaccess){
  
  # Prepare data to be saved to temp file
  
  # prepare data home
    if(home == "yes"){
       home = TRUE
     }else{
       home = FALSE
     }
  
  # prepare data data input
  if(datainput == "yes"){
    datainput = TRUE
  }else{
    datainput = FALSE
  }
  
  # prepare data data output
  if(dataoutput == "yes"){
    dataoutput = TRUE
  }else{
    dataoutput = FALSE
  }
  
  # prepare data manual input
  if(manualinput == "yes"){
    manualinput = TRUE
  }else{
    manualinput = FALSE
  }
  
  # prepare data profile
  if(profile == "yes"){
    profile = TRUE
  }else{
    profile = FALSE
  }
  
  # prepare data visual
  if(visual == "yes"){
    visual = TRUE
  }else{
    visual = FALSE
  }
  
  # prepare data search
  if(search == "yes"){
    search = TRUE
  }else{
    search = FALSE
  }
  
  # prepare data asset
  if(asset == "yes"){
    asset = TRUE
  }else{
    asset = FALSE
  }
  
  # Prepare data dataaccess
  
  if(is.null(dataaccess) == TRUE){
    dataaccess <- ""
    
  }else{
    
   dataaccess<- paste(dataaccess, collapse = ",")
  }
  
  # Read temp file with requred info __________________________________________
  
  keylist<- read.csv("codes/temp.csv")
  # Generate key to asociate with account
  num1 <- floor(runif(1, min=10, max=99))
  num2 <- floor(runif(1, min=10, max=99))
  num3 <- floor(runif(1, min=10, max=99))
  num4 <- floor(runif(1, min= 10, max = 99))
  
  # Create key to return to user
  key <- paste(num1,"-",num2,"-",num3,"-",num4, sep = "")
  
  # hash key for safe storage
  keyhash <- digest(key , "md5", serialize = TRUE)
  
  # Append information to the data frame
 keylist[nrow(keylist) + 1,] <- c(keyhash,home,datainput,dataoutput,manualinput,profile,visual,search,asset,dataaccess)
 
  # Save file with new info
 write.csv(keylist,"codes/temp.csv",row.names = FALSE)
  

  
  return(key)
}

verify_temp_key <- function(key){
  verification = FALSE
  key <- digest(key , "md5", serialize = TRUE)
  keylist<- read.csv("codes/temp.csv")
  
  
  length <- (nrow(keylist))
  
  for(i in 1:length){
    
    if(keylist$temp[i] == key) {
      verification = TRUE
    } 
  }
  
  return(verification)
  
}

get_user_profile <- function(key){
  
  key <- as.character(key)
  location <- NULL
  verification <- FALSE
  key <- digest(key , "md5", serialize = TRUE)
  keylist<- read.csv("codes/temp.csv")
  length <- (nrow(keylist))
  #print(key)
  for(i in 1:length){
    
    if(keylist$temp[i] == key) {
      verification = TRUE
      location <- i
      return(location)
      
    } 
    
  } 
  
  
}

remove_temp_key <- function(key){
  key <- as.character(key)
  location <- NULL
  verification = FALSE
  key <- digest(key , "md5", serialize = TRUE)
  keylist<- read.csv("codes/temp.csv")
  
  
  length <- (nrow(keylist))
  
  for(i in 1:length){
    
    if(keylist$temp[i] == key) {
      verification = TRUE
      location <- i
      
      
    } 
    
  } 
    if(verification == TRUE){
      keylist <- slice(keylist, -c(location))
    }
  write.csv(keylist,"codes/temp.csv",row.names = FALSE)
  return(verification)
}


remove_user <- function(inputstring, confirm){
  
  inputstring <- as.numeric(inputstring)
  # load in the users we want to remove, full list
  userlist<- read.csv("codes/Codes.csv")
  
  # get length of list returned
  
  
  stringmessage <- "Are you sure you want to delete user "
  # Get confirmation of process
  if(confirm == FALSE){
   
    stringmessage<- paste(stringmessage, userlist$Username[as.numeric(inputstring)], "? Press confirm to complete action ", sep = "")
    
    
    
    
   return(stringmessage)
  }
  
  #__________________________________________________________
  
  # Actually run opperation
  if(confirm == TRUE){
    user <- userlist$Username[as.numeric(inputstring)]
      userlist <- slice(userlist, -c((inputstring)))
      
    
    write.csv(userlist,"codes/Codes.csv",row.names = FALSE)
    return(paste("User ", user, " Deleted!",sep = ""))
  }
  
  
  
  
  
  
}


# GETTING LISTS___________________________________________________________________________

# Stored in text for later

#END OF GETTING LISTS_______________________________________________________________________



upgrade_user <- function(inputstring, confirm){
  
  inputstring <- as.numeric(inputstring)
  
  # load in the users we want to remove, full list
  userlist<- read.csv("codes/Codes.csv")
  userlistadmin <- read.csv("codes/Codes2.csv")
  
  
  # get length of list returned
  
  
  stringmessage <- "Are you sure you want to give admin access to user "
  
  # Get confirmation of process
  if(confirm == FALSE){
    
    
    
    stringmessage <- paste(stringmessage, userlist$Username[inputstring], "? Press confirm to complete action ", sep = "")
   
    
    
    
    return(stringmessage)
  }
  
  #__________________________________________________________
  
  # Actually run opperation
  if(confirm == TRUE){
    
      
      
      
      if(userlist$ADMIN[inputstring] == FALSE){
      
      # Get username, Password values
      username <- userlist$Username[inputstring]
      password <- userlist$Password[inputstring]
    
      
      
      # Copy values to admin codes
      
      userlistadmin[nrow(userlistadmin) + 1,] <- c(username,password)
      
      # Here we will set the value in the main codes to verify that they are admin
      userlist$ADMIN[inputstring] <- TRUE
      
      }else{
      
        return("user is already admin")
    }
    
    
    
    # Save the changes
    write.csv(userlistadmin,"codes/Codes2.csv",row.names = FALSE)
    write.csv(userlist,"codes/Codes.csv",row.names = FALSE)
    return(" Upgrade Complete")
  }
 
}


get_database <- function(username){
  # This function returns a database which only the user has access to. 
  
  
  # Load up the database
  database <- read.csv("database/database.hydro")
  #value <- "War Lake First Nation"
  
  # this function will return a dataset with only the data a person has access to
  Locationlist<- read.csv("list/LOCATIONS.csv")
  filepathtoread <- paste("Account_profile/", digest(username, "md5", serialize = FALSE),".hydro", sep = "")
  userprofile <- read.csv(filepathtoread)
  
  Access <- userprofile$DATAACCESS[1]
  
  for(i in 1:nrow(Locationlist)){
    
    
    
   # See if the value in the list is also given access
   if((grepl( tolower(Locationlist$LOCATION[i]), tolower(Access), fixed = TRUE)) == FALSE){
     
    database <- database[!grepl((Locationlist$LOCATION[i]), (database$FIRST_NATION_COMMUNITY)),]
     
   }else{
     
   }
    
    
  }
  
  
  return(database)
  
}

add_option <- function(tablenum,string){
  list <- c("1" = "EDUCATION","2" = "JOB_INTEREST", "3" = "APPRENTICESHIP_TRADE_LEVEL", "4" = "LOCATIONS", "5" = "PROJECT_INTEREST")
  path <- paste("list/",list[tablenum],".csv", sep = "")

  # Get data
  
  dataf <- read.csv(path)
  
  # Add new data to DF
  
  dataf[nrow(dataf) + 1,] <- c(string)
  
  # Write data back to file
  
  write.csv(dataf,path,row.names = FALSE)
  
  return("Complete!")
  
}

submit_entry <- function(First,Last,middle,email,phone,first_nation_community,city_town_residence,current_address,home_address,highest_education,Apprenticeship_trade_level,job_interests,female,project_interest,previous_mh_project_experence,previous_mh_project_experence_details,job_workshop,notes,work_availability,certificate_paths,resume_path,disability,disability_details,class_5,confined,air_brakes,opperate_seasonal_vehicle,cpr,travel,travel_airplane_boat,safety,construction,outdoorhot,outdoorcold,height,heavy_lifting,road_construction,heavy_equiptment,concrete,power_tool,detail,problem_solving,pressure,independent,forestry,user){
  
# Prepare True / False questions
  
  
 job_interests <- paste(job_interests, collapse = ",")
 project_interest <- paste(project_interest, collapse = ",") 
 opperate_seasonal_vehicle <- paste(opperate_seasonal_vehicle, collapse = ",")
 power_tool <- paste(power_tool, collapse = ",")

 resume_path <- paste(resume_path, collapse = ",")
 
 database <- read.csv("database/database.hydro") 
 databaseindex <- read.csv("database/databaseindex.hydro")
 databasebackup <- read.csv("list/database_template.hydro")
 #print(paste("resume_path :", resume_path, sep = ""))
 print(resume_path)

 if(nchar(resume_path) == 0){
   
   resume_path <- ""
   newpath <- ""
 }else{
  # print("running code")
  file_type <-  strsplit(resume_path, '\\.')
  
  length_file_type <- lengths(file_type)
  
  file_type <- file_type[[1]][length_file_type]
  
   newpath <- paste0("Resume/instance_",(databaseindex$Index + 1),".",file_type)
   
   file.copy((from = resume_path),
             to = newpath)
 }
  
  date <- Sys.Date()
  
  


# Here we create new row in database
database[nrow(database) + 1,] <- c(First,Last,middle,email,phone,first_nation_community,city_town_residence,current_address,home_address,highest_education,Apprenticeship_trade_level,job_interests,female,project_interest,previous_mh_project_experence,previous_mh_project_experence_details,job_workshop,notes,work_availability,certificate_paths,newpath,disability,disability_details,class_5,confined,air_brakes,opperate_seasonal_vehicle,cpr,travel,travel_airplane_boat,safety,construction,outdoorhot,outdoorcold,height,heavy_lifting,road_construction,heavy_equiptment,concrete,power_tool,detail,problem_solving,pressure,independent,forestry,(databaseindex$Index + 1),1,1,as.character(date),as.character(format(Sys.time(), "%H:%M:%S")),user)
#databasebackup[nrow(databasebackup) + 1,] <- c(First,Last,middle,email,phone,first_nation_community,city_town_residence,current_address,home_address,highest_education,Apprenticeship_trade_level,job_interests,female,project_interest,previous_mh_project_experence,previous_mh_project_experence_details,job_workshop,notes,work_availability,certificate_paths,newpath,disability,disability_details,class_5,confined,air_brakes,opperate_seasonal_vehicle,cpr,travel,travel_airplane_boat,safety,construction,outdoorhot,outdoorcold,height,heavy_lifting,road_construction,heavy_equiptment,concrete,power_tool,detail,problem_solving,pressure,independent,forestry,(databaseindex$Index + 1),1,1,as.character(date),as.character(format(Sys.time(), "%H:%M:%S")),user)
# update the index chart
print("run?")
databaseindex$Index[1] = databaseindex$Index[1] + 1


# Write new database's

write.csv(database,"database/database.hydro",row.names = FALSE)

write.csv(databaseindex,"database/databaseindex.hydro", row.names = FALSE)
write.csv(databasebackup,"temp/backup.employment", row.names = FALSE)


#print(job_interests)

return("Successfully Submitted!")
  
  
  
  
  
}



backup_database <- function(){
 
  # Get directory of all files from folders

     list1 <- dir(paste("","codes", sep = ""), full.names = TRUE)
     list2 <- dir(paste("","database", sep = ""), full.names = TRUE)
     list3 <- dir(paste("","list", sep = ""), full.names = TRUE)
     list4 <- dir(paste("","Account_profile", sep = ""), full.names = TRUE)
     list5 <- dir(paste("", "Resume",sep = ""),full.names = TRUE)
    
 
 # Combine all lists to single list
 
     tozip <- c(list1,list2,list3,list4,list5)
   # tozip <- c(test_entire_zip)
    # Create the archive
     
      
     #zip::zip("Database_backup.zip", test_entire_zip)
       zip::zip("Database_backup.zip", tozip)
       print('done')
       return("Database_backup.zip")
}


update_app <- function(path){
  if(is.null(path) == TRUE){
    return("Failed: No file uploaded")
  }
 unzip(path, exdir = ".")
  return("Complete!")
}

subset_current <- function(username){
# This function returns a subset of data which only contains the most current version of the data
 # database <- read.csv("database/database.hydro")
 # databaseindex <- read.csv("database/databaseindex.hydro")  
  
 database<- get_database(username)
  
  # Get index number of database
  
  database <- database[which(database$INSTANCE == database$MAX),]
  
  return(database)
}

get_time_since_length <- function( username){

  df <- subset_current(username)
  
  #datelist <- list(c( "Show all profiles" = "1" ,"1 Day" = "2", "1 Week" = "3","1 month" = "4" ,"3 Months" = "5","6 Months" = "6","1 Year" = "7","2+ years" = "8"))
   
  
  
  datenow <- as.character(Sys.Date())
  
  finish <- as.Date(Sys.Date(), format="%yyyy/%mm/%dd")
  
  

    varlength <- 31
  
  print(df$DATE[1])
 
  
  # Find subset given time range
  df <- df[which((as.numeric(finish - (as.Date(df$DATE)))) >= varlength),]
  length <- (nrow(df))
  
  return(length)
  
  
}

time_since <- function(datesince, username){
  
 df <- subset_current(username)
 
 #datelist <- list(c( "Show all profiles" = "1" ,"1 Day" = "2", "1 Week" = "3","1 month" = "4" ,"3 Months" = "5","6 Months" = "6","1 Year" = "7","2+ years" = "8"))
  

  datenow <- as.character(Sys.Date())
  
  finish <- as.Date(Sys.Date(), format="%yyyy/%mm/%dd")
  
  

  
  if(datesince == "Show all profiles"){
    varlength <- 0
  }
  
  if(datesince == "1 Day"){
    varlength <- 1
  }
  
  if(datesince == "1 Week"){
    varlength <- 7
  }
  
  if(datesince == "1 month"){
    varlength <- 31
  }
  
  if(datesince == "3 Months"){
    varlength <- 91
  }
  
  if(datesince == "6 Months"){
    varlength <- 182
  }
  
  
  if(datesince == "1 Year"){
    varlength <- 365
  }
  
  if(datesince == "2+ years"){
    varlength <- 730
  }
  
  
  # Find subset given time range
  df <- df[which((as.numeric(finish - (as.Date(df$DATE)))) >= varlength),]
  
 return(df)
  
  
}

#test1 <- time_since("Show all profiles","kwog@hydro.mb.ca")



secondary_df <- function(index,datesince,username,dftype){
  
  
  print(paste(" df type :", dftype, sep = ""))
  
  index <- as.numeric(index)
  
 # dftype <- "Edit Table"
#  datesince <- "Show all profiles"
  # Getting the original dataframe for our record
df <- time_since(datesince,username)
#print(index)
id <- df$ID[index]
instance <- df$INSTANCE[index]

 
 # Here we return single line to be edited

 if(dftype == "Edit Table"){
   
   dfreturn <- df[which(df$ID == id),]
   
   
   return(dfreturn)
   
 }
 
 # Here we return table for version control
 
 if(dftype == "See version history"){
   # Get entire dataframe
  dfversion<- get_database(username)
  
  dfversion <- dfversion[which(dfversion$ID == id),]
  
   return(dfversion)
   
 }
  
 
  
}



create_instructions_doc <- function(){
  sample_doc <- read_docx("word.docx") 
  sample_doc <- sample_doc %>% body_add_par("This is the first paragraph")
  
  
  

}


visualise_data_region <- function(username){
  
  df <- subset_current(username)
  locations <- read.csv("list/LOCATIONS.csv")
  subdf <- data.frame()
  
  dataframeoutput <- read.csv("list/visual.csv")
  
  for(i in 1:NROW(locations)){
    
    
    
    subdf_available <- df[which(df$FIRST_NATION_COMMUNITY == locations$LOCATION[i]),]
    subdf_available <- subdf_available[which(subdf_available$WORK_AVAILABILITY == "yes"),]
    subdf_notaval <- df[which(df$FIRST_NATION_COMMUNITY == locations$LOCATION[i]),]
    subdf_notaval <- subdf_notaval[which(subdf_notaval$WORK_AVAILABILITY == "NO"),]
    
    location <- locations$LOCATION[i]
    number_available <- nrow(subdf_available)
    number_not_available <- nrow(subdf_notaval)
    
    dataframeoutput[nrow(dataframeoutput) + 1,] = c(location,number_available,number_not_available)
    
    
    
    
  }
  
  return(dataframeoutput)
  
}



make_list <- function(string){
  


string<- strsplit(as.character(string), split = "\\,")

  
  return(string)
}




submit_entry_edit <- function(upload,resumepth,id,instance,First,Last,middle,email,phone,first_nation_community,city_town_residence,current_address,home_address,highest_education,Apprenticeship_trade_level,job_interests,female,project_interest,previous_mh_project_experence,previous_details,job_workshop,notes,work_availability,certificate_paths,resume_path,disability,disability_details,class_5,confined,air_brake,opperate_seasonal_vehicle,cpr,travel,travel_airplane_boat,safety,construction,outdoorhot,outdoorcold,height,heavy_lifting,road_construction,heavy_equiptment,concrete,power_tool,detail,problem_solving,pressure,independent,forestry,user){
  
  # Prepare True / False questions
  
  
  job_interests <- paste(job_interests, collapse = ",")
  project_interest <- paste(project_interest, collapse = ",") 
  resume_path <- paste(resume_path, collapse = ",")
  opperate_seasonal_vehicle <- paste(opperate_seasonal_vehicle, collapse = ",")
  power_tool <- paste(power_tool, collapse = ",")
  
  database <- read.csv("database/database.hydro") 
  databaseindex <- read.csv("database/databaseindex.hydro")
  
  #print(paste("this is resume path", resume_path))
  #print(paste("upload: ",upload))
  if(upload == FALSE){
    
    newpath <- resumepth
  }else{
    #print("running code on updating path")
    file_type <-  strsplit(resume_path, '\\.')
    
    length_file_type <- lengths(file_type)
    
    file_type <- file_type[[1]][length_file_type]
    
    newpath <- paste0("Resume/id_",id,".",file_type)
    
    file.copy((from = resume_path),
              to = newpath)
  }
  
  date <- Sys.Date()
  
  
  
  instance <- as.numeric(instance)
 
  
  # Here we create new row in database
  database[nrow(database) + 1,] <- c(First,Last,middle,email,phone,first_nation_community,city_town_residence,current_address,home_address,highest_education,Apprenticeship_trade_level,job_interests,female,project_interest,previous_mh_project_experence,previous_details,job_workshop,notes,work_availability,certificate_paths,newpath,disability,disability_details,class_5,confined,air_brake,opperate_seasonal_vehicle,cpr,travel,travel_airplane_boat,safety,construction,outdoorhot,outdoorcold,height,heavy_lifting,road_construction,heavy_equiptment,concrete,power_tool,detail,problem_solving,pressure,independent,forestry,id,instance + 1,instance + 1 ,as.character(date),as.character(format(Sys.time(), "%H:%M:%S")),user)
  
  # Write new database's
  
  write.csv(database,"database/database.hydro",row.names = FALSE)
 
  
 
  database <- read.csv('database/database.hydro')
 
    

  
  for(i in 1:NROW(database)){
    
    if(database$ID[i] == id){
      database$MAX[i] = instance + 1
     # print(i)
     # print(database$MAX[i])
    }
    

  }
    
 
  
  write.csv(database,"database/database.hydro",row.names = FALSE)
  

  
  
  #print(job_interests)
  
  return("Successfully Submitted!")
  
  
  
  
  
}


database_download_exporter <- function(string, username){
  
  if(string == "DOWNLOAD MOST RECENT DATA"){
    
    
   return(time_since("Show all profiles",username)) 
  }
  
  if(string == "DOWNLOAD DATA INCLUDING ALL VERSIONS"){
    
  
    return(get_database(username))  
  
  }
  
 
 #github test
  
}

Create_candidate_report <- function(df){
  
  df <- read.csv("test.csv")
 write.csv(df,"test.csv",row.names = FALSE)
  sample_doc <- read_docx() 
  
  if(df$WORK_AVAILABILITY[1] == "NO"){
    available <- "currently available"
  }else{
    available <- "currently unavailable"
  }
  #df <- read.csv("database/database.hydro")
  
  sample_doc <- sample_doc %>% body_add_par("Job Application Report", style = "centered")
  sample_doc <- sample_doc %>% body_add_par(paste(df$FIRST_NAME[1],df$MIDDLE_INITIAL[1],df$LAST_NAME[1],",", sep = " "))
  sample_doc <- sample_doc %>% body_add_par("")
  sample_doc <- sample_doc %>% body_add_par(paste(df$CURRENT_ADDRESS[1],", ",df$CITY_TOWN_RESIDENCE[1]," Manitoba",sep = ""))
  sample_doc <- sample_doc %>% body_add_par(df$FIRST_NATION_COMMUNITY[1])
  sample_doc <- sample_doc %>% body_add_par("")
  sample_doc <- sample_doc %>% body_add_par(paste("Email:",df$EMAIL[1],sep = " "))
  sample_doc <- sample_doc %>% body_add_par(paste("PHONE: ",df$PHONE[1],sep = ""))
  sample_doc <- sample_doc %>% body_add_par("")
  sample_doc <- sample_doc %>% body_add_par(paste(df$FIRST_NAME[1], " is a member of the ", df$FIRST_NATION_COMMUNITY[1], ", and is ", available, " to work.", sep = ""))
  
  
  
  
  
  # Travel attributives
  p1 <- ""
  # work details / attributes
  p2 <- ""
  
  p3 <- ""
  
  
  # Here we are going to work on putting together p1 (paragraph 1)
  name <- df$FIRST_NAME[1]
  
  Travel_by_airplane_boat <- df$TRAVEL_AIRPLANE_BOAT[1]
    
  class5 <- df$CLASS_5[1]
  season <- df$OPERATE_SEASONAL_VEHICLE[1]
  truck <- df$confined[1]
    airbrakes <- df$AIR_BRAKE[1]
  
  travel <- df$TRAVEL[1]
    
    p1 <- paste("        ",name, sep = "")
    dev1 <- ""
    
    if(Travel_by_airplane_boat == "yes"){
      
      if(travel == "yes"){
        
      p1 <- paste(p1," is able to travel on both airplanes and boats. ", name, " is also comfortable traveling from home for work which opens up many work opportunities." ,sep = "")
      
      }else{
        p1 <- paste(p1, " is currently unable to work away from their home town but is comfortable traveling by both airplane and boat. While unable to travel, this opens up work opportunities in the local area.",sep = "")
      }
    }else{
      
      if(travel == "yes"){
        
        p1 <- paste(p1," is comfortable working working away from home. Although ", name," is not able to travel on airplanes or boats. Travel will most likley need to take place by road.",sep = "")
        
      }else{
        p1 <- paste(p1," is neither comfortable working working away from home or traveling on airplanes or boats. ", name, " will not be sutable for employment opportunities which require travel away from home or locally by airplane and boat.",sep = "")
      }
      
    }
  
  if(class5 == "yes"){
    p1 <- paste(p1," ",name," has a valid class 5 license and capable of driving themself. ")
    
  }else{
    p1 <- paste(p1," ",sep = "")
  }
    
    if(truck == "yes"){
      
      if(airbrakes == "yes"){
        p1 <- paste(p1,name," is able to drive trucks and has their air brakes endorsement. This is a great asset for jobs that require opperating heavy equipment.",sep = "")
      }else{
        p1 <- paste(p1,name," is able to drive trucks but does not have their air brakes endorsement. Overall a great asset, and completing their air brakes endorsement could further open opportunities!")
      }
        
    }else{
      
      if(season == "yes"){
        p1 <- p1 <- paste(p1,name," is unable to drive trucks, but has the ability to drive seasonal vehicles such as 1/2 ton trucks and vans. ",sep = "")
        
      }else{
        p1 <- paste(p1,name," is able to drive trucks or seasonal vehicles such as 1/2 ton trucks and vans. Obtaining these skills could further their employment opportunities.",sep = "")
      }
    }
    
    sample_doc <- sample_doc %>% body_add_par("")
    sample_doc <- sample_doc %>% body_add_par(p1)
    
  
  # Here we will work on p2, Paragraph 2
  
  p2 <- "        Aside from Travel, "
  
  if(df$PREVIOUS_MH_PROJECT_EXPERIENCE[1] == "yes"){
    if(df$OUTDOOR_HOT[1] == "yes"){
      if(df$OUTDOOR_COLD[1] == "yes"){
        # previous experience and hot + cold
        p2 <- paste(p2,name," has previous experience working with Manitoba Hydro on a project in the past. The details are attached below indicating where they have worked. ",name," has indicated that they are comfortable working in both hot and cold environment which should make them a great candidate for working outdoor year round!",sep = "")
      }else{
        # previous experience and hot not cold
        p2 <- paste(p2,name," has indicated that they have previously worked on a Manitoba hydro project. Details about this project can be found below. ",name," has indicated that their capable of working in hot outdoor environments, but are not comfortable in the cold. Outdoor summer and indoor winter employment opportunities would be great options!",sep = "")
      }
    }else{
      if(df$OUTDOOR_COLD[1] == "yes"){
        # previous experience cold but not hot
        p2 <- paste(p2,name," has indicated that they have previously worked on a Manitoba hydro project. Details about this project can be found below. ",name," has indicated that their capable of working in cold outdoor environments, but are not comfortable in the heat. Outdoor winter and indoor summer employment opportunities would be great options!",sep = "")
      }else{
        # previous experience not cold or hot
        p2 <- paste(p2,name," has indicated that they have previously worked on a manitoba hydro project. Details about this project can be found below. Their application also indicated that they are not comfortable working in hot or cold outdoor environments. Indoor work would probably be the best option for this applicant.",sep = "")
      }
      
    }
  }else{
    if(df$OUTDOOR_HOT[1] == "yes"){
      if(df$OUTDOOR_COLD[1] == "yes"){
        # no previous experience and hot + cold
        p2 <- paste(p2,name," does not have previous experience working with Manitoba Hydro on a project in the past. ",name," has indicated that their are comfortable working in both hot and cold environment which should make them a great candidate for working outdoor year round!",sep = "")
        
      }else{
        # no previous experience and hot not cold
        p2 <- paste(p2,name," indicated that they have not previously worked on a Manitoba hydro project. ",name," has indicated that their capable of working in hot outdoor environments, but are not comfortable in the cold. Outdoor summer and indoor winter employment opportunities would be great options!",sep = "")
        
      }
    }else{
      if(df$OUTDOOR_COLD[1] == "yes"){
        # no previous experience cold but not hot
        p2 <- paste(p2,name," has indicated that they have not previously worked on a Manitoba hydro project in the past.",name," has indicated that their capable of working in cold outdoor environments, but are not comfortable in the heat. Outdoor winter and indoor summer employment opportunities would be great options!",sep = "")
        
      }else{
        # no previous experience not cold or hot
        p2 <- paste(p2,name," has indicated that they have not previously worked on a manitoba hydro project. Their application also indicated that they are not comfortable working in hot or cold outdoor environments. Indoor work would probably be the best option for this applicant.",sep = "")
        
      }
      
    }
    
  }
  
  sample_doc <- sample_doc %>% body_add_par("")
  sample_doc <- sample_doc %>% body_add_par(p2)
  sample_doc <- sample_doc %>% body_add_par("")
  
  
  
  # here we start paragraph 3
  
  
  p3 <- "        "
  # ______________________________________________________________
  string <- ""
  
  list <- as.list(strsplit(df$JOB_INTERESTS, ",")[[1]])
  
  if(length(list) == 0){
    string <- paste(name," has not indicated any jobs that interest them. we could follow up at a later date to see if their interested in any specific areas.", sep = "")
  }else{
  
  for(i in 2:(length(list))-1){
    print(i)
    if(i == 1){
      string <- paste(string,list[[i]], sep = "") 
    }else{
      print("done here")
     string <- paste(string,", ",list[[i]], sep = "") 
    }
  }
    
  }
  print(string)
    
    if(length(list) == 1){
      string <- paste(name,"'s jobs interest is ", list[[length(list)]], ".",sep = "")
    }else{
   string <- paste(name,"'s jobs interests are ",string,", and ", list[[length(list)]], ".",sep = "")
    }
  if(length(list) == 1){
   string <- paste(string," With only one indicated job interest, it would be great to follow up later and see if ", name, " is interested in any other job interests.",sep = "")
  }
  
  if(length(list) == 2){
   string <- paste(string," Its great ",name, " has thought about what jobs their are interested in! following up with the applicant may help realise more interests!",sep = "")
  }
  
  if(length(list) > 2){
   string <- paste(string," Its clear that ",name, " has lots of job interests and has very flexable employment options.",sep = "")
  }
  
  string <- paste("        ",string,sep = "")
  
  #___________________________________________________________________________
  
  
  
  stringproject <- ""
  
  list <- as.list(strsplit(df$PROJECT_INTERESTS, ",")[[1]])
  if(length(list) == 0){
    stringproject <- paste(name, " has not indicated any project interests, it would be valuble to follow up with applicant and explain project types and determine if there is any interest.", sep = "")
  }else{
  for(i in 2:(length(list))-1){
    print(i)
    if(i == 1){
      stringproject <- paste(stringproject,list[[i]], sep = "") 
    }else{
      stringproject <- paste(stringproject,", ",list[[i]], sep = "") 
    }
  }
    if(length(list) == 1){
      stringproject <- paste(name, "'s project interest is ", list[[length(list)]], ".",sep = "")
    }else{
  stringproject <- paste(name,"'s current project interests are ",stringproject,", and ", list[[length(list)]], ".",sep = "")
    }

  }
  
  
  p3 <- paste(string,stringproject)
  
  sample_doc <- sample_doc %>% body_add_par(p3)
  sample_doc <- sample_doc %>% body_add_par("")
  sample_doc <- sample_doc %>% body_add_par("")
  
  sample_doc <- sample_doc %>% body_add_par("Job Application Details:", style = "heading 1")
  sample_doc <- sample_doc %>% body_add_par(paste("Highest Education: ",df$HIGHEST_EDUCATION[1],sep = ""))
  sample_doc <- sample_doc %>% body_add_par(paste("Current Apprenticeship trade level: ",df$APPRENTICESHIP_TRADE_LEVEL[1],sep = ""))
  sample_doc <- sample_doc %>% body_add_par(paste("Applicants Job Interests: ",df$JOB_INTERESTS,sep = ""))
  sample_doc <- sample_doc %>% body_add_par(paste("Willing to join Manitoba Hydro engagement event?: ",df$ENGAGEMENT_EVENT[1],sep = ""))
  sample_doc <- sample_doc %>% body_add_par(paste("Previous Manitoba Hydro experience: ",df$PREVIOUS_MH_PROJECT_EXPERIENCE[1],sep = ""))
  if(df$PREVIOUS_MH_PROJECT_EXPERIENCE[1] == "yes"){
  sample_doc <- sample_doc %>% body_add_par(paste("Previous project experience details:",df$PREVIOUS_PROJECT_EXPERIENCE_DETAILS[1],sep = ""))
  }
  sample_doc <- sample_doc %>% body_add_par(paste("Willing to join job workshop: ",df$WORK_AVAILABILITY[1] ,sep = ""))
  sample_doc <- sample_doc %>% body_add_par(paste("Currently available to work: ",df$WORK_AVAILABILITY[1] ,sep = ""))
  sample_doc <- sample_doc %>% body_add_par(paste("Disability: ",df$DISABILITY[1],sep = ""))
  if(df$DISABILITY[1] == "yes"){
    sample_doc <- sample_doc %>% body_add_par(paste("Disability details: ",df$DISABILITY_DETAILS[1] ,sep = ""))
  }
  sample_doc <- sample_doc %>% body_add_par(paste("Class 5 license: ",df$CLASS_5[1],sep = ""))
  sample_doc <- sample_doc %>% body_add_par(paste("Truck driver Class 1-3: ",df$confined[1] ,sep = ""))
  sample_doc <- sample_doc %>% body_add_par(paste("Air brakes endorsement: ",df$AIR_BRAKE[1] ,sep = ""))
  sample_doc <- sample_doc %>% body_add_par(paste("Able to operate seasonal vehicle: ",df$OPERATE_SEASONAL_VEHICLE[1] ,sep = ""))
  sample_doc <- sample_doc %>% body_add_par(paste("First aid / CPR certified: ",df$CPR[1] ,sep = ""))
  sample_doc <- sample_doc %>% body_add_par(paste("Able to Travel From home town: ",df$TRAVEL[1] ,sep = ""))
  sample_doc <- sample_doc %>% body_add_par(paste("Able to travel on airplane or boat: ",df$TRAVEL_AIRPLANE_BOAT[1] ,sep = ""))
  sample_doc <- sample_doc %>% body_add_par(paste("Previous experience with workplace safety: ",df$SAFETY[1] ,sep = ""))
  sample_doc <- sample_doc %>% body_add_par(paste("Previous construction experience: ",df$CONSTRUCTION[1] ,sep = ""))
  sample_doc <- sample_doc %>% body_add_par(paste("Ability to work in a hot outdoor environment: ",df$OUTDOOR_HOT[1] ,sep = ""))
  sample_doc <- sample_doc %>% body_add_par(paste("Ability to work in a cold outdoor environment: ",df$OUTDOOR_COLD[1] ,sep = ""))
  sample_doc <- sample_doc %>% body_add_par(paste("Comfortable working at heights: ",df$HEIGHTS[1] ,sep = ""))
  sample_doc <- sample_doc %>% body_add_par(paste("Ability to lift large amounts of weight: ",df$HEAVY_LIFTING[1] ,sep = ""))
  sample_doc <- sample_doc %>% body_add_par(paste("Previous experience with road construction: ",df$ROAD_CONSTRUCTION[1] ,sep = ""))
  sample_doc <- sample_doc %>% body_add_par(paste("Heavy equipment: ",df$HEAVY_EQUIPTMENT[1] ,sep = ""))
  sample_doc <- sample_doc %>% body_add_par(paste("Previous experience working with concrete: ",df$CONCRETE[1] ,sep = ""))
  sample_doc <- sample_doc %>% body_add_par(paste("previous experience using a wide range of power tools: ",df$POWER_TOOL[1] ,sep = ""))
  sample_doc <- sample_doc %>% body_add_par(paste("Strong attention to detail: ",df$DETAIL[1] ,sep = ""))
  sample_doc <- sample_doc %>% body_add_par(paste("Ability to effectively problem solve: ",df$PROBLEM_SOLVING[1] ,sep = ""))
  sample_doc <- sample_doc %>% body_add_par(paste("Comfortable working under pressure: ",df$PRESSURE[1] ,sep = ""))
  sample_doc <- sample_doc %>% body_add_par(paste("Comfortable working independently: ",df$INDEPENDENT[1] ,sep = ""))
  sample_doc <- sample_doc %>% body_add_par(paste("Previous experience working in forestry: ",df$FORESTRY[1],sep = ""))
  
 
  
  
 print(sample_doc, target = "sample_file.docx")
  
  
  return("sample_file.docx")
}

github_update <- function(){
  
  print("preparing old data for backup")
  # Get directory of all files from folders
  
  list1 <- dir(paste("","codes", sep = ""), full.names = TRUE)
  list2 <- dir(paste("","database", sep = ""), full.names = TRUE)
  list3 <- dir(paste("","list", sep = ""), full.names = TRUE)
  list4 <- dir(paste("","Account_profile", sep = ""), full.names = TRUE)
  list5 <- dir(paste("", "Resume",sep = ""),full.names = TRUE)
  
  
  # Combine all lists to single list
  
  tozip <- c(list1,list2,list3,list4,list5)
  # Create the archive
  

  zip::zip("Database_backup_update.zip", tozip)
  
  # Backup file has been made and downloading file now
  print('Database resume and accounts backed up')
  
  print("preparing to download update")
  
  download.file("https://github.com/kjogow527/MH_EMPLOYMENT_APP/archive/refs/heads/main.zip", destfile = "HM_EMPLOYMENT_APP_KYLE.zip")
  
  print("File has been successfully downloaded!")
  
  unzip(zipfile = "HM_EMPLOYMENT_APP_KYLE.zip")
  
  print('File has been unpacked')
  
  if(file.exists("HM_EMPLOYMENT_APP_KYLE.zip")){
    unlink("HM_EMPLOYMENT_APP_KYLE.zip")
    print("deleted")
  }
  
  
  
  print("zip file has been removed post successful unpacking")
  
  list <- paste("MH_EMPLOYMENT_APP-main/",list.files("MH_EMPLOYMENT_APP-main/"),sep = "")
  
  print("preparing file transfer")
  
  file.copy(list, getwd(), recursive=TRUE, overwrite = TRUE)
  
  print('file transfer complete')
  
  print("preparing for cleanup")
  
  
  unlink("MH_EMPLOYMENT_APP-main",recursive=TRUE)
  
  
  print("all files cleaned up")
  
  
  # lets check if we have an old backup and delete it if unwanted
  
  
  if(file.exists("Database_backup.zip")){
    unlink("Database_backup.zip")
    print("old backup file was deleted")
  }
  
  # backed up old app data
    unzip(zipfile = "Database_backup_update.zip")
  
    unlink("Database_backup_update.zip",recursive=TRUE)
  
  
  
  
  return("Complete!")
  
  
}



cookie_login_add <- function(username){

  username <- tolower(username)
  
 hash <- digest(username , "md5", serialize = FALSE)
 
 df <-  read.csv("cookies/cookie_login.csv")
  
 df[nrow(df) + 1,] <- c(hash,username)
  
  write.csv(df,"cookies/cookie_login.csv", row.names = FALSE)
  
  
 return(hash) 
}

cookie_login_verify <- function(hash){
  
  df <-  read.csv("cookies/cookie_login.csv")
  
  df <- df[df$Hash == hash,]
  
  username <- df$username[1]
  
  
  
  
  
  return(username) 
}


certificate_handler <- function(certificate,name){
  
  print(paste("certificate: ",certificate, sep = ""))
  if(certificate[1] == ""){
    return("no certificates to upload")
  }else{
  length <- (length(certificate))
  
  # read index file
  index <- read.csv("Education_Certificates/Index.csv")
  string <- ""

   val <- index$INDEX[1]
  
  for(i in 1:length){
   
    
    
    resume_path <- certificate[i]
    
    newpath <- paste("Education_Certificates/",val,"_",name[i],sep = "")
    
    string <- paste(string, ", " , newpath, sep = "")
     
    file.copy((from = resume_path),
              to = newpath)
    
    val <- val + 1
    
  }
 
 index$INDEX[1] = val
 print(paste("index:", index$Index[1]), sep = "")
 
   write.csv(index,"Education_Certificates/Index.csv", row.names = FALSE)
 
  return(string)
  }
}

certificate_handler_edit <- function(certificate,name,stringst){
  
  print(paste("certificate: ",certificate, sep = ""))
  print(paste("stringst: ",stringst, sep = ""))
  if(certificate[1] == ""){
    return("no certificates to upload")
  }else{
    length <- (length(certificate))
    
    # read index file
    index <- read.csv("Education_Certificates/Index.csv")
    string <- stringst
    
    val <- index$INDEX[1]
    
    for(i in 1:length){
      
      
      
      resume_path <- certificate[i]
      
      newpath <- paste("Education_Certificates/",val,"_",name[i],sep = "")
      
      string <- paste(string, ", " , newpath, sep = "")
      
      file.copy((from = resume_path),
                to = newpath)
      
      val <- val + 1
      
    }
    
    index$INDEX[1] = val
    print(paste("index:", index$Index[1]), sep = "")
    
    write.csv(index,"Education_Certificates/Index.csv", row.names = FALSE)
    
    
    
    return(string)
  }
}

#write.csv(read.csv("database/database.csv"),"database/database.hydro", row.names = FALSE)

version1 <- function(tp){
    
    df <- read.csv("version/version.csv")
    
    if(tp == "version"){
      return(vdf$Version[1])
    }
    
    if(tp == "publish"){
     return(df$Status[1]) 
    }
    
    if(tp == "stable"){
      
      if(df$Status[1] == "unstable"){
        return("WARNING!!! THE DEVELOPER MARKED THIS VERSION UNSTABLE.")
      }
      if(version$Status[1] == "stable"){
        return("Latest Stable Release!")
      }
        
    
    }
    
  }
  
search_by_name <- function(username,first,last){
  
  mydata <- subset_current(username)
  print('should write csv')
  #write.csv(mydata, "testdata.csv", row.names = FALSE)
  #mydata <- read.csv("testdata.csv")
 # first <- "Kyle"
  #last <- ""

    # Here we are going to make the decision of how to process data
  
  output <- mydata[mydata$Name == "ad32432awd4wad3awdwadwadwdawda24324324324324324324324324",]
  output1 <- mydata[mydata$Name == "ad32432awd4wad3awdwadwadwdawda24324324324324324324324324",]
  
  if(first == ""){
    output <- mydata
  }else{
    for(i in 1:nrow(mydata)){
      print(i)
      if(tolower(trimws(mydata$FIRST_NAME[i])) == tolower(trimws(first))){
        output <- rbind(output,mydata[i,])
        
      }
    }
  }
  
  if(last == ""){
    output1 <- output
  }else{
    for(i in 1:nrow(output)){
      if(tolower(trimws(output$LAST_NAME[i])) == tolower(trimws(last))){
        output1 <- rbind(output1,output[i,])
      }
    }
    
    
  }
  
  
  if(first == "" & last == ""){
    output1 <- mydata[mydata$Name == "ad32432awd4wad3awdwadwadwdawda24324324324324324324324324",]
  }
  
  
  return(output1)
  
}

detail_report <- function(df, index){
  df <- read.csv("testdata.csv")

  intro <- (Paste(df$FIRST_NAME[1], ", ", df$LAST_NAME[1], " is from ", df$FIRST_NATION_COMMUNITY[1], ))
  
 
    
  
  
  
  
  
  
}


create_job_profile <- function(value,absolute,name){
  
  template <- read.csv("job_profiles/template.csv")
  
 # gs4_deauth()
  
 # dff <-  read_sheet("https://docs.google.com/spreadsheets/d/16uFYN1HMnSl9tQ2920UZ4SjmPupPO5tagCwJDsAhv8Q/edit?usp=sharing")
  

 
 template[nrow(template) + 1,] <- c(name,
                value$value_mh_exp, 
                value$value_driver_license, 
                value$air_brakes,
                value$confined_space,
                value$boat,
                value$atv,
                value$snowmobile,
                value$first_aid,
                value$travel,
                value$airplane,
                value$tb_boat,
                value$workplace_safety,
                value$workplace_construction,
                value$value_hot,
                value$value_cold,
                value$height,
                value$heavy_equip,
                value$heavy_lift,
                value$forestry,
                value$stress)
  
  
 template[nrow(template) + 1,] <- c(name, absolute$absolute_mh_exp,
   absolute$absolute_driver_license,
   absolute$absolute_air_brakes,
   absolute$absolute_confined_space,
   absolute$absolute_boat,
   absolute$absolute_atv,
   absolute$absolute_snowmobile,
   absolute$absolute_First_aid,
   absolute$absolute_travel,
   absolute$absolute_tb_airplane,
   absolute$absolute_tb_boat,
   absolute$absolute_workplace_safety,
   absolute$absolute_workplace_construction,
   absolute$absolute_hot,
   absolute$absolute_cold,
   absolute$absolute_height,
   absolute$absolute_heavy_equip,
   absolute$absolute_heavy_lift,
   absolute$absolute_forestry,
   absolute$absolute_stress)

  
  write.csv(template, paste("job_profiles/profiles/",name,".csv", sep = ""), row.names = FALSE)
  
  profile_list <- read.csv("job_profiles/profile_list.csv")
  
  profile_list[nrow(profile_list) + 1] <- c(name)
  
  write.csv(profile_list, row.names = FALSE)
  
}





rank_by_job <- function(username, job){
  
  
  
  
  
  
# here we will create a ranking system to determing elegability
  
# an attribute can be ranked from 0-1 in importance. 1 meaning the "attribute is of high importance", and 0 being not important at all
# an attribute can also be "absolute" meaning it is necessary to have any value
  
  
  
  # Capture the database which we want to work from
  
               df <- subset_current(username)
               
               df[, 'score'] = NA
              
  
              
  # Read in ranking data
              print(paste("TEST: job_profiles/profiles/",job,".csv", sep = "")) 
               
         # df_score <- read.csv(paste("job_profiles/profiles/",job,".csv", sep = ""))   
               
               
         df_score <- read.csv("job_profiles/TEST_PROFILE.csv")
          
          num <- as.numeric(nrow(df))
          
          
          
         
          
          for(i in 1: num){
  
        # Rank variable is to add up total candidate score
  
         rank <- 0
        rank_multiplier <- 1
      # Previous MH experience
  
       
        
      if(df$PREVIOUS_MH_PROJECT_EXPERIENCE[i] == "yes"){
        
        rank = as.numeric(df_score$PREVIOUS_MH_EXPERIENCE[1]) + rank
        
      }
        
      if(df_score$PREVIOUS_MH_EXPERIENCE[2] == "TRUE" & df$PREVIOUS_MH_PROJECT_EXPERIENCE[i] == "NO"){
         
         rank_multiplier <- 0
          
      }
  
      # Drivers License
     
       
         
  
      # Air brakes Endorcement
        
        if(df$CLASS_5[i] == "yes"){
          
          rank = as.numeric(df_score$PREVIOUS_MH_EXPERIENCE[1]) + rank
          
        }
        
        if(df_score$PREVIOUS_MH_EXPERIENCE[2] == "TRUE" & df$PREVIOUS_MH_PROJECT_EXPERIENCE[i] == "NO"){
          
          rank_multiplier <- 0
          
        }
  
      # Confined space
        
        if(df$CONFINED[i] == "yes"){
          
          rank = as.numeric(df_score$CONFINED_SPACE[1]) + rank
          
        }
        
        if(df_score$CONFINED_SPACE[2] == "TRUE" & df$CONFINED[i] == "NO"){
          
          rank_multiplier <- 0
          
        }
  
      # ability to operate boat
        
        if(grepl("BOAT", df$OPERATE_SEASONAL_VEHICLE[i], fixed=TRUE) == TRUE ){
          
          rank = as.numeric(df_score$BOAT[1]) + rank
          
        }
        
        if(df_score$BOAT[2] == "TRUE" & grepl("BOAT", df$OPERATE_SEASONAL_VEHICLE[i], fixed=TRUE) == FALSE){
          
          rank_multiplier <- 0
          
        }
        
  
      # ability to operate ATV
        
        if(grepl("ATV", df$OPERATE_SEASONAL_VEHICLE[i], fixed=TRUE) == TRUE ){
          
          rank = as.numeric(df_score$ATV[1]) + rank
          
        }
        
        if(df_score$ATV[2] == "TRUE" & grepl("ATV", df$OPERATE_SEASONAL_VEHICLE[i], fixed=TRUE) == FALSE){
          
          rank_multiplier <- 0
          
        }
        
  
      # Ability to operate snowmobile
        
        if(grepl("snowmobile", df$OPERATE_SEASONAL_VEHICLE[i], fixed=TRUE) == TRUE ){
          
          rank = as.numeric(df_score$SNOWMOBILE[1]) + rank
          
        }
        
        if(df_score$SNOWMOBILE[2] == "TRUE" & grepl("snowmobile", df$OPERATE_SEASONAL_VEHICLE[i], fixed=TRUE) == FALSE){
          
          rank_multiplier <- 0
          
        }
  
      # First aid current
        
        
  
      # First Aid previous
  
      # able to travel for work
  
      # possibly able to travel for work
  
      # travel by airplane
        
        if(df$TRAVEL_AIRPLANE_BOAT[i] == "Airplane only"){
          
          rank = as.numeric(df_score$AIRPLANE_TB[1]) + rank
          
        }
        
        
  
      # travel by boat
  
        if(df$TRAVEL_AIRPLANE_BOAT[i] == "Boat only"){
          
          rank = as.numeric(df_score$BOAT_TB[1]) + rank
          
        }
        
      # travel by airplane and boat
        
        if(df$TRAVEL_AIRPLANE_BOAT[i] == "Airplane and boat"){
          
          rank = as.numeric(df_score$TB_AIRPLANE_BOAT[1]) + rank
          
        }
  
      # some experience with workplace safety
        
        if(df$TRAVEL_AIRPLANE_BOAT[i] == "Airplane and boat"){
          
          rank = as.numeric(df_score$TB_AIRPLANE_BOAT[1]) + rank
          
        }
  
      # lots of experience with workplace safety
  
        
        
      # value per year of construction experience
  
        if(df$CONSTRUCTION[i] == "4+ Years"){
          
        }
        if(df$CONSTRUCTION[i] == "3 Years"){
          
        }
        if(df$CONSTRUCTION[i] == "2+ Years"){
          
        }
        if(df$CONSTRUCTION[i] == "2 Years"){
          
        }
        
        if(df$CONSTRUCTION[i] == "NO" & df_score$V_Y_WORKPLACE_CONSTRUCTION[2] == TRUE){
          rank_multiplier = 0
        }
        
        
        #_________________________________________________________________
        
        
        
  
      rank <- (rank * rank_multiplier)
      
      
      df[i, "score"] = rank
      
      print(i)
      
      }
      
         df <- df[order(df$score, decreasing = TRUE),]   
      
      
  return(df)
  
  
  
}




