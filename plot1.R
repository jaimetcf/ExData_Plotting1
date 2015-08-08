# Reads the data file
dset <- read.table("household_power_consumption.txt", 
                   header=TRUE, 
                   sep=";",
                   stringsAsFactors=FALSE );

# Gets only the rows where Data = "1/2/2007" Or "2/2/2007"
dhpc <- subset(dset, (Date=="1/2/2007") | 
                     (Date=="2/2/2007")   );

rm(dset);  # Releases memory used by dset

# Converts column Global_active_power to numeric
dhpc[,3] <- as.numeric(dhpc[,3]);

# Opens png device and creates plot1.png file
png(file = "plot1.png");

# Plots the Global_active_power histogram
hist(dhpc$Global_active_power, 
     col="red", 
     xlab="Global Active Power (Kilowatts)",
     main="Global Active Power");

# Closes the png file device
dev.off();
