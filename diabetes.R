#Carregando os dados
diabetes <- read.csv(
  ffile = "C:/Users/grazi/Downloads/DCTSPESSOAIS/CURSOS/EVG_.R/diabetes.csv"
)
head(diabetes)
str(diabetes)
colSums(is.na(diabetes))
table(diabetes$Outcome)
diabetes$Outcome <- as.factor(diabetes$Outcome)
summary(diabetes$Insulin)
boxplot(diabetes)
boxplot(diabetes$Insulin)
hist(diabetes$Insulin)
install.packages("dplyr")
library(dplyr)
diabetes2 <- diabetes %>%
  filter(Insulin <= 250)
boxplot(diabetes$Insulin)
boxplot(diabetes2)
hist(diabetes2$Pregnancies)
hist(diabetes$Age)
hist(diabetes2$BMI)

install.packages("caTools")
library(caTools)
index = sample.split(diabetes2$Pregnancies,SplitRatio = .70)
index
train = subset(diabetes2, index == TRUE)
test = subset(diabetes2, index == FALSE)
dim(diabetes2)
dim (train)
dim (test)

install.packages("caret")
install.packages("e1071")
library(caret)
library(e1071)
?caret::train
modelo <- train(
  Outcome ~., data = train, method = "knn")
modelo$results
modelo$bestTune

modelo2 <- train(
  Outcome ~., data=train, method = "knn",
  tuneGrid = expand.grid(k = c(1:20)))
modelo2$results
modelo2$bestTune
plot(modelo2)

install.packages("naivebayes")
library(naivebayes)

modelo3<-train(
  Outcome~., data=train, method = "naive_bayes")
modelo3$results
modelo3$bestTune


install.packages("randomForest")
library(randomForest)
modelo4 <- train(
  Outcome ~., data = train, method = "rpart2"
)
modelo4

varImp(modelo4$finalModel)
modelo4_1 <- train(
  Outcome ~., data = train[,c(-3,-5)],method = "rpart2"
)
modelo4_1

plot(modelo4_1$finalModel)
text(modelo4_1$finalModel)

install.packages("kernlab")
library(kernlab)
set.seed(100)
modelo5 <- train(
  Outcome~., data = train, method = "svmRadialSigma"
  ,preProcess=c("center")
)
modelo5$results
modelo5$bestTune

predicoes <- predict(modelo5,test)
predicoes

confusionMatrix(predicoes, test$Outcome)

novos.dados <- data.frame(
  Pregnancies = c(3),
  Glucose = c(111.50),
  BloodPressure = c(70),
  SkinThickness = c(20),
  Insulin = c(47.49),
  BMI = c(30.80),
  DiabetesPedigreeFunction = c(0.34),
  Age = c(28)
)
novos.dados
table(novos.dados)

previsao <- predict(modelo5, novos.dados)
resultado <-ifelse(previsao == 1, "Positivo","Negativo")
print(paste("Resultado:",resultado))

write.csv(predicoes,'resultado.csv')
resultado.csv <- read.csv('resultado.csv')
names(resultado.csv) <- c('Indice','Valor Previsto')
resultado.csv

str(diabetes)
colSums(is.na(diabetes))
summary(diabetes$Insulin)
boxplot(diabetes$Insulin)

boxplot(diabetes)
hist(diabetes2$Pregnancies)
hist(diabetes2$Age)
hist(diabetes2$BMI)

diabetes2 <- diabetes %>%
  filter(Insulin <=250)
boxplot(diabetes2$Insulin)

boxplot(diabetes2)
summary(diabetes2$Insulin)

#construção do modelo
#Divisão dos Dados

install.packages("caTools")
library(caTools)

set.seed(123)
index = sample.split(diabetes2$Pregnancies, SplitRatio = .70)
index
train = subset(diabetes2, index == TRUE)
test = subset(diabetes2, index == FALSE)
dim(diabetes2)
dim (train)
dim (test)

modelo <- train(
  Outcome ~.,data=train, method ="knn")
modelo$results
modelo$bestTune

modelo2 <- train(
  Outcome ~., data = train, method = "knn",
  tuneGrid = expand.grid(k = c(1:20)))
modelo2$results
modelo2$bestTune
plot(modelo2)

write.csv(predicoes,'resultado.csv')

#Obtenção dos dados

```{r}

diabetes <- read.csv(
  file = "C:/Users/grazi/Downloads/DCTSPESSOAIS/CURSOS/EVG_.R/diabetes.csv"
)
head(diabetes)
```
#Preparação dos dados
```{r message=FALSE, warning=FALSE}
diabetes$Outcome <- as.factor(diabetes$Outcome)
library(dplyr)
diabetes2 <- diabetes %>%
  filter(Insulin <=250)
```