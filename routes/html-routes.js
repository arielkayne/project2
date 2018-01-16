// Dependencies
// =============================================================
var path = require("path");

// Routes
// =============================================================
module.exports = function(app) {

  app.get("/", function(req, res) {
    res.sendFile(path.join(__dirname, "../public/signin.html"));
  });

  app.get("/transactions",function(req,res){
    res.sendFile(path.join(__dirname, "../public/transaction-manager.html"));
  });

  app.get("/register", function(req, res) {
  	res.sendFie(path.join(__dirname, "../public/register.html"));
  });

};