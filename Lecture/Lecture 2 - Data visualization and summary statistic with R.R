#===============================================================
#                 CHHD301-Biostatistics
#===============================================================
# TITLE  : Lecture 2 - Data visualization and summary statistic with R
# DATE   : 27 Jan 2021
#===============================================================


getwd()   
dirname <- " อย่าลืมเปลี่ยน directory "
setwd(dirname)  # set the working directory to dir name


##========##
## Part 1 ## R Datasets
##========##

data()
data(ChickWeight)


##========##
## Part 2 ## Vectors
##========##

a <- c(1,2,5.3,6,-2,4) # numeric vector 
a

b <- c("one","two","three") # character vector 
b

c <- c(TRUE,TRUE,TRUE,FALSE,TRUE,FALSE)
c

#logical vector
#Refer to elements of a vector using subscripts.
a[c(2,4)] # 2nd and 4th elements of vector  #index·Õè 2¡Ñº 4



##========##
## Part 3 ## Matrices
##========##

# generates 5 x 4 numeric matrix
y<-matrix(1:20, nrow=5,ncol=4)  #ÊÃéÒ§1-20 
y


# another example
cells <- c(1,26,24,68)
rnames <- c("R1", "R2") #row name
cnames <- c("C1", "C2") #col name
mymatrix <- matrix(cells, nrow=2, ncol=2, byrow=TRUE,
                   dimnames=list(rnames, cnames))
mymatrix


#Identify rows, columns or elements using subscripts.
y[,4] # 4th column of matrix 
y[3,] # 3rd row of matrix
y[2:4,1:3] # rows 2,3,4 of columns 1,2,3 


##========##
## Part 4 ## Data frames
##========##

#A data frame is more general than a matrix, in that different 
#columns can have different modes (numeric, character,factor, etc.).

d <- c(1,2,3,4)
e <- c("red", "white", "red", NA)
f <- c(TRUE,TRUE,TRUE,FALSE)
mydata <- data.frame(d,e,f)

names(mydata) <- c("ID","Color","Passed") #variable names
mydata

#There are a variety of ways to identify the elements of a dataframe .
mydata[1:2] # columns 1,2 of dataframe
mydata[c("ID","Passed")]# columns ID and Passed from dataframe
mydata$ID # variable ID in the dataframe



##========##
## Part 5 ## Lists
##========##

#An ordered collection of objects (components). A list allows
#you to gather a variety of (possibly unrelated) objects under one name.

cars

# example of a list containing two lists
pts <- list(x = cars[,1], y = cars[,2])  #cars = ¢éÍÁÙÅã¹R
pts


##========##
## Part 6 ## Import and Export data
##========##

#-----Import data-----#
#set working directory
setwd(" อย่าลืมเปลี่ยน directory ")
gbsg_data <- read.csv("../Data/gbsg.csv", header = TRUE, as.is = TRUE)


#-----Exporting Data-----#
#Write out a file csv
write.csv(file = "Gestation_out.csv", gestation, row.names = FALSE)


##========##
## Part 7 ## Missing Data
##========##

#Excluding Missing Values from Analyses
#Arithmetic functions on missing values yield missing values.

x <- c(1,2,NA,3)
mean(x) # returns NA
mean(x, na.rm=TRUE) # returns 2 


##========##
## Part 8 ## Date Values
##========##

#Dates are represented as the number of days since 1970-01-01, with 
#negative values for earlier dates.

# use as.Date( ) to convert strings to dates
mydates <- as.Date(c("2007-06-22", "2004-02-13"))

# number of days between 6/22/07 and 2/13/04
days <- mydates[1] - mydates[2]
days
Sys.Date( ) #returns today's date.

#print today's date
today <- Sys.Date()
format(today, format="%B %d %Y")


##========##
## Part 9 ## Creating new variables
##========##
install.packages("openair")
install.packages("utf8")

library(openair)
library(utf8)
data("mydata")
force(mydata)


#Use the assignment operator <- to create new variables. 
#A wide array of operators and functions are available here.

# Three examples for doing the same computations
mydata$sum <- mydata$ws + mydata$wd 
mydata$mean <- (mydata$ws + mydata$wd)/2
mydata

##method2
attach(mydata) 
mydata$sum <- ws+wd
mydata$mean <- (ws+wd)/2 
detach(mydata)
mydata <- transform( mydata,sum = ws+wd, mean = (ws+wd)/2)


##========##
## Part 10 ## Creating new variables
##========##
#install.packages("openair")
#install.packages("utf8")
library(openair)
library(utf8)
data("mydata")
force(mydata)

# Three examples for doing the same computations
mydata$sum <- mydata$ws + mydata$wd
mydata$mean <- (mydata$ws + mydata$wd)/2
mydata
##method2
attach(mydata)
mydata$sum <- ws+wd
mydata$mean <- (ws+wd)/2
detach(mydata)

mydata <- transform( mydata,sum = ws+wd, mean = (ws+wd)/2)
mydata


##========##
## Part 11 ##Basic commands
##========##
2+2
3^2
21/7
47%%10
47%/%10
height=5
height==5
height<-5:10
sqrt(64)
log10(100)
3*10*(4-2)
1:10
sqrt(25)==5
radius<-4
height!=5
height<7|height>8
exp(1)
log(exp(1))
runif(10)
10:1
sqrt(1:100)%%2
pi
radius<4
height[3:5]

##Control Structures 
##if else
# transpose of a matrix
# a poor alternative to built-in t() function

