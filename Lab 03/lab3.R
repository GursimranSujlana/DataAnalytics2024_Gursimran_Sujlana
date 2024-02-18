#### Exercise 1: Heatmap(), image() and hierarchical clustering

# creating a matrix data with random numbers
# and plotting the matrix using the image() function
# you will see there, it does not have a real pattern in the plot. 
set.seed(12345)
help(par)
data_Matrix <-matrix(rnorm(400), nrow = 40)
image(1:10, 1:40, t(data_Matrix)[,nrow(data_Matrix):1])

set.seed(12345)
par(mar = rep(0.2,4))
data_Matrix <-matrix(rnorm(400), nrow = 40)
image(1:10, 1:40, t(data_Matrix)[,nrow(data_Matrix):1])

help("heatmap")
help(rep)

par(mar=rep(0.2,4)) 
heatmap(data_Matrix)

help("rbinom") 

set.seed(678910) 
for(i in 1:40){
  # flipping a coin and getting the data
  coin_Flip <- rbinom(1, size = 1, prob = 0.5)
  # if the coin is "Heads", add a common pattern to that row, 
  if(coin_Flip){
  data_Matrix[i, ] <- data_Matrix[i, ] + rep(c(0,3), each =5) }
}
par(mar= rep(0.2, 4))
image(1:10, 1:40, t(data_Matrix)[, nrow(data_Matrix):1])

# separated the clusters
par(mar=rep(0.2, 4)) 
heatmap(data_Matrix)

# ten different columns mean and forty different rows means
hh <- hclust(dist(data_Matrix))
data_Matrix_Ordered <- data_Matrix[hh$order,]
par(mfrow = c(1,3))
image(t(data_Matrix_Ordered)[, nrow(data_Matrix_Ordered):1])
plot(rowMeans(data_Matrix_Ordered), 40:1, , Xlab = "The Row Mean", ylab = "Row", pch=19)
plot(colMeans(data_Matrix_Ordered), xlab = "Column", ylab = "Column Mean", pch = 19)

### exercise 2: classification

# abalone

abalone <- read.csv("/Applications/Gursimran/RPI/Semester 2/Data Analytics/Tasks/Lab 03/Data/abalone.csv")

# Rename columns for clarity
colnames(abalone) <- c("sex", "length", "diameter", "height", "whole_weight", "shucked_weight", "viscera_weight", "shell_weight", "rings")

# Check the structure of the dataset
str(abalone)

# As the rings variable has a wide range of values, we will convert it into categories for classification
abalone$rings_category <- cut(abalone$rings, breaks = c(-Inf, 8, 11, Inf), labels = c("young", "adult", "old"))

# Remove unnecessary columns like sex and the original rings column
abalone <- subset(abalone, select = -c(sex, rings))

# Normalize the numerical predictors
abalone[, -ncol(abalone)] <- scale(abalone[, -ncol(abalone)])

# Split the dataset into training and testing sets
set.seed(123)  # For reproducibility
train_indices <- sample(1:nrow(abalone), 0.7 * nrow(abalone))  # 70% train, 30% test
train_data <- abalone[train_indices, -ncol(abalone)]
train_labels <- abalone$rings_category[train_indices]
test_data <- abalone[-train_indices, -ncol(abalone)]
test_labels <- abalone$rings_category[-train_indices]

# Determine the value of k (number of neighbors)
k <- round(sqrt(nrow(train_data)))

# Perform k-NN classification
knn_predictions <- knn(train = train_data, test = test_data, cl = train_labels, k = k)

# View predictions
knn_predictions

# Optionally, evaluate the accuracy of the model
accuracy <- sum(knn_predictions == test_labels) / length(test_labels)
accuracy

## exercise 3: clustering

head(iris) # first 6 rows of the
str(iris) # take a look at the structure of the iris data using str() function in R.
# dataset has 150 observations equally distributed observations among
# the three species: Setosa, Versicolor and Verginica.
summary(iris) # summary statistics of all the 4 variables Sepal.Length,Sepal.Width,


# Create a new data frame without the fifth column (species)
iris_without_species <- iris[, -5]

# Apply kmeans clustering (choose your desired number of clusters, k)
set.seed(123)  # For reproducibility
k <- 3  # You can choose any value for k
clustering <- kmeans(iris_without_species, centers = k, iter.max = 1000)

# Assess the clustering results using the table function
result_table <- table(iris$Species, clustering$cluster)
print(result_table)

















