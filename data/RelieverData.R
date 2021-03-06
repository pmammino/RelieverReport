library(rvest)
library(plyr)
library(SDMTools)
library(ggplot2)

url <- "http://www.fangraphs.com/leaders.aspx?pos=all&stats=rel&lg=all&qual=0&type=c,13,113,37,46,66,70&season=2016&month=0&season1=2016&ind=0&team=0&rost=0&age=0&filter=&players=0&page=1_1000"
relief2016 <- url %>%
  read_html() %>%
  html_nodes(xpath= '//*[(@id = "LeaderBoard1_dg1")]/table[1]') %>%
  html_table()
url2 <- "http://www.fangraphs.com/leaders.aspx?pos=all&stats=rel&lg=all&qual=0&type=c,13,66,70&season=2019&month=0&season1=2012&ind=0&team=0,ss&rost=0&age=0&filter=&players=0"
average <- url2 %>%
  read_html() %>%
  html_nodes(xpath= '//*[(@id = "LeaderBoard1_dg1")]/table[1]') %>%
  html_table()
url3 <- "http://www.fangraphs.com/leaders.aspx?pos=all&stats=rel&lg=all&qual=0&type=c,13,113,37,46,66,70&season=2015&month=0&season1=2015&ind=0&team=0&rost=0&age=0&filter=&players=0&page=1_1000"
relief2015 <- url3 %>%
  read_html() %>%
  html_nodes(xpath= '//*[(@id = "LeaderBoard1_dg1")]/table[1]') %>%
  html_table()
url4 <- "http://www.fangraphs.com/leaders.aspx?pos=all&stats=rel&lg=all&qual=0&type=c,13,113,37,46,66,70&season=2014&month=0&season1=2014&ind=0&team=0&rost=0&age=0&filter=&players=0&page=1_1000"
relief2014 <- url4 %>%
  read_html() %>%
  html_nodes(xpath= '//*[(@id = "LeaderBoard1_dg1")]/table[1]') %>%
  html_table()
url5 <- "http://www.fangraphs.com/leaders.aspx?pos=all&stats=rel&lg=all&qual=0&type=c,13,113,37,46,66,70&season=2013&month=0&season1=2013&ind=0&team=0&rost=0&age=0&filter=&players=0&page=1_1000"
relief2013 <- url5 %>%
  read_html() %>%
  html_nodes(xpath= '//*[(@id = "LeaderBoard1_dg1")]/table[1]') %>%
  html_table()
url6 <- "http://www.fangraphs.com/leaders.aspx?pos=all&stats=rel&lg=all&qual=0&type=c,13,113,37,46,66,70&season=2012&month=0&season1=2012&ind=0&team=0&rost=0&age=0&filter=&players=0&page=1_1000"
relief2012 <- url6 %>%
  read_html() %>%
  html_nodes(xpath= '//*[(@id = "LeaderBoard1_dg1")]/table[1]') %>%
  html_table()
  
url7 <- "http://www.fangraphs.com/leaders.aspx?pos=all&stats=rel&lg=all&qual=0&type=c,13,113,37,46,66,70&season=2017&month=0&season1=2017&ind=0&team=0&rost=0&age=0&filter=&players=0&page=1_1000"
relief2017 <- url7 %>%
  read_html() %>%
  html_nodes(xpath= '//*[(@id = "LeaderBoard1_dg1")]/table[1]') %>%
  html_table()

url8 <- "http://www.fangraphs.com/leaders.aspx?pos=all&stats=rel&lg=all&qual=0&type=c,13,113,37,46,66,70&season=2018&month=0&season1=2018&ind=0&team=0&rost=0&age=0&filter=&players=0&page=1_1000"
relief2018 <- url8 %>%
  read_html() %>%
  html_nodes(xpath= '//*[(@id = "LeaderBoard1_dg1")]/table[1]') %>%
  html_table()

