var db = require("../models");
var validate = require('express-validation');

var passport = require('passport');

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
var bcrypt = require('bcryptjs');

// module.exports = function (authenticate, callback) {
//   bcrypt.genSalt(10, function(err, salt) {
//     bcrypt.hash(newUser.password, salt, function (err, hash) {
//       newUser.password = hash;
//       newUser.save(callback);
//     })
//   })
// }

//app.routes.js

// module.exports = function (app, passport) {

//here the tutorial has app/get /. which is in our html routes?

//process the login form




//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&/


module.exports = function(app){

  app.post('/login', passport.authenticate('local-login', {
    successRedirect : '/profile', // redirect to the secure profile section
    failureRedirect : '/login', // redirect back to the signup page if there is an error
    failureFlash : true // allow flash messages
  }));


  // process the signup form
  app.post('/signup', passport.authenticate('local-signup', {
      successRedirect : '/profile', // redirect to the secure profile section
      failureRedirect : '/signup', // redirect back to the signup page if there is an error
      failureFlash : true // allow flash messages
  }));

  app.post("/api/users/authenticate", function(req, res){
    generateHash = function(password) {
      return bcrypt.hashSync(password, bcrypt.genSaltSync(8), null);
      };
    var rehash = generateHash(req.body.password);
    console.log(rehash);

    validPassword = function(password) {
        if (bcrypt.compareSync(password, rehash) === true) {
        console.log("validPassword is true.")
       return true;}
    };

    if (validPassword(req.body.password) === true) {
      window.location
    };
  
    // console.log(req.body)
    
    // db.User.findOne({
    //   where:{
    //     username:req.body.username,
    //     password:req.body.password
    //     // password:req.body.password
    //   }
    //   console.log(validPassword(db.Userreq.body.password));
    // }).then(function(dbUser){
    //   console.log(dbUser);
    //   var result = {};
    //   if(dbUser === null){
    //     result.auth = false;
    //   } else{
    //     result.auth = true;
    //     result.userId = dbUser.id;
    //   }
    //   res.json(result);
    // });
  });


//below code is to get the firstname and lastname of user
  app.get("/api/users/:id", function(req, res){
    db.User.findOne({
      where:{
        id:req.params.id,
      }
    }).then(function(dbUser){
      //console.log(dbUser);
      var claimsyUser = {
        firstName: dbUser.firstName,
        lastName: dbUser.lastName
      }
      res.json(claimsyUser);
    })
  });

//below code is to create a new user for registration page
  app.post("/api/new/user", function(req, res){

      // req.checkBody('fname', "First name is required.").notEmpty();
      // req.checkBody('lname', "Last name is required.").notEmpty();
      // req.checkBody('email', "Email is not valid.").isEmail();
      // req.checkBody('uname', "Username is required.").notEmpty();
      // req.checkBody('paswrd', "Password is required.").notEmpty();
      // req.checkBody('conf_password', "Passwords do not match.").equals(req.body.paswrd);

      // var errors = req.validationErrors();

      // if(errors) {
      //   res.render('/signin.html', //this doesn't exist right now
      //   {
      //     error:errors //this requries handlebars dammit, i guess render on the fly to the reg page
      //   });
      // } else {
        console.log('PASSED');

      generateHash = function(password) {
      return bcrypt.hashSync(password, bcrypt.genSaltSync(8), null);
      };

  // // checking if password is valid
  //     User.methods.validPassword = function(password) {
  //     return bcrypt.compareSync(password, this.local.password);
  //     };
        console.log(generateHash(req.body.password));
        req.body.password = generateHash(req.body.password);
        db.User.create(
          {
            firstName:req.body.firstName,
            lastName:req.body.lastName,
            username:req.body.username,
            password:generateHash(req.body.password)
          }
        )
          
        .then(function(dbUser){
          // console.log(dbUser);
          // // dbUser.password = generateHash(dbUser.password);

          res.json(dbUser);
        });
        //code or reference to create a new user, user api line 57?
      

  });

}
