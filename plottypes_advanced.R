#PLOT1 - Histogram with stellar class fill
ggplot(data = filter(hyg, mag > -1 & class %in% 
                       c("O", "B", "A", "F", "G", "K", "M", "N", "C", "D"))) +
  geom_histogram(mapping = aes(x = absmag, fill = class), binwidth = 0.10) +
  scale_fill_manual(values = Lab.palette) +
  labs(x = "ABSOLUTE MAGNITUDE", y = "STAR COUNT", fill = "CLASS") +
  theme_classic() + 
  scale_x_continuous(breaks = (-5:15), limits = c(-5, 15)) +
  theme(plot.title = element_text(family = "Trebuchet MS", color="gray90", 
                                  face="bold", size=18, hjust=0)) +
  theme(panel.background = element_rect(fill = "gray25", colour = "gray40"),
        panel.border = element_blank()) +
  theme(panel.grid.major = element_blank()) +  
  theme(axis.title = element_text(family = "Trebuchet MS", colour="#666666", 
                                  face="bold", size=14)) +
  theme(legend.text = element_text(colour="gray90", size=8), 
        legend.background = element_rect(fill = "gray25"),
        legend.title = element_text(colour="gray90", size=12, face="bold"),
        legend.position = c(0.95, 0.4)) + 
  guides(fill=guide_legend(ncol=1))

#PLOT2 - Rose Diagram with stellar class fill
ggplot() +
  geom_histogram(data = filter(hyg, mag > -2 & class %in% 
                                 c("O", "B", "A", "F", "G", "K", "M", "N", "C", "D"), between((dec), -10, 10)), 
                 aes(ra_wedge, colour = class, fill = class), width = 1, stat="count",
                 position = position_stack(reverse = TRUE), alpha = 0.8) +
  scale_colour_manual(values = Lab.palette) +
  scale_fill_manual(values = Lab.palette) +
  labs(fill = "CLASS") +
  theme_classic() +  
  theme(plot.title = element_text(family = "Trebuchet MS", color="gray90", 
                                  face="bold", size=18, hjust=0)) +
  theme(axis.title = element_text(family = "Trebuchet MS", color="gray90", 
                                  face="bold", size=12)) +
  theme(panel.background = element_rect(fill = "gray25", colour = "gray40"),
        panel.border = element_blank()) +
  theme(panel.grid.major = element_blank()) +
  theme(axis.line = element_blank()) +
  theme(axis.ticks = element_blank()) +
  theme(axis.text.x = element_text(size=11, color="gray90")) +
  theme(axis.text.y = element_blank()) +
  theme(axis.title = element_blank()) +
  scale_x_discrete(labels = ra_wedge_name) +
  theme(legend.text = element_text(colour="gray90", size=10), 
        legend.background = element_rect(fill = "gray25"),
        legend.title = element_text(colour="gray90", size=8, face="bold"),
        legend.position = c(0.94, 0.16)) +
  guides(colour=FALSE, fill=guide_legend(ncol=1)) +
  coord_polar()

