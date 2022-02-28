#===============================================================
#                CHHD301-Biostatistics
#===============================================================
# INSTRUCTOR : Dr. Wiriya Mahikul
# TITLE      : Lecture 5 - Probability distributions 
#===============================================================

x<-0:3
fx<-c(1/8,3/8,3/8,1/8)
Fx<-c(1/8,4/8,7/8,1)
Fx
plot(x,fx,type="h",xlab="x",xlim=c(0,3),ylim = c(0,0.4))
title("PDF of X")

plot(x,Fx,type="n",xlab = "x",ylab = "F(x)",xlim = c(0,4),ylim=c(0,1),yaxt="n")
axis(2,at=c(1/8,4/8,7/8,1),lab=c('1/8','4/8','7/8','1'))
#segments(0,0,0,col="red")
segments(0:3,c(Fx),1:4,c(Fx),col="red")
lines(x,Fx,type = "p",pch=16)
title("CDF of X")

x<-0:3
x

f <- function(x){
  result<-12/(25*(x+1))
  print(result)
}
f(x)

plot(x,f(x),type="h",xlim=c(0,3),ylim = c(0,0.5))
title("PDF of X")

Fx <- c(0.48,0.72,0.88,1)

plot(x,Fx,type="n",xlab = "x",ylab = "F(x)",xlim = c(0,4),ylim=c(0.4,1),yaxt="n")
axis(2,at=c(0.48,0.72,0.88,1),lab=c('0.48','0.72','0.88','1'))
#segments(0,0,0,col="red")
segments(0:3,c(Fx),1:4,c(Fx),col="red")
lines(x,Fx,type = "p",pch=16)
title("CDF of X")


#covid
x<-1:6
fx<-c(0.2,0.207,0.173,0.13,0.13,0.16)
Fx<-c(0.2,0.407,0.58,0.71,0.84,1)
Fx
plot(x,fx,type="h",xlab="x",xlim=c(1,6),ylim = c(0,0.3))
title("PDF of X")

plot(x,Fx,type="n",xlab = "x",ylab = "F(x)",xlim = c(1,7),ylim=c(0,1),yaxt="n")
axis(2,at=c(0.2,0.407,0.58,0.71,0.84,1),lab=c('0.2','0.407','0.58','0.71','0.84','1'))
segments(1:6,c(Fx),2:7,c(Fx),col="red")
lines(x,Fx,type = "p",pch=16)
title("CDF of X")

##Probability distribution
##covid (หน้า13)
table(c(60,62,52,39,39,48))
prop.table(c(60,62,52,39,39,48))


##============================ Discrete random variables ============================

##===========================##
##   Binomial Distribution   ##
##===========================##

## color blind (หน้า 24)
# Suppose it is known that in a certain population 10 percent of the population is color blind. 
# If a random sample of 25 people is drawn from this population, find the probability that

# a) Four will be color blind.
# P(x = 4) = P(X <= 4) - P(X <= 3)
pbinom(4, size = 25, prob=0.1, lower.tail = TRUE, log.p = FALSE)-pbinom(3, size = 25, prob=0.1, lower.tail = TRUE, log.p = FALSE)

# b) Five or fewer will be color blind.
# P(X <= 5) = P(X=5) + P(X = 4) + P(X = 3) + P(X = 2)
pbinom(5, size = 25, prob=0.1, lower.tail = TRUE, log.p = FALSE)

# c) Six or more will be color blind
# P(X >= 6) = 1 - P(X <= 5)
1-pbinom(5, size = 25, prob=0.1, lower.tail = TRUE, log.p = FALSE)
pbinom(5, size = 25, prob=0.1, lower.tail = FALSE, log.p = FALSE)

# d) Between six and nine inclusive will be color blind.
# P(6 <= X <= 9) = P(X <= 9) - P(X <= 5)
pbinom(9, size = 25, prob=0.1, lower.tail = TRUE, log.p = FALSE)-pbinom(5, size = 25, prob=0.1, lower.tail = TRUE, log.p = FALSE)

# e) Two, three, or four will be color blind.
# P(2 <= X <= 4) = P(X <= 4) - P(X <= 1)
pbinom(4, size = 25, prob=0.1, lower.tail = TRUE, log.p = FALSE)-pbinom(1, size = 25, prob=0.1, lower.tail = TRUE, log.p = FALSE)



## covid (หน้า 29)
# Suppose it is known that 10% of a certain population is infected of COVID-19. 
# If a random sample of 5 people is drawn from this population. Find the probability that

# a) 1 or fewer will be infected of COVID-19
# P(X <= 1) = P(X = 0) + P(X = 1)
pbinom(1, size = 5, prob=0.1, lower.tail = TRUE, log.p = FALSE)

# b) 2 or more will be infected of COVID-19
# P(X => 2) = 1 - P(X <= 1)
1-pbinom(1, size = 5, prob=0.1, lower.tail = TRUE, log.p = FALSE)
pbinom(1, size = 5, prob=0.1, lower.tail = FALSE, log.p = FALSE)

