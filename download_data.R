library(data.table)

# Sets working directory to Coursera Assignment Directory
setwd("C:/Users/rober/Coursera/EDACourseProject1")

## Downloading and Extracting Datasets ##

# Download zip file containing datasets. Check to ensure it has not been already downloaded
zipUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
zipFilepath <- "exdata_data_household_power_consumption.zip"

if (!file.exists(zipFilepath)) {
    download.file(zipUrl, zipFilepath, mode = "wb")
}

# Unzip zip file containing data if data file does not already exist
datafilepath <- "household_power_consumption.txt"

if (!file.exists(datafilepath)) {
    unzip(zipFilepath)
}