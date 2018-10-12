# Load libraries ----------------------------------------------------------

# Load the libraries
library(tidyverse)
library(ggplot2)

# Set working directory ---------------------------------------------------
wdir <- "~/Dropbox/R/bio-one-master"
setwd(wdir)

# Read data ---------------------------------------------------------------

data <- read_csv("data/catalase_ph.csv")

data <- data %>% group_by(Group) %>% mutate(Normalized = activity/max(activity)*100)


#plot 
ggplot(data=data) +
  geom_point(mapping = aes(x = pH, y = activity, shape = Group, color = Group),
           size = 4, show.legend = FALSE) +
  geom_smooth(mapping = aes(x = pH, y = activity),
              show.legend = FALSE, size = 2) +
  scale_x_continuous(breaks = seq(0, 14, 1)) +
  labs(y = "Bubble height (mm)", x = "pH")


