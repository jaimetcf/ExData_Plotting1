# Reads the data file
dset <- read.table("household_power_consumption.txt", 
                   header=TRUE, 
                   sep=";",
                   stringsAsFactors=FALSE );

# Gets only the rows where Data = "1/2/2007" Or "2/2/2007"
dhpc <- subset(dset, (Date=="1/2/2007") | 
                     (Date=="2/2/2007")   );

rm(dset);   # Frees memory that won´t be used anymore

# Converts column Global_active_power to numeric
dhpc[,3] <- as.numeric(dhpc[,3]);

# Opens png device and creates plot2.png file
png(file = "plot2.png");

# Plots the Global_active_power chart
plot(dhpc$Global_active_power, 
     type="l",                 # Plots a line chart type
     col="black",              # Sets line color
     xaxt="n",                 # Removes default x axis scale
     xlab="",                  # Removes x labels
     ylab="Global Active Power (Kilowatts)", # Sets y label
     main="");                 # Removes char title

# Prints x axis scale
npoints <- nrow(dhpc);         # Gets number of rows in dhpc
axis(side = 1,                        # Axis labels below chart
     labels = c("Thu","Fri", "Sat"),  # Labels to show
     at = c(1,npoints/2,npoints))     # Where to put the labels

# Closes the png file device
dev.off();
