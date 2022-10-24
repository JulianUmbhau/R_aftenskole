## 3. Data manipulation

Forstå en dataframe
- rækker
- kolonner

Indlæsning af data
- forskellige typer data
- csv, excel, JSON, mv.

test_csv <- read.csv(file = "./data/test_csv.csv", header = T)
test_csv






Operatorer
# assignment
test <- "pil"

"pil" -> test

test = "pil"


# minus, addition, multiplikation, division
3-2

3+2

3*2

3/2


# <, >, ==
3 == 2

3 > 2

3 < 2

2<=2

3>=2

"to" == "to"

"to" < "tre"

"fire" < "fem"


# &, |, !

2 > 1 & 2 < 1

2 > 1 | 2 < 1

!2==2


# Konditionelle operatorer
# if, else, else if, ifelse

tal_et <- 2
tal_to <- 3
if (tal_et < tal_to) {
  print("tal_et er lavere end tal_to")
}


if (tal_et < tal_to) {
  print("tal_et er lavere end tal_to")
} else {
  print("tal_to er lavere end tal_et")
}

tal_to <- 2
if (tal_et < tal_to) {
  print("tal_et er lavere end tal_to")
} else {
  print("tal_to er lavere end tal_et")
}

tal_to <- 2
if (tal_et < tal_to) {
  print("tal_et er lavere end tal_to")
} else if (tal_et > tal_to) {
  print("tal_to er lavere end tal_et")
} else {
  print("tal_to er hverken højere eller lavere end tal_et")
}


### Workflow funktioner
# For loops
vektor <- c(1,2,4)
for (tal in vektor) {
  print(tal)
}

for (tal in seq(vektor)) {
  print(tal)
}

start <- 10
for (tal in vektor) {
  start =+ start+1
  print(start)
}


# While loops
i <- 0
below_10 <- 10
while (below_10) {
  i <- i+1

  if (i==2) {
    next
  }

  print(i)
  if(i>=below_10) {
    break
  }
}


### Filtrering
test_dataframe <- data.frame(test1=c(1,2,3), test2=c("en","to","tre"))

# []
test_dataframe[1]

test_dataframe[1,]

test_dataframe[,1]

test_dataframe["test2"]

test_dataframe[1,"test2"]

test_dataframe[1:2,]

# $
test_dataframe$test2

test_dataframe$test2[1:2]

# [[]]
class(test_dataframe[2])

class(test_dataframe[[1]])
class(test_dataframe[[2]])

# Filtrering på indhold
test_dataframe

test_dataframe[1]

test_dataframe$test2

test_dataframe$test1[test_dataframe$test2 == "tre"]



### Øvelser
# Dataframe øvelser
# Indlæs en fil / Dan en dataframe
# filtrer på dataframe
