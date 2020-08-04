NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

subsetNEI.Motor <- NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD",  ]
aggregatedTotalByYear.Motor <- aggregate(Emissions ~ year, subsetNEI.Motor, sum)

library(ggplot2)

png("plot5.png", width=840, height=480)
g <- ggplot(aggregatedTotalByYear.Motor, aes(factor(year), Emissions))
g <- g + geom_bar(stat="identity") +
        xlab("year") +
        ylab(expression('Total PM'[2.5]*" Emissions")) +
        ggtitle('Emissions from motor vehicle sources changed from 1999–2008 in Baltimore City')
print(g)
dev.off()