ages <- c(5, 6)
names <- c("John", "James")

friends <- data.frame(names, ages)
View(friends)
str(friends)

friends$ages
friends$names

data()
View(starwars)
library(tidyverse)

starwars %>%
  filter(height > 150 & mass < 200) %>%
  mutate(height_in_meters = height/100) %>%
  select(height_in_meters, mass) %>%
  arrange(mass) %>%
  #View()
  plot()

View(msleep)

glimpse(msleep)

head(msleep)

class(msleep$name)

length(msleep)

length(msleep$name)

names(msleep)

unique(msleep$vore)

missing <- !complete.cases(msleep)

msleep[missing, ]

starwars %>% 
  select(name, height, mass)

starwars %>% 
  select(ends_with("color")) %>% 
  View()

starwars %>%
  rename("characters" = "name") %>% 
  head()

class(starwars$hair_color)

starwars$hair_color <- as.factor(starwars$hair_color)

class(starwars$hair_color)

starwars %>% 
  mutate(hair_color = as.character(hair_color)) %>% 
  glimpse()
