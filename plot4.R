Enter file contents here#store langugage settings
user_lang <- Sys.getlocale("LC_TIME")
Sys.setlocale("LC_TIME", "English")

# read txt file and convert Date to a date variable
epower <- read.table("./04_Exploratory_Data_Analysis/assignment1/household_power_consumption.txt",
                     sep=";", header=TRUE, dec=".")
epower$Date <- as.Date(epower$Date,"%d/%m/%Y")

# Extract data for 2007-02-01 and 2007-02-02

epower07 <- subset(epower,epower$Date %in% as.Date(c("2007-02-01","2007-02-02"),"%Y-%m-%d"))

# Construct a datetime variable 
epower07$datetimestring <- paste(epower07$Date, epower07$Time)
epower07$datetimestring <- strptime(epower07$datetimestring,format = "%Y-%m-%d %H:%M:%S")

# transform factor variables into numeric variables

epower07$Global_active_power <- as.character(epower07$Global_active_power)
epower07$Global_active_power <- as.numeric(epower07$Global_active_power)
epower07$Global_reactive_power <- as.character(epower07$Global_reactive_power)
epower07$Global_reactive_power <- as.numeric(epower07$Global_reactive_power)
epower07$Voltage <- as.character(epower07$Voltage)
epower07$Voltage <- as.numeric(epower07$Voltage)
epower07$Sub_metering_1 <- as.character(epower07$Sub_metering_1)
epower07$Sub_metering_1 <- as.numeric(epower07$Sub_metering_1)
epower07$Sub_metering_2 <- as.character(epower07$Sub_metering_2)
epower07$Sub_metering_2 <- as.numeric(epower07$Sub_metering_2)
epower07$Sub_metering_3 <- as.character(epower07$Sub_metering_3)
epower07$Sub_metering_3 <- as.numeric(epower07$Sub_metering_3)

# Plot 4
png(filename = "plot4.png", width=480, height=480)
par(mfrow = c(2,2))
with(epower07,{
        plot(datetimestring,Global_active_power,type='l', xlab = '',
             ylab = 'Global Active Power', main='') 
        
        plot(datetimestring,Voltage,type='l', xlab = 'datetime',
             ylab = 'Voltage', main='')  
        
        plot(epower07$datetimestring, epower07$Sub_metering_1, main="", type='l', xlab = '', 
             ylab = 'Energy sub metering')
        points(epower07$datetimestring, epower07$Sub_metering_2, type='l', col="red")
        points(epower07$datetimestring, epower07$Sub_metering_3, type='l', col="blue")
        axis(side=2, at=seq(0,40, 10), labels=seq(0,40,10))
        legend("topright", pch = "-", col = c("black","red","blue"), lty = 1,
               legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
        
        plot(datetimestring,Global_reactive_power,type='l', xlab = 'datetime',
             ylab = 'Global_reactive_power', main='')  
})
dev.off()


#restore language
Sys.setlocale("LC_TIME", user_lang)
