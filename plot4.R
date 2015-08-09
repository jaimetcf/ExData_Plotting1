# Reads the data file
dset <- read.table("household_power_consumption.txt", 
                   header=TRUE, 
                   sep=";",
                   stringsAsFactors=FALSE );

# Gets only the rows where Data = "1/2/2007" Or "2/2/2007"
dhpc <- subset(dset, (Date=="1/2/2007") | 
                     (Date=="2/2/2007")   );

rm(dset); # Frees memory that won´t be used anymore

# Converts column Global_active_power to numeric
dhpc[,3] <- as.numeric(dhpc[,3]);

# Converts Global_reactive_power to numeric
dhpc[,4] <- as.numeric(dhpc[,4]);

# Converts Voltage to numeric
dhpc[,5] <- as.numeric(dhpc[,5]);

# Converts Sub_meterings columns to numeric
dhpc[,7] <- as.numeric(dhpc[,7]);
dhpc[,8] <- as.numeric(dhpc[,8]);
dhpc[,9] <- as.numeric(dhpc[,9]);

# Gets the y range for ploting the graph
r <- range(dhpc$Sub_metering_1, 
           dhpc$Sub_metering_2, 
           dhpc$Sub_metering_3  ); 


# Opens png device and creates plot4.png file
png(file = "plot4.png");

# Prepares a chart panel with 2 rows and 2 columns 
par(mfrow=c(2,2));

# Plots the Global_active_power chart #######################
plot(dhpc$Global_active_power, 
     type="l",
     col="black", 
     xaxt="n",      # Removes default x axis scale
     xlab="",       # Removes default x labels
     ylab="Global Active Power",
     main="");

# Prints x axis scale
npoints <- nrow(dhpc);
axis(side = 1,                        # Axis labels below chart
     labels = c("Thu","Fri", "Sat"),  # Labels to show
     at = c(1,npoints/2,npoints))     # Where to put the labels
#############################################################

# Plots the Voltage chart ###################################
plot(dhpc$Voltage, 
     type="l",
     col="black", 
     xaxt="n",        # Removes default x axis scale
     xlab="datetime",
     ylab="Voltage",
     main="");

# Prints x axis scale
npoints <- nrow(dhpc);
axis(side = 1,                        # Axis labels below chart
     labels = c("Thu","Fri", "Sat"),  # Labels to show
     at = c(1,npoints/2,npoints))     # Where to put the labels
#############################################################

# Plots Sub_metering charts #################################
plot(dhpc$Sub_metering_1,
     type="l",
     col="black",
     xaxt="n",       # Removes default x axis scale
     ylim=r,         # Sets y range equal to r
     xlab="",        # No default x labels
     ylab="",        # No default y labels
     main="");

par(new=TRUE)        # Keep ploting in the same chart
plot(dhpc$Sub_metering_2,
     type="l",
     col="red",
     xaxt="n",       # Removes default x axis scale
     ylim=r,         # Sets y range equal to r
     xlab="",        # No default x labels
     ylab="",        # No default y labels
     main="");

par(new=TRUE)
plot(dhpc$Sub_metering_3,
     type="l",
     col="blue",
     xaxt="n",       # Removes default x axis scale
     ylim=r,         # Sets y range equal to r
     xlab="",        # No default x labels
     ylab="Energy sub metering", # Sets y label
     main="");

# Prints x axis scale
npoints <- nrow(dhpc);
axis(side = 1,                       # Axis labels below chart
     labels = c("Thu","Fri", "Sat"), # Labels to show
     at = c(1,npoints/2,npoints)     # Where to put the labels
     )

# Puts the legend on the graph
legend("topright",                   # Legend position
       bty= "n",                     # No border here
       cex=0.75,                     # Reduces legend size
       legend=c("Sub_metering_1",    # Labels to show
                "Sub_metering_2", 
                "Sub_metering_3"),
       lwd=1,                        # Legend line width
       col=c("black", "red", "blue") # Legend lines colors
       )
#############################################################

# Plots the Global_reactive_power chart #####################
plot(dhpc$Global_reactive_power, 
     type="l",
     col="black", 
     xaxt="n",         # No default x axis scale
     xlab="datetime",
     ylab="Global Reactive Power",
     main="");

# Prints x axis scale
npoints <- nrow(dhpc);
axis(side = 1,                        # Axis labels below chart
     labels = c("Thu","Fri", "Sat"),  # Labels to show
     at = c(1,npoints/2,npoints))     # Where to put the labels
#############################################################

# Closes the png file device
dev.off();
