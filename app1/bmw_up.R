prod <- read.csv("products.csv")
region <- read.csv("regions.csv")
sales <- read.csv("sales.csv", nrows=500000)
sales_prod <- merge(sales, prod, by.x="productId", by.y="id")
sales_prod_region <- merge(sales_prod, region, by.x="regionId", by.y="id")
attach(sales_prod_region)

auto <- sales_prod_region[(sales_prod_region$category == 'Automobile'),]

bmw <- auto[(auto$brand == "BMW"),]

bmw_up <- bmw[(bmw$state == "UP"),]

bmw_up$month = substring(bmw_up$timestamp,6,7)
bmw_up$year = substring(bmw_up$timestamp,1,4)

bmw_dist <- tapply(bmw_up$timestamp, list(bmw_up$month, bmw_up$year), function(x) length(x))  #time series

bmw_dist[is.na(bmw_dist)] <- 0 #remove NAs

bmw_vector <- as.vector(bmw_dist)

bmw_ts <- ts(bmw_vector, frequency=12, start=c(2000,1))
plot.ts(bmw_ts)
