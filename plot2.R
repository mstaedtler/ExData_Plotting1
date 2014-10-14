
# This function needs the prepared dataFrame 
# from the loadAndPrepareData function (see plot1.R for this function)
# call the function with plot1(loadAndPrepareData()) 
#   Or plot1(df) with the prepared dataset "df"
plot2 <- function(df) {
  plot(df$timestamp,df$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
  dev.copy(png, file="plot2.png", width=480, height=480)
  dev.off()
  cat("plot2.png saved: ", getwd())
}