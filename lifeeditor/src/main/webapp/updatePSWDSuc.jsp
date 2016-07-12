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
    <link rel="shortcut icon" href="ico/favicon.ico">
    
    <title>Life Editor</title>
    
    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/style.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="js/fancybox/jquery.fancybox.css" rel="stylesheet" />

    <!-- Just for debugging purposes. Don't actually copy this line! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    
  </head>
  <style>
   div{margin:0px auto;}
  
  .errorspan{
	font-size:10pt;
	color:red;
	
  }
  </style>



  <body data-spy="scroll" data-offset="0" data-target="#theMenu">
	<!-- Menu -->

	<nav class="menu" id="theMenu">
		<div class="menu-wrap">
			<h1 class="logo"><a href="index.jsp#home">Life Editor</a></h1>
			<i class="fa fa-times menu-close"></i>
			<a href="index.jsp" class="smoothScroll">首頁</a>
			<a href="#about" class="smoothScroll">關於</a>
			<a href="#portfolio" class="smoothScroll">熱門人物</a>
			<a href="#contact" class="smoothScroll">聯絡我們</a>
			<a href="register/register.jsp" class="smoothScroll">註冊</a>
			<a id="modal_trigger2" href="#modal" class="smoothScroll">登入</a>
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
					<div><h1>Life Editor</h1>
					<div><h2 style="font-size: 55px;width:900px;position:absolute;left:50%;top:50%;margin-left:-450px;margin-top:220px;">Archive your goals and expand your horizon</h2></div>	
					<div style="width:180px;position:absolute;left:50%;top:50%;margin-left:-90px;margin-top:320px;text-align:center;">
			         <a id="modal_trigger" href="#modal" class="btn" style="font-size:20px;width:150px;">註冊 / 登入</a>
					</div>
					<div><img class="img_scroll" src="images/circle.png" style="position:absolute;left:50%;top:50%;margin-left:-30px;margin-top:480px;"></div>		
<!----------------------------------------------------- 	Login start --------------------------------------------------->
<!--     <div class="container"> -->
	<div id="modal" class="popupContainer" style="display:none;">
		<header class="popupHeader">
			<span class="header_title">Login</span>
			<span class="modal_close"><i class="fa fa-times"></i></span>
		</header>
		
		<section class="popupBody">
			<!-- Social Login -->
			<div class="social_login" style="margin:auto;">
				<div class="">					
					<div class="fb-login-button" scope="email" data-max-rows="1" data-size="large" data-show-faces="false" data-auto-logout-link="true" onlogin="checkLoginState();" ></div>
<!-- 						<fb:login-button scope="public_profile,email" onlogin="checkLoginState();" ></fb:login-button> -->
						<span class="icon"><i class="fa fa-facebook"></i></span>
						<span class="icon_title" >使用Facebook帳號快速登入</span>		
