install.packages("partykit")
# Load required packages
library(partykit)

# Fit conditional inference tree
fit2M <- ctree(Mileage ~ Price + Country + Reliability + Type, data = na.omit(cu.summary))

# Summarize the tree
summary(fit2M)

# Plot tree
plot(fit2M, uniform = TRUE, main = "CI Tree for Mileage")

# Add text to the plot
text(fit2M, use.n = TRUE, all = TRUE, cex = 0.8)