url9 <- "http://www.fangraphs.com/leaders.aspx?pos=all&stats=rel&lg=all&qual=0&type=c,13,113,37,46,66,70&season=2019&month=0&season1=2019&ind=0&team=0&rost=0&age=0&filter=&players=0&page=1_1000"
relief2019 <- url9 %>%
  read_html() %>%
  html_nodes(xpath= '//*[(@id = "LeaderBoard1_dg1")]/table[1]') %>%
  html_table()

average <- average[[1]]
average <-rename(average,c("X1"="#", "X2"="Year", "X3"="IP","X4"="RE24", "X5"="gmLI"))
average <- average[-1]
average <- average[-c(1,2,3), ]
average <- transform(average, IP = as.numeric(IP))
average <- transform(average, RE24 = as.numeric(RE24))
average <- transform(average, gmLI = as.numeric(gmLI))
relief2016 <- relief2016[[1]]
relief2016 <-rename(relief2016,c("X1"="#", "X2"="Name", "X3"="Team","X4"="IP", "X5"="SwStr", "X6"="BB", "X7" = "GBFB", "X8" = "RE24", "X9" = "gmLI"))
relief2016 <- relief2016[-1]
relief2016 <- relief2016[-c(1,2,3), ]
relief2016 <- relief2016[complete.cases(relief2016), ]
relief2016 <- transform(relief2016, SwStr = as.numeric(sub("%", "",SwStr)))
relief2016<- transform(relief2016, IP = as.numeric(IP))
relief2016<- transform(relief2016, BB = as.numeric(BB))
relief2016<- transform(relief2016, GBFB = as.numeric(GBFB))
relief2016<- transform(relief2016, RE24 = as.numeric(RE24))
relief2016<- transform(relief2016, gmLI = as.numeric(gmLI))
relief2015 <- relief2015[[1]]
relief2015 <-rename(relief2015,c("X1"="#", "X2"="Name", "X3"="Team","X4"="IP", "X5"="SwStr", "X6"="BB", "X7" = "GBFB", "X8" = "RE24", "X9" = "gmLI"))
relief2015 <- relief2015[-1]
relief2015 <- relief2015[-c(1,2,3), ]
relief2015 <- relief2015[complete.cases(relief2015), ]
relief2015 <- transform(relief2015, SwStr = as.numeric(sub("%", "",SwStr)))
relief2015<- transform(relief2015, IP = as.numeric(IP))
relief2015<- transform(relief2015, BB = as.numeric(BB))
relief2015<- transform(relief2015, GBFB = as.numeric(GBFB))
relief2015<- transform(relief2015, RE24 = as.numeric(RE24))
relief2015<- transform(relief2015, gmLI = as.numeric(gmLI))
relief2014 <- relief2014[[1]]
relief2014 <-rename(relief2014,c("X1"="#", "X2"="Name", "X3"="Team","X4"="IP", "X5"="SwStr", "X6"="BB", "X7" = "GBFB", "X8" = "RE24", "X9" = "gmLI"))
relief2014 <- relief2014[-1]
relief2014 <- relief2014[-c(1,2,3), ]
relief2014 <- relief2014[complete.cases(relief2014), ]
relief2014 <- transform(relief2014, SwStr = as.numeric(sub("%", "",SwStr)))
relief2014<- transform(relief2014, IP = as.numeric(IP))
relief2014<- transform(relief2014, BB = as.numeric(BB))
relief2014<- transform(relief2014, GBFB = as.numeric(GBFB))
relief2014<- transform(relief2014, RE24 = as.numeric(RE24))
relief2014<- transform(relief2014, gmLI = as.numeric(gmLI))
relief2013 <- relief2013[[1]]
relief2013 <-rename(relief2013,c("X1"="#", "X2"="Name", "X3"="Team","X4"="IP", "X5"="SwStr", "X6"="BB", "X7" = "GBFB", "X8" = "RE24", "X9" = "gmLI"))
relief2013 <- relief2013[-1]
relief2013 <- relief2013[-c(1,2,3), ]
relief2013 <- relief2013[complete.cases(relief2013), ]
relief2013 <- transform(relief2013, SwStr = as.numeric(sub("%", "",SwStr)))
relief2013<- transform(relief2013, IP = as.numeric(IP))
relief2013<- transform(relief2013, BB = as.numeric(BB))
relief2013<- transform(relief2013, GBFB = as.numeric(GBFB))
relief2013<- transform(relief2013, RE24 = as.numeric(RE24))
relief2013<- transform(relief2013, gmLI = as.numeric(gmLI))
relief2012 <- relief2012[[1]]
relief2012 <-rename(relief2012,c("X1"="#", "X2"="Name", "X3"="Team","X4"="IP", "X5"="SwStr", "X6"="BB", "X7" = "GBFB", "X8" = "RE24", "X9" = "gmLI"))
relief2012 <- relief2012[-1]
relief2012 <- relief2012[-c(1,2,3), ]
relief2012 <- relief2012[complete.cases(relief2012), ]
relief2012 <- transform(relief2012, SwStr = as.numeric(sub("%", "",SwStr)))
relief2012<- transform(relief2012, IP = as.numeric(IP))
relief2012<- transform(relief2012, BB = as.numeric(BB))
relief2012<- transform(relief2012, GBFB = as.numeric(GBFB))
relief2012<- transform(relief2012, RE24 = as.numeric(RE24))
relief2012<- transform(relief2012, gmLI = as.numeric(gmLI))

