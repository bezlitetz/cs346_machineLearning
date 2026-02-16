# package - set of functions, data, documentation
# library - directory to load installed packages from to the current r session
install.packages("caret")
library(rpart) # decision tree models
library(partykit) # improve rpart trees
library(caret) # to use train() #will internally call ggplot2 & lattice


#head(penguins)
penguins=na.omit(penguins) #remove missing values 
tree<-train(species~., data=penguins, method="rpart")
# parameter break down: 
# var to predict: species
# '.' use all variables as predictors. basically expands to: bill_length_mm + bill_depth_mm + flipper_length_mm + body_mass_g + island + sex
# penguins is dataset used
# use rpart algorithm for decision tree. caret internally calling rpart adjusts a few things: complexity parameter(cp)(helps avoid overfitting, prune branches that dont improve model performance, use gini impurity),resampling) 

# a few ways to plot

#1 partykit - cleaner tree, better spaced, readable, visually we organized
plot(as.party(tree$finalModel))

#2 rpart - also nice, color coded, w/o bar plots to show distribution at leaves
install.packages("rpart.plot")
library(rpart.plot)
rpart.plot(tree$finalModel)

#3 R - messy, overflowing, crowded
plot(tree$finalModel)
text(tree$finalModel)


