<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="../ico/favicon.ico">

    <title>註冊會員</title>
    
    <!-- Bootstrap core CSS -->
    <link href="../css/bootstrap.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="../css/style.css" rel="stylesheet">
    <link href="../css/font-awesome.min.css" rel="stylesheet">
    <link href="../js/fancybox/jquery.fancybox.css" rel="stylesheet" />
    <!-- Latest compiled and minified CSS -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous"> -->

<!-- Optional theme -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous"> -->

<!-- Latest compiled and minified JavaScript -->
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script> -->
<script src="https://code.jquery.com/jquery-2.2.4.js" integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI="   crossorigin="anonymous"></script>

    <!-- Just for debugging purposes. Don't actually copy this line! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<style>
#div1{
margin: auto;
width:1000px;
padding-top: 50px;  

}
label{
font-size:14pt;

}
span{
font-size:12pt;
color:red;
float: right;;
}
</style>

  </head>

  <body data-spy="scroll" data-offset="0" data-target="#theMenu">
		
	<!-- Menu -->
	<nav class="menu" id="theMenu">
		<div class="menu-wrap">
			<h1 class="logo"><a href="index.html#home">Life Editor</a></h1>
			<i class="fa fa-times menu-close"></i>
			<a href="#home" class="smoothScroll">首頁</a>
			<a href="#about" class="smoothScroll">關於</a>
			<a href="#portfolio" class="smoothScroll">熱門人物</a>
			<a href="#contact" class="smoothScroll">連絡我們</a>
			<a href="#inline0" class="smoothScroll">註冊登入</a>
			<a href="#"><i class="fa fa-facebook"></i></a>
			<a href="#"><i class="fa fa-twitter"></i></a>
			<a href="#"><i class="fa fa-dribbble"></i></a>
			<a href="#"><i class="fa fa-envelope"></i></a>
		</div>
		
		<!-- Menu button -->
		<div id="menuToggle"><i class="fa fa-bars"></i></div>
	</nav>

	<section id="home" name="home"></section>
	<div id="headerwrap">
		<div class="container">
			<div class="row">
				<div class="col-md-6 col-md-offset-3">
					<h1>Life Editor</h1>
				</div>
			</div><! --/row -->
		</div><! --/container -->
	</div><! --/headerwrap -->
	
	<div id="div1" class="container-fluid">
	<div class="row">
		<div class="col-md-6">
	
		
		
		
		
		</div>
	</div>
</div>
	
	<! -- SERVICE SECTION -->
	<section id="contact" name="contact"></section>
	<! -- CONTACT SEPARATOR -->
<!-- 	<div class="sep contact" data-stellar-background-ratio="0.5"></div> -->
	
	<div id="contactwrap">
		<div class="container">
			<div class="row">
				<div class="col-lg-6">
					<p>CONTACT ME RIGHT NOW!</p>
					<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.</p>
					<p>
						<small>5th Avenue, 987<br/>
						38399, New York,<br/>
						USA.</small>
					</p>
					<p>
						<small>Tel. 9888-4394<br/>
						Mail. Hello@coolfolks.com<br/>
						Skype. NYCDesign
					</p>
			
				</div>
				
				<div class="col-lg-6">
					<form role="form">
					  <div class="form-group">
					    <label for="exampleInputName1">Your Name</label>
					    <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Enter name">
					    <label for="exampleInputEmail1">Email address</label>
					    <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Enter email">
					    <label for="exampleInputText1">Message</label>
					    <textarea class="form-control" rows="3"></textarea>
					  </div>
					  <button type="submit" class="btn btn-default">Submit</button>
					</form>
				</div>
			
			</div><! --/row -->
		</div><!-- /container -->
	</div>
	
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	<script src="../js/classie.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/smoothscroll.js"></script>
	<script src="../js/jquery.stellar.min.js"></script>
	<script src="../js/fancybox/jquery.fancybox.js"></script>    
	<script src="../js/main.js"></script>
    <script>
