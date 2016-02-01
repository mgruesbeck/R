#!/usr/bin/env Rscript

library(ggplot2)
library(scales)
library(ggthemes)

data <- read.csv('practical.csv')
data$timestamp_obj <- as.POSIXct(data$timestamp, format="%Y-%m-%d %H:%M:%S")
data$hour <- as.factor(format(data$timestamp_obj, format="%H"))

png('practical_kde.png', width=800, height=800)

ggplot(data, aes(x=delay, color=component, group=component)) + 
    geom_line(stat='density') + 
    facet_grid(hour ~ .) +
    theme_economist() + 
    scale_colour_economist()
dev.off()
