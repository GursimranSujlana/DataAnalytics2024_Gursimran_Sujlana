require(rpart)
Swiss_rpart <- rpart(Fertility ~ Agriculture + Education + Catholic, data = swiss)
plot(Swiss_rpart, mar = c(0, 0, 0, 0)) # Adjust the right margin value as neededtext(Swiss_rpart, cex = 0.8, col = "blue", font = 2, family = "sans", pos = 2)
text(Swiss_rpart, cex = 0.8, col = "blue", font = 2, family = "sans", pos = 2)
