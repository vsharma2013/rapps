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
		{key : 'Jan-14', value : 4},
		{key : 'Feb-14', value : 5},
		{key : 'Mar-14', value : 6},
		{key : 'Apr-14', value : 7},
		{key : 'May-14', value : 4},
		{key : 'Jun-14', value : 2},
		{key : 'Jul-14', value : 3},
		{key : 'Aug-14', value : 5},
		{key : 'Sep-14', value : 6},
		{key : 'Oct-14', value : 7},
		{key : 'Nov-14', value : 11},
		{key : 'Dec-14', value : 8}
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
