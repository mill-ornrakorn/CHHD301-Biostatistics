#===============================================================
#                CHHD301-Biostatistics
#===============================================================
# INSTRUCTOR : Dr. Wiriya Mahikul
# TITLE      : Lecture 13 - Correlation and Regression
#===============================================================

##============================ Correlation ============================

## หน้า 14
# Portray the following information in a scatter
# diagram. What observations can you make about
# the relationship between the height and the weight?

Height<-c(90,100,100,110,110,120,120,130,130,
     140,150,150,160,160,170,180)
Weight<-c(10,15,25,20,25,25,30,25,
          30,40,45,50,55,60,60,60)
plot(Height, Weight, main="Scatterplot between the height and the weight",
     xlab="Height ", ylab="Weight ", pch=19)

## หน้า 17
# จากการฉีด vaccine covid-19 ไป 10 ประเทศ โดยแต่ละประเทศ
# มีน้ำหนักและส่วนสูงเฉลี่ยในวัยเรียน ที่มีการแจกแจงแบบปกติดังนี้

# จากตารางข้างต้น สามารถสรุปได้หรือไม่ว่า น้ำหนักมี
# ความสัมพันธ์เชิงเส้นกับส่วนสูง ที่ระดับนัยสําคัญ 0.05


Height<-c(90,100,100,110,110,120,120,130,130,140)
sum(Height)
Weight<-c(10,15,25,20,25,25,30,25,30,40)
sum(Weight)
r=(10*sum(Height*Weight)-sum(Height)*sum(Weight))/sqrt((10*sum(Height^2)-(sum(Height))^2)*(10*sum(Weight^2)-(sum(Weight))^2))
r
plot(Height, Weight, main="Scatterplot between the height and the weight",
     xlab="Height ", ylab="Weight ", pch=19)
cor(Height,Weight)
qt(0.025,df=8)
pt(4.898,df=8,lower.tail = FALSE)*2
pt(-4.898,df=8,lower.tail = FALSE)


plot(Weight~Height, main="Scatterplot between the height and the weight",
     xlab="Height ", ylab="Weight ", pch=19)
lm.fit =lm(Weight~Height )
lm.fit
summary (lm.fit )


## หน้า 23
# จากการฉีด vaccine covid-19 ไป 10 ประเทศ พบว่าเปอร์เซ็นต์
# การฉีดวัคซีนและอัตราการติดเชื้อหลังจากการฉีดวัคซีน ที่มีการแจกแจงแบบปกติ ดังนี้...

#จากตารางข้างต้น สามารถสรปได้หรือไม่ว่า เปอร์เซ็นต์การฉีดวัคซีน
# มีความสัมพันธ์เชิงเส้นกับอัตราการติดเชื้อหลังจากการฉีดวัคซีน ที่ระดับนัยสำคัญ 0.05

immunization<-c(77,69,32,85,94,99,89,13,95,95)
infection<-c(118,65,184,8,43,12,55,208,7,9)
plot(immunization, infection, main="Scatterplot between immunization and infection of COVID-19",
     xlab="immunization ", ylab="infection ", pch=19)
cor(immunization,infection)
qt(0.025,df=8)
pt(7.723,df=8,lower.tail = FALSE)*2
pt(-7.723,df=8,lower.tail = FALSE)


plot(infection ~ immunization, main="Scatterplot between immunization and infection of COVID-19",
     xlab="immunization ", ylab="infection ", pch=19)
lm.fit =lm(infection ~ immunization )
lm.fit
summary (lm.fit )


## หน้า 29
## correlation matrix
Height<-c(90,100,100,110,110,120,120,130,130,140)
sum(Height)
Weight<-c(10,15,25,20,25,25,30,25,30,40)
sum(Weight)
immunization<-c(77,69,32,85,94,99,89,13,95,95)
infection<-c(118,65,184,8,43,12,55,208,7,9)
data<-matrix(c(Height,Weight,immunization,infection),nrow = 10, ncol = 4)
data
colnames(data) <- c("Height","Weight","immunization","infection")
library("Hmisc")
rcorr(data)

##============================ Regression ============================
## หน้า 23
# จากการฉีด vaccine covid-19 ไป 10 ประเทศ โดยแต่ละประเทศมีน้ำหนักและส่วนสูงเฉลี่ย ใน
# วัยเรียน ที่มีการแจกแจงแบบปกติ ดังนี้..

# จงประมาณค่า (estimate) เมื่อส่วนสูงเท่ากับ 95 cm หรือ 122 cm แล้วน้ำหนักจะเป็นเท่าไร

Height<-c(90,100,100,110,110,120,120,130,130,140)
Weight<-c(10,15,25,20,25,25,30,25,30,40)

plot(Weight~Height, main="Scatterplot between the height and the weight",
     xlab="Height ", ylab="Weight ", pch=19)
lm.fit =lm(Weight~Height )
lm.fit
summary (lm.fit)
abline (lm.fit, col =" red ")

predict(lm.fit, data.frame(Height = c(95,122)))


