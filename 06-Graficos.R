setwd("C:/Users/grazi/Downloads/DCTSPESSOAIS/POWERBI/CAP12/Usuarios")
getwd

vetor_total_resultados = c(3,12,5,18,45)
names(vetor_total_resultados) = c("A","B","C","D","E")
vetor_total_resultados

?barplot
barplot(vetor_total_resultados)
barplot(vetor_total_resultados, col = c(1,2,3,4,5))

png("barplot.png", width = 480, height = 480)
barplot(vetor_total_resultados,
        col = rgb(0.5,0.1,0.6,0.6),
        xlab = "Categorias",
        ylab = "Valores",
        main = "Barplot em R",
        Ylim = c(0.60))
dev.off()

library(ggplot2)
View(mtcars)

ggplot(mtcars, aes(x = as.factor(cyl) ))+
  geom_bar()

ggplot(mtcars, aes(x = as.factor(cyl), fill = as.factor(cyl)))+
  geom_bar()
scale_fill_manual(values = c("red","green","blue"))

dados = data.frame(group = c("A","B","C","D"), value = c(33,62,56,67))
View (dados)

ggplot (dados, aes(x = group, y = value, fill = group))+
  geom_bar(width = 0.85, stat = "identity")
### Pie Chart ####

fatias <- c(4, 12, 14, 16, 8)
países <- c("Brasil", "Estados Unidos", "Alemanha", "Reino Unido", "Espanha")
pie(fatias, labels = países, main = "Leitura de Livros po Pessoa/Ano")

###Pie Chart 3D###
install.packages("plotrix")
library(plotrix)

fatias <- c(4,12,14,16,8)
países <- c("Brasil","Alemanha","Estados Unidos", "Reino Unido", "Espanha")
pie3D(fatias, labels = países, explode = 0,1, main = "Leitura de Livros Por Pessoa/Ano")


### Line Chart###
#Dados
carros <- c(1,3,6,4,9)
caminhoes <- c(2,5,4,5,12)

#plot
plot(carros, typw = "o",  col = "blue", ylin = c(0,12))
lines(caminhoes, typw = "o", pch = 22, lty = 2, col = "red")
title(main = "Produção de Veículos", col.main = "red", font.main = 4)

###Boxplot###

library(ggplot2)
View(mpg)

#Plot
ggplot(mpg,aes(x = reorder(class, hwy), y = hwy, fill = class))+
    geom_boxplot()+
    xlab("class")+
    theme(legend.position = "none")

###Scatter Plot###


Library (ggplot2)
data = data.frame(cond = rep(c("condition_1", "condition_2"), each=10),
                    my_x = 1:100 + rnorm(100,sd=9), my_y = 1:100 + rnorm(100,sd=16))

ggplot(data,aes(x=my_x, y=my_y))+
  geom_point(shape=1)

#adiciona linha de regressão
ggplot(data,aes(x = my_x, y = my_y))+
  geom_point(shape = 1)+
  geom_smooth(method = lm, color = "red", se = TRUE)

#adiciona smooth
ggplot(data, aes(x=my_x, y=my_y))+
  geom_point(shape = 1)+
  geom_smooth(method=lm, color ="red", se=TRUE)