##PLOT3 - Scatter plot H-R Diagram Interpretation
ggplot(data = filter(hyg, lydist < 3500 & mag > -5, between(ci,-0.30, 2.06)), 
       mapping = aes(x = ci, y = absmag, colour = temp)) +
  geom_point(shape = ".") +
  scale_colour_gradientn(colours = Lab.palette.rev(20), limits = c(400, 19000)) +
  geom_smooth(data = filter(spec_class, seq == "V"), colour = "violetred1", se = FALSE, span = 0.4) +
  geom_smooth(data = filter(spec_class, seq == "IV"), colour = "violetred1", se = FALSE, span = 0.4) +
  geom_smooth(data = filter(spec_class, seq == "III"), colour = "violetred1", se = FALSE, span = 0.4) +
  geom_smooth(data = filter(spec_class, seq == "II"), colour = "violetred1", se = FALSE, span = 0.4) +
  geom_smooth(data = filter(spec_class, seq == "Ib"), colour = "violetred1", se = FALSE, span = 0.4) +  
  geom_smooth(data = filter(spec_class, seq == "Ia"), colour = "violetred1", se = FALSE, span = 0.4) +   
  geom_smooth(data = filter(hyg, seq == "WD", between(ci,-0.26, 2.06)), 
              colour = "violetred1", se=FALSE) +
  scale_x_continuous(limits = c(-0.3, 2.10)) +
  scale_y_reverse(breaks = (22:-10) * 5, limits = c(22, -10)) +    
  theme_classic() +
  annotate("text", x=-0.3, y =21.5, label= "O", size = 9, colour = "lightskyblue") +
  annotate("text", x=-0.07, y =21.5, label= "B", size = 9, colour = "lightblue1") +
  annotate("text", x=0.18, y =21.5, label= "A", size = 9, colour = "white") +
  annotate("text", x=0.48, y =21.5, label= "F", size = 9, colour = "lightgoldenrodyellow") +
  annotate("text", x=0.8, y =21.5, label= "G", size = 9, colour = "yellow") +
  annotate("text", x=1.2, y =21.5, label= "K", size = 9, colour = "chocolate1") +
  annotate("text", x=1.59, y =21.5, label= "M", size = 9, colour = "indianred1") + 
  annotate("text", x=1.94, y =21.5, label= "N", size = 9, colour = "brown2") +  
  annotate("text", x=1.72, y=-7, label= "(Ia)", colour = "gray96") +  
  annotate("text", x=1.84, y=-5.7, label= "SUPERGIANTS", colour = "gray96") + 
  annotate("text", x=1.67, y=-4.5, label= "(Ib)", colour = "gray80") + 
  annotate("text", x=1.9, y=-2.35, label= "(II) BRIGHT GIANTS", colour = "gray96") +  
  annotate("text", x=1.75, y=0.1, label= "(III) GIANTS", colour = "gray96") +  
  annotate("text", x=1.35, y=4, label= "(IV) SUB-GIANTS", colour = "gray96") +  
  annotate("text", x=1.8, y=17, label= "  (V) MAIN 
           SEQUENCE", colour = "gray96") + 
  annotate("text", x=1.1, y=16.5, label= "WHITE DWARFS", colour = "gray96") +
  labs(x = "COLOUR INDEX (B-V)", y = "ABSOLUTE MAGNITUDE", colour = "TEMP(K)") +
  theme(plot.title = element_text(family = "Trebuchet MS", color="#666666", 
                                  face="bold", size=18, hjust=0)) +
  theme(axis.title = element_text(family = "Trebuchet MS", color="#666666", 
                                  face="bold", size=14)) +
  theme(panel.background = element_rect(fill = "gray25", colour = "gray40"),
        panel.border = element_blank()) +
  theme(legend.text = element_text(colour="gray90", size=6), 
        legend.background = element_rect(fill = "gray25"),
        legend.title = element_text(colour="gray90", size=10, face="bold"),
        legend.position = c(0.94, 0.42))

#PLOT4 - R-visualization-SKY aitoff image for scatter plots
ggplot() +
  geom_col(data = filter(polar_coord, ra_wedge %in% c("5h0m", "5h15m", "5h30m", "5h45m")), 
           aes(x = ra * 15, y = dec), fill = "violetred1", alpha = 0.6, width = 3.75) +
  geom_point(data = filter(hyg, between(lydist, 0, 3500) & mag > -1, 
                           between(ra, 0, 24) & between(dec, -90, 90), view == "EYE"),    
             aes(x = ra * 15, y = dec, colour = temp, size = radius)) +
  scale_colour_gradientn(colours = Lab.palette.rev(20), limits = c(400, 19000)) +
  coord_map(projection = "aitoff") +
  scale_y_continuous(breaks = (-2:2) * 30, limits = c(-90, 90)) +
  scale_x_reverse(breaks = (360:0) * 30, limits = c(360, 0)) +  
  scale_size_continuous(breaks = (0:350) * 50, limits = c(0,320)) +
  labs(x = "RIGHT ASCENSION", y = "DECLINATION (DEG)", colour = "TEMP (K)", size = "RADIUS (Ro)") +
  theme(plot.title = element_text(family = "Trebuchet MS", color="#666666", 
                                  face="bold", size=18, hjust=0)) +
  theme(axis.title = element_text(family = "Trebuchet MS", color="#666666", 
                                  face="bold", size=14)) +
  theme(panel.grid.major = element_blank()) +
  theme(axis.text.x = element_blank()) +
  theme(panel.background = element_rect(fill = 'gray25', colour = 'gray40'),
        panel.border = element_blank())  

##PLOT6A - Dot Plotting Class vs Temperature
ggplot(data = filter(hyg, lydist < 3500 & mag > -5, between(ci,-0.30, 2.06), class %in% 
                       c("O", "B", "A", "F", "G", "K", "M", "N", "C", "D"),
                     seq %in% c("Ia", "Ib", "II", "III", "IV", "V", "WD")), 
       mapping = aes(x = seq, y = temp)) +
  geom_point(aes(colour = class, size = radius), shape = 1) +
  scale_colour_manual(values = Lab.palette) +  
  scale_size_continuous(breaks = (0:250) * 50) +
  scale_y_continuous(breaks = (0:20000) * 2000, limits = c(2000, 18000)) +
  labs(x = "STELLAR SEQUENCE", y = "TEMP (K)", colour = "CLASS", size = "RADIUS") +  
  theme_classic() +
  theme(plot.title = element_text(family = "Trebuchet MS", color="#666666", 
                                  face="bold", size=18, hjust=0)) +
  theme(axis.title = element_text(family = "Trebuchet MS", color="#666666", 
                                  face="bold", size=16)) +
  theme(panel.background = element_rect(fill = 'gray25', colour = 'gray40'),
        panel.border = element_blank()) +
  theme(legend.position = "right") +
  theme(legend.text = element_text(size=8))

##PLOT6B - Boxplot Class vs Temperature
ggplot(data = filter(hyg, lydist < 3500 & mag > -5, between(ci,-0.30, 2.06), class %in% 
                       c("O", "B", "A", "F", "G", "K", "M", "N", "C", "D"),
                     seq %in% c("Ia", "Ib", "II", "III", "IV", "V", "WD")), 
       mapping = aes(x = seq, y = temp)) +
  geom_boxplot(aes(fill = factor(class)), varwidth = FALSE, notch = FALSE, colour = "gray90", 
               outlier.colour = "violetred1", outlier.size=1) +
  scale_fill_manual(values = Lab.palette) +  
  scale_y_continuous(breaks = (0:20000) * 2000, limits = c(2000, 18000)) +
  labs(x = "STELLAR CLASSIFICATION", y = "TEMP (K)", fill = "CLASS") +  
  theme_classic() +
  theme(plot.title = element_text(family = "Trebuchet MS", color="#666666", 
                                  face="bold", size=18, hjust=0)) +
  theme(axis.title = element_text(family = "Trebuchet MS", color="#666666", 
                                  face="bold", size=16)) +
  theme(panel.background = element_rect(fill = 'gray25', colour = 'gray40'),
        panel.border = element_blank()) +
  theme(legend.position = "right") +
  theme(legend.text = element_text(size=7))

##PLOT7 - stellar class density plots
ggplot(data = filter(hyg, mag > -2, cat == "HIP" | cat == "YBS", class %in% 
                       c("B", "A", "F", "G", "K", "M")),    
       mapping = aes(x = lydist, y = class, colour = class, fill = class)) +
  geom_density_ridges2(aes(alpha = 0.6), scale = 4, size = 0.1, panel_scaling = FALSE,
                       stat = "density_ridges", show.legend = FALSE, bandwidth = 8, 
                       rel_min_height = 0.001) +
  scale_colour_manual(values = c("lightskyblue", "lightblue1", "lightgoldenrodyellow", 
                                 "yellow", "gold", "chocolate1")) +
  scale_fill_manual(values = c("lightskyblue", "lightblue1", "lightgoldenrodyellow", 
                               "yellow", "gold", "chocolate1")) +
  labs(x = "LIGHT YEARS", y = "STELLAR CLASS") +
  theme_classic() +
  scale_y_discrete(expand = c(0.03, 0), limits = c("M", "K", "G", "F", "A", "B")) +
  scale_x_continuous(breaks = (0:3500) * 500, limits = c(0,3500)) +
  theme(panel.background = element_rect(fill = "gray25", colour = "gray40"),
        panel.border = element_blank()) +
  theme(panel.grid.major = element_blank()) +  
  theme(axis.title = element_text(family = "Trebuchet MS", colour="#666666", 
                                  face="bold", size=14)) +
  theme(legend.text = element_text(size=8)) 

