setwd("/Users/mkinet/Desktop/CourseProject1/")

datanames<-read.table("./household_power_consumption.txt",header=TRUE,sep=";",nrows=1)
data<-read.table("./household_power_consumption.txt",header=FALSE,sep=";",nrows=2880,skip=66637,na.strings="?",
                 col.names=colnames(datanames))

# PLOT 1
#open graphic device
png(filename="plot1.png")
#make histogram and modify default xlabel and default title
with(data,hist(Global_active_power,col='red',main='Global Active Power',xlab="Global Active Power (kilowatts)"))
#close graphic device
dev.off()
