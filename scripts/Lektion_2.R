# R - Grundlæggende data analyse og data visualisering Lektion 2

## Variable i R
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

test% <- "test"

test$ <- "test"

1test <- "test"

.1test <- "test"

_test <- "test"

## Hvad er en funktion?
mean(x = c(1,2,3))
# builtin functions, packages and custom functions
# reusable code

# arguments
# action/output

test_vektor <- c(1,2,3)
mean(test_vektor)

print("test")


## Datatyper
logisk <- TRUE
class(logisk)

integers <- integer(1)
class(integers)

numerisk <- 1
class(numerisk)

karakterer <- "ord"
class(karakterer)

kompleks <- 3i
class(kompleks)


# Datastrukturer
vektor_character <- c("en","to")
class(vektor_character)

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



na_vektor[!is.na(na_vektor)]






### særlige typer data/dataformater
## JSON
example <- jsonlite::fromJSON("https://tools.learningcontainer.com/sample-json.json")
example
