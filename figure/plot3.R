# Reading the Data
datafile <- "./household_power_consumption.txt"
dataset <- read.table(file = datafile,header = TRUE,sep = ";", dec = ".", stringsAsFactors = FALSE)
head(dataset)

#subsetting the dataset
subset_data <- dataset[dataset$Date %in% c("1/2/2007", "2/2/2007"),]
str(subset_data)

# Changing the date format with function `strptime`
datetime <- strptime(paste(subset_data$Date, subset_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

submetric1 <- as.numeric(subset_data$Sub_metering_1)
submetric2 <- as.numeric(subset_data$Sub_metering_2)
submetric3 <- as.numeric(subset_data$Sub_metering_3)


png("plot3.png", width = 480, height = 480)
plot(datetime, submetric1, type = "l", xlab = "", ylab = "Enery sub metering")
lines(datetime, submetric2, type = "l", col ="red")
lines(datetime, submetric3, type ="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
