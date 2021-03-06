library(plyr)
library(dplyr)
library(ggplot2)
library(ggthemes)

gdat <- read.delim("gapminder.tsv")

ggplot(gdat, aes(x=lifeExp, fill=continent)) + geom_density(alpha=0.5) + facet_wrap(~year) +  ggtitle("Density plot of life expectancy by year") + theme(legend.position="right", plot.title = element_text(size = 15, face="bold")) + xlab("Life Expectancy") + ylab("Density")

# save graph to file

ggsave(file = "lifeExp-density.png")

quantile<-gdat %>%
	group_by(year) %>%
	summarise(q3 = quantile(lifeExp, 0.75), q1 = quantile(lifeExp, 0.25))

ggplot(gdat, aes(x = year, y = lifeExp, colour = lifeExp < quantile$q3 & lifeExp > quantile$q1)) + geom_point(aes(group=year)) + facet_wrap(~ continent) + ggtitle("Life expectancy within 25-75% quantile over time") + theme(legend.position="top", plot.title = element_text(size = 15, face="bold")) + xlab("Year") + ylab("Life Expectancy") + scale_x_continuous(breaks=seq(from=1950, to=2007, by=25)) + scale_y_continuous(breaks=seq(30,80,by=20)) + scale_color_economist(name = "Within 25-75% quantile")

# save graph to file

ggsave(file = "lifeExp-quantile.png")

quantile.gdp<-gdat %>%
	group_by(year) %>%
	summarise(q3 = quantile(gdpPercap, 0.75), q1 = quantile(gdpPercap, 0.25))

ggplot(gdat, aes(x = year, y = gdpPercap, colour = gdpPercap < quantile.gdp$q3 & gdpPercap > quantile.gdp$q1)) + geom_point(aes(group=year)) + facet_wrap(~ continent) + ggtitle("GDP per capita and 25-75% quantile over time") + theme(legend.position="top", plot.title = element_text(size = 15, face="bold")) + xlab("Year") + ylab("GDP per capita") + scale_x_continuous(breaks=seq(from=1950, to=2007, by=25)) + scale_y_log10() + scale_color_discrete(name = "Within 25-75% quantile")


# save graph to file

ggsave(file = "gdp-quantile.png")

# Check factor levels

levels(gdat$continent)

# Change the factor levels by life expectancy

gdat <- gdat %>%
	mutate(continent = reorder(continent, lifeExp, max)) %>%
	arrange(continent)

# Now the factor levels and order of data should be changed

levels(gdat$continent) 
head(gdat)

# save the data into another file

dput(gdat, "sorted_gapminder.tsv")