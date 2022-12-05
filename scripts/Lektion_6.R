## 6. Pipes og Tidyverse

# Øvelser fra sidst




# Tidyverse
# Hvad er tidyverse?
# core tidyverse
# - ggplot2
# - dplyr - data manipulation
# - tidyr - data "rengøring"
# - readr - indlæsning af data
# - purrr - effektivt alternativ til loops
# - tibble - alsidigt alternativ til dataframe
# - stringr - funktioner til arbejde med strings
# - forcats - funktioner til arbejde med factors
# Ekstra tidyverse pakker
# - tidymodels
# - lubridate
# - hms - time-day-values


library(dplyr)
# tibbles dataframe
# ændrer ikke variabelnavne, strings bliver ikke sat som factors
mtcars_tibble <- tibble(mtcars)
mtcars_tibble

print(mtcars_tibble, n=2)

colnames(mtcars_tibble)


# Forstå pipes
# simpel filtrering
mtcars_tibble[mtcars_tibble$cyl > 4,]
mtcars_tibble %>%
  filter(cyl > 4)

# filtrering på flere variable
mtcars_tibble[mtcars_tibble$cyl < 5 & mtcars_tibble$hp > 100 & mtcars_tibble$gear < 5,]
mtcars_tibble %>%
  filter(cyl < 5 & hp > 100 & gear < 5)

# ny variabel dannes og bruges til filtrering
mtcars_tibble["hp_per_cyl"] <- mtcars_tibble$hp/mtcars_tibble$cyl
mtcars_tibble[mtcars_tibble$hp_per_cyl >30,]

mtcars_tibble %>%
  mutate(hp_per_cyl = hp/cyl) %>%
  filter(hp_per_cyl)

# ny variabel dannes, vi filtrerer på den og vil kun se et udvalg af variable
mtcars_tibble["hp_per_cyl"] <- mtcars_tibble$hp/mtcars_tibble$cyl
mtcars_tibble[mtcars_tibble$hp_per_cyl >30, c("hp","cyl","hp_per_cyl")]

mtcars_tibble %>%
  mutate(hp_per_cyl = hp/cyl) %>%
  filter(hp_per_cyl > 30) %>%
  select(hp, cyl, hp_per_cyl)

# arrange
mtcars_tibble %>%
  mutate(hp_per_cyl = hp/cyl) %>%
  filter(hp_per_cyl > 30) %>%
  select(hp, cyl, hp_per_cyl) %>%
  arrange(hp_per_cyl)

mtcars_tibble %>%
  mutate(hp_per_cyl = hp/cyl) %>%
  filter(hp_per_cyl > 30) %>%
  select(hp, cyl, hp_per_cyl) %>%
  arrange(desc(hp_per_cyl))

# group by
mtcars_tibble$avg_hp[mtcars_tibble$cyl == 4] <- mean(mtcars_tibble$hp[mtcars_tibble$cyl == 4])
mtcars_tibble$avg_hp[mtcars_tibble$cyl == 6] <- mean(mtcars_tibble$hp[mtcars_tibble$cyl == 6])
mtcars_tibble$avg_hp[mtcars_tibble$cyl == 8] <- mean(mtcars_tibble$hp[mtcars_tibble$cyl == 8])

mtcars_tibble$avg_hp

mtcars_tibble$avg_hp <- NULL

mtcars_tibble %>%
  group_by(cyl) %>%
  mutate(avg_hp = mean(hp)) %>%
  select(avg_hp)

mtcars_tibble %>%
  group_by(cyl) %>%
  mutate(avg_hp = mean(hp)) %>%
  ungroup() %>%
  select(avg_hp)


# opsummering data med summarise
mtcars_tibble %>%
  summarise(n = n(),
            wt_avg = mean(wt),
            wt_median = median(wt)
            )


mtcars_tibble %>%
  group_by(cyl) %>%
  summarise(n = n(),
            wt_avg = mean(wt),
            wt_median = median(wt))


# binding rows and columns
df1 <- tibble(v1=c(1,2,3), v2=c(2,3,4))
df2 <- tibble(v1=c(1,2,3), v2=c(2,3,4))
bind_rows(df1, df2, .id = "orig_df")

bind_cols(df1, df2, .name_repair = "unique")
bind_cols(df1, df2, .name_repair = "check_unique")

# nesting
mtcars %>%
  group_by(cyl)

test_nest <- mtcars %>%
  group_by(cyl) %>%
  tidyr::nest()
test_nest
test_nest$data

# unnesting
tidyr::unnest(test_nest,
              cols = c(data)) %>%
  ungroup()
# tidyr pivots - long - wide
penguins <- palmerpenguins::penguins

tidyr::pivot_wider(mtcars, names_from = "cyl", values_from = "hp") %>%  View

tidyr::pivot_wider(penguins, id_cols = c("island", "year"), names_from = "species", values_from = "bill_length_mm")

tidyr::pivot_longer(penguins)




# Øvelser - tidyverse
install.packages("palmerpenguins")
install.packages("dplyr")
install.packages("tidyr")
install.packages("tibble")
library(dplyr)
library(tidyr)
library(tibble)

penguins <- palmerpenguins::penguins

#find datatypen for penguins datasættet - er det en tibble dataframe? Hvis ikke, lav det om til en tibble

# Lav en filtrering så kun Adelies species vises, med brug af pipes

# Lav en filtrering med brug af flere variable, brug pipes

# Lav en ny variabel ved at bearbejde to eksisterende variable i penguins

# Filtrer på denne variabel i samme pipe som den dannes

# udvælg to variable som skal printes ud, og sorter dem i samme ombæring vha. pipes

# udregn gennemsnits flipper_length vha summarise

# Udregn gennemsnits flipper_length for de tre forskellgie arter, vha. summarise og group by

df1 <- tibble(v1=c(1,2,3), v2=c(20,30,40))
df2 <- tibble(v1=c(10,20,30), v2=c(2,3,4))
# brug bind_rows og bind_cols på df1 og df2

# lav nesting af data, på island variablen