relief2017 <- relief2017[[1]]
relief2017 <-rename(relief2017,c("X1"="#", "X2"="Name", "X3"="Team","X4"="IP", "X5"="SwStr", "X6"="BB", "X7" = "GBFB", "X8" = "RE24", "X9" = "gmLI"))
relief2017 <- relief2017[-1]
relief2017 <- relief2017[-c(1,2,3), ]
relief2017 <- relief2017[complete.cases(relief2017), ]
relief2017 <- transform(relief2017, SwStr = as.numeric(sub("%", "",SwStr)))
relief2017<- transform(relief2017, IP = as.numeric(IP))
relief2017<- transform(relief2017, BB = as.numeric(BB))
relief2017<- transform(relief2017, GBFB = as.numeric(GBFB))
relief2017<- transform(relief2017, RE24 = as.numeric(RE24))
relief2017<- transform(relief2017, gmLI = as.numeric(gmLI))

relief2018 <- relief2018[[1]]
relief2018 <-rename(relief2018,c("X1"="#", "X2"="Name", "X3"="Team","X4"="IP", "X5"="SwStr", "X6"="BB", "X7" = "GBFB", "X8" = "RE24", "X9" = "gmLI"))
relief2018 <- relief2018[-1]
relief2018 <- relief2018[-c(1,2,3), ]
relief2018 <- relief2018[complete.cases(relief2018), ]
relief2018 <- transform(relief2018, SwStr = as.numeric(sub("%", "",SwStr)))
relief2018<- transform(relief2018, IP = as.numeric(IP))
relief2018<- transform(relief2018, BB = as.numeric(BB))
relief2018<- transform(relief2018, GBFB = as.numeric(GBFB))
relief2018<- transform(relief2018, RE24 = as.numeric(RE24))
relief2018<- transform(relief2018, gmLI = as.numeric(gmLI))

relief2019 <- relief2019[[1]]
relief2019 <-rename(relief2019,c("X1"="#", "X2"="Name", "X3"="Team","X4"="IP", "X5"="SwStr", "X6"="BB", "X7" = "GBFB", "X8" = "RE24", "X9" = "gmLI"))
relief2019 <- relief2019[-1]
relief2019 <- relief2019[-c(1,2,3), ]
relief2019 <- relief2019[complete.cases(relief2019), ]
relief2019 <- transform(relief2019, SwStr = as.numeric(sub("%", "",SwStr)))
relief2019<- transform(relief2019, IP = as.numeric(IP))
relief2019<- transform(relief2019, BB = as.numeric(BB))
relief2019<- transform(relief2019, GBFB = as.numeric(GBFB))
relief2019<- transform(relief2019, RE24 = as.numeric(RE24))
relief2019<- transform(relief2019, gmLI = as.numeric(gmLI))

