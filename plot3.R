NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(ggplot2)

png(filename = 'plot3.png')
plot <- (ggplot(TotalByYearandType_Baltimore, aes(x=year, y=Emissions, color = type)) 
         + geom_line() + ggtitle(expression('Total PM'[2.5]*' emissions in Baltimore City-MD in kilotons')) 
         + xlab("year") 
         + ylab(expression('total PM'[2.5]*' emission in kilotons')))
print(plot)
dev.off()