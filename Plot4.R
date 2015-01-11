setwd("/Users/mkinet/Desktop/CourseProject1/")

datanames<-read.table("./household_power_consumption.txt",header=TRUE,sep=";",nrows=1)
data<-read.table("./household_power_consumption.txt",header=FALSE,sep=";",nrows=2880,skip=66637,na.strings="?",
                 col.names=colnames(datanames))
#group date and time in 1 variable
data$DateTime<-paste(data$Date,data$Time)
#format date/time variable
data$DateTime<-strptime(data$DateTime,"%d/%m/%Y %H:%M:%S")

#PLOT 4
#open graphic device
png(filename="plot4.png")
#divide graphic window in 4 subfigure with 2 rows and 2 columns.
par(mfrow=c(2,2))
#add the four plots 1 by one.
with(data,{plot(DateTime,Global_active_power,ylab="Global Active Power",type="l",xlab="")
           plot(DateTime,Voltage,ylab="Voltage",xlab="datetime",type='l')
           plot(DateTime,Sub_metering_1,ylab="Energy sub metering",type="l",xlab="")
           lines(DateTime,Sub_metering_2,col="red")
           lines(DateTime,Sub_metering_3,col="blue")
           plot(DateTime,Global_reactive_power,type='l',xlab="datetime")})
#close graphic device
dev.off()