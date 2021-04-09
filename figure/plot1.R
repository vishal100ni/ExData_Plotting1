# Reading the Data
datafile <- "./household_power_consumption.txt"
dataset <- read.table(file = datafile,header = TRUE,sep = ";", dec = ".", stringsAsFactors = FALSE)
head(dataset)

#subsetting the dataset
subset_data <- dataset[dataset$Date %in% c("1/2/2007", "2/2/2007"),]
str(subset_data)

#Subsetting the Global active power data
global_active_power <- as.numeric(subset_data$Global_active_power)

#plotting it in the form of histogram
png(filename = "plo1.png", width = 480, height = 480)
hist(global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (Killowatts)")
dev.off()
