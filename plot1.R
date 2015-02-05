#store langugage settings
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

# Plot 1
png(filename = "plot1.png", width=480, height=480)
hist(epower07$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()

#restore language
Sys.setlocale("LC_TIME", user_lang)Enter file contents here
