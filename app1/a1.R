
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
cloths <- sales_prod_region[(sales_prod_region$category == 'Clothing'),]

bmw <- auto[(auto$brand == "BMW"),]

adist <- tapply(spr$timestamp, list(spr$category, spr$region), function(x) length(x)) #Category distribution across regions


kl <- tapply(bmw$timestamp, list(bmw$region, bmw$state), function(x) length(x)) #BMW sales statewise
kl <- tapply(bmw$timestamp, list(bmw$region, bmw$city), function(x) length(x))  #BMW sales citywise

spr <- sales_prod_region
spr$month = substring(spr$timestamp,6,7)
spr$year = substring(spr$timestamp,1,4)

adist <- tapply(spr$timestamp, list(spr$month, spr$year), function(x) length(x))  #time series

adist[is.na(adist)] <- 0 #remove NAs
