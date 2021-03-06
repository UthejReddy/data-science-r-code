#install package "arules"
install.packages("arules")

install.packages("arulesViz")
library(arulesViz) 

library(arules)#import the given package

books<-read.csv(file.choose())


book1 <- as.data.frame(lapply(books, as.factor))

book2 <- as(book1, "transactions")

itemFrequencyPlot(book2, topN=20, type = "absolute") 

#apply the algorithm

rules<-apriori(book2)

arules::inspect(rules)

rules.sorted<-sort(rules,by="lift")#sorts the data according to the list ratio

arules::inspect(rules.sorted)#shows the sorted list


rules<-apriori(book2,parameter = list(minlen=1,supp=0.1,conf=0.5))

arules::inspect(rules)


rule_lift <- sort(rules, by = "lift", descending = TRUE)
inspect(head(rule_lift))

# Sort the Rules by Confidence
rule_confidence <- sort(rules, by = "confidence", descending = TRUE)
inspect(head(rule_confidence))

#try with some more rules
rule2 <- rules <- apriori(book2, parameter = list(supp = 0.05, confidence = 0.8,minlen = 6, maxlen = 20))
inspect(head(rule2, 10))
rule2 
plot(rule2, method = "grouped")


rule3 <- rules <- apriori(book2, parameter = list(supp = 0.03, confidence = 0.6,minlen = 8, maxlen = 15))
inspect(head(rule3, 10))
rule3 
plot(rule3, method = "grouped")

rule4 <- rules <- apriori(book2, parameter = list(supp = 0.06, confidence = 0.7,minlen = 9, maxlen = 10))
inspect(head(rule4, 10))
rule4
plot(rule4, method = "grouped")


rule5 <- rules <- apriori(book2, parameter = list(supp = 0.07, confidence = 0.4,minlen = 5, maxlen = 8))
inspect(head(rule5, 10))
rule5
plot(rule5, method = "grouped")
