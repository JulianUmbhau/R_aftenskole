# R - Grundlæggende data analyse og data visualisering Lektion 1 - R og Rstudio

## Mulighederne med R

### Data manipulation
library(dplyr)
mtcars
View(mtcars)

mtcars %>% 
  filter(cyl < 6)

### Deskriptiv Statistik
mtcars$hp
mean(mtcars$hp)


fit <- lm(formula = hp ~ cyl+disp, data = mtcars)
fit

library(ggplot2)
ggplot(mtcars, aes(cyl, hp))+
  geom_point() +
  stat_smooth(method = "lm")