average$IP.int <- round(average$IP)
average$diff <- round(average$IP - average$IP.int,1)
average$add <- ifelse(average$diff == 0.2, 0.66, ifelse(average$diff == 0.1,0.34, 0))
average$IP2 <- average$IP.int + average$add
relief2016$IP.int <- round(relief2016$IP)
relief2016$diff <- round(relief2016$IP - relief2016$IP.int,1)
relief2016$add <-ifelse(relief2016$diff == 0.2, 0.66, ifelse(relief2016$diff == 0.1, 0.34, 0))
relief2016$Innings <- relief2016$IP.int + relief2016$add
relief2015$IP.int <- round(relief2015$IP)
relief2015$diff <- round(relief2015$IP - relief2015$IP.int,1)
relief2015$add <-ifelse(relief2015$diff == 0.2, 0.66, ifelse(relief2015$diff == 0.1, 0.34, 0))
relief2015$Innings <- relief2015$IP.int + relief2015$add
relief2014$IP.int <- round(relief2014$IP)
relief2014$diff <- round(relief2014$IP - relief2014$IP.int,1)
relief2014$add <-ifelse(relief2014$diff == 0.2, 0.66, ifelse(relief2014$diff == 0.1, 0.34, 0))
relief2014$Innings <- relief2014$IP.int + relief2014$add
relief2013$IP.int <- round(relief2013$IP)
relief2013$diff <- round(relief2013$IP - relief2013$IP.int,1)
relief2013$add <-ifelse(relief2013$diff == 0.2, 0.66, ifelse(relief2013$diff == 0.1, 0.34, 0))
relief2013$Innings <- relief2013$IP.int + relief2013$add
relief2012$IP.int <- round(relief2012$IP)
relief2012$diff <- round(relief2012$IP - relief2012$IP.int,1)
relief2012$add <-ifelse(relief2012$diff == 0.2, 0.66, ifelse(relief2012$diff == 0.1, 0.34, 0))
relief2012$Innings <- relief2012$IP.int + relief2012$add

relief2017$IP.int <- round(relief2017$IP)
relief2017$diff <- round(relief2017$IP - relief2017$IP.int,1)
relief2017$add <-ifelse(relief2017$diff == 0.2, 0.66, ifelse(relief2017$diff == 0.1, 0.34, 0))
relief2017$Innings <- relief2017$IP.int + relief2017$add

relief2018$IP.int <- round(relief2018$IP)
relief2018$diff <- round(relief2018$IP - relief2018$IP.int,1)
relief2018$add <-ifelse(relief2018$diff == 0.2, 0.66, ifelse(relief2018$diff == 0.1, 0.34, 0))
relief2018$Innings <- relief2018$IP.int + relief2018$add

relief2019$IP.int <- round(relief2019$IP)
relief2019$diff <- round(relief2019$IP - relief2019$IP.int,1)
relief2019$add <-ifelse(relief2019$diff == 0.2, 0.66, ifelse(relief2019$diff == 0.1, 0.34, 0))
relief2019$Innings <- relief2019$IP.int + relief2019$add

relief2012$gmLI <- relief2012$gmLI/average$gmLI[1]
relief2013$gmLI <- relief2013$gmLI/average$gmLI[2]
relief2014$gmLI <- relief2014$gmLI/average$gmLI[3]
relief2015$gmLI <- relief2015$gmLI/average$gmLI[4]
relief2016$gmLI <- relief2016$gmLI/average$gmLI[5]
relief2017$gmLI <- relief2017$gmLI/average$gmLI[6]
relief2018$gmLI <- relief2018$gmLI/average$gmLI[7]
relief2019$gmLI <- relief2019$gmLI/average$gmLI[8]

relief2016$ADRE <- relief2016$RE24 * relief2016$gmLI
relief2016$ADREIP <- relief2016$ADRE / relief2016$Innings
relief2015$ADRE <- relief2015$RE24 * relief2015$gmLI
relief2015$ADREIP <- relief2015$ADRE / relief2015$Innings
relief2014$ADRE <- relief2014$RE24 * relief2014$gmLI
relief2014$ADREIP <- relief2014$ADRE / relief2014$Innings
relief2013$ADRE <- relief2013$RE24 * relief2013$gmLI
relief2013$ADREIP <- relief2013$ADRE / relief2013$Innings
relief2012$ADRE <- relief2012$RE24 * relief2012$gmLI
relief2012$ADREIP <- relief2012$ADRE / relief2012$Innings