$(function (){
	 
    function format_float(num, pos)
    {
        var size = Math.pow(10, pos);
        return Math.round(num * size) / size;
    }
 
    function preview(input) {
 
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            
            reader.onload = function (e) {
                $('.preview').attr('src', e.target.result);
                var KB = format_float(e.total / 1024, 2);
                $('.size').text("檔案大小：" + KB + " KB");
            }
 
            reader.readAsDataURL(input.files[0]);
        }
    }
 
    $("body").on("change", ".upl", function (){
        preview(this);
    })
    
})
</script>
		<script>
		$(function(){
			$.stellar({
				horizontalScrolling: false,
				verticalOffset: 40
			});
		});
		</script>
		
		<script type="text/javascript">
      $(function() {
        //    fancybox
          jQuery(".fancybox").fancybox();
      });
	   </script>

  </body>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script>
	function statusChangeCallback(response) { //檢查登入狀態 為您的回呼所提供 response 的物件中含有數個欄位
		console.log('statusChangeCallback');
		console.log(response);

		if (response.status === 'connected') {
			// 這位用戶已登入 Facebook，也已經登入您的應用程式
			testAPI();
		} else if (response.status === 'not_authorized') {
			// 這位用戶已登入 Facebook，但尚未登入您的應用程式。
			document.getElementById('status').innerHTML = '可使用FB快速登入，請同意分享Email';
		} else {
			//這位用戶沒有登入 Facebook，因此您無法得知用戶是否已登入您的應用程式。或者之前已呼叫 FB.logout()，因此無法連結至 Facebook。
			document.getElementById('status').innerHTML = '可使用FB快速登入，請同意分享Email';

		}
	}
	function checkLoginState() {  //檢查登入狀態 
		FB.getLoginStatus(function(response) {  //存取權杖
			statusChangeCallback(response);
		});
	}

	window.fbAsyncInit = function() {
		FB.init({
			appId : '236995580009135',
			//appId : 1751012028468871,
			cookie : true, // enable cookies to allow the server to access 
			// the session
			xfbml : true, // parse social plugins on this page
			version : 'v2.2' 
		});

	};

	// Load the SDK asynchronously
	(function(d, s, id) {
		var js, fjs = d.getElementsByTagName(s)[0];
		if (d.getElementById(id))
			return;
		js = d.createElement(s);
		js.id = id;
		js.src = "//connect.facebook.net/zh_TW/sdk.js";
		fjs.parentNode.insertBefore(js, fjs);
	}(document, 'script', 'facebook-jssdk'));

	function testAPI() {
		console.log('Welcome!  Fetching your information.... ');
		FB.api('/me','GET', {"fields":"email,last_name,first_name,id,gender,picture"},
				  function(response){
						      $('#UserName').text('登入者lastＮame ：'+response.last_name);
						      	
							console.log('Successful login for: '+ response.name);
							console.log(JSON.stringify(response));
					   
							document.getElementById('status').innerHTML = '歡迎您的登入'+response.first_name+ response.last_name + '!';
							
							var datas = JSON.stringify(response) ;
							var info = JSON.parse(datas);
							console.log(info);
							
							 ajaxPost(response.email,response.last_name,response.first_name,response.id,response.gender);
														
						});
		
}
//	function myFacebookLogin() {
//		FB.login(function(){
//			  // Note:登入時自動發文 The call will only work if you accept the permission request
//			  FB.api('/me/feed', 'post', {message: '0.0'});
//			}, {scope: 'publish_actions'});
//		}


	function ajaxPost(email,last_name,first_name,id,gender)
	{
	      //===AJAX POST===
	        var params = {"EMAIL" : email ,"LASTNAME" : last_name ,"FIRSTNAME" : first_name ,"PSWD" : id,"GENDER":gender };
	         $.ajax({
	            url: 'ch04_02/Fb.do',
	            type:"post",
	            data: params,
	            success: function(data){
	                //表單成功送出後會執行的地方	               
                    alert('個資已被送出');
		      
		         	 window.location.href =  "${ctx}/index.jsp";
			
	            }
	       });
	} 	
//          $.post("FbServlet",{"EMAIL":email ,"NAME":last_name},
//         		 function(data){
//         			 alert('個資已記錄2');
//         		 });
//          }

	
</script>
</html>
