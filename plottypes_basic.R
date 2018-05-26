#PLOT1 - Histogram for lyr distance
ggplot(data = filter(hyg, mag > -1)) +
  geom_histogram(mapping = aes(x = lydist), binwidth = 50) +
  labs(x = "DISTANCE (LIGHTYEAR)", y = "STAR COUNT") +
  theme_bw()

#PLOT2 - Rose Diagram
ggplot() +
  geom_histogram(data = filter(hyg, mag > -2, class == "B"), 
                 aes(ra_wedge), width = 1, stat="count",
                 position = position_stack(reverse = TRUE), alpha = 0.8) +
  labs(x = "RIGHT ASCENSION", y = "STAR COUNT") +  
  theme_bw() +  
  scale_x_discrete(labels = ra_wedge_name) +
  coord_polar()

#PLOT3 - Scatter Plot
ggplot() +
  geom_point(data = filter(hyg, mag > -2), 
                 aes(x = radius, y = ci), cex = 0.2) +
  labs(x = "RADIUS (Ro)", y = "COLOUR INDEX (B-V)") +  
  theme_bw()

#PLOT6A - Dot Plot
ggplot(data = filter(hyg, lydist < 3500 & mag > -5, between(ci,-0.30, 2.06), class %in% 
                       c("O", "B", "A", "F", "G", "K", "M", "N", "C", "D"))) +
  geom_point(aes(x = class, y = radius)) +
  labs(x = "STELLAR CLASSIFICATION", y = "RADIUS (Ro)") +  
  theme_bw()

#PLOT6A - Box Plot
ggplot(data = filter(hyg, lydist < 3500 & mag > -5, between(ci,-0.30, 2.06), class %in% 
                       c("O", "B", "A", "F", "G", "K", "M", "N", "C", "D"))) +
  geom_boxplot(aes(x = class, y = radius)) +
  labs(x = "STELLAR CLASSIFICATION", y = "RADIUS (Ro)") +  
  theme_bw() 

#PLOT7 - Density plots
ggplot(data = filter(hyg, mag > -2, class == "B" | class == "G")) +
  geom_density(aes(x = ra, fill = class), alpha = 0.6) +
  labs(x = "RIGHT ASCENSION (H)", y = "DENSITY") +
  scale_fill_manual(values = c("gray75","gray40"))
  theme_bw()