<!-- 					</a> -->
				</div>
				<div class="action_btns">
				<div class="one_half"><a href="#" id="login_form" class="btn" >登入</a></div>   <!-- 	 onclick="window.location.href=('login.jsp')"    onclick="document.getElementById('form-id').submit();" -->
					<div class="one_half last"><a href="#" id="register_form" class="btn">註冊</a></div>
				</div>
			</div>

			<!-- Username & Password Login form -->
			<div class="user_login" style="margin:auto;">
				<form id="form-id" Action="Login.java" method="POST">
					<label>帳號</label>
					 <input  type="text" name="account" size="10"  value="${sessionScope.account}">				
					<br />
					<label>密碼</label>
					   <input  type="password" name="pswd"  size="10"   value="${sessionScope.pswd}">
					<small><Font id="ErrorMsg" color='red' size="-1"></Font></small>
					<br />
					
						 <input type="checkbox" name="rememberMe" value="true"
					       <c:if test='${sessionScope.rememberMe == true}' > checked='checked'  </c:if>  /> 
						 <label for="rememberMe">記住這個帳號</label>
					
					<div class="action_btns">
						<div class="one_half"><a href="#" class="btn back_btn"><i class="fa fa-angle-double-left"></i> 上一頁</a></div>
						<div class="one_half last"><a href="#" class="btn btn_red"  onclick="LoginAjax();">登入</a></div>
					</div>
				</form>
				<a href="XXXupdatePassword.jsp" class="forgot_password">忘記密碼</a>
			</div>

			<!-- Register Form -->
			<div id="user_register" class="user_register">
				<div id="div1" class="container-fluid">
	<div class="row">
	<FORM METHOD="post" ACTION="register/user_spec.do" id="form1" enctype="multipart/form-data">
    <div class="col-md-6">
	<div>
		<label for="exampleInputaccount">帳號:</label>
		<input type="TEXT" class="form-control" id="exampleInputaccount" name="account" value="${param.account}" size="45"  /><span id="ErrorMsg2" class="errorspan"></span>
	</div>
	<div>
		<label for="exampleInputpswd">密碼</label>
		<input type="password" class="form-control" id="exampleInputpswd"  name="pswd" value="${param.pswd}" size="45" /><span id="ErrorMsg3" class="errorspan"></span>
	</div>
	<div>
		<label for="exampleInputpswd1">再次輸入密碼</label>
		<input type="password" class="form-control" id="exampleInputpswd1" name="pswd1" value="${param.pswd1}" size="45" /><span id="ErrorMsg4" class="errorspan"></span>
	</div>
	<div class="form-group">
		<label for="exampleInputlastName">姓氏</label>
		<input type="TEXT" class="form-control" id="exampleInputlastName" name="lastName" value="${param.lastName}" size="22"><span id="ErrorMsg5" class="errorspan"></span>
	</div>
	<div class="form-group">
		<label for="exampleInputfirstName">姓名</label>
		<input type="TEXT" class="form-control" id="exampleInputfirstName" name="firstName" value="${param.firstName}" size="22" /><span id="ErrorMsg6" class="errorspan"></span>
	</div>
	<div class="form-group">
		<label for="exampleInputgender">性別</label><br>
		<input  id="exampleInputgender" type="radio" name="gender" value="M" size="22" />男
		<input  id="exampleInputgender" type="radio" name="gender" value="F" size="22" />女
		<span id="ErrorMsg7" class="errorspan"></span>
	</div>
	<div class="form-group">
	
		<label for="exampleInputbirthdate">生日</label>
		<input type="date" class="form-control" id="exampleInputbirthdate" name="birthdate" value="${param.birthdate}" size="22"  /><span id="ErrorMsg8" class="errorspan"></span>
	</div>
	</div>
	<div style="padding-left:50px" class="col-md-6">
	<div class="form-group">
		<label for="exampleInputemail">電子信箱</label>
		<input type="TEXT" class="form-control" id="exampleInputemail" name="email" value="${param.email}" size="22"  /><span id="ErrorMsg9" class="errorspan"></span>
	</div>
	<div class="form-group">
		<label for="exampleInputaddress">住址</label>
		<input type="TEXT" class="form-control" id="exampleInputaddress" name="address" value="${param.address}" size="22"  /><span id="ErrorMsg10" class="errorspan"></span>
	</div>
	<div class="form-group">
		<label  for="exampleInputphone">電話號碼</label>
		<input type="TEXT"  class="form-control" id="exampleInputphone" name="phone" value="${param.phone}" size="22"  /><span id="ErrorMsg11" class="errorspan"></span>
	</div>
	<div id="div" class="container-fluid">
		<div class="row">
	<div class="col-md-6">
	<div class="form-group">
		<label for="exampleInputpicture">上傳大頭貼</label>
		<input type="file" id="exampleInputpicture" class="upl" name="picture" size="22"  /><span id="ErrorMsg12" class="errorspan"></span>
 	</div>
 	</div>
 	<div class="col-md-6">
 	<div>
 	<label>預覽大頭貼</label><br>
        <img class="preview" style="max-width: 150px; max-height: 100px;">
        <div class="size"></div>
    </div>
    </div>
    </div>
    </div>
    
	<div style="font-size:20px;padding-top:10px">
	<script src="https://www.google.com/recaptcha/api.js" async defer></script>
		<div class="g-recaptcha" data-sitekey="6LevuSITAAAAAIrjzYbDHse7oBVZjWFUVapy3sT_"></div>
		<noscript>
		  <div >
		    <div style="width: 302px; height: 422px; position: relative;">
		      <div style="width: 302px; height: 422px; position: absolute;">
		        <iframe src="https://www.google.com/recaptcha/api/fallback?key=6LevuSITAAAAAIrjzYbDHse7oBVZjWFUVapy3sT_"
		                frameborder="0" scrolling="no"
		                style="width: 302px; height:422px; border-style: none;">
		        </iframe>
		      </div>
		    </div>
		    <div style="width: 300px; height: 60px; border-style: none;
		                   bottom: 12px; left: 25px; margin: 0px; padding: 0px; right: 25px;
		                   background: #f9f9f9; border: 1px solid #c1c1c1; border-radius: 3px;">
		      <textarea id="g-recaptcha-response" name="g-recaptcha-response"
		                   class="g-recaptcha-response"
		                   style="width: 250px; height: 40px; border: 1px solid #c1c1c1;
		                          margin: 10px 25px; padding: 0px; resize: none;" >
		      </textarea>
		    </div>
		  </div>
		</noscript>
		</div>
		<div style="font-size:12pt;color:red;"><p id="ErrorMsg1" class="errorspan"></p></div>
		
		<div class="action_btns" style="padding-top:10px" >
						<input type="hidden" name="action" value="insert">
						<div class="one_half"><a href="#" class="btn back_btn"><i class="fa fa-angle-double-left"></i> 上一頁</a></div>
						<div class="one_half last"><a href="#" class="btn btn_red"  onclick="RegisterAjax()">註冊</a></div>
		    			
		</div>
		</div>
			
		</FORM>
			</div>
			</div>
			</div>
		</section>
	</div>
