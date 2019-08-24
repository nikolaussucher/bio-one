# Load libraries ----------------------------------------------------------

# Load the libraries
library(tidyverse)
library(ggplot2)

# Set working directory ---------------------------------------------------
wdir <- "~/Dropbox/R/bio-one-master"
setwd(wdir)

# Read data ---------------------------------------------------------------

data <- read_csv("data/absorption.csv")

data <- data %>% select(Wavelength,blue_1,green_1,red_1) %>% 
  gather(key = "color", value = "absorption",-Wavelength)


# Plot ---------------------------------------------------------------

ggplot(data=data) +
  geom_point(mapping = aes(x = Wavelength, y = absorption, color = color),
             size = 4, show.legend = FALSE) +
  geom_line(mapping = aes(x = Wavelength, y = absorption, color = color),
              show.legend = TRUE, size = 2) +
scale_color_manual(values=c("lightskyblue", "seagreen2", "lightpink"),) +
  labs(y = "Normalized Absorption (%)", x = "Wavelength") +
  theme(axis.text.x=element_text(family="sans"),axis.text.y=element_text(family="sans"))
