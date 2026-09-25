library(ggplot2)

data <- read.csv("Exam_mark_test.csv")
head(data)

data2 <- read.csv("Exam_mark_change_test.csv")
head(data2)

#### ####

#### PLOT ONE ####
plot <- ggplot(data,
               aes(x = Answer,
                   y = reorder(Question, -Order),
                   #size = Percent,
                   fill = State))+
  geom_point(shape = 21,
             size = data$PercentAdj
             #color = "black",
             #stat = "identity",
             )+
  geom_segment(aes(x = 0.5,
                   xend = 5.5,
                   y = 0.5,
                   yend = 0.5),
               size = 0.25,
               lineend = "round")+
  geom_segment(aes(x = 0.5,
                   xend = 5.5,
                   y = 1.5,
                   yend = 1.5),
               size = 0.25)+
  geom_segment(aes(x = 0.5,
                   xend = 5.5,
                   y = 2.5,
                   yend = 2.5),
               size = 0.25)+
  geom_segment(aes(x = 0.5,
                   xend = 5.5,
                   y = 3.5,
                   yend = 3.5),
               size = 0.25)+
  geom_segment(aes(x = 0.5,
                   xend = 5.5,
                   y = 4.5,
                   yend = 4.5),
               size = 0.25)+
  geom_segment(aes(x = 0.5,
                   xend = 5.5,
                   y = 5.5,
                   yend = 5.5),
               size = 0.25,
               lineend = "round")+
  geom_segment(aes(x = 0.5,
                   xend = 0.5,
                   y = 0.5,
                   yend = 5.5),
               size = 0.25,
               lineend = "round")+
  geom_segment(aes(x = 1.5,
                   xend = 1.5,
                   y = 0.5,
                   yend = 5.5),
               size = 0.25)+
  geom_segment(aes(x = 2.5,
                   xend = 2.5,
                   y = 0.5,
                   yend = 5.5),
               size = 0.25)+
  geom_segment(aes(x = 3.5,
                   xend = 3.5,
                   y = 0.5,
                   yend = 5.5),
               size = 0.25)+
  geom_segment(aes(x = 4.5,
                   xend = 4.5,
                   y = 0.5,
                   yend = 5.5),
               size = 0.25)+
  geom_segment(aes(x = 5.5,
                   xend = 5.5,
                   y = 0.5,
                   yend = 5.5),
               size = 0.25,
               lineend = "round")+
  theme(panel.background = element_blank(),
        panel.grid = element_blank(),
        panel.border = element_blank(),
        axis.line = element_blank(),
        axis.title = element_blank(),
        axis.text = element_text(colour = "black", 
                                   size = 10),
        axis.ticks = element_blank(),
        legend.position = "none")+
  scale_fill_identity()+
  scale_x_discrete(position = "top")+
  labs(title = "Results from Assessment 1 - multiple choice",
       subtitle = "Size of dot indicates proportion of student mark")
plot


ggsave(filename = "Outputs/Exam_marks_test.png",
       plot,
       device = "png",
       units = "cm",
       width = 10,
       height = 10)




#### PLOT TWO #### 
plot2 <- ggplot(data = data2,
                aes(y = reorder(ID, -Order),
                    x = Mark,
                    fill = Assessment))+
  geom_segment(x = data2$Mark2,
               xend = data2$Mark2 - data2$Change,
               colour = data2$Col2)+
  geom_point(shape = 21,
             size = data2$Size,
             colour = "black")+
  scale_x_continuous(limits = c(40,100))+
  scale_fill_manual(values = c("orange",
                               "purple"))+
  theme(panel.background = element_blank(),
        panel.grid = element_blank(),
        panel.border = element_rect(colour = "black"),
        axis.line = element_blank(),
        axis.title = element_text(colour = "black",
                                  size = 12),
        axis.text.x = element_text(colour = "black", 
                                 size = 10),
        axis.text.y = element_blank(),
        axis.ticks = element_blank(),
        legend.position = "bottom",
        legend.direction = "vertical")+
  labs(title = "Change in student marks between \nAssessments 1 & 2",
       subtitle = "Red line = worse, Green line = better",
       x = "Mark (%)",
       y = "Rank order for Assessment 2")
plot2

ggsave(filename = "Outputs/Exam_marks_rank.png",
       plot2,
       device = "png",
       units = "cm",
       width = 10,
       height = 15)


#### PLOT TWO B ####
plotB <- ggplot(data = data2,
                aes(y = reorder(ID,
                                -Order2),
                    x = Change,
                    #fill = Assessment,
                    ))+
  geom_segment(x = 0,
               xend = data2$Change)+
  geom_vline(xintercept = 0,
             linewidth = 0.5,
             linetype = "dashed")+
  geom_point(shape = 21,
             size = 2.5,
             colour = "black",
             fill = "darkgreen")+
  scale_x_continuous(limits = c(-50,
                                50))+
  scale_y_discrete(limits = rev)+
  scale_fill_manual(values = c("orange",
                               "purple"))+
  theme(panel.background = element_blank(),
        panel.grid = element_blank(),
        panel.border = element_rect(colour = "black"),
        axis.line = element_blank(),
        axis.title = element_text(colour = "black",
                                  size = 12),
        axis.text.x = element_text(colour = "black", 
                                   size = 10),
        axis.text.y = element_blank(),
        axis.ticks = element_blank(),
        legend.position = "bottom",
        legend.direction = "vertical")+
  labs(title = "Change in student marks between \nAssessments 1 & 2",
       subtitle = "Red line = worse, Green line = better",
       x = "Mark (%)",
       y = "Rank order for Assessment 2")

plotB

ggsave(filename = "Outputs/Exam_marks_rank.png",
       plot2,
       device = "png",
       units = "cm",
       width = 10,
       height = 15)