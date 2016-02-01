#!/usr/bin/env Rscript


# load awesome things
library(ggplot2)
library(ggthemes)

# set data frame to read csv
data <- read.csv('scatterplot.csv')

# create png
png('scatterplot.png', width=800, height=800)

# use ggplot
ggplot(data, aes(x=x,y=y)) + geom_point() + 
    theme_economist() + 
    scale_colour_economist() 
dev.off()
