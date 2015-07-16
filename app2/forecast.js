var rio = require("rio");
var path = require('path');
var fs = require('fs');


function onRResponse(err, res){
	if(err){
		console.log(err);
		return;
	}

	console.log(res);
}

var args = {
	data:[
		{key : 'Jan-14', value : 11},
		{key : 'Feb-14', value : 5},
		{key : 'Mar-14', value : 5},
		{key : 'Apr-14', value : 2},
		{key : 'May-14', value : 12},
		{key : 'Jun-14', value : 5},
		{key : 'Jul-14', value : 19},
		{key : 'Aug-14', value : 14},
		{key : 'Sep-14', value : 17},
		{key : 'Oct-14', value : 24},
		{key : 'Nov-14', value : 27},
		{key : 'Dec-14', value : 18}
	],
	forecastPeriod : 1,
	startYear : 2014,
	frequency : 12
};

rio.sourceAndEval(path.join(__dirname, "forecast.R"), {
    entryPoint: "execute",
    data: args,
    callback: onRResponse
});
