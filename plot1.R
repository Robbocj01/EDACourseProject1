# Code to plot a histogram of the Global Active Power in kilowatts.

library(data.table)
library(dplyr)

# Sets working directory to Coursera Assignment Directory
setwd("C:/Users/rober/Coursera/EDACourseProject1")

# Power datafilepath
datafilepath <- "household_power_consumption.txt"

## Reading Downloaded Datafiles ##
powerdatatable <- data.table::fread(input = datafilepath,header=TRUE, na.strings = "?") 

## Tidy datafile

# Change Date Column to Date Type
powerdatatable[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SD = c("Date")]
# Subset Dates for 2007-02-01 and 2007-02-02
powerdatatable <- subset(powerdatatable, (Date >= "2007-02-01") & (Date <= "2007-02-02"))

png("plot1.png", width=500, height=500)

## Plot 1
hist(powerdatatable[, Global_active_power], main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.off()