relief2017$ADRE <- relief2017$RE24 * relief2017$gmLI
relief2017$ADREIP <- relief2017$ADRE / relief2017$Innings

relief2018$ADRE <- relief2018$RE24 * relief2018$gmLI
relief2018$ADREIP <- relief2018$ADRE / relief2018$Innings

relief2019$ADRE <- relief2019$RE24 * relief2019$gmLI
relief2019$ADREIP <- relief2019$ADRE / relief2019$Innings

relief2012$Season <- 2012
relief2013$Season <- 2013
relief2014$Season <- 2014
relief2015$Season <- 2015
relief2016$Season <- 2016
relief2017$Season <- 2017
relief2018$Season <- 2018
relief2019$Season <- 2019

relief <- rbind(relief2012, relief2013, relief2014, relief2015, relief2016, relief2017, relief2018)
ISO <- read.csv("data/ISO.csv")
relief <- merge(relief, ISO, by = c("Name","Season"), all = TRUE)
relief <- relief[, c(1,2,3,4,5,6,7,16,9,15)]

Sample <- subset(relief, (gmLI >= 1.2) & (IP >= 40))
PCACON <- prcomp(Sample[c(7,8)], center = TRUE, scale. = TRUE)
Sample <- cbind(Sample, predict(PCACON))
Sample <- rename(Sample, c("PC1" = "CON1", "PC2" = "CON2"))
Sample <- Sample[,c(1,2,3,4,5,6,7,8,9,11,10)]

xADREIP <- lm(ADREIP ~ CON1 + SwStr + BB, data = Sample)
Sample$xADREIP <- predict(xADREIP)

ISO2019 <- read.csv("data/ISO2019.csv")
ISO2019 <- ISO2019[,c(2,17,19)]
ISO2019$ISO <- ISO2019$SLG - ISO2019$AVG
ISO2019 <- ISO2019[,c(1,4)]
relief2019 <- merge(relief2019, ISO2019, by = c("Name"), all = TRUE)
relief2019 <- relief2019[, c(1,15,2,3,4,5,6,16,8,14)]

relief <- rbind(relief,relief2019)

relief <- cbind(relief, predict(PCACON, newdata = relief))
relief <- rename(relief, c("PC1" = "CON1", "PC2" = "CON2"))
relief <- relief[,c(1,2,3,4,5,6,7,8,9,11,10)]
relief$xADREIP <- predict(xADREIP, newdata = relief)
relief$ISO <- round(relief$ISO,3)
relief$gmLI <- round(relief$gmLI,2)
relief$CON1 <- round(relief$CON1,2)
relief$ADREIP <- round(relief$ADREIP,4)
relief$xADREIP <- round(relief$xADREIP, 4)

PlatoonScore <- read.csv("data/PlatoonSplitsAll.csv")
PlatoonScore <- rename(PlatoonScore, c("Year" = "Season"))
PlatoonScore <- transform(PlatoonScore, PlatoonScore = as.numeric(as.character(PlatoonScore)))

SampleNew <- merge(Sample, PlatoonScore, by = c("Name","Season"), all = TRUE)
SampleNew <- SampleNew[complete.cases(SampleNew),]
SampleNew <- SampleNew[,c(1,2,3,4,5,6,7,8,13,9,10,11)]
PCA <- prcomp(SampleNew[c(5,6,9)], center = TRUE, scale. = TRUE)
SampleNew <- cbind(SampleNew, predict(PCA))
xADREIPPlatoon <- lm(ADREIP ~ CON1 + PC1, data = SampleNew)
SampleNew$xADREIP <- predict(xADREIPPlatoon)

