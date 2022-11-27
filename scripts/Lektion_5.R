## 5. Data udforskning og visualisering 

# Gennemgang af lektion 4 øvelser

# Deskriptiv statistik

penguins <- palmerpenguins::penguins

summary(penguins)

mean(penguins$bill_length_mm, na.rm = TRUE)

median(penguins$bill_length_mm, na.rm = TRUE)

unique(penguins$species)

max(penguins$bill_length_mm, na.rm = TRUE)

min(penguins$bill_length_mm, na.rm = TRUE)

class(penguins$bill_length_mm)

str(penguins$bill_length_mm)

str(penguins)




### Visualisering i R basic
plot(penguins$body_mass_g) # x axis baseres på rækkefølgen (index)
View(penguins)


# randomisering

runif(20, 0, 20) # random uniform

sample(c(1:20), size = 10)
sample(c(1:20), size = 25, replace = T)


# for at randomisere index
sample(length(penguins$species)) 
penguins_random <- penguins[sample(length(penguins$species)),]

plot(penguins_random$body_mass_g)

### histogram
hist(penguins$body_mass_g)

hist(penguins$body_mass_g,breaks = 50)
rug(penguins$body_mass_g)

### scatterplot
plot(penguins$body_mass_g, penguins$bill_length_mm)
rug(penguins$body_mass_g)

### Boxplot
plot(penguins$species, penguins$bill_length_mm)

plot(penguins$sex, penguins$body_mass_g)

### barplot
plot(penguins$species, penguins$island)


### scatterplot 
datasets::women

plot(datasets::women$height, datasets::women$weight)

plot(datasets::women)

plot(datasets::women$height, datasets::women$weight, 
     type = "b", main = "Kvinders højde vs vægt", 
     xlab = "Vægt", ylab = "Højde", xlim = c(50,75))



# Install package ggplot2
install.packages("ggplot2")
library(ggplot2)

# clean dataset
penguins_clean <- na.omit(penguins)

# Histogram
ggplot(penguins_clean, aes(body_mass_g)) +
  geom_histogram()

# boxplot
ggplot(data = penguins_clean, 
       mapping = aes(sex, body_mass_g)) +
  geom_boxplot()

# scatter of sex vs mass + jitter
ggplot(data = penguins_clean, 
       mapping = aes(sex, body_mass_g)) +
  geom_point() # + geom_jitter()

# simple scatterplot
ggplot(penguins_clean, 
       aes(body_mass_g, bill_length_mm)) +
  geom_point()

# scatterplot with title and rug
ggplot(penguins_clean, 
       aes(body_mass_g, bill_length_mm)) +
  geom_point() +
  labs(title = "Penguin Mass vs Bill Length - grouped in species",
       x = "Mass", y = "Bill Length") +
  geom_rug()

# scatterplot with species as color
ggplot(penguins_clean, 
       aes(body_mass_g, bill_length_mm)) +
  geom_point(aes(color=species)) +
  geom_hline(yintercept = mean(penguins_clean$bill_length_mm), col="blue") +
  geom_vline(xintercept = mean(penguins_clean$body_mass_g), col="red") 


# Øvelser
# Plotting med base R
mtcars <- mtcars
# Lav et Histogram med disp kolonnen i mtcars datasættet 

# Lav et scatterplot med mtcars kolonnerne hp og disp

# Lav et scatterplot hvor du selv vælger 2 kolonner fra mtcars datasættet 
# eller penguins datasættet. Giv det en titel og giv akserne navne


# GGplot2
# Lav et histogram i ggplot2 - vælg selv dit datasæt eller brug mtcars

# lav et boxplot i ggplot2

# Lav et scatterplot med brug af 2 kolonner i ggplot2

# Lav et scatterplot der bruger 2 kolonner og laver farver med en 3. kolonne