# c)Between 2 and 4 inclusive will be infected of COVID19
# P(2 <= X <= 4) = P(X <= 4) - P(X <= 1)
pbinom(4, size = 5, prob=0.1, lower.tail = TRUE, log.p = FALSE)-pbinom(1, size = 5, prob=0.1, lower.tail = TRUE, log.p = FALSE)


## operation process (หน้า 30)
# In a survey of surgery department, 75% of patients could recovery within 1 month after operation process. 
# If this percentage holds for theentire population, and 15 patients were randomly selected. Find the
# chance that the number of patients could recover within a month after operational process is:

# a) At least 7
pbinom(8, size = 15, prob=0.25, lower.tail = TRUE, log.p = FALSE)
pbinom(6, size = 15, prob=0.75, lower.tail = FALSE, log.p = FALSE)

# b) Not more than 5
pbinom(5, size = 15, prob=0.75, lower.tail = TRUE, log.p = FALSE)

# c)Between 6 and 9, inclusive
pbinom(9, size = 15, prob=0.75, lower.tail = TRUE, log.p = FALSE)-pbinom(5, size = 15, prob=0.75, lower.tail = TRUE, log.p = FALSE)


##===========================##
##   Poisson Distributions   ##
##===========================##

## adolescent suicides (หน้า 38)
# In the study of adolescent suicides, the monthly distribution of
# adolescent suicide closely followed a Poisson distribution. The average
# number of adolescent suicides was 2.

# a) Find the probability that the randomly selected month will be three adolescent suicides occurred
# P(X = 3)
ppois(3, lambda=2, lower.tail = TRUE, log.p = FALSE)-ppois(2, lambda=2, lower.tail = TRUE, log.p = FALSE)

# b) Find the probability that the randomly selected month will be less than or equal one adolescent suicides occurred
# P(X <= 1)
ppois(1, lambda=2, lower.tail = TRUE, log.p = FALSE)

# c) Find the probability that the randomly selected month will be more than 5 adolescent suicides occurred
# P(X => 6) = 1 - P(X <= 5)
ppois(5, lambda=2, lower.tail = FALSE, log.p = FALSE)


## In the clinic half an hour (หน้า 40)
# In the clinic, doctor found that average of 3 patient come to visit in the clinic within half an hour.

# a) Find the probability of patient come to visit the clinic less than 3 patient within half an hour
# P(X <= 3)
ppois(2, lambda=3, lower.tail = TRUE, log.p = FALSE)

# b) Find the probability of patient come to visit the clinic 10 or more patient within half an hour
# P(X => 10) = 1 - P(X <= 9)
ppois(9, lambda=3, lower.tail = FALSE, log.p = FALSE)

# c) Find the probability of patient come to visit the clinic between 8 and 12 patient inclusive within half an hour
# P(8 <= X <= 12) = P(X <= 12) - P(X <= 7)
ppois(12, lambda=3, lower.tail = TRUE, log.p = FALSE)-ppois(7, lambda=3, lower.tail = TRUE, log.p = FALSE)

##In the clinic within an hour (หน้า 41)
ppois(2, lambda=6, lower.tail = TRUE, log.p = FALSE)
ppois(9, lambda=6, lower.tail = FALSE, log.p = FALSE)
ppois(12, lambda=6, lower.tail = TRUE, log.p = FALSE)-ppois(7, lambda=6, lower.tail = TRUE, log.p = FALSE)


##============================ Continuous random variable ============================

##===========================##
##    Normal distribution    ##
##===========================##

# หน้า 57
pnorm(-3)
pnorm(-2.59)
pnorm(1.31)
pnorm(2)
pnorm(-4.75)

# หน้า 58
1-pnorm(1.31)

# หน้า 59
pnorm(1.31)-pnorm(-2.59)

# หน้า 61
pnorm(1)
pnorm(1100, mean = 1000, sd = 100, lower.tail = TRUE, log.p = FALSE)
pnorm(900, mean = 1000, sd = 100, lower.tail = FALSE, log.p = FALSE)
pnorm(790, mean = 1000, sd = 100, lower.tail = TRUE, log.p = FALSE)
pnorm(1150, mean = 1000, sd = 100, lower.tail = TRUE, log.p = FALSE)-pnorm(790, mean = 1000, sd = 100, lower.tail = TRUE, log.p = FALSE)

## glucose level (หน้า 63)
pnorm(120, mean = 110, sd = 10, lower.tail = TRUE, log.p = FALSE)
pnorm(128, mean = 110, sd = 10, lower.tail = TRUE, log.p = FALSE)-pnorm(100, mean = 110, sd = 10, lower.tail = TRUE, log.p = FALSE)
pnorm(126, mean = 110, sd = 10, lower.tail = FALSE, log.p = FALSE)



