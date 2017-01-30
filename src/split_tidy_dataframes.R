# Script for splitting, and cleaning, full dataset:
library(tidyverse)

bat_dat <- read_csv(file = "./data/bat_dat.csv")
# separate site number from urban status for urban sites (Habitat == 0)
bat_dat <- bind_rows(bat_dat %>% slice(1:116) %>% mutate(Urban = NA),
          bat_dat %>% 
                  slice(117:nrow(.)) %>%
                  separate(Site,into = c("Site", "Urban"), fill = "left",extra = "drop")) %>%
        select(Site, Habitat, Season, Urban, 4:(ncol(.) - 1))
# split into 
survey_data <- bat_dat %>% select(Site, Season:Moon, Temp,Humidity)
site_data <- bat_dat %>% 
        select(Site, Urban, NatEx:Distance1sttree) %>% 
        distinct()

# why are arent duplicate entries removing??  
# which variables are not matching? 
# Which sites have duplicate entries with errors?

site_data %>% 
        gather(., -Site, key = variable, value = value) %>% 
        group_by(Site, variable) %>% 
        mutate(same = ifelse(first(value) == last(value), "match", "no_match")) %>%
        filter(same == "no_match")

# select the sites with errors, and their variable with errors. well take the longest value / non-rounded value as the correct one, we can basically just remove these by filtering them out then.. Just take the "first" values for each combination of Site and variable.

site_data %<>% 
        gather(., -Site, key = variable, value = value) %>% 
        group_by(Site, variable) %>% 
        summarise(value = first(value)) %>%
        ungroup() %>%
        spread(key = variable,value = value, convert = TRUE) #convert because col was mix of types before gathering

survey_data %>% write_csv(., path = "./data/survey_data.csv")
site_data %>% write_csv(., path = "./data/site_data.csv")

