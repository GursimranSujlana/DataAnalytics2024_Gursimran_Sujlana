install.packages("gdata")
library(gdata) 
#faster xls reader but requires perl!

install.packages("xlsx")
library(xlsx)

bronx1 <- read.xlsx("/Applications/Gursimran/RPI/Semester 2/Data Analytics/Box DA_Files/NYhousing/rollingsales_bronx.xls", sheetIndex = 1, startRow = 5)
bronx1<-bronx1[which(bronx1$GROSS.SQUARE.FEET!="0" & bronx1$LAND.SQUARE.FEET!="0" & bronx1$SALE.PRICE!="$0"),]

View(bronx1)

attach(bronx1) # If you choose to attach, leave out the "data=." in lm regression
SALE.PRICE<-sub("\\$","",SALE.PRICE) 
SALE.PRICE<-as.numeric(gsub(",","", SALE.PRICE)) 
GROSS.SQUARE.FEET<-as.numeric(gsub(",","", GROSS.SQUARE.FEET)) 
LAND.SQUARE.FEET<-as.numeric(gsub(",","", LAND.SQUARE.FEET)) 
plot(log(GROSS.SQUARE.FEET), log(SALE.PRICE)) 

data = bronx1[complete.cases(bronx1),]

m1 <- lm(SALE.PRICE ~ LAND.SQUARE.FEET + GROSS.SQUARE.FEET, data = data)
summary(m1)
abline(m1,col="red",lwd=2)
plot(resid(m1))

# Model 2

install.packages("dplyr")  # Install the dplyr 
library(dplyr)             # Load the dplyr package

# Now you can use the %>%
bronx1 <- bronx1 %>% select("LAND.SQUARE.FEET", "GROSS.SQUARE.FEET", "SALE.PRICE", "NEIGHBORHOOD")

bronx1 <- na.omit(bronx1)

str(bronx1)

m2<-lm(bronx1$SALE.PRICE~bronx1$GROSS.SQUARE.FEET+bronx1$LAND.SQUARE.FEET)+factor(bronx1$NEIGHBORHOOD)
summary(m2)
plot(resid(m2))

# Suppress intercept - using "0+ ..."
m2a<-lm(bronx1$SALE.PRICE~0+bronx1$GROSS.SQUARE.FEET+bronx1$LAND.SQUARE.FEET+factor(bronx1$NEIGHBORHOOD))
summary(m2a)
plot(resid(m2a))

bronx1 <- bronx1  %>% select("LAND.SQUARE.FEET", "GROSS.SQUARE.FEET", "SALE.PRICE","NEIGHBORHOOD","BUILDING.CLASS.CATEGORY")

# Model 3
# Remove rows with missing values
bronx1 <- na.omit(bronx1)

# Check factor levels
table(bronx1$NEIGHBORHOOD)
table(bronx1$BUILDING.CLASS.CATEGORY)

# Ensure consistency in factor levels
bronx1$NEIGHBORHOOD <- as.factor(bronx1$NEIGHBORHOOD)
bronx1$BUILDING.CLASS.CATEGORY <- as.factor(bronx1$BUILDING.CLASS.CATEGORY)

# Now try fitting the model again
m3 <- lm(log(SALE.PRICE) ~ 0 + log(GROSS.SQUARE.FEET) + log(LAND.SQUARE.FEET) + NEIGHBORHOOD + BUILDING.CLASS.CATEGORY, data = bronx1)
summary(m3)

m3<-lm(bronx1$SALE.PRICE~0+bronx1$GROSS.SQUARE.FEET+bronx1$LAND.SQUARE.FEET+factor(bronx1$NEIGHBORHOOD)+factor(bronx1$BUILDING.CLASS.CATEGORY))
summary(m3)
plot(resid(m3))

# Model 4
# Remove rows with missing values
bronx1 <- na.omit(bronx1)


# Check factor levels
table(bronx1$NEIGHBORHOOD)
table(bronx1$BUILDING.CLASS.CATEGORY)

# Ensure consistency in factor levels
bronx1$NEIGHBORHOOD <- as.factor(bronx1$NEIGHBORHOOD)
bronx1$BUILDING.CLASS.CATEGORY <- as.factor(bronx1$BUILDING.CLASS.CATEGORY)

# Check the structure of the data frame
str(bronx1)

# Check the number of rows in the data frame
nrow(bronx1)

# Now try fitting the model again
m3 <- lm(log(SALE.PRICE) ~ 0 + log(GROSS.SQUARE.FEET) + log(LAND.SQUARE.FEET) + NEIGHBORHOOD + BUILDING.CLASS.CATEGORY, data = bronx1)
summary(m3)

m4<-lm(log(bronx1$SALE.PRICE)~0+log(bronx1$GROSS.SQUARE.FEET)+log(bronx1$LAND.SQUARE.FEET)+factor(bronx1$NEIGHBORHOOD)*factor(bronx1$BUILDING.CLASS.CATEGORY))
summary(m4)
plot(resid(m4))
#
