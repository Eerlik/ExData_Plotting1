
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
 

# #only for the dates 2007-02-01 and 2007-02-02
KWdata <- subset(KWdata, KWdata$Date == "1/2/2007" | KWdata$Date == "2/2/2007")
#Combine day and time data
n=length(KWdata$Date)
# DateTime=c()
for (i in 1:n){
  KWdata$Date[i]<-as.Date(KWdata$Date[i], format = "%d/%m/%Y")
  format(KWdata$Date[i],"%Y-%m-%d")

#   DateTime[i]= paste(KWdata$Date[i], KWdata$Time[i], sep = " ")
#   DateTime[i]<-as.Date(DateTime[i], format = "%d/%m/%Y")
}





## -------------------------------
## Plot the data
png("plot1.png", 
    width = 480, height = 480,
    units = "px", bg = "transparent")
hist(KWdata$Global_active_power, breaks=20, 
     col="red", 
     xlab = "Global Active Power (kilowatts)", 
     main ="Global Active Power")
dev.off()

