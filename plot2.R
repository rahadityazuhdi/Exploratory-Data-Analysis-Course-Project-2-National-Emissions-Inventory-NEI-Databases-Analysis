NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

Baltimore <- subset(NEI, fips == "24510")
TotalByYear_Baltimore <- aggregate(Emissions ~ year, Baltimore, sum)

png(filename = 'plot2.png')
barplot(height = TotalByYear_Baltimore$Emissions/1000 , 
        names.arg = TotalByYear_Baltimore$year, 
        main = expression('Total PM'[2.5]*' emissions in Baltimore City-MD in kilotons'), 
        ylim = c(0,4), 
        xlab = "Year", 
        ylab = expression('total PM'[2.5]*' emission in kilotons'), 
        col = "light blue")
dev.off()