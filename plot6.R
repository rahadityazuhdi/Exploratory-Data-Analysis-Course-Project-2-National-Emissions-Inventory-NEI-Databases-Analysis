NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

Baltimore_LA <- NEI[(NEI$fips=="24510"|NEI$fips=="06037") & NEI$type=="ON-ROAD",  ]
aggregatedTotalByYearAndFips.Baltimore_LA <- aggregate(Emissions ~ year + fips, Baltimore_LA, sum)
aggregatedTotalByYearAndFips.Baltimore_LA$fips[aggregatedTotalByYearAndFips.Baltimore_LA$fips=="24510"] <- "Baltimore, MD"
aggregatedTotalByYearAndFips.Baltimore_LA$fips[aggregatedTotalByYearAndFips.Baltimore_LA$fips=="06037"] <- "Los Angeles, CA"

library(ggplot2)

png("plot6.png", width=1040, height=480)
g <- ggplot(aggregatedTotalByYearAndFips.Baltimore_LA, aes(factor(year), Emissions))
g <- g + facet_grid(. ~ fips)
g <- g + geom_bar(stat="identity")  +
        xlab("year") +
        ylab(expression('Total PM'[2.5]*" Emissions")) +
        ggtitle('Total Emissions from motor vehicle in Baltimore City, MD vs Los Angeles, CA 1999-2008')
print(g)
dev.off()