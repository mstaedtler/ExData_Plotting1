# This function needs the prepared dataFrame 
# from the loadAndPrepareData function (see plot1.R for this function)
# call the function with plot1(loadAndPrepareData()) 
#   Or plot1(df) with the prepared dataset "df"
plot3 <- function(df) {
  plot(df$timestamp,df$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
  lines(df$timestamp,df$Sub_metering_2,col="red")
  lines(df$timestamp,df$Sub_metering_3,col="blue")
  legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), lwd=c(1,1))
  dev.copy(png, file="plot3.png", width=480, height=480)
  dev.off()
  cat("plot3.png saved: ", getwd())
}
