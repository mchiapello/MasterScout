dvw <- dir_ls(paste0("matches/", mat), regexp = "dvw$")
x <- dv_read(dvw)
dv_meta_video(x) <- "https://youtu.be/iZ19EyhzNmQ"
# Remove local mp4 file
file_delete(dir_ls(paste0("matches/", mat), regexp = "mp4$"))

## extract the plays
px <- datavolley::plays(x)

px2 <- px %>% 
    filter(!is.na(player_id),
           team == "PGS Foglizzese") %>% 
    mutate(Nome = player_name,
           fondamentale = skill)

px3 <- px2 %>% 
    group_by(Nome, fondamentale) %>% 
    nest() %>% 
    arrange(Nome, fondamentale)

## define columns to show in the table
extra_cols <- c("player_name", "evaluation", "set_number",
                "home_team_score", "visiting_team_score")

setwd(paste0("matches/", mat))
map(px3 %>% filter(Nome != "unknown player") %>% 
        mutate(Nome = str_remove(Nome, " ")) %>% 
        pull(Nome) %>% 
        unique, fs::dir_create)
setwd(here::here())

px3 <- px3 %>% 
    filter(Nome != "unknown player") %>%
    mutate(out = map(data, ov_video_playlist, x$meta,
                     extra_cols = extra_cols),
           outfile = paste0(getwd(), "/matches/", mat, "/", str_remove(Nome, " "), "/", fondamentale, ".html"))

px4 <- px3 %>% 
    filter(fondamentale %in% c("Attack", "Reception", "Serve", "Set"))

for(i in 1:nrow(px4)){
    ov_playlist_to_html(px4$out[[i]], 
                        table_cols = extra_cols,
                        outfile = px4$outfile[i])
}


