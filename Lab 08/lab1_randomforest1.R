# Load required libraries
library(randomForest)

# Load datasets
data(kyphosis)  # Load the kyphosis dataset
data(swiss)
data(imports85) # Additional data

# Check the structure of the kyphosis dataset
str(kyphosis)

# Fit random forest for the kyphosis dataset
fitKF <- randomForest(Kyphosis ~ Age + Number + Start, data = kyphosis)
print(fitKF) # View the results
importance(fitKF) # Importance of each predictor

# Fit random forest for the swiss dataset
fitSwiss <- randomForest(Fertility ~ Agriculture + Education + Catholic, data = swiss)
print(fitSwiss) # View the results
importance(fitSwiss) # Importance of each predictor

# Plot variable importance for the swiss dataset
varImpPlot(fitSwiss)

# Plot the random forest object (may not be very interpretable for large forests)
plot(fitSwiss)

# Get the first tree from the random forest object (with labels)
getTree(fitSwiss, 1, labelVar = TRUE)

# Get help for the randomForest package
help(randomForest) # Look at all the package contents and the randomForest method options

# Look at rfcv - random forest cross-validation
help(rfcv)

