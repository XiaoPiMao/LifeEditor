<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登錄</title>
</head>
<body>
	<CENTER>
		<!-- 
<Form Action="login.do" method="POST">
 -->
		<!-- 
<Form Action="<c:url value='login.do' />" method="POST">
 -->
		<Form Action="Login.java" method="POST">
			<Table width='330'>
				<TR>
					<TH colspan='2'>
						<H1>登入</H1>
					</TH>
					<TH></TH>
				</TR>
				<TR>
					<TD align="RIGHT">帳號：</TD>
					<TD align="LEFT"><input type="text" name="account" size="10"></TD>
					<TD width='120'><small><Font id="AccountMsg" color='red' size="-1">${ErrorMsgKey.AccountEmptyError}</Font></small></TD>
				</TR>
				<TR>
					<TD align="RIGHT">密碼：</TD>
					<TD align="LEFT"><input type="password" name="pswd" size="10"></TD>
					<TD width='120'><small><Font id="PswdMsg" color='red' size="-1">${ErrorMsgKey.PasswordEmptyError}</Font></small></TD>
				</TR>
				<TR>
					<TD align="CENTER" colspan='3'><Font color='red' size="-1">${ErrorMsgKey.LoginError}&nbsp;</Font></TD>

				</TR>

				<TR>
					<TD colspan="2" align="center"><input type="submit" value="提交"> 
					<div>--------------or---------------</div>
					<div class="fb-login-button" data-max-rows="1" data-size="large" data-show-faces="false" data-auto-logout-link="true" onlogin="checkLoginState();"></div>
					<div class="fb-login-button" data-max-rows="1" data-size="large" data-show-faces="false" data-auto-logout-link="true" onlogin="checkLoginState();"></div>
					<div id="status"></div>		
					</TD>
				</TR>
				
			</Table>
		</Form>
	</CENTER>
<!-- 	<fb:login-button scope="public_profile,email" onlogin="checkLoginState();" ></fb:login-button> -->
	<br>
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
		FB.api('/me','GET', {"fields":"email,last_name,first_name,id,gender,picture,name"},
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
