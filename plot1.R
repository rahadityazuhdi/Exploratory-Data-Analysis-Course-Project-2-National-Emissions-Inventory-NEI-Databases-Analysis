NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

TotalByYear <- aggregate(Emissions ~ year, NEI, sum)

png(filename = 'plot1.png')
barplot(height = TotalByYear$Emissions/1000 , 
        names.arg = TotalByYear$year, 
        main = expression('Total PM'[2.5]*' emissions at various years in kilotons'), 
        xlab = "Year", 
        ylab = "Total PM2.5 emission in kilotons", 
        col = "light blue")
dev.off()