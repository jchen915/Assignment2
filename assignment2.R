cohort <- read.csv("/Users/jackiechen/Downloads/cohort.csv")
summary(cohort)
table(cohort$smoke)
table(cohort$cardiac)

glm.cohort=glm(cardiac~smoke, family="binomial", data=cohort)
summary(glm.cohort)

install.packages("pROC")
library(pROC)

cohort$predicted_prob <- predict(glm.cohort, type = "response")
roc_obj <- roc(cohort$cardiac, cohort$predicted_prob)
plot(roc_obj, main = "ROC Curve for Cardiac ~ Smoke")
auc(roc_obj)

#In this analysis of 5,000 individuals, only about 16% of the cohort were smokers, 
#and 5% had cardiac disease. The logistic regression showed that smokers had 
#significantly higher odds of having cardiac disease, with an odds ratio of 
#about 7.1 (exp(1.96)). The ROC curve showed that using smoking status alone to 
#predict cardiac disease gives an AUC of 0.697, which suggests moderate 
#predictive ability.

#I did not use generative AI technology to complete any portion of this assignment.