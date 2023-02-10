# Estatistica basica
#Parte1 - Medidas de Posição
#Definindo a Pasta de Trabalho
#Substitua o caminho abaixo pela pasta no seu computador
setwd("C:/Users/grazi/Downloads/DCTSPESSOAIS/POWERBI/CAP12/6-Vendas")
getwd()

#Carregando o dataset

vendas<- read.csv ("vendas.csv", fileEncoding = "windows-1252")

# Resumo do dataset

View (vendas)
str (vendas)
summary (vendas$Custo)
summary (vendas$Valor)

#média
?mean
mean(vendas$Custo)
mean(vendas$Valor)

#média ponderada
?weighted.mean
weighted.mean(vendas$Valor, w = vendas$Custo)

#mediana
median(vendas$Valor)
median(vendas$Custo)

#moda - criando uma função
moda<- function(v){
  valor_unico <- unique(v)
  valor_unico[which.max(tabulate(match(v,valor_unico)))]
}
 
#obtendo a moda
resultado_valor <- moda(vendas$Valor)
print(resultado_valor)

resultado_custo <- moda(vendas$Custo)
print (resultado_custo)

#criando gráfico de média de valor de venda por estado com ggplot2
install.packages ("ggplot2")
library(ggplot2)

#criando gráfico
ggplot(vendas) +
  stat_summary(aes(x = Estado,
                   y = Valor),
               fun = mean,
               geom = "bar",
               fill = "lightgreen",
               col = "grey50") +
  labs (title = "Média de Valor de Venda Por Estado")


ggplot(vendas) +
  stat_summary(aes(x = Estado,
                   y = Custo),
               fun = max,
               geom = "bar",
               fill = "red",
               col = "grey50") + 
  labs(title = "Valor Máximo de Custo por Estado")
