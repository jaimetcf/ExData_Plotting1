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

# Converts Sub_meterings columns to numeric
dhpc[,7] <- as.numeric(dhpc[,7]);
dhpc[,8] <- as.numeric(dhpc[,8]);
dhpc[,9] <- as.numeric(dhpc[,9]);

# Gets the y range for ploting the graph
r <- range(dhpc$Sub_metering_1, 
           dhpc$Sub_metering_2, 
           dhpc$Sub_metering_3  ); 


# Opens png device and creates plot3.png file
png(file = "plot3.png");

# Plots Sub_metering charts
plot(dhpc$Sub_metering_1,
     type="l",
     col="black",
     xaxt="n", 
     ylim=r,
     xlab="",
     ylab="",
     main="");

par(new=TRUE)
plot(dhpc$Sub_metering_2,
     type="l",
     col="red",
     xaxt="n", 
     ylim=r,
     xlab="",
     ylab="",
     main="");

par(new=TRUE)
plot(dhpc$Sub_metering_3,
     type="l",
     col="blue",
     xaxt="n", 
     ylim=r,
     xlab="",
     ylab="Energy sub metering",
     main="");

# Prints x axis scale
npoints <- nrow(dhpc);
axis(side = 1,                       # Axis labels below chart
     labels = c("Thu","Fri", "Sat"), # Labels to show
     at = c(1,npoints/2,npoints)     # Where to put the labels
     )

# Puts the legend on the graph
legend("topright",                   # Legend position
       legend=c("Sub_metering_1",    # Labels to show
                "Sub_metering_2", 
                "Sub_metering_3"),
       lwd=1,                        # Legend line width
       col=c("black", "red", "blue") # Legend lines colors
       )


# Closes the png file device
dev.off();

