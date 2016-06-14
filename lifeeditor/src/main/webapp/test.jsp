<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
    <jsp:useBean id="trgSvc" class="com.lifeeditor.service.TargetSpecService" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>使用者小天地</title>
    <link href="singlecolor/css/bootstrap.min.css" rel="stylesheet">
    <link href="singlecolor/css/font-awesome.min.css" rel="stylesheet">
    <link href="singlecolor/css/lightbox.css" rel="stylesheet"> 
    <link href="singlecolor/css/animate.min.css" rel="stylesheet"> 
	<link href="singlecolor/css/main.css" rel="stylesheet">
	<link href="singlecolor/css/responsive.css" rel="stylesheet">
    <link rel="stylesheet" href="css/main.css" />
    <!--[if lt IE 9]>
	    <script src="js/html5shiv.js"></script>
	    <script src="js/respond.min.js"></script>
    <![endif]-->       
    <link rel="shortcut icon" href="singlecolor/images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="singlecolor/images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="singlecolor/images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="singlecolor/images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="singlecolor/images/ico/apple-touch-icon-57-precomposed.png">
    <style>
		.user-icon{
		border-radius:50%;
		}
		
		.mini-post#img{
    width:100px;
    height:100px;
    border-radius: 50%;
}
		</style>
	<script src="js/jquery.min.js"></script>
			<script src="js/skel.min.js"></script>
			<script src="js/util.js"></script>
			<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="js/main.js"></script>
    <script>
    var jTypes = JSON.parse('${jTypes}');
    
    
    var catogoryNum = new Object();
    $.each(jTypes,function() {
    	catogoryNum[this.typeName] = 0 ;
    })
    
    		
    		
    	
$(document).ready(function(){
    	
      $.getJSON('GetJTargetByUser',function(data){
    	//console.log(data);
    	var str = "";
    	
		$.each(data,function(){
			catogoryNum[this.typeName]++;
			str += '<div class="col-md-12 col-sm-12">' +
		            '<div class="single-blog two-column">' +
		            '<div class="post-thumb">' +
		                '<a href="blogdetails.html"><img src="singlecolor/images/blog/8.jpg" class="img-responsive" alt=""></a>'+
		                '<div class="post-overlay">' +
		                    '<span class="uppercase"><a href="#">14 <br><small>Feb</small></a></span>' +
		                '</div>' +
		            '</div>' +
		            '<div class="post-content overflow">' +
		                '<h2 class="post-title bold"><a href="blogdetails.html">' + this.trgName +'</a></h2>' +
		                '<h3 class="post-author"><a href="#">micron News</a></h3>' +
		                '<p>'+ this.intention + '</p>'+
		                '<a href="#" class="read-more">View More</a>'+
		                '<div class="post-bottom overflow">'+
		                    '<ul class="nav navbar-nav post-nav">'+
		                        '<li><a href="#"><i class="fa fa-tag"></i>'+ this.typeName + '</a></li>'+
		                        '<li><a href="#"><i class="fa fa-heart"></i>'+ this.genkiBar + '</a></li>'+
		                        '<li><a href="#"><i class="fa fa-comments"></i>3 Comments</a></li>'+
		                    '</ul>'+
		                '</div>'+
		            '</div>'+
		        '</div>'+
		    '</div>'
  
		});
		var spans = document.querySelectorAll('.pull-right');
		var i = 0;
		$.each(catogoryNum,function(name,value) {
			$(spans[i]).text("(" + value + ")");
			i++;
		})
		$("[class = 'col-md-9 col-sm-7']").append( $("<div></div>").addClass("row").html(str) );
	})
});
	
    </script>
</head>
<body>
<!-- <div id="wrapper"> -->
<!-- Header -->
<header id="header" >
	<h1><a href="home.jsp">Life Editor</a></h1>
		<nav class="links">
			<ul>
				<li><a href="setgoal.jsp">目標</a></li>
				<li><a href="#">行事曆</a></li>
				<li><a href="#">朋友</a></li>
				<li><a href="#">關於我</a></li>
			</ul>
		</nav>
		<nav class="main">
			<ul>
				<c:choose>
					<c:when test="${ ! empty FbPicture }">
						<img src="${FbPicture}"></img>
						<a href="<c:url value='/logout_index.jsp'/>" onclick="javascript:logout();">登出</a> 
					</c:when>
					<c:when test="${! empty LoginOK }">
					<img src="HomeGetPicture" style="border-radius:50%;height:40px;width:40px;"></img>
					<a href="<c:url value='/logout_index.jsp'/>" onclick="javascript:logout();">登出</a> 
					</c:when>
				</c:choose>
														
<%-- 			<c:if test="${! empty LoginOK }"> --%>
<%-- 			<a href="<c:url value='/logout_index.jsp'/>"    onclick="javascript:logout();">登出</a>     --%>
<%-- 			</c:if>	 --%>
													
			   <li class="">
					<a class="fa-user" href="#" style="overflow:visible;text-indent:2em;width:2em;"></a>
			   </li>
																	
			   <li class="menu">
					<a class=" fa-chevron-down" href="#" style="overflow:visible;text-indent:0em;width:2em;"></a>
					<a id="modal_trigger2" href="#modal" class="">登出</a>
			   </li>
			</ul>
		</nav>
