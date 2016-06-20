verdict<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>LifeEditor Manager</title>
	<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
	<link rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
	<link rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
	<link rel="stylesheet" href="${ctx }/manager/dist/css/AdminLTE.min.css">
	<link rel="stylesheet" href="${ctx }/manager/dist/css/skins/skin-blue.min.css">
</head>
<style>
	@CHARSET "UTF-8";
/*
over-ride "Weak" message, show font in dark grey
*/

.progress-bar {
    color: #333;
} 

/*
Reference:
http://www.bootstrapzen.com/item/135/simple-login-form-logo/
*/

* {
    -webkit-box-sizing: border-box;
	   -moz-box-sizing: border-box;
	        box-sizing: border-box;
	outline: none;
}

    .form-control {
	  position: relative;
	  font-size: 16px;
	  height: auto;
	  padding: 10px;
		@include box-sizing(border-box);

		&:focus {
		  z-index: 2;
		}
	}

body {
	background: url(http://i.imgur.com/GHr12sH.jpg) no-repeat center center fixed;
    -webkit-background-size: cover;
    -moz-background-size: cover;
    -o-background-size: cover;
    background-size: cover;
}

.login-form {
	margin-top: 60px;
}

form[role=login] {
	color: #5d5d5d;
	background: #f2f2f2;
	padding: 26px;
	border-radius: 10px;
	-moz-border-radius: 10px;
	-webkit-border-radius: 10px;
}
	form[role=login] img {
		display: block;
		margin: 0 auto;
		margin-bottom: 35px;
	}
	form[role=login] input,
	form[role=login] button {
		font-size: 18px;
		margin: 16px 0;
	}
	form[role=login] > div {
		text-align: center;
	}
	
.form-links {
	text-align: center;
	margin-top: 1em;
	margin-bottom: 50px;
}
	.form-links a {
		color: #fff;
	}
</style>
<script src="${ctx }/manager/dist/js/jquery-1.12.3.min.js"></script>
<script src="http://canvasjs.com/assets/script/canvasjs.min.js"></script>
<script type="text/javascript">
$(document).ready(function () {
});

</script>
<body>
	<div class="container">
  <div class="row" id="pwd-container">
    <div class="col-md-4"></div>  
    <div class="col-md-4">
      <div class="login-form">
        <form method="post" action="${ctx }/backstageLogin/loginService" role="login">
          <h3>登入</h3>
          <input type="text" name="account"  required class="form-control input-lg" placeholder="user" value="${requestScrope.account}" />      
          <input type="password" name="pswd" required class="form-control input-lg" id="password" placeholder="Password" value="${requestScrope.pswd}" />                  
          <div class="pwstrength_viewport_progress"></div>               
          <button type="submit" class="btn btn-lg btn-primary btn-block">登入</button>
          <div>
            <a href="#">Create account</a> or <a href="#">reset password</a>
          </div>
          
        </form>
        
        <div class="form-links">
          <a href="#">www.LifeEditor.com</a>
        </div>
      </div>  
      </div>
      
      <div class="col-md-4"></div>
      

  </div>
  
  <p>
    <br>
    <br>
    
  </p>     
  
  
</div>
</body>
</html>