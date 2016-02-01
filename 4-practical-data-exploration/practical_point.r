#!/usr/bin/env Rscript

library(ggplot2)
library(scales)
library(ggthemes)

data <- read.csv('practical.csv')
data$timestamp_obj <- as.POSIXct(data$timestamp, format="%Y-%m-%d %H:%M:%S")

png('practical.png', width=800, height=800)

ggplot(data, aes(x=timestamp_obj, y=delay, color=component, group=component)) + 
    geom_point(size=1) + 
    theme_economist() + 
    scale_colour_economist()
dev.off()
