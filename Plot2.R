setwd("/Users/mkinet/Desktop/CourseProject1/")

datanames<-read.table("./household_power_consumption.txt",header=TRUE,sep=";",nrows=1)
data<-read.table("./household_power_consumption.txt",header=FALSE,sep=";",nrows=2880,skip=66637,na.strings="?",
                 col.names=colnames(datanames))
#group date and time in 1 variable
data$DateTime<-paste(data$Date,data$Time)
#format date/time variable
data$DateTime<-strptime(data$DateTime,"%d/%m/%Y %H:%M:%S")


# PLOT 2
#open graphic device
png(filename="plot2.png")
#make line plot. replace default ylabel and remove xlabel.
with(data,plot(DateTime,Global_active_power,ylab="Global Active Power (kilowatts)",type="l",xlab=""))
#close graphic device
dev.off()