reliefNew <- merge(relief, PlatoonScore, by = c("Name","Season"), all = TRUE)
reliefNew <- reliefNew[,c(1,2,3,4,5,6,7,8,13,10,9,11)]
reliefNew <- cbind(reliefNew, predict(PCA, newdata = reliefNew))
reliefNew$xADREIP <- predict(xADREIPPlatoon, type = "response", newdata = reliefNew)
reliefNew <- reliefNew[,c(1,2,3,4,5,6,9,7,8,11,10,13,12,16)]
reliefNew$xADREIP <- round(reliefNew$xADREIP, 4)
reliefNew$PC1 <- round(reliefNew$PC1, 2)
reliefNew$PlatoonScore <- round(reliefNew$PlatoonScore, 3)

relief2019_new <- subset(reliefNew, (Season >= 2019))
relief2019_new$Dist <- 0
relief2019_new <- relief2019_new[,c(1,2,3,4,5,6,7,8,9,10,13,15)]
relief2019_new <- relief2019_new[-477,]
SampleNewTester <- SampleNew[,c(1,2,3,4,5,6,9,7,8,10,12)]
SampleNewTester$PlatoonScore <- round(SampleNewTester$PlatoonScore,3)
SampleNewTester$ISO <- round(SampleNewTester$ISO,3)
SampleNewTester$gmLI <- round(SampleNewTester$gmLI,2)
SampleNewTester$ADREIP <- round(SampleNewTester$ADREIP,4)
relief2019_new <- relief2019_new[relief2019_new$Name != "Austin Adams",]
relief2019_new <- relief2019_new[relief2019_new$Name != "Javy Guerra",]
player_comps <- function(player, number)
{
Dist <- mahalanobis(x = SampleNewTester[,c(5,6,7,8,9)], as.numeric(relief2019_new[which(relief2019_new$Name==player), c(5,6,7,8,9)]), cov(SampleNewTester[,c(5,6,7,8,9)]))
SampleNewTester$Dist <- Dist
SampleNewTester$Dist <- round(SampleNewTester$Dist,3)
SampleNewTester <- SampleNewTester[order(SampleNewTester$Dist, decreasing=FALSE),]
row.names(SampleNewTester) <- 1:nrow(SampleNewTester)
rbind(relief2019_new[which(relief2019_new$Name==player),],SampleNewTester[1:number,])
}


player_comps_sum <- function(player)
{
  SampleNewTester_2 <- SampleNew[,c(1,2,3,4,5,6,9,7,8,10,12)]
  SampleNewTester_2$PlatoonScore <- round(SampleNewTester_2$PlatoonScore,3)
  SampleNewTester_2$ISO <- round(SampleNewTester_2$ISO,3)
  SampleNewTester_2$gmLI <- round(SampleNewTester_2$gmLI,2)
  SampleNewTester_2$ADREIP <- round(SampleNewTester_2$ADREIP,4)
  relief2019_new <- relief2019_new[complete.cases(relief2019_new), ]
  Dist <- mahalanobis(x = SampleNewTester_2[,c(5,6,7,8,9)], as.numeric(relief2019_new[which(relief2019_new$Name==player), c(5,6,7,8,9)]), cov(SampleNewTester_2[,c(5,6,7,8,9)]))
  SampleNewTester_2$Dist <- Dist
  SampleNewTester_2$Dist <- round(SampleNewTester_2$Dist,3)
  SampleNewTester_2$W <- 1/SampleNewTester_2$Dist
  SampleNewTester_2 <- SampleNewTester_2[order(SampleNewTester_2$Dist, decreasing=FALSE),]
  wt.mean(SampleNewTester_2$ADREIP, SampleNewTester_2$W)
}


