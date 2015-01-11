setwd("/Users/mkinet/Desktop/CourseProject1/")

datanames<-read.table("./household_power_consumption.txt",header=TRUE,sep=";",nrows=1)
data<-read.table("./household_power_consumption.txt",header=FALSE,sep=";",nrows=2880,skip=66637,na.strings="?",
                 col.names=colnames(datanames))
#group date and time in 1 variable
data$DateTime<-paste(data$Date,data$Time)
#format date/time variable
data$DateTime<-strptime(data$DateTime,"%d/%m/%Y %H:%M:%S")


# PLOT 3
#open graphic device
png(filename="plot3.png")
#make line plot for the first data (sub_metering_1) and add lines for the other 2. Replace defaults axis label.
with(data,{plot(DateTime,Sub_metering_1,ylab="Energy sub metering",type="l",xlab="")
           lines(DateTime,Sub_metering_2,col="red")
           lines(DateTime,Sub_metering_3,col="blue")})
# add legend for the three lines.
legend(x="topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),
       col=c("black","red","blue"))
#close graphic device
dev.off()