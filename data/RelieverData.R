library(rvest)
library(plyr)


url <- "http://www.fangraphs.com/leaders.aspx?pos=all&stats=rel&lg=all&qual=0&type=c,13,113,37,46,66,70&season=2016&month=0&season1=2016&ind=0&team=0&rost=0&age=0&filter=&players=0&page=1_1000"
relief2016 <- url %>%
  read_html() %>%
  html_nodes(xpath= '//*[(@id = "LeaderBoard1_dg1")]/table[1]') %>%
  html_table()
url2 <- "http://www.fangraphs.com/leaders.aspx?pos=all&stats=rel&lg=all&qual=0&type=c,13,66,70&season=2017&month=0&season1=2012&ind=0&team=0,ss&rost=0&age=0&filter=&players=0"
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

relief2012$gmLI <- relief2012$gmLI/average$gmLI[1]
relief2013$gmLI <- relief2013$gmLI/average$gmLI[2]
relief2014$gmLI <- relief2014$gmLI/average$gmLI[3]
relief2015$gmLI <- relief2015$gmLI/average$gmLI[4]
relief2016$gmLI <- relief2016$gmLI/average$gmLI[5]
relief2017$gmLI <- relief2017$gmLI/average$gmLI[6]

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

relief2012$Season <- 2012
relief2013$Season <- 2013
relief2014$Season <- 2014
relief2015$Season <- 2015
relief2016$Season <- 2016
relief2017$Season <- 2017

relief <- rbind(relief2012, relief2013, relief2014, relief2015, relief2016)
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

ISO2017 <- read.csv("data/ISO2017.csv")
ISO2017 <- ISO2017[,c(2,17,19)]
ISO2017$ISO <- ISO2017$SLG - ISO2017$AVG
ISO2017 <- ISO2017[,c(1,4)]
relief2017 <- merge(relief2017, ISO2017, by = c("Name"), all = TRUE)
relief2017 <- relief2017[, c(1,15,2,3,4,5,6,16,8,14)]

relief <- rbind(relief,relief2017)

relief <- cbind(relief, predict(PCACON, newdata = relief))
relief <- rename(relief, c("PC1" = "CON1", "PC2" = "CON2"))
relief <- relief[,c(1,2,3,4,5,6,7,8,9,11,10)]
relief$xADREIP <- predict(xADREIP, newdata = relief)
relief$ISO <- round(relief$ISO,3)
relief$gmLI <- round(relief$gmLI,2)
relief$CON1 <- round(relief$CON1,2)
relief$ADREIP <- round(relief$ADREIP,4)
relief$xADREIP <- round(relief$xADREIP, 4)

url8 <- "http://www.fangraphs.com/leaders.aspx?pos=all&stats=rel&lg=all&qual=0&type=c,13,113,37,46,66,70&season=2016&month=0&season1=2016&ind=0&team=0,to&rost=0&age=0&filter=&players=0&page=1_1000"
relief2016_split <- url8 %>%
  read_html() %>%
  html_nodes(xpath= '//*[(@id = "LeaderBoard1_dg1")]/table[1]') %>%
  html_table()
url9 <- "http://www.fangraphs.com/leaders.aspx?pos=all&stats=rel&lg=all&qual=0&type=c,13,113,37,46,66,70&season=2015&month=0&season1=2015&ind=0&team=0,to&rost=0&age=0&filter=&players=0&page=1_1000"
relief2015_split <- url9 %>%
  read_html() %>%
  html_nodes(xpath= '//*[(@id = "LeaderBoard1_dg1")]/table[1]') %>%
  html_table()
url10 <- "http://www.fangraphs.com/leaders.aspx?pos=all&stats=rel&lg=all&qual=0&type=c,13,113,37,46,66,70&season=2014&month=0&season1=2014&ind=0&team=0,to&rost=0&age=0&filter=&players=0&page=1_1000"
relief2014_split <- url10 %>%
  read_html() %>%
  html_nodes(xpath= '//*[(@id = "LeaderBoard1_dg1")]/table[1]') %>%
  html_table()
url11 <- "http://www.fangraphs.com/leaders.aspx?pos=all&stats=rel&lg=all&qual=0&type=c,13,113,37,46,66,70&season=2013&month=0&season1=2013&ind=0&team=0,to&rost=0&age=0&filter=&players=0&page=1_1000"
relief2013_split <- url11 %>%
  read_html() %>%
  html_nodes(xpath= '//*[(@id = "LeaderBoard1_dg1")]/table[1]') %>%
  html_table()