player_comps_std <- function(player)
{
  SampleNewTester_2 <- SampleNew[,c(1,2,3,4,5,6,9,7,8,10,12)]
  SampleNewTester_2$PlatoonScore <- round(SampleNewTester_2$PlatoonScore,3)
  SampleNewTester_2$ISO <- round(SampleNewTester_2$ISO,3)
  SampleNewTester_2$gmLI <- round(SampleNewTester_2$gmLI,2)
  SampleNewTester_2$ADREIP <- round(SampleNewTester_2$ADREIP,4)
  relief2019_new <- relief2019_new[complete.cases(relief2019_new), ]
  Dist <- mahalanobis(x = SampleNewTester_2[,c(5,6,7,8,9)], as.numeric(relief2019_new[which(relief2019_new$Name==player), c(5,6,7,8,9)]), cov(SampleNewTester_2[,c(5,6,7,8,9)]))
  SampleNewTester_2$Dist <- Dist
  SampleNewTester_2$Dist <- round(SampleNewTester_2$Dist,3)
  SampleNewTester_2$W <- 1/SampleNewTester_2$Dist
  SampleNewTester_2 <- SampleNewTester_2[order(SampleNewTester_2$Dist, decreasing=FALSE),]
  wt.sd(SampleNewTester_2$ADREIP, SampleNewTester_2$W)
}

relief2019_comp <- relief2019_new[complete.cases(relief2019_new), ]
relief2019_comp <- relief2019_comp[relief2019_comp$Name != "Austin Adams",]
List_2019 <- as.list(relief2019_comp$Name)
comps_2019 <- sapply(List_2019, player_comps_sum)
std_2019 <- sapply(List_2019, player_comps_std)

List_2019 <- data.frame(List_2019)
comps_all <- data.frame(unlist(List_2019), unlist(comps_2019), unlist(std_2019))
row.names(comps_all) <- 1:nrow(comps_all)

colnames(comps_all) <- c("Name", "Comp ADREIP", "Comp STD")
comps_all$`Comp ADREIP` <- round(comps_all$`Comp ADREIP`,4)
comps_all$`Comp STD` <- round(comps_all$`Comp STD`,4)


player_comps_groups <- function(player)
{
  SampleNewTester_2 <- SampleNew[,c(1,2,3,4,5,6,9,7,8,10,12)]
  SampleNewTester_2$PlatoonScore <- round(SampleNewTester_2$PlatoonScore,3)
  SampleNewTester_2$ISO <- round(SampleNewTester_2$ISO,3)
  SampleNewTester_2$gmLI <- round(SampleNewTester_2$gmLI,2)
  SampleNewTester_2$ADREIP <- round(SampleNewTester_2$ADREIP,4)
  relief2019_new <- relief2019_new[complete.cases(relief2019_new), ]
  Dist <- mahalanobis(x = SampleNewTester_2[,c(5,6,7,8,9)], as.numeric(relief2019_new[which(relief2019_new$Name==player), c(5,6,7,8,9)]), cov(SampleNewTester_2[,c(5,6,7,8,9)]))
  SampleNewTester_2$Dist <- Dist
  SampleNewTester_2$Dist <- round(SampleNewTester_2$Dist,3)
  SampleNewTester_2$W <- 1/SampleNewTester_2$Dist
  SampleNewTester_2 <- SampleNewTester_2[order(SampleNewTester_2$Dist, decreasing=FALSE),]
  total <- sum(SampleNewTester_2$W)
  SampleNewTester_2$Prob <- SampleNewTester_2$W/total
  prob_dist <- list(sum(SampleNewTester_2[which(SampleNewTester_2[,11] < -0.1),14]),
                    sum(SampleNewTester_2[which(SampleNewTester_2[,11] < 0 & SampleNewTester_2[,11] >= -0.1),14]),
                    sum(SampleNewTester_2[which(SampleNewTester_2[,11] < 0.05 & SampleNewTester_2[,11] >= 0),14]),
                    sum(SampleNewTester_2[which(SampleNewTester_2[,11] < .1 & SampleNewTester_2[,11] >= 0.05),14]),
                    sum(SampleNewTester_2[which(SampleNewTester_2[,11] < .15 & SampleNewTester_2[,11] >= .1),14]),
                    sum(SampleNewTester_2[which(SampleNewTester_2[,11] < .2 & SampleNewTester_2[,11] >= .15),14]),
                    sum(SampleNewTester_2[which(SampleNewTester_2[,11] < .25 & SampleNewTester_2[,11] >= .2),14]),
                    sum(SampleNewTester_2[which(SampleNewTester_2[,11] < .3 & SampleNewTester_2[,11] >= .25),14]),
                    sum(SampleNewTester_2[which(SampleNewTester_2[,11] < .35 & SampleNewTester_2[,11] >= .3),14]),
                    sum(SampleNewTester_2[which(SampleNewTester_2[,11] < .4 & SampleNewTester_2[,11] >= .35),14]),
                    sum(SampleNewTester_2[which(SampleNewTester_2[,11] < .45 & SampleNewTester_2[,11] >= .4),14]),
                    sum(SampleNewTester_2[which(SampleNewTester_2[,11] < .5 & SampleNewTester_2[,11] >= .45),14]),
                    sum(SampleNewTester_2[which(SampleNewTester_2[,11] < .55 & SampleNewTester_2[,11] >= .5),14]),
                    sum(SampleNewTester_2[which(SampleNewTester_2[,11] < .6 & SampleNewTester_2[,11] >= .55),14]),
                    sum(SampleNewTester_2[which(SampleNewTester_2[,11] >= .6),14]))
}