mytrans <- function(x) 
{ if (!is.matrix(x)) {warning("argument is not a matrix: returning NA")
  return(NA_real_)}
  y <- matrix(1, nrow=ncol(x), ncol=nrow(x)) 
  for (i in 1:nrow(x)) {
    for (j in 1:ncol(x)) {
      y[j,i] <- x[i,j] 
    }
  }
  return(y)}

# try it
z <- matrix(1:10, nrow=5, ncol=2)
tz <- mytrans(z) 
tz

##========##
## Part 12 ## Creating a Graph
##========##
attach(mtcars) #Motor Trend Car Road Tests
plot(wt, mpg) 
abline(lm(mpg~wt))
title("Regression of MPG on Weight")


##pie chart

pie.sales <- c(0.12, 0.3, 0.26, 0.16, 0.04, 0.12) 
names(pie.sales) <- c("Blueberry", "Cherry", "Apple", "Boston Cream", "Other", "Vanilla Cream") 
pie(pie.sales, main = "pie.sales") 

# default colours 
pie(pie.sales, col = c("purple", "violetred1", "green3", "cornsilk", "cyan", "white") , main = "pie.sales" ) 
pie(pie.sales, col = gray(seq(0.4, 1.0, length = 6)) , main = "pie.sales" )

# A Silly Axis Example
# specify the data 
x <- c(1:10); y <- x; z <- 10/x
# create extra margin room on the right for an axis 
par(mar=c(5, 4, 4, 8) + 0.1)
# plot x vs. y 
plot(x, y,type="b", pch=21, col="red",yaxt="n", lty=3, xlab="", ylab="")
# add x vs. 1/x 
lines(x, z, type="b", pch=22, col="blue", lty=2)
# draw an axis on the left 
axis(2, at=x,labels=x, col.axis="red", las=2)
# draw an axis on the right, with smaller text and ticks 
axis(4, at=z,labels=round(z,digits=2),col.axis="blue", las=2, cex.axis=0.7, tck=-.01)
# add a title for the right axis 
mtext("y=1/x", side=4, line=3, cex.lab=1,las=2, col="blue")
# add a main title and bottom and left axis labels 
title("An Example of Creative Axes", xlab="X values",ylab="Y=X") 


# Legend Example
attach(mtcars)
boxplot(mpg~cyl, main="Milage by Car Weight",yaxt="n", xlab="Milage", horizontal=TRUE,col=terrain.colors(3))
legend("topright", inset=.05, title="Number of Cylinders",c("4","6","8"), fill=terrain.colors(3), horiz=TRUE) 

#3 figures arranged in 3 rows and 1 column
attach(mtcars)
par(mfrow=c(3,1)) 
hist(wt)
hist(mpg)
hist(disp) 

# Add boxplots to a scatterplot
dev.off(dev.list()["RStudioGD"])  ##delete previous figure
par(fig=c(0,0.8,0,0.8), new=TRUE)
plot(mtcars$wt, mtcars$mpg, xlab="Miles Per Gallon",ylab="Car Weight")
par(fig=c(0,0.8,0.55,1), new=TRUE)
boxplot(mtcars$wt, horizontal=TRUE, axes=FALSE)
par(fig=c(0.65,1,0,0.8),new=TRUE)
boxplot(mtcars$mpg, axes=FALSE)
mtext("Enhanced Scatterplot", side=3, outer=TRUE, line=-3) 

#Desity plot
library(lattice)
attach(mtcars)
# create factors with value labels
gear.f<-factor(gear,levels=c(3,4,5),labels=c("3gears","4gears","5gears"))
cyl.f <-factor(cyl,levels=c(4,6,8),labels=c("4cyl","6cyl","8cyl")) 
# kernel density plot 
densityplot(~mpg, main="Density Plot", xlab="Miles per Gallon")
# kernel density plots by factor level 
densityplot(~mpg|cyl.f, main="Density Plot by Number of Cylinders", xlab="Miles per Gallon")

# boxplots for each combination of two factors 
bwplot(cyl.f~mpg|gear.f, ylab="Cylinders", xlab="Miles per Gallon", main="Mileage by Cylinders and Gears", layout=(c(1,3)))
# scatterplots for each combination of two factors 
xyplot(mpg~wt|cyl.f*gear.f, main="Scatterplots by Cylinders and Gears", ylab="Miles per Gallon", xlab="Car Weight")
# 3d scatterplot by factor level 
cloud(mpg~wt*qsec|cyl.f, main="3D Scatterplot by Cylinders") 
# dotplot for each combination of two factors 
dotplot(cyl.f~mpg|gear.f, main="Dotplot Plot by Number of Gears and Cylinders", xlab="Miles Per Gallon")
# scatterplot matrix 
splom(mtcars[c(1,3,4,5,6)], main="MTCARS Data") 


#heat map
require(grDevices); require(graphics) 
x <- as.matrix(mtcars) 
rc <- rainbow(nrow(x), start = 0, end = .3) 
cc <- rainbow(ncol(x), start = 0, end = .3) 
heatmap(x, Colv = NA, col = cm.colors(256), scale = "column", RowSideColors = rc, margins = c(5,10), xlab = "specification variables", ylab = "Car Models", main = "heatmap(<Mtcars data>, ..., scale = \"column\")")

### volcano

filled.contour(volcano, color.palette = terrain.colors, asp = 1) 
title(main = "volcano data: filled contour map")

