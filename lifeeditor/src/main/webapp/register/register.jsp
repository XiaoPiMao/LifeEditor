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
			<a href="#contact" class="smoothScroll">聯絡我們</a>
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
		<FORM METHOD="post" ACTION="user_spec.do" name="form1" enctype="multipart/form-data">


	<div>
		<label for="exampleInputaccount">帳號:</label>
		<input type="TEXT" class="form-control" id="exampleInputaccount" name="account" value="${param.account}" size="45"  /><span>${errorMsgs.errorAccountempty}</span>
	</div>
	<div>
		<label for="exampleInputpswd">密碼</label>
		<input type="password" class="form-control" id="exampleInputpswd"  name="pswd" value="${param.pswd}" size="45" /><span>&nbsp&nbsp&nbsp${errorMsgs.errorpswd}</span>
	</div>
	<div>
		<label for="exampleInputpswd1">再次輸入密碼</label>
		<input type="password" class="form-control" id="exampleInputpswd1" name="pswd1" value="${param.pswd1}" size="45" /><span>&nbsp&nbsp&nbsp${errorMsgs.errorpswd1}</span>
	</div>
	<div class="form-group">
		<label for="exampleInputlastName">姓氏</label>
		<input type="TEXT" class="form-control" id="exampleInputlastName" name="lastName" value="${param.lastName}" size="22"><span>&nbsp&nbsp&nbsp${errorMsgs.errorlastName}</span>
	</div>
	<div class="form-group">
		<label for="exampleInputfirstName">姓名</label>
		<input type="TEXT" class="form-control" id="exampleInputfirstName" name="firstName" value="${param.firstName}" size="22" /><span>&nbsp&nbsp&nbsp${errorMsgs.errorfirstName}</span>
	</div>
	<div class="form-group">
		<label for="exampleInputgender">性別</label><br>
		<input  id="exampleInputgender" type="radio" name="gender" value="M" size="22" />男
		<input  id="exampleInputgender" type="radio" name="gender" value="F" size="22" />女
		<span>&nbsp&nbsp&nbsp${errorMsgs.errorgender}</span>
	</div>
	<div class="form-group">
		<label for="exampleInputbirthdate">生日</label>
		<input type="date" class="form-control" id="exampleInputbirthdate" name="birthdate" value="${param.birthdate}" size="22"  /><span>&nbsp&nbsp&nbsp${errorMsgs.errorbirthdate}</span>
	</div>
	<div class="form-group">
		<label for="exampleInputemail">電子信箱</label>
		<input type="TEXT" class="form-control" id="exampleInputemail" name="email" value="${param.email}" size="22"  /><span>&nbsp&nbsp&nbsp${errorMsgs.erroremail}</span>
	</div>
	<div class="form-group">
		<label for="exampleInputaddress">住址</label>
		<input type="TEXT" class="form-control" id="exampleInputaddress" name="address" value="${param.address}" size="22"  /><span>&nbsp&nbsp&nbsp${errorMsgs.erroraddress}</span>
	</div>
	<div class="form-group">
		<label  for="exampleInputphone">電話號碼</label>
		<input type="TEXT"  class="form-control" id="exampleInputphone" name="phone" value="${param.phone}" size="22"  /><span>&nbsp&nbsp&nbsp${errorMsgs.errorphone}</span>
	</div>
	<div class="form-group">
		<label for="exampleInputpicture">上傳大頭貼</label>
		<input type="file" id="exampleInputpicture" class="upl" name="picture" size="22"  /><span>&nbsp&nbsp&nbsp${errorMsgs.errorpicture}</span>
	</div>
	<div>
		<input type="hidden" name="action" value="insert">
		<input type="submit" style="margin-left: 650px;position:relative; bottom: 150px;width:150px;height:80px;font-size:20px;" class="btn btn-default" value="送出新增"><div style="font-size:12pt;color:red;width:150px; margin-left: 650px;position:relative; bottom: 250px;"><p>${errorMsgs.errorCaptcha}</p></div>
	</div>
	<div style="margin-left: 580px;position:relative; bottom: 480px;width:150px;height:80px;font-size:20px;">
	<script src="https://www.google.com/recaptcha/api.js" async defer></script>
		<div class="g-recaptcha" data-sitekey="6LfoPyETAAAAAG8hEQH-RAVNjAft9mX6uzK70CTD"></div>
		<noscript>
		  <div >
		    <div style="width: 302px; height: 422px; position: relative;">
		      <div style="width: 302px; height: 422px; position: absolute;">
		        <iframe src="https://www.google.com/recaptcha/api/fallback?key=6LfoPyETAAAAAG8hEQH-RAVNjAft9mX6uzK70CTD"
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
</FORM>
		</div>
		<div style="padding-left:100px" class="col-md-6">		
		
		<div>
		<label>預覽大頭貼</label><br>
        <img class="preview" style="max-width: 450px; max-height: 400px;">
        <div class="size"></div>
		</div>
		<br>
		<br>
		<br>
		<jsp:useBean id="userSvc" scope="page" class="com.lifeeditor.service.user_specService" />
			<FORM METHOD="post" ACTION="user_spec.do" >
		       <b>選擇員工編號:</b>
		       <select size="1" name="userID">
		         <c:forEach var="user_specVO" items="${userSvc.all}" > 
		          <option value="${user_specVO.userID}">${user_specVO.userID}
		         </c:forEach>   
		       </select>
		       <input type="submit" value="送出">
		       <input type="hidden" name="action" value="getOne_For_Update">
		    </FORM>
		
		
		
		
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
</html>
