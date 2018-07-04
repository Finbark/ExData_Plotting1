setwd("D:/Programming/Data/course4")
df <- read.table('household_power_consumption.txt', na.strings = "?", header = TRUE, sep = ";")
df <-rbind(df[df$Date=="1/2/2007",],df[df$Date=="2/2/2007",])
df$Date <- as.Date(df$Date, format="%d/%m/%Y")
date_time <- paste(as.Date(df$Date), df$Time)
df$Date_time <- as.POSIXct(date_time)
df$Date <- NULL
df$Time <- NULL
df[, 1:7] <- lapply(1:7, function(x) as.numeric(df[[x]]))

hist(df$Global_active_power,
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency",
     col = "Red")