url12 <- "http://www.fangraphs.com/leaders.aspx?pos=all&stats=rel&lg=all&qual=0&type=c,13,113,37,46,66,70&season=2012&month=0&season1=2012&ind=0&team=0,to&rost=0&age=0&filter=&players=0&page=1_1000"
relief2012_split <- url12 %>%
  read_html() %>%
  html_nodes(xpath= '//*[(@id = "LeaderBoard1_dg1")]/table[1]') %>%
  html_table()

url13 <- "http://www.fangraphs.com/leaders.aspx?pos=all&stats=rel&lg=all&qual=0&type=c,13,113,37,46,66,70&season=2017&month=0&season1=2017&ind=0&team=0,to&rost=0&age=0&filter=&players=0&page=1_1000"
relief2017_split <- url13 %>%
  read_html() %>%
  html_nodes(xpath= '//*[(@id = "LeaderBoard1_dg1")]/table[1]') %>%
  html_table()

relief2016_split <- relief2016_split[[1]]
relief2016_split <-rename(relief2016_split,c("X1"="#", "X2"="Name", "X3"="Team","X4"="IP", "X5"="SwStr", "X6"="BB", "X7" = "GBFB", "X8" = "RE24", "X9" = "gmLI"))
relief2016_split <- relief2016_split[-1]
relief2016_split <- relief2016_split[-c(1,2,3), ]
relief2016_split <- relief2016_split[complete.cases(relief2016_split), ]
relief2016_split <- transform(relief2016_split, SwStr = as.numeric(sub("%", "",SwStr)))
relief2016_split<- transform(relief2016_split, IP = as.numeric(IP))
relief2016_split<- transform(relief2016_split, BB = as.numeric(BB))
relief2016_split<- transform(relief2016_split, GBFB = as.numeric(GBFB))
relief2016_split<- transform(relief2016_split, RE24 = as.numeric(RE24))
relief2016_split<- transform(relief2016_split, gmLI = as.numeric(gmLI))
relief2015_split <- relief2015_split[[1]]
relief2015_split <-rename(relief2015_split,c("X1"="#", "X2"="Name", "X3"="Team","X4"="IP", "X5"="SwStr", "X6"="BB", "X7" = "GBFB", "X8" = "RE24", "X9" = "gmLI"))
relief2015_split <- relief2015_split[-1]
relief2015_split <- relief2015_split[-c(1,2,3), ]
relief2015_split <- relief2015_split[complete.cases(relief2015_split), ]
relief2015_split <- transform(relief2015_split, SwStr = as.numeric(sub("%", "",SwStr)))
relief2015_split<- transform(relief2015_split, IP = as.numeric(IP))
relief2015_split<- transform(relief2015_split, BB = as.numeric(BB))
relief2015_split<- transform(relief2015_split, GBFB = as.numeric(GBFB))
relief2015_split<- transform(relief2015_split, RE24 = as.numeric(RE24))
relief2015_split<- transform(relief2015_split, gmLI = as.numeric(gmLI))
relief2014_split <- relief2014_split[[1]]
relief2014_split <-rename(relief2014_split,c("X1"="#", "X2"="Name", "X3"="Team","X4"="IP", "X5"="SwStr", "X6"="BB", "X7" = "GBFB", "X8" = "RE24", "X9" = "gmLI"))
relief2014_split <- relief2014_split[-1]
relief2014_split <- relief2014_split[-c(1,2,3), ]
relief2014_split <- relief2014_split[complete.cases(relief2014_split), ]
relief2014_split <- transform(relief2014_split, SwStr = as.numeric(sub("%", "",SwStr)))
relief2014_split<- transform(relief2014_split, IP = as.numeric(IP))
relief2014_split<- transform(relief2014_split, BB = as.numeric(BB))
relief2014_split<- transform(relief2014_split, GBFB = as.numeric(GBFB))
relief2014_split<- transform(relief2014_split, RE24 = as.numeric(RE24))
relief2014_split<- transform(relief2014_split, gmLI = as.numeric(gmLI))
relief2013_split <- relief2013_split[[1]]
relief2013_split <-rename(relief2013_split,c("X1"="#", "X2"="Name", "X3"="Team","X4"="IP", "X5"="SwStr", "X6"="BB", "X7" = "GBFB", "X8" = "RE24", "X9" = "gmLI"))
relief2013_split <- relief2013_split[-1]
relief2013_split <- relief2013_split[-c(1,2,3), ]
relief2013_split <- relief2013_split[complete.cases(relief2013_split), ]
relief2013_split <- transform(relief2013_split, SwStr = as.numeric(sub("%", "",SwStr)))
relief2013_split<- transform(relief2013_split, IP = as.numeric(IP))
relief2013_split<- transform(relief2013_split, BB = as.numeric(BB))
relief2013_split<- transform(relief2013_split, GBFB = as.numeric(GBFB))
relief2013_split<- transform(relief2013_split, RE24 = as.numeric(RE24))
relief2013_split<- transform(relief2013_split, gmLI = as.numeric(gmLI))
relief2012_split <- relief2012_split[[1]]
relief2012_split <-rename(relief2012_split,c("X1"="#", "X2"="Name", "X3"="Team","X4"="IP", "X5"="SwStr", "X6"="BB", "X7" = "GBFB", "X8" = "RE24", "X9" = "gmLI"))
relief2012_split <- relief2012_split[-1]
relief2012_split <- relief2012_split[-c(1,2,3), ]
relief2012_split <- relief2012_split[complete.cases(relief2012_split), ]
relief2012_split <- transform(relief2012_split, SwStr = as.numeric(sub("%", "",SwStr)))
relief2012_split<- transform(relief2012_split, IP = as.numeric(IP))
relief2012_split<- transform(relief2012_split, BB = as.numeric(BB))
relief2012_split<- transform(relief2012_split, GBFB = as.numeric(GBFB))
relief2012_split<- transform(relief2012_split, RE24 = as.numeric(RE24))
relief2012_split<- transform(relief2012_split, gmLI = as.numeric(gmLI))

