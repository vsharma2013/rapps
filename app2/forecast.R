require(tseries)
require(RJSONIO)
require(forecast)

execute <- function (jsonObj) {
	o = fromJSON(jsonObj);
	keys <- c();
	values <- c();
	outVals <- c();

	for(x in o){
		keys = append(keys, as.numeric(x$key));
		values = append(values, x$value);
		outVals = append(outVals, 0);
	}
	evalSet <- c(values[0], values[1], values[2], values[3]);
	for(i in 4:8){
		evalSet = append(evalSet, values[i]);
		fVal <- getForcastValue(c(evalSet), keys);
		
		min <- fVal$lower[1];
		max <- fVal$upper[1];
		if(values[i] < min)
			outVals[i] = -1;
	 	if(values[i] > max)
		 	outVals[i] = 1;
		print(keys[i]);
		print(values[i]);
		print(min);
		print(max);		
		print('-----------------')
	}
    results <- outVals;
    names(results) <- keys
    return(toJSON(results));
}

getForcastValue <- function (values, keys){
	tsrs  <- ts(values, start=c(keys[1]));
	tModel <- HoltWinters(tsrs, gamma=FALSE, l.start=values[1]);
	tForecast <- forecast.HoltWinters(tModel, h=1)
	return (tForecast);
}