
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
#check frequencies
table(hpc_sel$date2);

#plot global active power
hist(hpc_sel$Global_active_power, col="red",
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)");

#copy plot to file
dev.copy(png, file="plot1.png");
dev.off();

