
## COURSERA == Exploratory Data Analysis == ##
##  WEEK 1 -> COURSE PROJECT   ##

# Date: 11 October 2014
# @author: Erik Redelinghuys 


## -------------------------------
## Clean up the interface
# ls()
# rm(list=ls())
# cat("\014")

library(base)
library(lubridate)

## -------------------------------
## Some information on the data:
#Headings:
#Date:  Time;   Global_active_power;  Global_reactive_power; 
# Voltage;      Global_intensity;     Sub_metering_1;  Sub_metering_2;  Sub_metering_3

# The dataset has 2,075,259 rows and 9 columns


## -------------------------------
## Read in the data
KWdata <- read.table(file ="./data/household_power_consumption.txt", sep = ";",
                     na.strings = "?", header = TRUE, 
                     colClasses = c("character","character","numeric","numeric","numeric",
                                    "numeric","numeric","numeric","numeric"))


#only for the dates 2007-02-01 and 2007-02-02
KWdata <- subset(KWdata, KWdata$Date == "1/2/2007" | KWdata$Date == "2/2/2007")


#Combine day and time data
n=length(KWdata$Date)
DateTime= paste(KWdata$Date, KWdata$Time, sep = " ")
#   DateTime[i]=ymd_hms(DateTime[i])

class(DateTime)<-"character"

Clean_dates = gsub("1/2/", replacement ="01-02-", DateTime )
Clean_dates = gsub("2/2/", replacement ="02-02-", Clean_dates )
#convert to "date" class
# Clean_dates<-as.Date(Clean_dates, format = "%Y-%m-%d %I:%M%p")
DateTime<-Clean_dates
DateTime <- strptime(DateTime, format="%d-%m-%Y %H:%M:%S")

KWdata<-cbind(DateTime, KWdata)


#convert to "date" class
# KWdata$DateTime<-as.Date(KWdata$DateTime, format = "%Y-%m-%d")
# x<-ymd(DateTime)

## -------------------------------
## Plot the data
png("plot3.png", 
    width = 480, height = 480,
    units = "px")
plot(x=DateTime, KWdata$Sub_metering_1,
     type = "l",
     col = "black",
     xlab = "", ylab = "Energy sub metering")
lines(DateTime, KWdata$Sub_metering_2, col = "red")
lines(DateTime, KWdata$Sub_metering_3, col = "blue")
legend("topright", 
       col = c("black", "red", "blue"),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lwd = 1)
dev.off()