# R - Grundlæggende data analyse og data visualisering Lektion 2

## Variabelnavne i R
test1 = "test1"
test1

test2 <- "test2"
test2

"test3" -> test3
test3

test. <- "test."
test.

test_ <- "test_"
test_
test_jeg_testerobjekt

test% <- "test"

test$ <- "test"

1test <- "test"

.1test <- "test"

_test <- "test"

## Hvad er en funktion?
x <- c(1,2,3)

mean(x)

mean(x = c(1,2,3))

?mean

# builtin functions, packages and custom functions
# reusable code# 
install.packages("remotes")
remotes::install_github("allisonhorst/penguins")
View(palmerpenguins::penguins)
# arguments
# action/output

test_vektor <- c(1,2,3)
mean(test_vektor)

print("test")

gangtal<-function(tal1, tal2) {
  resultat <- tal1 * tal2
  print(resultat)
  resultat <- resultat/7
  resultat
}
gangtal(5, 9)

## Datatyper
logisk <- c(T,F)
class(logisk)

integers <- integer(1)
class(integers)

numerisk <- 1.5
class(numerisk)

karakterer <- "ord"
class(karakterer)

kompleks <- 3i
class(kompleks)


# Datastrukturer
character <- c("en","to")
class(character)

vektor_numeric <- c(1,2)
class(vektor_numeric)

liste_simpel <- list(1,"en")
liste_simpel

liste_kompleks <- list(
  numerisk_vektor=vektor_numeric,
  character_vektor=vektor_character
)
liste_kompleks

matrice <- matrix(c(3, 9, -1, 4, 2, 6), nrow = 3)
matrice

dataframe <- data.frame(
  numerisk_kolonne=c(1,2,3),
  karakter_kolonne=c("en","to","tre"))
dataframe

a <- array(c('green','yellow'),dim = c(3,3,2))
print(a)

# Mangelfuld data
NA
str(NA)

str()

NaN
str(NaN)

NULL
str(NULL)


na_vektor <- c(NA, 1,2)
is.na(na_vektor)



#NA in dataset
airquality <- datasets::airquality
is.na(airquality)

is_na_overview <- is.na(airquality)

any(is_na_overview)
all(is_na_overview)

sum(is.na(airquality$Ozone)) / length(airquality$Ozone)

na.omit(airquality)



###

### særlige typer data/dataformater
## JSON
example <- jsonlite::fromJSON("https://tools.learningcontainer.com/sample-json.json")
example



####
# Øvelser
# Lav en vektor med 6 tal
vektor <- c(1,29,4,6,1,8)

# Lav en vektor med 5 tal og en NA

c(1,2,3,99)

c(1,2,3,4,5,NA)
# Tjek at der er NA i vektoren med en funktion

# lav en dataframe med 4 kolonner, 5 rækker og mindst 3 forskellige datatyper, hvoraf en celle skal være NA.
# Se også nedenstående eksempel
eksempel_dataframe <- data.frame(
  test=c(2,3,NA),
  test2=c("en","to","tre"),
  logisk=c(T,F,T)
)



# Fjern rækken der er NA

### Ekstra
# SKriv na. og vent på funktionerne der kommer frem.
# Læs på de forskellige na. funktioner og deres forskelle

### Ekstra
#Der findes også en anden datatype kaldet "faktor", som er en vektor der opdeles i "levels".
# Den eksisterer for at gøre computeringer hurtigere
# Omdan vektoren forneden til en factor-type med factor()
test_vektor <- c("en","to","en")