relief2017_split <- relief2017_split[[1]]
relief2017_split <-rename(relief2017_split,c("X1"="#", "X2"="Name", "X3"="Team","X4"="IP", "X5"="SwStr", "X6"="BB", "X7" = "GBFB", "X8" = "RE24", "X9" = "gmLI"))
relief2017_split <- relief2017_split[-1]
relief2017_split <- relief2017_split[-c(1,2,3), ]
relief2017_split <- relief2017_split[complete.cases(relief2017_split), ]
relief2017_split <- transform(relief2017_split, SwStr = as.numeric(sub("%", "",SwStr)))
relief2017_split<- transform(relief2017_split, IP = as.numeric(IP))
relief2017_split<- transform(relief2017_split, BB = as.numeric(BB))
relief2017_split<- transform(relief2017_split, GBFB = as.numeric(GBFB))
relief2017_split<- transform(relief2017_split, RE24 = as.numeric(RE24))
relief2017_split<- transform(relief2017_split, gmLI = as.numeric(gmLI))

average$IP.int <- round(average$IP)
average$diff <- round(average$IP - average$IP.int,1)
average$add <- ifelse(average$diff == 0.2, 0.66, ifelse(average$diff == 0.1,0.34, 0))
average$IP2 <- average$IP.int + average$add
relief2016_split$IP.int <- round(relief2016_split$IP)
relief2016_split$diff <- round(relief2016_split$IP - relief2016_split$IP.int,1)
relief2016_split$add <-ifelse(relief2016_split$diff == 0.2, 0.66, ifelse(relief2016_split$diff == 0.1, 0.34, 0))
relief2016_split$Innings <- relief2016_split$IP.int + relief2016_split$add
relief2015_split$IP.int <- round(relief2015_split$IP)
relief2015_split$diff <- round(relief2015_split$IP - relief2015_split$IP.int,1)
relief2015_split$add <-ifelse(relief2015_split$diff == 0.2, 0.66, ifelse(relief2015_split$diff == 0.1, 0.34, 0))
relief2015_split$Innings <- relief2015_split$IP.int + relief2015_split$add
relief2014_split$IP.int <- round(relief2014_split$IP)
relief2014_split$diff <- round(relief2014_split$IP - relief2014_split$IP.int,1)
relief2014_split$add <-ifelse(relief2014_split$diff == 0.2, 0.66, ifelse(relief2014_split$diff == 0.1, 0.34, 0))
relief2014_split$Innings <- relief2014_split$IP.int + relief2014_split$add
relief2013_split$IP.int <- round(relief2013_split$IP)
relief2013_split$diff <- round(relief2013_split$IP - relief2013_split$IP.int,1)
relief2013_split$add <-ifelse(relief2013_split$diff == 0.2, 0.66, ifelse(relief2013_split$diff == 0.1, 0.34, 0))
relief2013_split$Innings <- relief2013_split$IP.int + relief2013_split$add
relief2012_split$IP.int <- round(relief2012_split$IP)
relief2012_split$diff <- round(relief2012_split$IP - relief2012_split$IP.int,1)
relief2012_split$add <-ifelse(relief2012_split$diff == 0.2, 0.66, ifelse(relief2012_split$diff == 0.1, 0.34, 0))
relief2012_split$Innings <- relief2012_split$IP.int + relief2012_split$add

