
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

##plot
plot(hpc_sel$dateTime,hpc_sel$Global_active_power,
     type="l",ylim=c(0,8), ylab="Global Active Power (kilowatts)",
     xlab="");

#copy plot to file
dev.copy(png, file="plot2.png");
dev.off();