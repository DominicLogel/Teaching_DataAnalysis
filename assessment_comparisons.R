library(ggplot2)
library(ggridges)

data <- read.csv("boxplot_test.csv")
head(data)

boxplot <- ggplot(data = data,
                  aes(x = Assessment,
                      y = Score,
                      fill = Assessment))+
  theme(panel.background = element_blank(),
        panel.grid = element_blank(),
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
  labs(x = "Assessment",
       y = "Assessment mark",
       title = "Comparing class results for Assessments")+
  scale_y_continuous(limits = c(50,
                                100))+
  geom_boxplot()+
  stat_boxplot(geom = "errorbar",
               width = 0.25)+
  geom_dotplot(binaxis='y', 
               stackdir='center', 
               dotsize = .5, 
               fill="black")
  
boxplot

violin <- ggplot(data = data,
                  aes(x = Assessment,
                      y = Score,
                      fill = Assessment))+
  theme(panel.background = element_blank(),
        panel.grid = element_blank(),
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
  labs(x = "Assessment",
       y = "Assessment mark",
       title = "Comparing class results for Assessments")+
  scale_y_continuous(limits = c(50,
                                100))+
  geom_violin(trim = TRUE)+
  geom_dotplot(binaxis='y', 
               stackdir='center', 
               dotsize = .5, 
               fill="black")

violin

density <- ggplot(data = data,
                 aes(y = Score,
                     fill = Assessment))+
  theme(panel.background = element_blank(),
        panel.grid = element_blank(),
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
  labs(x = "Assessment",
       y = "Assessment mark",
       title = "Comparing class results for Assessments")+
  scale_y_continuous(limits = c(0,
                                100))+
  coord_flip()+
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

