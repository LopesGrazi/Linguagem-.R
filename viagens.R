#viagens a serviço gov/2019
#Carregando os dados
? read.csv
viagens <- read.csv(
  file = "C:/Users/grazi/Downloads/DCTSPESSOAIS/CURSOS/EVG_.R/2019_20230101_Viagens.csv\2019_Viagem.csv",
  sep = ';',
  dec = ','
)

head(viagens)
View(viagens)
dim(viagens)

?summary
summary(viagens)
summary(viagens$valor.passagens)

library(dplyr)
glimpse(viagens)