probs_2019 <- sapply(List_2019, player_comps_groups)
probs_2019 <- t(probs_2019)
row.names(probs_2019) <- 1:nrow(probs_2019)
probs_2019 <- data.frame(probs_2019)
list_names <- t(List_2019)
probs_2019$Name <- list_names[,1]
probs_2019 <- probs_2019[,c(16,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15)]
probs_2019 <- rename(probs_2019, c('X1' = '<-0.1',	'X2' = '-0.1-0',	'X3' = '0-0.05',	'X4' = '0.05-0.1',	'X5' = '0.1-0.15',	'X6' = '0.15-0.2',	'X7' = '0.2-0.25',	'X8' = '0.25-0.3',	'X9' = '0.3-0.35',	'X10' = '0.35-0.4',	'X11' = '0.4-0.45',	'X12' = '0.45-0.5',	'X13' = '0.5-0.55',	'X14' = '0.55-0.6',	'X15' = '>=0.6'))
probs_2019 <- apply(probs_2019,2,as.character)

write.table(probs_2019, file = "allprobs.csv", sep = ",")



compare_chart <- function(player,player2)
{
  probs <- player_comps_groups(player)
  probs2 <- player_comps_groups(player2)
  probs2 <- data.frame(probs2)
  colnames(probs2) <- c('X1' = '<-0.1',	'X2' = '-0.1-0',	'X3' = '0-0.05',	'X4' = '0.05-0.1',	'X5' = '0.1-0.15',	'X6' = '0.15-0.2',	'X7' = '0.2-0.25',	'X8' = '0.25-0.3',	'X9' = '0.3-0.35',	'X10' = '0.35-0.4',	'X11' = '0.4-0.45',	'X12' = '0.45-0.5',	'X13' = '0.5-0.55',	'X14' = '0.55-0.6',	'X15' = '>=0.6')
  probs <- data.frame(probs)
  colnames(probs) <- c('X1' = '<-0.1',	'X2' = '-0.1-0',	'X3' = '0-0.05',	'X4' = '0.05-0.1',	'X5' = '0.1-0.15',	'X6' = '0.15-0.2',	'X7' = '0.2-0.25',	'X8' = '0.25-0.3',	'X9' = '0.3-0.35',	'X10' = '0.35-0.4',	'X11' = '0.4-0.45',	'X12' = '0.45-0.5',	'X13' = '0.5-0.55',	'X14' = '0.55-0.6',	'X15' = '>=0.6')
  probs <- rbind(as.numeric(probs),as.numeric(probs2))
  barplot(probs, main="Compare Chart", 
          xlab="Ranges", beside = T,col=c("darkblue","red"),legend = c(player,player2),
          names.arg = c('<-0.1','-0.1-0',	'0-0.05',	'0.05-0.1',	'0.1-0.15',	'0.15-0.2',	'0.2-0.25',	'0.25-0.3',	'0.3-0.35',	'0.35-0.4',	'0.4-0.45',	'0.45-0.5','0.5-0.55','0.55-0.6','>=0.6'))
}
compare_chart("Wade Davis","Adam Ottavino")
