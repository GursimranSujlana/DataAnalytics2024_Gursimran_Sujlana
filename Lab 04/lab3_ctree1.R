require(rpart)

# Fit the decision tree model and store it in the variable Swiss_rpart
Swiss_rpart <- rpart(Fertility ~ Agriculture + Education + Catholic, data = swiss)

# Plot the decision tree (using the correct variable name Swiss_rpart)
plot(Swiss_rpart) # try some different plot options

# Add text to the plot (using the correct variable name Swiss_rpart)
text(Swiss_rpart) # try some different text options


require(party)

treeSwiss<-ctree(Species ~ ., data=iris)
plot(treeSwiss)

cforest(Species ~ ., data=iris, controls=cforest_control(mtry=2, mincriterion=0))

treeFert<-ctree(Fertility ~ Agriculture + Education + Catholic, data = swiss)

cforest(Fertility ~ Agriculture + Education + Catholic, data = swiss, controls=cforest_control(mtry=2, mincriterion=0))
# look at help info, vary parameters.

install.packages("tree")
library(tree)
tr <- tree(Species ~ ., data=iris)
tr
tr$frame
plot(tr)
text(tr)
#find "prettier" ways to plot the tree



