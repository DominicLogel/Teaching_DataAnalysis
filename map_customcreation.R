# these packages need to be installed for this to work

# does the visuals (ggplot2), and data wrangling (dplyr)
library(tidyverse)
# works with the shapefile a.k.a. map data
library(sf)
# is what the map data is called from
library(rnaturalearth)
# extends the map data to make more high-quality work
library(rnaturalearthdata)
# lets you preview the plot at the final dimensions you want\
library(ggview)

# calls the map and assigns it to 'world1'
world1 <- ne_countries(returnclass = "sf",
                       scale = "medium")

# data frame that makes the manual data. Open world1 to check each countries three letter code (sov_a3)
data_country <- read_table("
sov_a3 Values
PAN 600
COL 7000
VEN 4000
PER 300
ECU 1000
GUY 300
SUR 100")

# calls another map layer by adding the manual data onto the shapefile information
world2 <- right_join(world1,
                     data_country,
                     by = "sov_a3")

# this is the map
custom_map <- ggplot()+                          # calls the map and assigns it to "custom_map'
  geom_sf(data = world1,                         # generates a map layer using world1
          fill="grey95",                         # fills every country on this layer with this colour  
          color="black",                         # colours the border outlines in this colour
          size = 0.2) +                          # sets the width of the border lines
  geom_sf(data = world2,                         # generates a may layer using world2
          aes(fill = world2$Infections),         # within aesthetics (needed to do the manual scale below) colours based off Values data
          color="black",                         # colours the border outlines in this colour
          size = 0.2) +                          # sets the width of the border lines
  scale_fill_gradient(high = "grey10",           # manually sets a gradient for the fill. High sets top value and low sets bottom value
                      low = "grey50",
                      breaks = seq(1000,         # breaks sets the points which the gradients sets as values. seq() script means "top number, bottom number, break every number"
                                   8000,
                                   2500))+
  coord_sf(crs = st_crs(54009),                  # this all sets the map projection. without a specific projection you get Mercator. This projection is Molleweide
           default_crs = sf::st_crs(4326),       # this sets the projection to read information as latitude and longitude
          # xlim = c(-50,                        # when used, this allows you to set the longitude cut offs
          #          50),
          # ylim = c(-50,                        # when used this sets the latitude cut offs
          #          50),
           ) +
  # all of this is for labeling the plot.
  labs(x = NULL,
       y = NULL,
       title = "Infections from novel respiratory virus",
       subtitle = NULL,
       tag = NULL,
       alt = NULL,
       fill = "Number of known \ninfections", # \n adds new line to text
       caption = "generated from manual dataset")+
  # this sets the aesthetics of the plot
  theme(
        # the background of the plot
        panel.background = element_rect(fill = "white",
                                        colour = "white"),
        # the latitude and longitude lines
        panel.grid = element_line(colour = "grey90",
                                  linewidth = 0.2),
        # the border around the plot
        panel.border = element_rect(colour = "grey"),
        axis.text = element_blank(),
        axis.ticks = element_blank(),
        # font size for the plot title
        plot.title = element_text(size = 12),
        # font size of the plot caption
        plot.caption = element_text(size = 8,
                                    hjust = 0),
        # font size for the legend title
        legend.title = element_text(size = 8),
        # font size of the legend text
        legend.text = element_text(size = 7),
        # puts the legend on the right hand size of the plot
        legend.position = "right",
        # puts the legend at the top of the plot
        legend.justification = "top",
        # this sets how wide the legend is
        legend.key.width = unit(0.4, 
                                "cm"))
# previews the plot 
custom_map

# previews the plot at the final size you want - DO NOT run this within the normal generation, it breaks the image save
custom_map + canvas(width = 20,
                    height = 10,
                    units = "cm")

ggsave(filename = "Outputs/custom_map.png", # sets the file name and location
       plot = custom_map,                   # chooses which plot to save
       bg = "white",                        # sets the plot background in case transparency occurs
       device = "png",                      # sets the file type
       units = "cm",                        # sets the units for the height and width
       width = 20,                          # sets width size
       height = 10)                         # sets height size
  
