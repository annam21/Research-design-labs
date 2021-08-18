library(tidyverse)
library(gapminder)

# write_csv(gapminder, "data/gapminder.csv")

# Clean Penguins for class
peng <- read_csv("data/Penguin data.csv")
peng2 <- peng %>% 
  rename(sample_number = `Sample Number`,
         individualID = `Individual ID`,
         clutch_completion = `Clutch Completion`,
         date_egg = `Date Egg`,
         culmen_length_mm = "Culmen Length (mm)",
         culmen_depth_mm = "Culmen Depth (mm)",
         flipper_length_mm = "Flipper Length (mm)",
         body_mass_g = "Body Mass (g)"
        ) %>% 
  select(-`Delta 15 N (o/oo)`, -`Delta 13 C (o/oo)`) %>% 
  drop_na() # Loses A TON of rows 

# Plot the data
ggplot(peng2) + 
  geom_point(aes(x = body_mass_g, y = flipper_length_mm, color = Species))

write_csv(peng2, "data/penguins_clean.csv")

# Test it 
read_csv( "data/penguins_clean.csv")
read.csv( "data/penguins_clean.csv")
