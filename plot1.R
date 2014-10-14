# Loads the data from the given link and prepares the data.
# Extracts only "2007-02-01" AND "2007-02-02" and 
# doing some formatting of dates and numerics.
loadAndPrepareData <- function(){
  
  if(!file.exists("exdata-data-household_power_consumption.zip")) {
    power_consumption <- tempfile()
    download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", power_consumption)
    file <- unzip(power_consumption)
    unlink(power_consumption)
  }
  power <- read.table(file, header=T, sep=";")
  power$Date <- as.Date(power$Date, format="%d/%m/%Y")
  df <- power[(power$Date=="2007-02-01") | (power$Date=="2007-02-02"),]
  df$Global_active_power <- as.numeric(as.character(df$Global_active_power))
  df$Global_reactive_power <- as.numeric(as.character(df$Global_reactive_power))
  df$Voltage <- as.numeric(as.character(df$Voltage))
  df <- transform(df, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
  df$Sub_metering_1 <- as.numeric(as.character(df$Sub_metering_1))
  df$Sub_metering_2 <- as.numeric(as.character(df$Sub_metering_2))
  df$Sub_metering_3 <- as.numeric(as.character(df$Sub_metering_3))
  df
}

# This function needs the prepared dataFrame from the loadAndPrepareData function
# call the function with plot1(loadAndPrepareData()) 
#   Or plot1(df) with the prepared dataset "df"
plot1 <- function(df) {
  hist(df$Global_active_power, main = paste("Global Active Power"), col="red", xlab="Global Active Power (kilowatts)")
  dev.copy(png, file="plot1.png", width=480, height=480)
  dev.off()
  cat("Plot1.png saved: ", getwd())
}