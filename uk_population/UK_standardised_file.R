library(tidyverse)
library(janitor)

ons <- read_csv("RM121-2021-1.csv") %>%
  clean_names()  # simplify column names

ons_clean <- ons %>%
  rename(
    age = age_23_categories,    # age bands
    sex = sex_2_categories,
    uk_pop = observation
  ) %>%
  mutate(
    sex = tolower(sex),
    sex = recode(sex, female = "f", male = "m")
  )

# Map ONS age bands → your study groups
ons_clean <- ons_clean %>%
  mutate(
    age_group = case_when(
      str_detect(age, "18|19|20 to 24|25 to 29|30 to 34|35 to 39") ~ "18-39",
      str_detect(age, "40 to 44|45 to 49|50 to 54|55 to 59|60 to 64") ~ "40-64",
      str_detect(age, "65 to 69|70 to 74|75 to 79|80 to 84|85") ~ "65+",
      TRUE ~ NA_character_
    )
  ) %>%
  filter(!is.na(age_group))   # keep adults only


# Aggregate to final structure
uk_std <- ons_clean %>%
  group_by(age_group, sex) %>%
  summarise(
    uk_pop = sum(uk_pop, na.rm = TRUE),   # total population
    .groups = "drop"
  ) %>%
  mutate(
    uk_weight = uk_pop / sum(uk_pop)      # convert to proportions
  )


uk_std
