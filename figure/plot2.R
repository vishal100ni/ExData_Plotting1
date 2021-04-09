# Reading the Data
datafile <- "./household_power_consumption.txt"
dataset <- read.table(file = datafile,header = TRUE,sep = ";", dec = ".", stringsAsFactors = FALSE)
head(dataset)

#subsetting the dataset
subset_data <- dataset[dataset$Date %in% c("1/2/2007", "2/2/2007"),]
str(subset_data)

# Changing the date format with function `strptime`
datetime <- strptime(paste(subset_data$Date, subset_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
global_active_power <- as.numeric(subset_data$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, global_active_power, "l" , xlab = "", ylab = "Global Active Power (Killowatts)")
dev.off()
