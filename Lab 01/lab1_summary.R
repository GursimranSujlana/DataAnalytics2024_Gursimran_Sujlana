# excercise 1

summary(EPI) 	# stats
fivenum(EPI,na.rm=TRUE)
help(stem)
stem(EPI)		 # stem and leaf plot
help(hist)
hist(EPI)
hist(EPI, seq(30., 95., 1.0), prob=TRUE)
help(lines)
lines(density(EPI,na.rm=TRUE,bw=1.)) # or try bw=“SJ”
help(rug)
rug(EPI) 

#cumulative density function
plot(ecdf(EPI), do.points=FALSE, verticals=TRUE)

#Quantile-Quantile
par(pty="s")
qqnorm(EPI); qqline(EPI)

#Q-Q plot against generating distribution
x<-seq(30,95,1)
qqplot(qt(ppoints(250), df = 5), x, xlab = "Q-Q plot for t dsn")
qqline(x)

# doing for DALY
summary(DALY) 
fivenum(DALY,na.rm=TRUE)
help(stem)
stem(DALY)		 # stem and leaf plot
help(hist)
hist(DALY)
hist(DALY, seq(30., 95., 1.0), prob=TRUE)
help(lines)
lines(density(DALY,na.rm=TRUE,bw=1.)) # or try bw=“SJ”
help(rug)
rug(DALY) 

#cumulative density function
plot(ecdf(DALY), do.points=FALSE, verticals=TRUE)

#Quantile-Quantile
par(pty="s")
qqnorm(DALY); qqline(DALY)

#Q-Q plot against generating distribution
x<-seq(30,95,1)
qqplot(qt(ppoints(250), df = 5), x, xlab = "Q-Q plot for t dsn")
qqline(x)

#comparing distribution
boxplot(EPI,DALY)

