iris<-datasets::iris
View(iris)
data("iris")

#install packages caret and C50
install.packages("caret")
install.packages("C50")

library(caret)
library(C50)



acc<-c()
for(i in 1:500)#to create multiple models
{
  print(i)
  #Data Partiton
  inTraininglocal<-createDataPartition(iris$Species,p=.70,list=F)
  training<-iris[inTraininglocal,]#training is one partition
  testing<-iris[-inTraininglocal,]#testing is another partition

  #model building
  fittree<-C5.0(training$Species~.,data=training)
 
  #generate the model summary
  summary(fittree)

  #Predict for test data set
  pred<-predict.C5.0(fittree,testing[,-5])
  a<-table(testing$Species,pred)
  a
  #Accuracy
  acc<-c(acc,sum(diag(a))/sum(a))
}
  boxplot(acc)#plot the decision tree
acc  
