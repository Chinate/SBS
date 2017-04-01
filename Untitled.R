ohmygod <- data$srch_ci-as.Date.POSIXct(data$date_time)
ohhmygod <- as.numeric(ohmygod, units = "days")
ohhhmygod <- head(ohhmygod, 7000)
hist(ohhhmygod, breaks = 100)

date1 <- data$srch_ci
date2 <- as.Date.POSIXct(data$date_time)
table(date1 - date2)
hissss <- as.numeric(date1 - date2, units="days")
hissss <- hissss %% 365
his2 <- head(hissss, 1000)
hist(hissss, 100)

date1 <- head(date1,10)
date2 <- head(date2,10)

table(date1 - date2)

date1 <- data[data$is_booking==1,13]
dat <-data[data$is_booking==1,1]
date2 <- as.Date.POSIXct(dat$date_time)
date1$srch_ci-date2
dat2 <- as.numeric(date1$srch_ci-date2, units="days") %%365
hist(dat2, 100, freq = FALSE)

date3 <- data[data$is_booking==0,13]
dat3 <-data[data$is_booking==0,1]
date4 <- as.Date.POSIXct(dat3$date_time)
date3$srch_ci-date4
dat4 <- as.numeric(date3$srch_ci-date4, units="days") %%365
hist(dat4, 100, freq = FALSE)


head(date1,10)
newdate<- format(date1, "%m-%d")
newdate <- as.Date(newdate, "%m-%d")
newdate <- newdate - as.Date("2016-12-31")
newdate <- as.numeric(newdate, units = "days")
hist(newdate, breaks = 365)
hist(newdate, breaks = 365)
class(newdate)
table(newdate)
