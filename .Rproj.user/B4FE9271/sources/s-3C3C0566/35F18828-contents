# Needed libraries
library(datavolley)
library(ovideo)
library(ovscout2)
library(tidyverse)
library(fs)

# Create match folder
date <- "2022-05-22"
us <- "PGS Foglizzese"
opp <- "TSEC"
mat <- paste0(date, "_", opp)
dir_create(paste0("matches/", match)) 
    
# Match info
match <- tibble(date = lubridate::ymd(date),
                time = lubridate::hms("16:00:00"),
                season = "2021-2022",
                league = "POU13F UISP",
                phase = "girone unico",
                home_away = FALSE,
                day_number = NA,
                match_number = NA,
                text_encodong = 1,
                regulation = "indoor rally point",
                zones_or_cones = "Z")

# TEAMS
teams <- tibble(team_id = c("FOG", opp),
                team = c(us, opp),
                set_won = c(3, 2),
                coach = c("Berardi", "Unknow"),
                assistent = c("Chiapello", "Unknow"),
                shirt_colour = c("White", "Blue"),
                X7 = NA,
                home_away_team  = c("*", "a"),
                won_match = c(TRUE, FALSE))



# Video file
video_file <- dir_ls(paste0("matches/", mat), regexp = "mp4$")


