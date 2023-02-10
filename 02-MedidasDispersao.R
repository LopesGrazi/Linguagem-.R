#Estatistica Básica

#Parte 2 - Medidas de Dispersão

#Definindo a Pasta de Trabalho
setwd("C:/Users/grazi/Downloads/DCTSPESSOAIS/POWERBI/CAP12/6-Vendas")
getwd

#Carregando o dataset
vendas <- read.csv("Vendas.csv", fileEncoding = "windows-1252")

#Resumo do dataset
View (vendas)
str(vendas)
summary(vendas$Valor)


#Variancia
var(vendas$Valor)

#Desvio Padrão
sd(vendas$Valor)
