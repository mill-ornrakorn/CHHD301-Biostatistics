#===============================================================
#                 CHHD301-Biostatistics
#===============================================================
# TITLE  : Biostatistics and Data Analysis by R
# DATA   : Data 4 - Risk factors & Colorectal cancer
# BY     : Ornrakorn Mekchaiporn 6205025
# DATE   : 29 Jan 2021
#===============================================================

#setting

rm(list = ls())  # clear environment

getwd()   
dirname <- " อย่าลืมเปลี่ยน directory "
setwd(dirname)  # set the working directory to dir name


data4 <- read.csv("../Data/Data - 4_Risk_factors+Colorectal_cancer.csv", header = TRUE, as.is = TRUE)
data4


attach(data4)


##===========================##
##  3.Descriptive Statistics ##
##===========================##

#+-+-+-+-+-+-+-+ Categorical data +--+-+-+-+-+-+#

# 1.fh: ประวัติครอบครัวเป็นมะเร็ง
#-Frequency Table
Freq_fh <- table(fh)
Freq_fh

#-Relative Frequency
RelaFre_fh <- Freq_fh / length(fh)
RelaFre_fh

#-Percentage
RelaFre_fh_percen <- RelaFre_fh *100
Percen_fh <- paste(format(RelaFre_fh_percen, digits = 1, format = "f"), "%",sep="")
Percen_fh

#-----------------------------------------#
# 2.dm: ประวัติโรคเบาหวาน
#-Frequency
Freq_dm <- table(dm)
Freq_dm

#-Relative Frequency
RelaFre_dm <- Freq_dm / length(dm)
RelaFre_dm

#-Percentage
RelaFre_dm_percen <- RelaFre_dm *100
Percen_dm <- paste(format(RelaFre_dm_percen, digits = 1, format = "f"), "%",sep="")
Percen_dm

#-----------------------------------------#
# 3.smoking: ประวัติการสูบบุหรี่
#-Frequency
Freq_smoking <- table(smoking)
Freq_smoking

#-Relative Frequency
RelaFre_smoking <- Freq_smoking / length(smoking)
RelaFre_smoking

#-Percentage
RelaFre_smoking_percen <- RelaFre_smoking *100
Percen_smoking <- paste(format(RelaFre_smoking_percen, digits = 1, format = "f"), "%",sep="")
Percen_smoking

#-----------------------------------------#
# 4.fit: Fecal immunochemical test (FIT)
#-Frequency Table
Freq_fit <- table(fit)
Freq_fit

#-Relative Frequency
RelaFre_fit <- Freq_fit / length(fit)
RelaFre_fit

#-Percentage
RelaFre_fit_percen <- RelaFre_fit *100
Percen_fit <- paste(format(RelaFre_fit_percen, digits = 1, format = "f"), "%",sep="")
Percen_fit

#-----------------------------------------#
# 5.coloscopy: ผลการส่องกล้อง
#-Frequency Table
Freq_coloscopy <- table(coloscopy)
Freq_coloscopy

#-Relative Frequency
RelaFre_coloscopy <- Freq_coloscopy / length(coloscopy)
RelaFre_coloscopy

#-Percentage
RelaFre_coloscopy_percen <- RelaFre_coloscopy *100
Percen_coloscopy <- paste(format(RelaFre_coloscopy_percen, digits = 1, format = "f"), "%",sep="")
Percen_coloscopy

#+-+-+-+-+-+-+-+ Numerical data +--+-+-+-+-+-+#
# 1.age
#--Measures of Location---
#-Mean
mean(age)

#-Median
median(age)

#-Mode
FreqTable_age <- table(age)
names(FreqTable_age)[which(FreqTable_age==max(FreqTable_age))]


#--Measures of Spread---
#-Range
range(age)

#-SD
sd(age)

#-Variance
var(age)

#-Quantile
quantile(age)

#-----------------------------------------#
# 2.BMI
#--Measures of Location---
#-Mean
mean(bmi)

#-Median
median(bmi)

#-Mode
FreqTable_bmi <- table(bmi)
names(FreqTable_bmi)[which(FreqTable_bmi==max(FreqTable_bmi))]


#--Measures of Spread---
#-Range
range(bmi)

#-SD
sd(bmi)

#-Variance
var(bmi)

#-Quantile
quantile(bmi)

#-----------------------------------------#
# 3.Hematocrit
#--Measures of Location---
#-Mean
mean(hematocrit)

#-Median
median(hematocrit)

#-Mode
FreqTable_hematocrit <- table(hematocrit)
names(FreqTable_hematocrit)[which(FreqTable_hematocrit==max(FreqTable_hematocrit))]


#--Measures of Spread---
#-Range
range(hematocrit)

#-SD
sd(hematocrit)

#-Variance
var(hematocrit)

#-Quantile
quantile(hematocrit)


##============================================================================##

##===========================##
##   4.Data Visualization    ##
##===========================##

#+-+-+-+-+-+-+-+ Categorical data +--+-+-+-+-+-+#

# 1.fh: ประวัติครอบครัวเป็นมะเร็ง

#-Frequency Table
FreqTable_fh <- table(fh)
FreqTable_fh

#-Bar Graph
counts_fh <- table(fh)
color_fh <- c("#e98167", "#79aca9")  #กำหนดสี

barplot(counts_fh, col = color_fh,main="Family History of Cancer in Patients Bar Graph",
        ylab="Number of Patients")


#-Pie Chart
counts_fh <- table(fh)
color_fh <- c("#e98167", "#79aca9")  #กำหนดสี

pct_fh <- round(counts_fh/sum(counts_fh)*100)
lbls_fh <- paste(pct_fh,"%",sep="") #เพิ่ม % ไปในpie

