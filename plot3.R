
## open file
hpc<-read.table("data/household_power_consumption.txt",
                header=TRUE, sep=";",na.strings = "?",
                colClasses=c(rep("character",2),rep("numeric",7))
);
##convert to date
hpc$date2<-as.Date(hpc$Date,"%d/%m/%Y");
##select specific dates
hpc_sel<-hpc[hpc$date2==c("2007-02-01","2007-02-02"),]
##create dateTime variable
hpc_sel$dateTime<-as.POSIXct(paste(hpc_sel$Date,hpc_sel$Time),format="%d/%m/%Y %H:%M:%S") 

##plot first
plot(hpc_sel$dateTime,
     hpc_sel$Sub_metering_1,type="l",     
     ylab="Energy sub metering",xlab="")
#add second
lines(hpc_sel$dateTime,hpc_sel$Sub_metering_2,col="red")
#add third line
lines(hpc_sel$dateTime,hpc_sel$Sub_metering_3,col="blue")
#add legend
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c(1,"orange","blue"), lty=1,border="black")

#copy plot to file
dev.copy(png, file="plot3.png");
dev.off();