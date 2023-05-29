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

# Changing factor levels
df <- starwars
df$sex <- as.factor(df$sex)

levels(df$sex)

df <- df %>% 
  mutate(sex = factor(sex,
                      levels = c("male", "female", "hermaphroditic", "none"
                                 )))

# Filter rows
starwars %>% 
  select(mass, sex) %>% 
  filter(mass < 55 &
           sex == "male")

# Recode data
starwars %>% 
  select(sex) %>% 
  mutate(sex = recode(sex,
                      "male" = "man",
                      "female" = "woman"))

# Dealing with missing data
mean(starwars$height, na.rm = TRUE)

starwars %>%
  drop_na(hair_color)

# Dealing with duplicates
Names <- c("Peter", "John", "Andrew", "Peter")
Age <- c(22, 33, 44, 22)

friends <- data.frame(Names, Age)

friends

friends %>% 
  distinct()

distinct(friends)

# Manipulate
starwars %>% 
  mutate(height_m = height/100) %>% 
  select(name, height, height_m)

# Conditional changes
starwars %>% 
  mutate(height_m = height/100) %>% 
  select(name, height, height_m) %>% 
  mutate(tallness = 
           if_else(height_m < 1,
                   "short",
                   "tall"))

# Reshape data with Pivot wider
install.packages("gapminder")
library(gapminder)
View(gapminder)

data <- select(gapminder, country, year, lifeExp)

# Reshape to make shorter
wide_data <- data %>%
  pivot_wider(names_from = year, values_from = lifeExp)

View(wide_data)

# Reshape data with Pivot longer
long_data <- wide_data %>% 
  pivot_longer(2:13, 
               names_to = "year",
               values_to = "lifeExp")

View(long_data)
