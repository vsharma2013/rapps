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

var args = [
	{key : '2000', value : 919},
	{key : '2001', value : 443},
	{key : '2002', value : 468},
	{key : '2003', value : 844},
	{key : '2004', value : 908},
	{key : '2005', value : 1047},
	{key : '2006', value : 1252},
	{key : '2007', value : 1905},
	{key : '2008', value : 1146},
	{key : '2009', value : 1153},
	{key : '2010', value : 1949},
	{key : '2011', value : 2285},
	{key : '2012', value : 2537},
	{key : '2013', value : 1893},
	{key : '2014', value : 2538}
]

rio.sourceAndEval(path.join(__dirname, "forecast.R"), {
    entryPoint: "execute",
    data: args,
    callback: onRResponse
});
