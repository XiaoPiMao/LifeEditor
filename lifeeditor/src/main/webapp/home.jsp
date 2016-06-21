<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<jsp:useBean id="trgSvc" class="com.lifeeditor.service.TargetSpecService" />
<!DOCTYPE HTML>
<html>
	<head>
		<title>Life Editor</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link href="singlecolor/css/bootstrap.min.css" rel="stylesheet">
		<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="css/main.css" />
		<script src="js/jquery.min.js"></script>
		<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
		<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
<style>


#hotmanicon{
    width:60px;
    height:60px;
    border-radius: 50%;
    margin:0px 0px 50px 5px;
    posttion:right;
}

#hotmanPic{
    width:310px;
    height:210px;
    border-radius:5%;
}

</style>


<script>
var jHome = JSON.parse('${jHome}'.replace(/\n/g,'\\n').replace(/\r/g,'\\r'));
console.log(jHome);
$(function(){
	//秀出所有朋友的目標
	var str = "";
	$.each(jHome,function(){
		str += 
			'<article class="post">' +
				'<header>' +
			    	'<div class="title">';
	
			if(this.trgType == 2){
            	str +='<h2 class="post-title bold" style="width:500px;letter-spacing:0.05em;margin-bottom:20px;"><a href=""> 目 標 : ' + this.trgName +'</a><span style="color:red;font-size:28px;">(挑戰任務)</span></h2>';
            }else {
            	str +='<h2 class="post-title bold" style="width:500px;display:inline;letter-spacing:0.05em;"><a href=""> 目 標 : ' + this.trgName +'</a></h2>';
            }
		
		str +=
					  '<h3 style="font-size:18px;font-weight:500;letter-spacing:0.05em;"> 初 衷 : ' + this.intention + '</h3>' +
					'</div>' +
				    '<div class="meta">' +
					  '<a href="#" class="author"><span class="name">' + this.lastName + this.firstName + '</span>' + 
					  '<img src="GetUserPicture?id=' + this.userID + '" /></a>' +
					'</div>' +
				'</header>' +
					'<a href="#" class="image featured"><img src="' + this.trgPicPath + '"/></a>' +
					'<p style="cursor:default;font-size:18px;letter-spacing:0.05em;font-weight:500;">' + this.trgNote + '</p>' +
				'<footer>' +
					'<ul class="stats">' +
					  '<li><a href="#" class="icon fa-heart">428</a></li>' +
					  '<li><a href="#" class="icon fa-comment">128</a></li>' +
					'</ul>' +
				'</footer>' +
			'</article>'
	});
	
	$('.col-md-9.col-sm-7').append(str);
});
</script>
</head>

<body>

<script>
	
</script>
	
<!-- Wrapper -->

<div id="wrapper">

<jsp:include page="header.jsp"></jsp:include>

<section id="blog" class="padding-top" style="width:1400px;">
<!-- <div class="container"> -->
<div class="row">
<div class="col-md-3 col-sm-5" style="width:300px;margin-top:30px;">  
   <div class="mini-posts" style="">
     <h2 style="margin-left:20px;">熱門人物</h2>
		<!-- Mini Post -->
		<article class="mini-post">
		  <div id="hotmans" style="border-bottom-style:ridge;border-color: red;">
		  <c:forEach var="Target_specVO" items="${trgSvc.allByHotMan}">
		    <div style="text-align:center;"><a href="#" ><img id="hotmanPic" src='${Target_specVO.trgPicPath}'/></a> <br></div>
		    <div style="margin-bottom:40px;padding:2px;">
			   <h4 style="font-size:17px;margin-left:5px;"><a href="#">${Target_specVO.targetVO.trgName}</a></h4>
			   <h5 style="margin:0 0 0 0;"><time class="published" datetime="${Target_specVO.targetVO.doneTime}">${Target_specVO.targetVO.doneTime}</time></h5>
			   <div class="fb-share-button" data-href="http://lifeeditor.cloudapp.net/lifeeditor/home.jsp" data-layout="button" data-mobile-iframe="true"><a class="fb-xfbml-parse-ignore" target="_blank"">分享</a></div> 
			   <div style="width:250px;margin-left:180px;margin-top:-50px;">
			   <a href="#" class="author" style="width:150px;margin:0 0 0 0;"><span style="font-size:16px;">${Target_specVO.userVO.lastName} ${Target_specVO.userVO.firstName}</span>
			   <img id="hotmanicon" src="GetUserPicture?id=${Target_specVO.userVO.userID}" title="${Target_specVO.userVO.lastName}${Target_specVO.userVO.firstName}" alt="userName" /></a>
			   </div>
			</div>
		  </c:forEach>
		  </div>
		</article>
	</div>
</div>  <!-- col-md-3 col-sm-5 END -->

<div class="col-md-9 col-sm-7" style="width:960px;margin-left:30px;">
<!-- <article class="post"> -->
<!-- <header> -->

<!-- 	<div class="title"> -->
<!-- 		<h2><a href="#">資策盃冠軍終於到手</a></h2> -->
<!-- 		<h3>不放棄！絕不放棄！永不放棄！</h3> -->
<!-- 	</div> -->
<!-- 	<div class="meta"> -->
<!-- 		<time class="published" datetime="2016-06-06">June 6, 2016</time> -->
<!-- 		<a href="#" class="author"><span class="name">Shin Da Tsai</span><img src="images/3.jpg" /></a> -->
<!-- 	</div> -->
<!-- </header> -->
<!-- 	<a href="#" class="image featured"><img src="images/band.jpg" style="width:950px;height:470px;"/></a> -->
<!-- 	<p>雖然我們只有成軍短短半年，但大家都非常的努力！半年的密集訓練，每天從早上9點練到晚上8點，有時甚至到10點！每次看到我的隊員們累到直接躺在地上睡著了，我就一直告訴自己:我一定要給大家一個非常難忘的比賽經驗！從未想過我們會得冠軍...</p> -->
<!-- <footer> -->
<!-- 	<ul class="stats"> -->
<!-- 		<li><a href="#" class="icon fa-heart">428</a></li> -->
<!-- 		<li><a href="#" class="icon fa-comment">128</a></li> -->
<!-- 	</ul> -->
<!-- </footer> -->
<!-- </article> -->
</div>    <!--col-md-9 col-sm-7 END -->

</div>            <!-- row -->
<!-- </div>            container -->
 </section>       <!--padding-top-->

			</div>

		<!-- Scripts -->
			
			<script src="js/skel.min.js"></script>
			<script src="js/util.js"></script>
			<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="js/main.js"></script>
<!-- 			<script> -->		
<script>
		
		
        window.fbAsyncInit = function() {
                FB.init({
               	appId : '236995580009135',
                status: true,
                cookie: true,
                xfbml: true,
                version : 'v2.6' 
            });
        };
        (function(d, s, id) {
					var js, fjs = d.getElementsByTagName(s)[0];
					if (d.getElementById(id))
						return;
					js = d.createElement(s);
					js.id = id;
					js.src = "//connect.facebook.net/zh_TW/sdk.js";
					fjs.parentNode.insertBefore(js, fjs);
			}(document, 'script', 'facebook-jssdk'));
        function logout() {
            FB.logout(function(response) {
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
        </script>
<!-- 			</script> -->
	</body>

</html>
