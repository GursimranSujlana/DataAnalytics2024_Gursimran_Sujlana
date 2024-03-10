# Fit the conditional inference tree for Kyphosis
fitK <- ctree(Kyphosis ~ Age + Number + Start, data = kyphosis)

# Plot the conditional inference tree with the specified main title
plot(fitK, main = "Conditional Inference Tree for Kyphosis")

# Plot the conditional inference tree with a simple layout and the corrected main title
plot(fitK, main = "Conditional Inference Tree for Kyphosis", type = "simple")


