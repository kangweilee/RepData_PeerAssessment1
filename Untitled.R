
library(ggplot2)
library(dplyr)


Excer <- read.csv("activity.csv", header=TRUE,sep=",",na.strings = "NA", stringsAsFactors = FALSE)

class(Excer)

ExcerSteps <- subset(Excer, steps>0)

CompletExer <- ExcerSteps[complete.cases(ExcerSteps),]

head(CompletExer$date)

CompletExer$date <- as.Date(CompletExer$date)

head(CompletExer$date)

DailySumSteps <- aggregate(steps ~ date, CompletExer,sum)



#plot(DailySumSteps$steps ~ as.Date(DailySumSteps$date,"%d/%m/%Y"),type="l", xlab="dates",ylab="steps")



# Most basic bubble plot
p <- ggplot(data=DailySumSteps, aes(x=date, y=steps)) +
  geom_bar(stat= "identity", fill = "purple") + 
  labs(title="Title",x="date",y="steps") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1,size=6)) +
  scale_x_date(date_breaks = "2 day")
  

p
