library(tidyverse)
library(ggridges)

hyg <- read_csv("hygdata_v3_edit.csv", na = "")
spec_class <-  read_csv("spectral_class.csv", na = "")
polar_coord <- read_csv("polar_coord.csv", na = "")

Lab.palette.rev <- colorRampPalette(c("brown", "indianred1", "indianred1", "indianred1", "yellow",
                                      "lightgoldenrodyellow", "white", "white", "lightcyan", "lightcyan1", 
                                      "lightblue1", "lightblue1", "lightblue1", "deepskyblue1",
                                      "deepskyblue1"), space = "Lab")
Lab.palette <- (c("steelblue1", "lightskyblue", "lightblue1", "lightgoldenrodyellow", 
                   "yellow", "gold", "chocolate1", "indianred1", "brown2", "gray50", "cyan"))
hyg$class <- factor(hyg$class, levels = c("O", "B", "A", "F", "G", "K", "M", "N", "C", "D", "W",
                                          "sd", "R", "S", "pec"))
ra_wedges_rev <-c("0h0m", "0h15m", "0h30m", "0h45m", "1h0m", "1h15m", "1h30m", "1h45m",
                  "2h0m", "2h15m", "2h30m", "2h45m", "3h0m", "3h15m", "3h30m", "3h45m", 
                  "4h0m", "4h15m", "4h30m", "4h45m", "5h0m", "5h15m", "5h30m", "5h45m", 
                  "6h0m", "6h15m", "6h30m", "6h45m", "7h0m", "7h15m", "7h30m", "7h45m", 
                  "8h0m", "8h15m", "8h30m", "8h45m", "9h0m", "9h15m", "9h30m", "9h45m",
                  "10h0m", "10h15m", "10h30m", "10h45m", "11h0m", "11h15m", "11h30m", "11h45m",
                  "12h0m", "12h15m", "12h30m", "12h45m", "13h0m", "13h15m", "13h30m", "13h45m",  
                  "14h0m", "14h15m", "14h30m", "14h45m", "15h0m", "15h15m", "15h30m", "15h45m", 
                  "16h0m", "16h15m", "16h30m", "16h45m", "17h0m", "17h15m", "17h30m", "17h45m", 
                  "18h0m", "18h15m", "18h30m", "18h45m", "19h0m", "19h15m", "19h30m", "19h45m",
                  "20h0m", "20h15m", "20h30m", "20h45m", "21h0m", "21h15m", "21h30m", "21h45m",
                  "22h0m", "22h15m", "22h30m", "22h45m", "23h0m", "23h15m", "23h30m", "23h45m",
                  "24h0m")

hyg$ra_wedge <- factor(hyg$ra_wedge, levels = ra_wedges_rev)

ra_wedge_name <- c("0H", "", "", "", "1H", "", "", "",
                   "2H", "", "", "", "3H", "", "", "", 
                   "4H", "", "", "", "5H", "", "", "", 
                   "6H", "", "", "", "7H", "", "", "",
                   "8H", "", "", "", "9H", "", "", "", 
                   "10H", "", "", "", "11H", "", "", "", 
                   "12H", "", "", "", "13H", "", "", "",                   
                   "14H", "", "", "", "15H", "", "", "", 
                   "16H", "", "", "", "17H", "", "", "", 
                   "18H", "", "", "", "19H", "", "", "", 
                   "20H", "", "", "", "21H", "", "", "", 
                   "22H", "", "", "", "23H", "", "", "", "24H") 