pie(counts_fh, labels = lbls_fh, col = color_fh, main = "Family History of Cancer in Patients Pie Chart") 
legend("topright", c("No","Yes"), cex = 1, fill = color_fh) #กรอบที่บอกว่าสีนี้คืออะไร


#-----------------------------------------#
# 2.dm: ประวัติโรคเบาหวาน
#-Frequency Table
FreqTable_dm <- table(dm)
FreqTable_dm

#-Bar Graph
counts_dm <- table(dm)
color_dm <- c("#5B6B8F", "#FED48A")  #กำหนดสี

barplot(counts_dm, col = color_dm,main="History of Diabetes Mellitus in Patients Bar Graph",
        ylab="Number of Patients")


#-Pie Chart
counts_dm <- table(dm)
color_dm <- c("#5B6B8F", "#FED48A")  #กำหนดสี

pct_dm <- round(counts_dm/sum(counts_dm)*100)
lbls_dm <- paste(pct_dm,"%",sep="") #เพิ่ม % ไปในpie

pie(counts_dm, labels = lbls_dm, col = color_dm, main = "History of Diabetes Mellitus in Patients Pie Chart") 
legend("topright", c("No","Yes"), cex = 1, fill = color_dm) #กรอบที่บอกว่าสีนี้คืออะไร

#-----------------------------------------#
# 3.smoking: ประวัติการสูบบุหรี่
#-Frequency Table
FreqTable_smoking <- table(smoking)
FreqTable_smoking

#-Bar Graph
counts_smoking <- table(smoking)
color_smoking <- c("#B8A489", "#BE854D")  #กำหนดสี

barplot(counts_smoking, col = color_smoking,main="History of Smoking in Patients Bar Graph",
        ylab="Number of Patients")


#-Pie Chart
counts_smoking <- table(smoking)
color_smoking <- c("#B8A489", "#BE854D")  #กำหนดสี

pct_smoking <- round(counts_smoking/sum(counts_smoking)*100)
lbls_smoking <- paste(pct_smoking,"%",sep="") #เพิ่ม % ไปในpie

pie(counts_smoking, labels = lbls_smoking, col = color_smoking, main = "History of Smoking in Patients Pie Chart") 
legend("topright", c("No","Yes"), cex = 1, fill = color_smoking)  #กรอบที่บอกว่าสีนี้คืออะไร

#-----------------------------------------#
#4.fit: Fecal immunochemical test (FIT)
#-Frequency Table
FreqTable_fit <- table(fit)
FreqTable_fit

#-Bar Graph
counts_fit <- table(fit)
color_fit <- c("#A5CAD2", "#D87F81")  #กำหนดสี

barplot(counts_fit, col = color_fit,main="Fecal Immunochemical Test (FIT) in Patients Bar Graph",
        ylab="Number of Patients")


#-Pie Chart
counts_fit <- table(fit)
color_fit <- c("#A5CAD2", "#D87F81") #กำหนดสี

pct_fit <- round(counts_fit/sum(counts_fit)*100)
lbls_fit <- paste(pct_fit,"%",sep="")  #เพิ่ม % ไปในpie

pie(counts_fit, labels = lbls_fit, col = color_fit, main = "Fecal Immunochemical Test (FIT) in Patients Pie Chart") 
legend("topright", c("Negative","Positive"), cex = 1, fill = color_fit) #กรอบที่บอกว่าสีนี้คืออะไร

#-----------------------------------------#
# 5.coloscopy: ผลการส่องกล้อง
#-Frequency Table
FreqTable_coloscopy <- table(coloscopy)
FreqTable_coloscopy

#-Bar Graph
counts_coloscopy <- table(coloscopy)
color_coloscopy <- c("#E8B298", "#A46360","#EECC8C") #กำหนดสี

barplot(counts_coloscopy, col = color_coloscopy,main= "Coloscopy in Patients Bar Graph",
        ylab="Number of Patients")


#-Pie Chart
counts_coloscopy <- table(coloscopy)
color_coloscopy <- c("#E8B298", "#A46360","#EECC8C") #กำหนดสี

pct_coloscopy <- round(counts_coloscopy/sum(counts_coloscopy)*100)
lbls_coloscopy <- paste(pct_coloscopy,"%",sep="")  #เพิ่ม % ไปในpie

pie(counts_coloscopy, labels = lbls_coloscopy, col = color_coloscopy, main = "Coloscopy in Patients Pie Chart") 
legend("topright", c("Abnormal","Colorectal cancer", "Normal"), cex = 1.01, fill = color_coloscopy) #กรอบที่บอกว่าสีนี้คืออะไร




#+-+-+-+-+-+-+-+ Numerical data +--+-+-+-+-+-+#
#1.age
#-Histograms
hist(age, col="#8CCCC8", main = "Age of Patients",
     ylab="Number of Patients",
     xlab="Age (years)")

#-Boxplot
boxplot(age, col="#8CCCC8", main = "Age of Patients",
        ylab = "Age (years)",
        xlab = "Patients")

#-----------------------------------------#
#2.bmi
#-Histograms
hist(bmi, col="#C7D5F9", main = "BMI of Patients",
     ylab="Number of Patients",
     xlab="BMI")

#-Boxplot
boxplot(bmi, col="#C7D5F9", main = "BMI of Patients",
        ylab = "BMI",
        xlab = "Patients")

#-----------------------------------------#
#3.hematocrit
#-Histograms
hist(hematocrit, col="#E14F4F", main = "Hematocrit of Patients",
     ylab="Number of Patients",
     xlab="Hematocrit")

#-Boxplot
boxplot(hematocrit, col="#E14F4F", main = "Hematocrit of Patients",
        ylab = "Hematocrit",
        xlab = "Patients")
