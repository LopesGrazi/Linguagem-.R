mensagem <- "Hello word"
print(mensagem)

# Isto é um comentário

?print
?str

#instalando um pacote

install.packages("ggplot2")

#carregando um pacote
library(ggplot2)

#Vetores
#Criando vetores
?c()
cidade <- c("Brasilia",
            "São Paulo",
            "Rio de Janeiro",
            "Porto Alegre")

#Visualizando os dados do vetor cidade

tenperatura <- c(32,22,35,17)
temperatura <- tenperatura

regiao <- c(1,2,3,4)

#acessando o primeiro elemento
cidade[1]

#acessando um intervalo de elementos
temperatura [1:3]

#copiando um vetor
cidade2 <- cidade
cidade2

#Excluindo o segundo elemento da consulta
temperatura[-2]

#Alterando um vetor
cidade2[3] <- "Belo Horizonte"
cidade2

#Adicionando um novo elemento
cidade2[5] <- "Curitiba"
cidade2

#Deletando valor
cidade2 <- NULL
cidade2

#Fator
?factor
grau.instrucao <- factor(c("Nível Médio",
                           "Superior",
                           "Nível Médio",
                           "Fundamental"),
             levels = c ("Fundamental",
                         "Nível Médio",
                         "Superior"),
             ordered = TRUE)
grau.instrucao

#Listas
?list()
pessoa <- list(sexo = "M", cidade = "Brasilia", idade = 20)
pessoa

#acessando o primeiro elemento da lista
pessoa[1]

#acessando o valor do primeiro elemento da lista
pessoa[[1]]

#editando a lista
pessoa [["idade"]] <- 22
pessoa

pessoa[["sexo"]]<- "F"
pessoa

pessoa [["cidade"]]<- "Contagem"
pessoa

pessoa [["idade"]] <- 22
pessoa

#filtrando elementos da lista
pessoa[c("cidade", "idade")]

#listas de listas
cidades <- list (cidade = cidade,
                 temperatura = temperatura,
                 regiao = regiao)
cidades

#criando um dataframe com vetores
df <- data.frame (cidade,temperatura)
df

#criando uma data frame com lista
df2 <-data.frame (cidades)
df2

#filtrando valores do data frame
#recuperando o valor da linha 1, coluna 2
df[1,2]

#todas as da primeira coluna
df[,1]

#primeira linha e todas as colunas
df[1,]

#selecionando as 3 primeiras linhas
#da primeira e ultima coluna
df2[c(1:3), c(1,3)]

#verificando o nome das colunas
names(df)

#verificando numero de linhas x colunas
dim(df)

#verificando os tipos de dados
str(df)

#Acessar uma coluna do dataframe
df$cidade
df['cidade']

#matrizes
m<- matrix(seq(1:9), nrow = 3)
m

m2 <- matrix(seq(1:30),
             ncol = 5,
             byrow = TRUE,
             dimnames = list(c(seq(1:6)),
                             c('A','B','C','D','E')
                             )
             )
m2

#filtrando a matriz
m2[c(1:2), c("B","C")]

#Loops
#For
#for (valor in sequencia){
#codigo...
#  }

#exemplo for
for (i in seq(12)){
  print(i)
}
#whilw
#while(condicao){
#codigo
#}

i <- 0
while (i <- 10){
  #codigo
  print(i)
  i = i +1
}

#controle de fluxo
#if (condicoao){
#codigo...
# }

x=10
if (x>0){
  print("numero positivo")
}

nota <- 4
if (nota >= 7){
  print("Aprovado")
} else if(nota >5 && nota <7){
  print("Recuperação")
} else {
  print ("Reprovado")
}

#criando a função
par.impar <- function(num){
  if((num%%2)==0){
    return("Par")
  } else
    return ("Impar")
  }
#usando a função
num = 3
par.impar(num)

#Apply()
?apply

x <- seq(1:9)
matriz <- matrix(x,ncol=3)
matriz

result1 <- apply(matriz,1,sum)
result1

result2 <- apply (matriz,2,sum)
result2

#list

numeros.p <- c(2,4,6,8,10,12)
numeros.i <- c(1,3,5,7,9,11)
numeros <- list(numeros.p,numeros.i)
numeros

#lapply (linhas quebradas)
lapply (numeros,mean)

#saplly (mesma linha)
sapply(numeros,mean)


#criando gráficos

?mtcars
carros <- mtcars[,c(1,2,9)]

head (carros)

hist(carros$mpg)

plot (carros$mpg,carros$cyl)

#install.packages("ggplot2")
library(ggplot2)

ggplot(carros, aes(am))+
  geom_bar()

#join

#install.packages("dplyr")
library (dplyr)

df1 <- data.frame(Produto = c(1,2,3,5),Preço = c(15,10,25,20))
head(df1)


df2 <- data.frame(Produto = c(1,2,3,4), Nome = c("A","B","C","D"))
head(df2)

#left_join
df3 <- left_join(df1,df2,"Produto")
head(df3)

#right_join
df4 <- right_join(df1,df2,"Produto")
head(df4)

#inner_join
df5 <- inner_join(df1,df2,"Produto")
head(df5) 

#DPLYR
? iris
?dplyr

head(iris)
glimpse(iris)

#filter - filtrando os dados - apenas versicolor
versicolor <- filter(iris, Species == "versicolor")
dim(versicolor)

#Slice - selecionando algumas linhas específicas
slice(iris,5:10)

#select - selecionando algumas colunas
select (iris, 2:4)

#todas colunas exceto sepal width
select(iris, -Sepal.Width)

#criando uma nova coluna com base em colunas existentes
iris2 <- mutate(iris, nova.coluna = Sepal.Length + Sepal.Width)

iris2[,c("Sepal.Length","Sepal.Width","nova.coluna")]

#Arrange - ordenar os dados
?arrange

select(iris,Sepal.Length)%>%
arrange(Sepal.Length)

#group_by _ agrupar os dados por uma determinada coluna

iris %>% group_by(Species)%>%
  summarise (mean(Sepal.Length))

#Tidyr
library(tidyr)
#Quantidade de vendas por ano e produto
dfDate <- data.frame (Produto = c('A','B','C'),
                      A.2015 = c(10,12,20),
                      A.2016 = c(20,25,35),
                      A.2017 = c(15,20,30)
                      )
head(dfDate)


#Gather
?gather
#install.packages("Tidyr")
library(tidyr)

dfDate2 <- gather(dfDate, "Ano", "Quantidade", 2:4)
head (dfDate2)

?separate
dfDate3 <- separate(dfDate2, Ano, c("A","Ano"))
dfDate3 <- dfDate3[-2]
dfDate3

#Acrescentando uma coluna Mes
dfDate3$Mes <- c('01','02','03')
dfDate3

?unite

dfDate4 <- dfDate3 %>%
  unite(Data, Mes,Ano,sep='/')

head(dfDate4)



