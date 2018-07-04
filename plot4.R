setwd("D:/Programming/Data/course4")
df <- read.table('household_power_consumption.txt', na.strings = "?", header = TRUE, sep = ";")
df <-rbind(df[df$Date=="1/2/2007",],df[df$Date=="2/2/2007",])
df$Date <- as.Date(df$Date, format="%d/%m/%Y")
date_time <- paste(as.Date(df$Date), df$Time)
df$Date_time <- as.POSIXct(date_time)
df$Date <- NULL
df$Time <- NULL
df[, 1:7] <- lapply(1:7, function(x) as.numeric(df[[x]]))

par(mfrow=c(2,2))
plot(df$Global_active_power ~ df$Date_time, 
     type="l", 
     ylab = "Global Active Power", 
     xlab = "")

plot(df$Voltage ~ df$Date_time, 
     type="l", 
     ylab = "Voltage", 
     xlab = "datetime")

with(df, {plot(Sub_metering_1 ~ Date_time, 
               type="l", 
               ylab = "Energy sub metering", 
               xlab = ""
               )})
lines(df$Sub_metering_2 ~ df$Date_time, col = 'Red')
lines(df$Sub_metering_3 ~ df$Date_time, col = 'Blue')
legend("topright", 
       lty=1, 
       lwd =3, 
       col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

plot(df$Global_reactive_power ~ df$Date_time, 
     type="l", 
     ylab = "Global reactive power", 
     xlab = "datetime")