</div>
<!-------------------------------------------------- Login end ----------------------------------------------------------->			
					</div>
				</div>
				
			</div><! --/row -->
		</div><! --/container -->
	</div><! --/headerwrap -->

	
	<center><div  style="font-size:35px; "> 修改密碼成功，請使用新密碼登入</div></center>

				</div><!-- col-lg-4 -->
			</div><!-- /row -->
		</div><! --/container -->
		
				
			</div><! --/row -->
		</div><! --/container -->
	</div ><! --/Portfoliowrap -->
	
	<div id="testimonials">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 col-lg-offset-2 mt">
				
					
					  <!-- Indicators -->
					  <ol class="carousel-indicators">
					    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
					    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
					    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
					  </ol>
					</div>
					  
				</div><! --/col-lg-8 -->
			</div><! --/row -->
		</div><! --/container -->
	</div><! --/testimonials -->
	
	<! -- SERVICE SECTION -->
	<section id="contact" name="contact"></section>
	<! -- CONTACT SEPARATOR -->
<!-- 	<div class="sep contact" data-stellar-background-ratio="0.5"></div> -->
	
	<div id="contactwrap">
		<div class="container">
			<div class="row">
				<div class="col-lg-6">
					<p>CONTACT US RIGHT NOW!</p>
					<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.</p>
					<p>
						<small>No. 390, Section 1, Fuxing S Rd,<br/>
						 Da’an District, Taipei City,<br/>
						TAIWAN</small>
					</p>
					<p>
						<small>Tel. +886 6631 6599<br/>
						eeit85@gmail.com<br/>
						First Group Design
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
	<script src="js/classie.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/smoothscroll.js"></script>
	<script src="js/jquery.stellar.min.js"></script>
	<script src="js/fancybox/jquery.fancybox.js"></script>    
	<script src="js/main.js"></script>
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
<!------------------------------------------------------------------------------------ login----start------------------------------------------------------------------------------->
<script type="text/javascript" src="js/jquery.leanModal.min.js"></script>
<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css" />
<link type="text/css" rel="stylesheet" href="css/style.css" />
<script type="text/javascript">
	$("#modal_trigger").leanModal({top : 200, overlay : 0.6, closeButton: ".modal_close" });
	$("#modal_trigger2").leanModal({top : 200, overlay : 0.6, closeButton: ".modal_close" });  //給右邊界面
	$(function(){
		// Calling Login Form
		$("#login_form").click(function(){
			$(".social_login").hide();
			$(".user_login").show();
			return false;
		});

		// Calling Register Form
		$("#register_form").click(function(){
			$(".social_login").hide();
			$(".user_register").show();
			$(".header_title").text('Register');
			return false;
		});

		// Going back to Social Forms
		$(".back_btn").click(function(){
			$(".user_login").hide();
			$(".user_register").hide();
			$(".social_login").show();
			$(".header_title").text('Login');
			return false;
		});

	})

