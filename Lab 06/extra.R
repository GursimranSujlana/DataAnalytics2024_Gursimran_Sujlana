install.packages("rpart")
install.packages("party")
install.packages("randomForest")

## titanic
library(datasets)
data(Titanic)

# Convert the Titanic data to a data frame
titanic_df <- as.data.frame(Titanic)

## Decision Tree with rpart
library(rpart)

# Fit a decision tree model
tree_model <- rpart(Survived ~ ., data = titanic_df, method = "class")

# Plot the tree
plot(tree_model)
text(tree_model, use.n = TRUE)

## Conditional Inference Tree with ctree
library(party)

# Fit a conditional inference tree
ctree_model <- ctree(Survived ~ ., data = titanic_df)

# Plot the tree
plot(ctree_model)

### Hierarchical Clustering with hclust
# Using only numeric data for clustering (hence excluding the target variable)
numeric_data <- titanic_df[sapply(titanic_df, is.numeric)]

# Perform hierarchical clustering
hc_model <- hclust(dist(numeric_data))

# Plot the dendrogram
plot(hc_model)

### Random Forest with randomForest
library(randomForest)

# Fit a random forest model
rf_model <- randomForest(Survived ~ ., data = titanic_df, ntree = 100)

# View the model summary
print(rf_model)

# Plot variable importance
varImpPlot(rf_model)
