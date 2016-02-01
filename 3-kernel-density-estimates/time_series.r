#!/usr/bin/env Rscript

# load in the thangs
library(ggplot2)
library(scales)
library(ggthemes)

# read csv files
data <- read.csv('time_series.csv')

# set timestamp
data$timestamp_obj <- as.POSIXct(data$timestamp, format="%Y-%m-%d %H:%M:%S")

# create png
png('time_series_kde.png', width=800, height=800)

# use ggplot
ggplot(data, aes(x=delay)) + 
    geom_line(stat='density', adjust=1/2) + 
    xlab("Delay (ms)") + 
    theme_economist() + 
    scale_colour_economist()
dev.off()