</script>
<script>
	$(function() {
		$("#form-id").submit(function(e)
				{
				    var postData = $(this).serializeArray(); 
				    var formURL = $(this).attr("Action");
			
				    $.ajax(
				    {
				        url : 'ch04_02/Login.do',
				        type: "POST",
				        data : postData,
				        success:function(data) 
				        {   
				        		if(data != "") {
				        			var errMsg = JSON.parse(data);	
					        	    document.getElementById("ErrorMsg").innerHTML =errMsg.LoginError;       
				        		}else {
				        			window.location.href = "home.jsp"
				        		}
				    		
				        }
				        
				    });
				    e.preventDefault(); //STOP default action
// 				    e.unbind(); //unbind. to stop multiple form submit.
				});
	})
	function statusChangeCallback(response) { //檢查登入狀態 為您的回呼所提供 response 的物件中含有數個欄位
		console.log('statusChangeCallback');
		console.log(response);

		if (response.status === 'connected') {
			// 這位用戶已登入 Facebook，也已經登入您的應用程式	
			testAPI();
		} else if (response.status === 'not_authorized') {
			// 這位用戶已登入 Facebook，但尚未登入您的應用程式。
		//	document.getElementById('status').innerHTML = '可使用FB快速登入，請同意分享Email';
		} else {
			//這位用戶沒有登入 Facebook，因此您無法得知用戶是否已登入您的應用程式。或者之前已呼叫 FB.logout()，因此無法連結至 Facebook。
		//	document.getElementById('status').innerHTML = '可使用FB快速登入，請同意分享Email';

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
 	//		appId : '467832290092585',
			//appId : 1751012028468871,
			cookie : true, // enable cookies to allow the server to access 
			// the session
			xfbml : true, // parse social plugins on this page
			version : 'v2.6' 
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
		FB.api('/me','GET', {"fields":"email,last_name,first_name,id,gender,picture{url}"},
				  function(response){					
                     			console.log(JSON.stringify(response));
//  								console.log(response);
			                console.log(response.picture);
							 ajaxPost(response.email,response.last_name,response.first_name,response.id,response.gender,response.picture);														
						});		
}
	
	function share() {   
		FB.ui(
	    {
	      method: 'share',
	      href: 'http://localhost:8080/lifeeditor/index.jsp',
	    },
	    // callback
	    function(response) {
	      if (response && !response.error_message) {
	        alert('分享成功!');
	      } else {
	        // alert('Error while posting.');
	      }
	    }
	  )
	};
	
	
	function LoginAjax(){		
		$("#form-id").submit();		
	}
	

	function ajaxPost(email,last_name,first_name,id,gender,picture)

	{
		//	alert(JSON.stringify(picture));
	      //===AJAX POST===
	        var params = {"EMAIL" : email ,"LASTNAME" : last_name ,"FIRSTNAME" : first_name ,"PSWD" : id,"GENDER":gender, "PIC":JSON.stringify(picture)};
	         $.ajax({
	            url: 'ch04_02/Fb.do',
	            type:"post",
	            data: params,
	            success: function(data){
	                //表單成功送出後會執行的地方	               
//                    alert('個資已被送出');
		      
	         	 window.location.href =  "${ctx}/home.jsp";
			
	            }
	       });
	} 		
</script>
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

$(function() {
$("#form1").submit(function(e)
		{
		    var postData = new FormData(this ); 
		    var formURL = $(this).attr("Action");
	
		    $.ajax(
		    {
		        url : formURL,
		        type: "POST",
		        processData: false,
		        contentType: false,
		        data : postData,
		        
		        success:function(data) 
		        {   
		        		if(data != "") {
		        			var errMsg = JSON.parse(data);	
			    			
				            
		        			if(errMsg.errorCaptcha != undefined){
		        				document.getElementById("ErrorMsg1").innerHTML =errMsg.errorCaptcha;
				        	}else{
				        		$("#ErrorMsg1").empty();
				        	}4
			        	    if(errMsg.errorAccountempty != undefined){
			        	    	document.getElementById("ErrorMsg2").innerHTML =errMsg.errorAccountempty;
				        	}else{
				        		$("#ErrorMsg2").empty();
				        	}
			        	    if(errMsg.errorpswd != undefined){
			        	    	document.getElementById("ErrorMsg3").innerHTML =errMsg.errorpswd;
				        	}else{
				        		$("#ErrorMsg3").empty();
				        	}
			        	    if(errMsg.errorpswd1 != undefined){
			        	    	document.getElementById("ErrorMsg4").innerHTML =errMsg.errorpswd1;
				        	}else{
				        		$("#ErrorMsg4").empty();
				        	}
			        	    if(errMsg.errorlastName != undefined){
			        	    	document.getElementById("ErrorMsg5").innerHTML =errMsg.errorlastName;
				        	}else{
				        		$("#ErrorMsg5").empty();
				        	}
			        	    if(errMsg.errorfirstName != undefined){
			        	    	document.getElementById("ErrorMsg6").innerHTML =errMsg.errorfirstName;
				        	}else{
				        		$("#ErrorMsg6").empty();
				        	}
			        	    if(errMsg.errorgender != undefined){
			        	    	document.getElementById("ErrorMsg7").innerHTML =errMsg.errorgender;
				        	}else{
				        		$("#ErrorMsg7").empty();
				        	}
			        	    if(errMsg.errorbirthdate != undefined){
			        	    	document.getElementById("ErrorMsg8").innerHTML =errMsg.errorbirthdate;
				        	}else{
				        		$("#ErrorMsg8").empty();
				        	}
			        	    if(errMsg.erroremail != undefined){
			        	    	document.getElementById("ErrorMsg9").innerHTML =errMsg.erroremail;
				        	}else{
				        		$("#ErrorMsg9").empty();
				        	}
			        	    if(errMsg.erroraddress != undefined){
			        	    	document.getElementById("ErrorMsg10").innerHTML =errMsg.erroraddress;
				        	}else{
				        		$("#ErrorMsg10").empty();
				        	}
			        	    if(errMsg.errorphone != undefined){
			        	    	document.getElementById("ErrorMsg11").innerHTML =errMsg.errorphone;
				        	}else{
				        		$("#ErrorMsg11").empty();
				        	}
			        	    if(errMsg.errorpicture != undefined){
			        	    	document.getElementById("ErrorMsg12").innerHTML =errMsg.errorpicture;
				        	}else{
				        		$("#ErrorMsg12").empty();
				        	}
		        		}else{
		        			$(".user_register").empty();
		        			document.getElementById("user_register").innerHTML ="<h1 style='color:black'>系統正在寄信給您</h1>";
		        			
		        		}
		    			
		        }
		        
		    });
		    e.preventDefault(); //STOP default action
//			    e.unbind(); //unbind. to stop multiple form submit.
		});
});
function RegisterAjax(){
	
	$("#form1").submit();
	
}
</script>
 	<!------------------------------------------- login----end------------------------------------------------>
  </body>
</html>

