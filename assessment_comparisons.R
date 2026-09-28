# calls the library used to create the graphs
library(ggplot2)
library(ggridges)

# calls the dataset and assigns it to the name 'data'. File must be in your working directory. 
# check your working directory by running getwd() in the console. Set your working directory with setwd()
data <- read.csv("boxplot_test.csv")
# checks the top 5 entries in your assigned data, useful for checking column names
head(data)


### box plot ### 
boxplot <- ggplot(data = data,
                  aes(x = Assessment,
                      y = Score,
                      fill = Assessment))+
  # changes the aesthetic qualities of the graph
  theme(panel.background = element_blank(),
        panel.grid = element_blank(),
        panel.border = element_rect(colour = "black"),
        axis.line = element_line(colour = "black"),
        axis.title = element_text(colour = "black",
                                  size = 12),
        axis.text = element_text(colour = "black", 
                                   size = 10),
        axis.ticks = element_line(colour = "black"))+
  # manually sets each colour for each fill category
  scale_fill_manual(values = c("#9f9d39",
                               "#9e6ebe",
                               "#5fa475",
                               "#ca5e57"))+
  # specifies each title within the plot
  labs(x = "Assessment",
       y = "Assessment mark",
       title = "Comparing class results for Assessments",
       subtitle = NULL,
       tag = NULL,
       alt = NULL,
       fill = "Assessment",
       caption = "generated from randomised dataset")+
  # specifies the Y axis settings
  scale_y_continuous(limits = c(50,
                                100),
                     breaks = seq(0,
                                  100,
                                  10))+
  # adds the boxplot
  geom_boxplot()+
  # addes the error bars to the boxplot
  stat_boxplot(geom = "errorbar",
               width = 0.25)+
  # adds the dots representing the individual scores to the plot
  geom_dotplot(binaxis='y', 
               stackdir='center', 
               dotsize = .5, 
               fill="black")
# calls the graph so you can check it
boxplot


### violin plot ### 
violin <- ggplot(data = data,
                  aes(x = Assessment,
                      y = Score,
                      fill = Assessment))+
  # changes the aesthetic qualities of the graph
  theme(panel.background = element_blank(),
        panel.grid = element_blank(),
        panel.border = element_rect(colour = "black"),
        axis.line = element_line(colour = "black"),
        axis.title = element_text(colour = "black",
                                  size = 12),
        axis.text = element_text(colour = "black", 
                                 size = 10),
        axis.ticks = element_line(colour = "black"))+
  # manually sets each colour for each fill category
  scale_fill_manual(values = c("#9f9d39",
                               "#9e6ebe",
                               "#5fa475",
                               "#ca5e57"))+
  # manually sets each colour for each fill category
  scale_fill_manual(values = c("#9f9d39",
                               "#9e6ebe",
                               "#5fa475",
                               "#ca5e57"))+
  # specifies each title within the plot
  labs(x = "Assessment",
       y = "Assessment mark",
       title = "Comparing class results for Assessments",
       subtitle = NULL,
       tag = NULL,
       alt = NULL,
       fill = "Assessment",
       caption = "generated from randomised dataset")+
  # specifies the Y axis settings
  scale_y_continuous(limits = c(50,
                                100),
                     breaks = seq(0,
                                  100,
                                  10))+
  # generates the violin plot
  geom_violin(trim = TRUE)+
  # generates the dots showing the individual scores in the dataset
  geom_dotplot(binaxis='y', 
               stackdir='center', 
               dotsize = .5, 
               fill="black")
# calls the graph so you can check it
violin

### density plot ### 
density <- ggplot(data = data,
                 aes(y = Score,
                     fill = Assessment))+
  # changes the aesthetic qualities of the graph
  theme(panel.background = element_blank(),
        panel.grid = element_blank(),
        panel.border = element_rect(colour = "black"),
        axis.line = element_line(colour = "black"),
        axis.title = element_text(colour = "black",
                                  size = 12),
        axis.text = element_text(colour = "black", 
                                 size = 10),
        axis.ticks = element_line(colour = "black"))+
  # manually sets each colour for each fill category
  scale_fill_manual(values = c("#9f9d39",
                               "#9e6ebe",
                               "#5fa475",
                               "#ca5e57"))+
  labs(x = "Assessment",
       y = "Assessment mark",
       title = "Comparing class results for Assessments",
       subtitle = NULL,
       tag = NULL,
       alt = NULL,
       fill = "Assessment",
       caption = "generated from randomised dataset")+
  # specifies the Y axis settings
  scale_y_continuous(limits = c(0,
                                100),
                     breaks = seq(0,
                                  100,
                                  10))+
  # puts the axis in the right order - geom_density is weird and needs this as far as I can tell
  coord_flip()+
  # generates the density plot
  geom_density(alpha = 0.5)

density


ridge <- ggplot(data = data,
                  aes(y = Assessment,
                      x = Score,
                      fill = Assessment))+
  theme(
        panel.border = element_rect(colour = "black"),
        axis.line = element_line(colour = "black"),
        axis.title = element_text(colour = "black",
                                  size = 12),
        axis.text = element_text(colour = "black", 
                                 size = 10),
        axis.ticks = element_line(colour = "black"))+
  scale_fill_manual(values = c("#9f9d39",
                               "#9e6ebe",
                               "#5fa475",
                               "#ca5e57"))+
  labs(y = "Assessment",
       x = "Assessment mark",
       title = "Comparing class results for Assessments")+
  scale_x_continuous(limits = c(40,
                                100))+
 # coord_flip()+
  stat_density_ridges(quantile_lines = TRUE)

ridge


# save your graph as an image
ggsave("Outputs/plot.png",  # sets the save location and name
       boxplot,             # calls the graph you want, change the name to whatever you have called the graph
       device = "png",      # sets the file type
       units = "cm",        # sets the plot dimension units
       width = 10,          # sets the width
       height = 10)         # sets the height
