
prod <- read.csv("products.csv")
region <- read.csv("regions.csv")
sales <- read.csv("sales.csv", nrows=500000)
sales_prod <- merge(sales, prod, by.x="productId", by.y="id")
sales_prod_region <- merge(sales_prod, region, by.x="regionId", by.y="id")
attach(sales_prod_region)
sales_prod_region  <- sales_prod_region[order(timestamp),]
auto <- sales_prod_region[(sales_prod_region$category == 'Automobile'),]
elec <- sales_prod_region[(sales_prod_region$category == 'Electronics'),]
appliance <- sales_prod_region[(sales_prod_region$category == 'Applicance'),]
cloths <- sales_prod_region[(sales_prod_region$category == 'Cloths'),]

rgn <- sales_prod_region[(sales_prod_region$region == 'South'),]
state <- sales_prod_region[(sales_prod_region$state == 'UP'),]
city <- sales_prod_region[(sales_prod_region$city == 'Jaipur'),]

apple <- sales_prod_region[(sales_prod_region$brand == 'Honda'),]


sub <- city

sub$month = substring(sub$timestamp,6,7)
sub$year = substring(sub$timestamp,1,4)

adist <- tapply(sub$timestamp, list(sub$month, sub$year), function(x) length(x))  #time series

adist[is.na(adist)] <- 0 #remove NAs

adv <- as.vector(adist)

ats <- ts(adv, frequency=12, start=c(2000,1))
plot.ts(ats)







