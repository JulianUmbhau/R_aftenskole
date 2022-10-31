
## 4. Grundlæggende kodning i R
# Hvad er pakker i R?
# Ideen bag open source og code

# Ideen bag pakker
# pakke overview: 
"https://cran.r-project.org/"



# Kode igennem scripts

# Ideen bag reproducerbare analyser

# Kommentarer i kode






# Dataframe funktioner



- cbind
- rbind
- merge



# Scopes i R
# Environments
search()

# Hvordan laver man en funktion i R?
  # - definition
  # - scope - funktion foregår i undermiljø
  # - input
  # - output

test_variabel <- "test"

hej_funktion <- function(argument1="Julian") {
  test_variabel <- argument1
  
  print(paste0("Hej, jeg hedder: ", argument1))
}

# funktion med default værdi
hej_funktion()
# med specificeret værdi
hej_funktion("Jan")

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

rm("test_variabel")
hej_funktion()


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



### Øvelser
# Dataframe øvelser


# find på en funktion med en sætning
# find på en funktion med tal og en default værdi

