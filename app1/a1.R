
prod <- read.csv("products.csv")
region <- read.csv("regions.csv")
sales <- read.csv("sales.csv", nrows=500000)
sales_prod <- merge(sales, prod, by.x="productId", by.y="id")
sales_prod_region <- merge(sales_prod, region, by.x="regionId", by.y="id")
attach(sales_prod_region)
sales_prod_region  <- sales_prod_region[order(timestamp),]

category <- sales_prod_region[(sales_prod_region$category == 'Automobile'),]
type <- sales_prod_region[(sales_prod_region$type == 'TV'),]
brand <- sales_prod_region[(sales_prod_region$brand == 'Honda'),]
model <- sales_prod_region[(sales_prod_region$model == 'Acer2'),]

rgn <- sales_prod_region[(sales_prod_region$region == 'South'),]
state <- sales_prod_region[(sales_prod_region$state == 'UP'),]
city <- sales_prod_region[(sales_prod_region$city == 'Chennai'),]

sub <- type

sub$month = substring(sub$timestamp,6,7)
sub$year = substring(sub$timestamp,1,4)

adist <- tapply(sub$timestamp, list(sub$month, sub$year), function(x) length(x))  #time series

adist[is.na(adist)] <- 0 #remove NAs

adv <- as.vector(adist)

ats <- ts(adv, frequency=12, start=c(2000,1))
plot.ts(ats)













cars  <- c(11,5,5,2,12,5)#, 908, 1047)#, 1259, 1905) 11  5  5  2 12  5 19 14 17 24 27 18
carseries  <- ts(cars, frequency=12, start=c(2014, 1))
plot.ts(carseries)
carmodel <- HoltWinters(carseries, gamma=FALSE, l.start=1)
plot(carmodel)
carforecast <- forecast.HoltWinters(carmodel, h=1)
plot.forecast(carforecast)





