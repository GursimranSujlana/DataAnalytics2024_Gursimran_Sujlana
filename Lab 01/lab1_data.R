#reading csv file
GRUMP_data <- read.csv("/Applications/Gursimran/RPI/Semester 2/Data Analytics/Box DA_Files/GPW3_GRUMP_SummaryInformation_2010.csv")

# reading xls file
install.packages("readxl")
library(readxl)
EPI_data <- read_excel("/Applications/Gursimran/RPI/Semester 2/Data Analytics/Box DA_Files/EPI/2010EPI_data.xls", sheet = "EPI2010_all countries")

#plotting some variables
plot(EPI_data$EPI, EPI_data$EPI)

EPI_data$EPI <- as.numeric(as.character(EPI_data$EPI))
#finding commanalities
cor(EPI_data$EPI, EPI_data$EPI)

View(EPI_data)
print(EPI_data)

attach(EPI_data) 	# sets the ‘default’ object
fix(EPI_data) 	# launches a simple data editor
EPI 			# prints out values EPI_data$EPI
tf <- is.na(EPI) # records True values if the value is NA
E <- EPI[!tf] # filters out NA values, new array

# Exercise -2

# Filtering EPI Landlock

epi_2010 <- read_excel("/Applications/Gursimran/RPI/Semester 2/Data Analytics/Box DA_Files/EPI/Data/2010EPI_data.xls", sheet="EPI2010_all countries")
head(epi_2010)
str(epi_2010)

attach(epi_2010)

epi_2010$EPI<- as.numeric(epi_2010$EPI)
epi_2010$EPI

EPILand  =  epi_2010[!Landlock,]
Eland <- EPILand[!is.na(EPILand$EPI),]


png(filename="/Applications/Gursimran/RPI/Semester 2/Data Analytics/Box DA_Files/EPI/Data/histogram$EPILand.png")
hist(Eland$EPI, seq(30., 95., 1.0), prob=TRUE)
lines(density(Eland$EPI,na.rm=TRUE,bw="SJ"))
rug(Eland$EPI) 
dev.off()


plot(ecdf(Eland$EPI), do.points=FALSE, verticals=TRUE) 
qqnorm(Eland$EPI); 
qqline(Eland$EPI)

# No surface water


EPI_No_Surfacewater =  epi_2010[!No_surface_water,]
ESurfacewater <- EPI_No_Surfacewater[!is.na(EPI_No_Surfacewater$EPI),]


png(filename="/Applications/Gursimran/RPI/Semester 2/Data Analytics/Box DA_Files/EPI/Data/histogram$EPI_Nosurfacewater.png")
hist(ESurfacewater$EPI)
lines(density(ESurfacewater$EPI,na.rm=TRUE,bw=1.))
rug(ESurfacewater$EPI) 
dev.off()

hist(ESurfacewater$EPI)

plot(ecdf(ESurfacewater$EPI), do.points=FALSE, verticals=TRUE) 
qqnorm(ESurfacewater$EPI); 
qqline(ESurfacewater$EPI)

# Water

EPI_Desert=  epi_2010[!Desert,]
EDesert <- EPI_Desert[!is.na(EPI_Desert$EPI),]


hist(EDesert$EPI)

png(filename="/Applications/Gursimran/RPI/Semester 2/Data Analytics/Box DA_Files/EPI/Data/histogram$EPI_Desert.png")
hist(EDesert$EPI)
lines(density(EDesert$EPI,na.rm=TRUE,bw=1.))
rug(EDesert$EPI) 
dev.off()


# High_Population_Density


EPI_High_Population_Density =  epi_2010[!High_Population_Density,]
E_High_Population_Density <- EPI_High_Population_Density[!is.na(EPI_High_Population_Density$EPI),]


hist(E_High_Population_Density$EPI)

png(filename="/Applications/Gursimran/RPI/Semester 2/Data Analytics/Box DA_Files/EPI/Data/histogram$EPI_HPD.png")
hist(E_High_Population_Density$EPI, seq(30., 95., 1.0), prob=TRUE)
lines(density(E_High_Population_Density$EPI,na.rm=TRUE,bw=1.))
rug(E_High_Population_Density$EPI) 
dev.off()
