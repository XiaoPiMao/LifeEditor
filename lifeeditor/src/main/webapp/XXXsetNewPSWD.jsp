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
			<a href="#home" class="smoothScroll">首頁</a>
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
				
					</div>
					<div><img class="img_scroll" src="images/circle.png" style="position:absolute;left:50%;top:50%;margin-left:-30px;margin-top:480px;"></div>		
<!----------------------------------------------------- 	Login start --------------------------------------------------->

<!-------------------------------------------------- Login end ----------------------------------------------------------->			
					</div>
				</div>
				
			</div><! --/row -->
		</div><! --/container -->
	</div><! --/headerwrap -->

	
	<div id="div1" class="container-fluid" >
	<div class="row">
	    <form action="ResetPswd.do" method="post"    name="form3"  class="row3">  
				 <div class="col-md-6">
			    <span style="color: red">${requestScope.sendMailMsg}</span>  
		<div>
			 <label>您的帳號:</label>
			<input type="text" name="userAccount" value="${param.userAccount}" readonly="readonly" class="form-control"  size="22"/><br/>
			 
			<label >設定新密碼:</label>
			<input type="password" name="newPassword"  class="form-control"  size="22"/><span class="error">${errors.newPassword }</span><br/>  
			</div>
			<div>
			<label >再輸入新密碼:</label>
			<input type="password" name="newPassword2"  class="form-control" size="22" /><span class="error">${errors.newPassword2 }</span><br/> 
					    <input type="submit" value="送出資料" /><a href=""></a>  
					    
			</div>		    
					</form> 
	</div>
	  </div>

				</div><!-- col-lg-4 -->
			</div><!-- /row -->
		</div><! --/container -->
		
				
			</div><! --/row -->
		</div><! --/container -->
	</div><! --/Portfoliowrap -->
	
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

	<!------------------------------------------- login----end------------------------------------------------>
  </body>
</html>

