#Estatistica Básica

#Parte 3 - Medidas de Posição Relativa

#Cuidado: A Linguagem R é Case Sensitive

#Definindo a pasta de trabalho

setwd("C:/Users/grazi/Downloads/DCTSPESSOAIS/POWERBI/CAP12/6-Vendas")
getwd

#Carregando o dataset
vendas <- read.csv ("vendas.csv", fileEncoding = "windows-1252")

#Resumo de dados
head(vendas)
tail(vendas)
View(vendas)

#Medida de Tendência Central
summary(vendas$Valor)
summary(vendas[c('Valor', 'Custo')])

#Explorando Variáveis Numéricas

mean(vendas$Valor)
median(vendas$Valor)
quantile(vendas$Valor)
quantile(vendas$Valor, probs = c(0.01, 0.99))
quantile (vendas$Valor, seq(from = 0, to = 1, by = 0.20))
IQR(vendas$Valor) 
range(vendas$Valor)
summary(vendas$Valor)
diff(range(vendas$Valor))
