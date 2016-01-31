#!/usr/bin/env Rscript

library(ggplot2)
library(ggthemes)

data <- read.csv('scatterplot.csv')
png('scatterplot.png', width=400, height=400)
ggplot(data, aes(x=x,y=y)) + geom_point() + 
    theme_economist() + 
    scale_colour_economist() 
dev.off()