</header>

<section id="blog" class="padding-top">
  <div class="container">
    <div class="row">
        <div class="col-md-3 col-sm-5">
            <div class="sidebar blog-sidebar">
                <div class="sidebar-item  recent">
                    <h3>最 新 留 言</h3>
                      <div class="media">
                         <div class="pull-left">
                             <a href="#"><img src="singlecolor/images/portfolio/project1.jpg" alt=""></a>
                         </div>
                       <div class="media-body">
                            <h4><a href="#">Lorem ipsum dolor sit amet consectetur adipisicing elit,</a></h4>
                             <p>posted on  07 March 2014</p>
                        </div>
                      </div>
                 </div>
                        <div class="sidebar-item categories">
                            <h3>目 標 類 別</h3>
                            <ul class="nav navbar-stacked">
                            <c:forEach var="type" items="${types}">
                                <li><a href="#">${type.typeName}<span class="pull-right">(0)</span></a></li>
                            </c:forEach>
                            </ul>
                        </div>

                        <div class="sidebar-item popular">
                            <h3>Latest Photos</h3>
                            <ul class="gallery">
                                <li><a href="#"><img src="singlecolor/images/portfolio/popular1.jpg" alt=""></a></li>
                                <li><a href="#"><img src="singlecolor/images/portfolio/popular2.jpg" alt=""></a></li>
                                <li><a href="#"><img src="singlecolor/images/portfolio/popular3.jpg" alt=""></a></li>
                                <li><a href="#"><img src="singlecolor/images/portfolio/popular4.jpg" alt=""></a></li>
                                <li><a href="#"><img src="singlecolor/images/portfolio/popular5.jpg" alt=""></a></li>
                                <li><a href="#"><img src="singlecolor/images/portfolio/popular1.jpg" alt=""></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-md-9 col-sm-7">
                 </div>
            </div>
        </div>
    </section>
<!--    	</div>  -->
    <!--/#blog-->

    <footer id="footer" >
        <div class="container">
            <div class="row">
                <div class="col-sm-12 text-center bottom-separator">
                    <img src="singlecolor/images/home/under.png" class="img-responsive inline" alt="">
                </div>
                <div class="col-md-4 col-sm-6" style="display:none;">
                    <div class="testimonial bottom">
                        <h2>Testimonial</h2>
                        <div class="media">
                            <div class="pull-left">
                                <a href="#"><img src="singlecolor/images/home/profile1.png" alt=""></a>
                            </div>
                            <div class="media-body">
                                <blockquote>Nisi commodo bresaola, leberkas venison eiusmod bacon occaecat labore tail.</blockquote>
                                <h3><a href="#">- Jhon Kalis</a></h3>
                            </div>
                         </div>
                        <div class="media">
                            <div class="pull-left">
                                <a href="#"><img src="singlecolor/images/home/profile2.png" alt=""></a>
                            </div>
                            <div class="media-body">
                                <blockquote>Capicola nisi flank sed minim sunt aliqua rump pancetta leberkas venison eiusmod.</blockquote>
                                <h3><a href="">- Abraham Josef</a></h3>
                            </div>
                        </div>   
                    </div> 
                </div>
                <div class="col-md-3 col-sm-6" style="display:none;">
                    <div class="contact-info bottom">
                        <h2>Contacts</h2>
                        <address>
                        E-mail: <a href="mailto:someone@example.com">email@email.com</a> <br> 
                        Phone: +1 (123) 456 7890 <br> 
                        Fax: +1 (123) 456 7891 <br> 
                        </address>

                        <h2>Address</h2>
                        <address>
                        Unit C2, St.Vincent's Trading Est., <br> 
                        Feeder Road, <br> 
                        Bristol, BS2 0UY <br> 
                        United Kingdom <br> 
                        </address>
                    </div>
                </div>
                <div class="col-md-4 col-sm-12" style="display:none;">
                    <div class="contact-form bottom">
                        <h2>Send a message</h2>
                        <form id="main-contact-form" name="contact-form" method="post" action="sendemail.php">
                            <div class="form-group">
                                <input type="text" name="name" class="form-control" required="required" placeholder="Name">
                            </div>
                            <div class="form-group">
                                <input type="email" name="email" class="form-control" required="required" placeholder="Email Id">
                            </div>
                            <div class="form-group">
                                <textarea name="message" id="message" required="required" class="form-control" rows="8" placeholder="Your text here"></textarea>
                            </div>                        
                            <div class="form-group">
                                <input type="submit" name="submit" class="btn btn-submit" value="Submit">
                            </div>
                        </form>
                    </div>
                </div>
                <div class="col-sm-12">
                    <div class="copyright-text text-center">
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!--/#footer-->
   
			
      <script type="text/javascript" src="singlecolor/js/jquery.js"></script>
    <script type="text/javascript" src="singlecolor/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="singlecolor/js/lightbox.min.js"></script>
    <script type="text/javascript" src="singlecolor/js/wow.min.js"></script>
    <script type="text/javascript" src="singlecolor/js/main.js"></script> 
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


        </script>
<!-- </script> -->

    
</body>
</html>