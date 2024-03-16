# Load required packages
library(partykit)

# Fit conditional inference tree
fitK <- ctree(Kyphosis ~ Age + Number + Start, data = kyphosis)

# Plot tree with default settings
plot(fitK, main = "Conditional Inference Tree for Kyphosis")

# Plot tree with simple type
plot(fitK, main = "Conditional Inference Tree for Kyphosis", type = "simple")

# Extract terminal node information
terminal_nodes <- nodeapply(fitK, ids = nodeids(fitK), FUN = function(node) is.terminal(node))

# Extract the node IDs for terminal nodes
terminal_node_ids <- which(terminal_nodes)

# Add text to the plot
text(terminal_node_ids, fitted(fitK)[terminal_node_ids], labels = terminal_node_ids, pos = 4, offset = 0.5, cex = 0.8)
