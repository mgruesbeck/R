#!/usr/bin/env Rscript

# load in the thangs
library(ggplot2)
library(scales)
library(ggthemes)

# read csv files
data <- read.csv('time_series.csv')

# set timestamp
data$timestamp_obj <- as.POSIXct(data$timestamp, format="%Y-%m-%d %H:%M:%S")

# create svg
svg('time_series.svg', width=8, height=5)

# use ggplot
ggplot(data, aes(x=timestamp_obj,y=delay)) + geom_area() + 
    theme_economist() + 
    scale_colour_economist() +
    xlab("Timestamp") +
    ylab("Delay (ms)") + 
    scale_x_datetime(breaks=pretty_breaks(), labels=date_format("%H:%M:%S"))
dev.off()
