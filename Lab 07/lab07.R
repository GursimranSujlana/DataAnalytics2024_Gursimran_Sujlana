# Read the dataset without a header
wine_data <- read.table("http://archive.ics.uci.edu/dataset/109/wine", sep = ",", header = FALSE)

# Check the structure or the first few rows
head(wine_data)
nrow(wine_data)

# Now add the column names, ensuring they match the number of columns in wine_data
colnames(wine_data) <- c("Cvs", "Alcohol", "Malic_Acid", "Ash", "Alkalinity_of_Ash",
                         "Magnesium", "Total_Phenols", "Flavanoids", "NonFlavanoid_Phenols",
                         "Proanthocyanins", "Color_Intensity", "Hue", "OD280/OD315_of_Diluted_Wine",
                         "Proline")

# Check the result
head(wine_data)
# Using the Heatmap() function, we can check the correlations,
# In the heatmap(), the "Dark Colors" represent the "Correlated"
# In the heatmap(), the "Light Colors" represent the "Not or less Correlated"
help("heatmap") # Read the heatmap() function Documentation in RStudio.
# Now we will use the heatmap() function to show the correlation among variables.
heatmap(cor(wine_data),Rowv = NA, Colv = NA)
#Our goal is to identify the 3 variates based on the chemical data on the wine dataset.
#In order to make it easy identify the 3 cultivars, we will declare 3 classes that represents each cultivar (Cv1,Cv2, Cv3) by using the factor function in R
#Read the documentation in Rstudio for the factor) function.
help(factor)
# declaring the cultivar_classes using the factor() function each cultivar Cv1,Cv2 and Cv3.
cultivar_classes <- factor(wine_data$Cvs)
cultivar_classes
#Now we will use PCA,
#The default built in function in R for PCA is prcomp() function
# Read the documentation of prcomp() function in Rstudio
help(prcomp)
# We will normalize the wine data to a common scale using scale() function so that the PCA process will not
# overweight variables that happen to have the larger values.
# Read the documentation of scale() function in RStudio.
help(scale)
# We will not normalize the Cvs variable (first colume) so we exclude the Cvs column with with -1
wine_data_PCA <- prcomp(scale(wine_data[,-1]))
# We can use the summary() function on wine_data_PCA to see the cumulative proportion that each
# principal component (PC) contributes,
summary(wine_data_PCA)
