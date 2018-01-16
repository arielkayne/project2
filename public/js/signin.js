$(document).ready(function() {

    $('#login-form-link').click(function(e) {
    $("#login-form").delay(100).fadeIn(100);
    $("#register-form").fadeOut(100);
    $('#register-form-link').removeClass('active');
    $(this).addClass('active');
    e.preventDefault();
  });
  $('#register-form-link').click(function(e) {
    $("#register-form").delay(100).fadeIn(100);
    $("#login-form").fadeOut(100);
    $('#login-form-link').removeClass('active');
    $(this).addClass('active');
    e.preventDefault();
  });

  $("#login-submit").on("click", function(event){
    event.preventDefault();

    var uname = $("#username").val();
    var paswrd = $("#password").val();

    $.ajax({
      method:"POST",
      url:"/api/users/authenticate",
      data: {username:uname, password:paswrd}
    }).done(function(msg){
      console.log(msg);
      if(msg.auth === true){
        window.location = "/transactions?userId="+msg.userId; // this will redirect to transactions.html
      } else {
        alert("invalid username/password");

      }
    });
  });

  //--------------register or create a user
  $("#register-submit").on("click", function(event){
    event.preventDefault();
    var fname = $("#register_firstname").val();
    var lname = $("#register_lastname").val();
    //&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
    var email = $("register_email").val();
    //&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&//
    var uname = $("#register_username").val();
    var paswrd = $("#register_password").val();
    var conf_password = $("#confirm-password").val();
    console.log(conf_password);
    console.log(paswrd);
//jblock starts******************************
    if(conf_password === paswrd){
      //ajax should go here
      $.ajax({
        method:"POST",
        url:"/api/new/user",
        data:{
          firstName: fname,
          lastName: lname,
          username: uname,
          password: paswrd
        }
      }).done(function(msg){
        window.location="/"; // redirect user to the login page
        });
    } else{
      alert("Please check your credentials");
    }
    //jblock ends******************************

      //jh starts &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
      //validation
      // req.checkBody('fname', "First name is required.").notEmpty();
      // req.checkBody('lname', "Last name is required.").notEmpty();
      // req.checkBody('email', "Email is not valid.").isEmail();
      // req.checkBody('uname', "Username is required.").notEmpty();
      // req.checkBody('paswrd', "Password is required.").notEmpty();
      // req.checkBody('conf_password', "Passwords do not match.").equals(req.body.paswrd);

      // var errors = req.validationErrors();

      // if(errors) {
      //   res.render('/register', //this doesn't exist right now
      //   {
      //     error:errors //this requries handlebars dammit, i guess render on the fly to the reg page
      //   });
      // } else {
      //   console.log('PASSED');
      //   //code or reference to create a new user, user api line 57?
      // }
  });




});
