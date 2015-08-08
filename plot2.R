# Reads the data file
dset <- read.table("household_power_consumption.txt", 
                   header=TRUE, 
                   sep=";",
                   stringsAsFactors=FALSE );

# Gets only the rows where Data = "1/2/2007" Or "2/2/2007"
dhpc <- subset(dset, (Date=="1/2/2007") | 
                     (Date=="2/2/2007")   );

rm(dset);

# Converts column Global_active_power to numeric
dhpc[,3] <- as.numeric(dhpc[,3]);

# Opens png device and creates plot2.png file
png(file = "plot2.png");

# Plots the Global_active_power chart
plot(dhpc$Global_active_power, 
     type="l",
     col="black", 
     xaxt="n",
     xlab="",
     ylab="Global Active Power (Kilowatts)",
     main="");

# Prints x axis scale
npoints <- nrow(dhpc);
axis(side = 1,                        # Axis labels below chart
     labels = c("Thu","Fri", "Sat"),  # Labels to show
     at = c(1,npoints/2,npoints))     # Where to put the labels

# Closes the png file device
dev.off();
