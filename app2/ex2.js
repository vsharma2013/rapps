var util = require("util"),
    path = require("path"),
    rio = require("rio");

var args = {
    prods: ["IBM", "YHOO", "MSFT"]
};

function displayResponse(err, res) {
    var i;

    if (!err) {
        res = JSON.parse(res);
        for (i = 0; i < args.prods.length; i += 1) {
            console.log("Optimal weight for " + args.prods[i] +
                " is " + res.pw[i]);
        }
        // Optimal weights: 0.27107,0.2688,0.46013
    } else {
        console.log("Optimization failed");
    }
}

rio.sourceAndEval(path.join(__dirname, "ex2.R"), {
    entryPoint: "getOptimalPortfolio",
    data: args,
    callback: displayResponse
});