
## 4. Grundlæggende kodning i R

#Se på lektion 3 øvelser!


# Hvad er pakker i R?
# Ideen bag open source og code

# Ideen bag pakker
# pakke overview: 
"https://cran.r-project.org/"



# Kode igennem scripts

# Ideen bag reproducerbare analyser

# Kommentarer i kode



# Gode funktioner til oversigt
# table

table(mtcars$gear)

summary(mtcars$wt)

summary(mtcars)


# Dataframe funktioner

test_df1 <- data.frame(
  ID1=c("en","to","tre","fire"),
  kolonne1=c(1,2,3,4), 
  kolonne2=c(10,20,30,40)
)

test_df2 <- data.frame(
  ID1=c("en","to","tre","fire"),
  kolonne1=c(11,12,13,14), 
  kolonne2=c(100,200,300,400)
)

#Sæt datasæt sammen ved kolonner - ens antal rækker kræves
cbind(test_df1, test_df2)

fail_df1 <- data.frame(
  kolonne1=c(1,2,3), 
  kolonne2=c(100,200,300)
)
cbind(test_df1, fail_df1)

# Sæt datasæt sammen ved rækker - ens antal kolonner kræves
rbind(test_df1, test_df2)

fail_df2 <- data.frame(
  kolonne1=c(1,2,3), 
  kolonne2=c(100,200,300), 
  kolonne3=c(10,20,30)
)
rbind(test_df1, fail_df2) # fejler pga forkerte kolonnenavne

fail_df3 <- data.frame(ID=c("en","to","tre"), fail_df2)
rbind(test_df1, fail_df3) # fejler pga forkerte kolonnenavne

# Sæt datasæt sammen ved rækker med en fælles id
View(merge(x = test_df1, 
           y = test_df2, 
           by.x = "ID1", 
           by.y = "ID1"))


# Scopes i R
# Environments - Hvor kigger R efter objekter/funktioner - se også environments tab
search()

library(palmerpenguins)

search()




# Hvordan laver man en funktion i R?
# - definition
# - scope - funktion foregår i undermiljø
# - input
# - output

test_variabel <- "test"

hej_funktion <- function(argument1="Julian", argument2) {
  test_variabel <- argument1
  
  print(paste0("Hej, jeg hedder: ", argument1))
}

# funktion med default værdi
test_variabel <- hej_funktion()
test_variabel
# med specificeret værdi
hej_funktion("test", "Jan")

# variable udenfor funktionen ændres ikke
test_variabel

# variable defineret i scope over funktionen kan godt bruges, men det er farligt fordi miljøer er midlertidige
test_variabel <- "test"

hej_funktion <- function(argument1="Julian") {
  print(test_variabel)
  test_variabel <- argument1
  print(paste0("Hej, jeg hedder: ", argument1))
}

hej_funktion()

ls()

rm("test_variabel")
ls()

rm(list=ls())
ls()


#Best practice
#- Brug en editor, gerne RStudio
#- Indentation
  #  ctrl+i
#- 80 karakterer brede sætninger
#- Variabelnavne/funktionsnavne
  # - simple, uden tal, engelsk
  # - funktioner beskriver funtionaliteten
  # - variable og datasæt beskriver indhold
#- DRY - Dont Repeat Yourself
#- Minimale og Generiske funktioner


# eksempel på ikke-generisk funktion
tal1 <- 1
tal2 <- 2
tal3 <- 3

plus_og_divider <- function(tal1, tal2, tal3) {
  resultat <- tal1 + tal2 
  resultat <- resultat / tal3
  resultat
}
plus_og_divider(tal1, tal2, tal3)



# Brug istedet separate funktioner
plus <- function(tal1, tal2) {
  resultat <- tal1 + tal2
  resultat
}
tal4 <- plus(tal1, tal2)

divider <- function(tal3, tal4) {
  resultat <- tal4 / tal3
  resultat
}
divider(tal4, tal3)




### Smagsprøve på data visualisering
plot(x = test_df1$kolonne2, y = test_df1$kolonne1)
hist(mtcars$cyl)




### Øvelser
# Dataframe øvelser
penguins <- palmerpenguins::penguins

# Find antallet af NA i sex kolonnen
sum(is.na(penguins$sex))

# Find pingviner som har bill_length_mm over 40, fra 2008, med body_mass_g under 3500. Print deres flipper_length_mm
penguins[penguins$bill_length_mm > 40 & 
           penguins$year == 2008 & 
           penguins$body_mass_g < 3500,]

penguins$flipper_length_mm[penguins$bill_length_mm > 40 & penguins$year == 2008 & penguins$body_mass_g < 3500]


# Sæt nedenstående dataframes sammen på to forskellige måder. 
# Sæt ID_kolonne_vektor ind hvis nødvendigt.

ID_kolonne_vektor=c("A","B","C","D")

df1 <- data.frame(
  ID=c("A","A","B","C"),
  tal_kolonne=c(23,30,25,20),
  tekst_kolonne=c("ord1","ord2","ord3","ord4")
)

df2 <- data.frame(
  tal_kolonne=c(22,35,25,10),
  tekst_kolonne=c("ord6","ord2","ord9","ord4")
)

cbind(df1, df2)

df2_with_ID <- cbind(ID_kolonne_vektor, df2)

merge(x = df1, y = df2_with_ID, by.x = "ID", by.y = "ID_kolonne_vektor")

### For at lave nye kolonner i eksisterende dataframe
df2$ID <- ID_kolonne_vektor
df2["ID"] <- ID_kolonne_vektor
### For at lave om på kolonners navne
new_order <- c("ID","tal_kolonne","tekst_kolonne")
df2 <- df2[, new_order]

# find på en funktion der giver en sætning tilbage hvor input_ordet indgår i en sætning som printes ud
faerdig_saetning <- function(input) {
  print(paste0("Jeg printer: ", input))
}

faerdig_saetning("test")

# find på en funktion der sammenligner 2 tal for at se om de er ens,
# printer resultatet, og ændr funktionen så tal nummer 2 får en default værdi
tal_sammenligning <- function(tal1, tal2=2) {
  ens <- tal1 == tal2
  print(ens)
}
tal_sammenligning(2)