relief2017_split$IP.int <- round(relief2017_split$IP)
relief2017_split$diff <- round(relief2017_split$IP - relief2017_split$IP.int,1)
relief2017_split$add <-ifelse(relief2017_split$diff == 0.2, 0.66, ifelse(relief2017_split$diff == 0.1, 0.34, 0))
relief2017_split$Innings <- relief2017_split$IP.int + relief2017_split$add

relief2012_split$gmLI <- relief2012_split$gmLI/average$gmLI[1]
relief2013_split$gmLI <- relief2013_split$gmLI/average$gmLI[2]
relief2014_split$gmLI <- relief2014_split$gmLI/average$gmLI[3]
relief2015_split$gmLI <- relief2015_split$gmLI/average$gmLI[4]
relief2016_split$gmLI <- relief2016_split$gmLI/average$gmLI[5]
relief2017_split$gmLI <- relief2017_split$gmLI/average$gmLI[6]

relief2016_split$ADRE <- relief2016_split$RE24 * relief2016_split$gmLI
relief2016_split$ADREIP <- relief2016_split$ADRE / relief2016_split$Innings
relief2015_split$ADRE <- relief2015_split$RE24 * relief2015_split$gmLI
relief2015_split$ADREIP <- relief2015_split$ADRE / relief2015_split$Innings
relief2014_split$ADRE <- relief2014_split$RE24 * relief2014_split$gmLI
relief2014_split$ADREIP <- relief2014_split$ADRE / relief2014_split$Innings
relief2013_split$ADRE <- relief2013_split$RE24 * relief2013_split$gmLI
relief2013_split$ADREIP <- relief2013_split$ADRE / relief2013_split$Innings
relief2012_split$ADRE <- relief2012_split$RE24 * relief2012_split$gmLI
relief2012_split$ADREIP <- relief2012_split$ADRE / relief2012_split$Innings

relief2017_split$ADRE <- relief2017_split$RE24 * relief2017_split$gmLI
relief2017_split$ADREIP <- relief2017_split$ADRE / relief2017_split$Innings

relief2012_split$Season <- 2012
relief2013_split$Season <- 2013
relief2014_split$Season <- 2014
relief2015_split$Season <- 2015
relief2016_split$Season <- 2016
relief2017_split$Season <- 2017

relief_split <- rbind(relief2012_split, relief2013_split, relief2014_split, relief2015_split, relief2016_split,relief2017_split)
ISOSplit <- read.csv("data/ISOSplit.csv")
ISOSplit <- ISOSplit[,c(2,1,4,17,19)]
ISOSplit$ISO <- ISOSplit$SLG - ISOSplit$AVG
ISOSplit <- ISOSplit[,c(1,2,3,6)]
TeamConverter <- read.csv("data/Team Converter.csv")
TeamConverter <- transform(TeamConverter, Team = as.character(Team))
ISOSplit$Team <- plyr::mapvalues(ISOSplit$Team,
                                 from = TeamConverter$TeamA,
                                 to = TeamConverter$Team)
relief_split <- merge(relief_split, ISOSplit, by = c("Name","Season", "Team"), all = TRUE)

relief_split <- cbind(relief_split, predict(PCACON, newdata = relief_split))
relief_split <- rename(relief_split, c("PC1" = "CON1", "PC2" = "CON2"))
relief_split <- relief_split[,c(1,2,3,4,5,6,7,16,17,9,15)]
relief_split$xADREIP <- predict(xADREIP, newdata = relief_split)
relief_split$ISO <- round(relief_split$ISO,3)
relief_split$gmLI <- round(relief_split$gmLI,2)
relief_split$CON1 <- round(relief_split$CON1,2)
relief_split$ADREIP <- round(relief_split$ADREIP,4)
relief_split$xADREIP <- round(relief_split$xADREIP, 4)
