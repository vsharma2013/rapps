var rio = require("rio");
var path = require('path');
var fs = require('fs');

var args = {
    prods: ["VISHAL", "GAURAV", "PIHU"]
};

function displayResponse(err, res) {
    var i;

    if (!err) {
        console.log("response = " + res);
    } else {
        console.log("R operation failed");
    }
}

function getPlot(err, res) {
    if (!err) {
        fs.writeFile("myPlot.png", res, {encoding: "binary"}, function (err) {
            if (!err) {
                console.log("myPlot.png saved in ", __dirname);
            }
        });
    } else {
        console.log("Loading image failed");
    }
}

rio.sourceAndEval(path.join(__dirname, "sales.R"), {
    entryPoint: "execute",
    data: args,
    callback: getPlot
});