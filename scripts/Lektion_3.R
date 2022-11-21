## 3. Data manipulation

#Indlæsning af data
#- forskellige typer data
#- csv, excel, JSON, mv.
test_csv <- read.csv(file = "./penguins_data.csv", header = T)
test_csv

install.packages("openxlsx")
test <- openxlsx::buildWorkbook(test_csv)
openxlsx::saveWorkbook(test, file = "./penguins_data.xlsx")
penguins <- openxlsx::read.xlsx(xlsxFile = "./penguins_data.xlsx")
penguins


## Brugbare funktioner - unikke værdier, head, tail
test_vektor <- c(1,2,3,3)
unique(test_vektor)

head(penguins, n = 20)
tail(penguins)

# Operatorer
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

2 <= 2

3 >= 2


c(1,2,3) == c(1,2,3)

c(1,2,3) < c(1,2,3)


# sammenligninger med characterer
# bogstavers "nummer" i alfabetet sammenlignes

"to" == "to"

c("en", "to","tre") == c("en","to","tre")

c("en", "to","tre") == c(1,"to","tre")


# & (AND), | (OR), ! (NOT)

2 > 1 & 2 < 1

2 > 1 | 2 < 1

!2==2

2 != 2


# Konditionelle operatorer
# if, else, else if, ifelse

tal_et <- 2
tal_to <- 3

if (2 < 3) {
  print("tal_et er lavere end tal_to")
}


if (tal_et < tal_to) {
  print("tal_et er lavere end tal_to")
} else {
  print("tal_to er lavere end tal_et")
}

tal_to <- 2
if (2 < 2) {
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



#### PAUSE




### Workflow funktioner
# For loops
vektor <- c(1,2,4)

length(vektor)

for (tal in vektor) {
  print(tal)
}


for (tal in seq(vektor)) {
  print(tal)
}

start <- 10
for (tal in vektor) {
  start <- start + 1
  print(start)
}


# While loops
i <- 0
below_10 <- 10

while (i >= below_10) {
  i <- i+1

  print(i)
  if(i >= below_10) {
    break
  }
}




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


# %in%
# bruges ved flere værdier

test_dataframe$test1[test_dataframe$test2 == c("tre", "to")] # Fungerer ikke


test_dataframe$test1[test_dataframe$test2 %in% c("tre", "to")]

# Udvidelse af dataframe med en ekstra kolonne 
test_dataframe$test3 <- c(10,20, 30)

# filtrering af dataframe med 2 filtre  & (AND), | (OR) 
test_dataframe$test1[test_dataframe$test2 %in% c("tre", "to") & test_dataframe$test3 == 20]

test_dataframe$test1[test_dataframe$test2 %in% c("to") | test_dataframe$test3 == 10]


# Filtrering med real-life data
penguins$flipper_length_mm[penguins$flipper_length_mm > 200 & penguins$sex == "female"]





### Øvelser
# Sammenlign nedenstående vektorer med to forskellige operatorer
test_vektor1 <- c(10,15,20)
test_vektor2 <- c(20,15,10)

# lav en sammenligning der benytter | eller !
1 != 1

# lav en if-else statement der sammenligner nedenstpende 2 værdier
test_vaerdi1 <- 5
test-vaerdi2 <- 6

# Lav et for-loop der printer nedenstående vektor ud
for_loop_vektor <- c(10,15,20)

# lav nedenstående while-loop færdigt, så det printer følgende ud: 1,2,3,5
i=0
while (i<6) {
  print(i)

}


### Dataframe øvelser
# Indlæs nedenstående hjemmeside fil 
"https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_daily_reports_us/10-30-2022.csv"

# Er der NA i dataframe?

# hvilke kolonner har NA?

# filtrer på dataframe, så kun Arizona kommer frem

# filtrer på dataframe, så kun stater med Case_Fatality_Ratio over 1 kommer frem

# filtrer på dataframe, så kun stater med Case_Fatality_Ratio over 1 og Confirmed over 30000 kommer frem





######################
### Øvelser løsning
# Sammenlign nedenstående vektorer med to forskellige operatorer
test_vektor1 <- c(10,15,20)
test_vektor2 <- c(20,15,10)

test_vektor1 != test_vektor2
test_vektor1 %in% test_vektor2


# lav en sammenligning der benytter | eller !
1 != 1
1 != 1 | 1 == 1

# lav en if-else statement der sammenligner nedenstpende 2 værdier
test_vaerdi1 <- 5
test_vaerdi2 <- 6

if (test_vaerdi1 < test_vaerdi2) {
  print("værdi 1 er lavere end værdi 2")
}

# Lav et for-loop der printer nedenstående vektor ud
for_loop_vektor <- c(10,15,20)
for (var in for_loop_vektor) {
  print(var)
}


# lav nedenstående while-loop færdigt, så det printer følgende ud: 1,2,3,5
i=0
while (i<5) {
  i <- i+1
  if (i == 4) {
    next 
  }
  print(i)
}


### Dataframe øvelser
# Indlæs nedenstående hjemmeside fil 
url <- "https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_daily_reports_us/10-30-2022.csv"

df <- read.csv(url)

# Er der NA i dataframe?
any(is.na(df))

# hvilke kolonner har NA?
any(is.na(df$Province_State))

kolonne_navne <- names(df)

for (kolonne in kolonne_navne) {
  if (any(is.na(df[kolonne]))) {
    print(kolonne)
  }
}

# Hvis vi vil vide hvor mange der er NA
for (kolonne in kolonne_navne) {
  if (any(is.na(df[kolonne]))) {
    antal_na <- sum(is.na(df[kolonne]))
    print(paste0(kolonne, " antal na: ", antal_na))
  }
}



# filtrer på dataframe, så kun Arizona kommer frem
df[df$Province_State == "Arizona",] # filtrerer kun på rækker, derfor er komma nødvendigt
df[df$Province_State == "Arizona", "Confirmed"] # med filtrering på kolonner

# filtrer på dataframe, så kun stater med Case_Fatality_Ratio over 1 kommer frem
df[df$Case_Fatality_Ratio > 1,]

# filtrer på dataframe, så kun stater med Case_Fatality_Ratio over 1 og Confirmed over 30000 kommer frem
df[df$Case_Fatality_Ratio > 1 & df$Confirmed > 30000,]

