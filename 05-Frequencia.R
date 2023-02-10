setwd("C:/Users/grazi/Downloads/DCTSPESSOAIS/POWERBI/CAP12/Usuarios")
getwd
?read.table
dados<- read.table("usuarios.csv",
                              dec = ".",
                              sep = ",",
                              h = T,
                              fileEncoding = "windows-1252")
View(dados)
names(dados)
str(dados)
summary(dados$salario)
summary(dados$grau_instrucao)
mean(dados$salario)
mean(dados$grau_instrucao)


freq <- table(dados$grau_instrucao)
View(freq)

freq_rel <- prop.table(freq)
View (freq_rel)
 
p_freq_rel <- 100*prop.table(freq_rel)
View (p_freq_rel)

View (freq)
freq <- c(freq, sum(freq))
View(freq)
names(freq)[4] <- "Total"
View(freq)

freq_rel <- c (freq_rel, sum(freq_rel))
p_freq_rel <- c(p_freq_rel, sum(p_freq_rel))

tabela_final <- cbind (freq,
                       freq_rel = round(freq_rel, digits = 2),
                       p_freq_rel = round(p_freq_rel, digits = 2))

View (tabela_final)
