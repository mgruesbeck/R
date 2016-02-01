#!/usr/bin/env Rscript

library(ggplot2)
library(scales)
library(ggthemes)

get_factor <- function()
{
  strings <- format(data$timestamp_obj, format="%H:%M")
  split_strings <- lapply(strings, function(x) strsplit(x, ':')[[1]])
  minutes <- lapply(split_strings, function(x) as.integer(x[2]))
  rounded_minutes <- lapply(minutes, function(x) (x %/% 15) * 15)
  rounded_minutes_strings <- lapply(rounded_minutes, function(x) sprintf("%02d", x))
  group <- mapply(function(e1, e2) paste(e1[1], ':', e2, sep=''), split_strings, rounded_minutes_strings)
  as.factor(group)
}

data <- read.csv('practical.csv')
data$timestamp_obj <- as.POSIXct(data$timestamp, format="%Y-%m-%d %H:%M:%S")
data$group <- get_factor()

png('practical_boxplot.png', width=800, height=800)

ggplot(data, aes(x=group, y=delay, group=group)) + 
geom_boxplot() + 
    facet_grid(. ~ component) +
    scale_y_continuous(breaks=seq(round(min(data$delay)/5)*5,
            round(max(data$delay)/5)*5,
            5)) +
    theme_economist() + 
    scale_colour_economist()
dev.off()
