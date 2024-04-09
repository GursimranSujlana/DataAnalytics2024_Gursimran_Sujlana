# Load required libraries
library(boot)
library(MASS)

# Load data
data(mammals)

# Fit the model
mammals.glm <- glm(log(brain) ~ log(body), data = mammals)

# Define the cost function for cross-validation
cost <- function(r, pi = 0) mean(abs(r-pi) > 0.5)

# Perform cross-validation
cv.err <- cv.glm(data = mammals, glmfit = mammals.glm, cost = cost)
cv.err$delta  # Display the cross-validation error

# You can also specify the number of folds (e.g., K = 6)
cv.err.6 <- cv.glm(data = mammals, glmfit = mammals.glm, cost = cost, K = 6)
cv.err.6$delta  # Display the cross-validation error for 6 folds
