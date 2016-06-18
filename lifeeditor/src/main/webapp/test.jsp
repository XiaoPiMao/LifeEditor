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
    <link href="singlecolor/css/lightbox.css" rel="stylesheet"> 
    <link href="singlecolor/css/animate.min.css" rel="stylesheet"> 
	<link href="singlecolor/css/main.css" rel="stylesheet">
	<link href="singlecolor/css/responsive.css" rel="stylesheet">
<!--     <link rel="stylesheet" href="css/main.css" /> -->
    <!--[if lt IE 9]>
	    <script src="js/html5shiv.js"></script>
	    <script src="js/respond.min.js"></script>
    <![endif]-->       
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="singlecolor/images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="singlecolor/images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="singlecolor/images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="singlecolor/images/ico/apple-touch-icon-57-precomposed.png">
    <link rel="stylesheet" href="css/popup.css" type="text/css"/>
    
    <style>
	.user-icon{
	border-radius:50%;
	}
		
    .mini-post#img{
    width:100px;
    height:100px;
    border-radius: 50%;
    }



.carousel-control {
    position: absolute;
    top: 50%;
    left: 15px;
    width: 40px;
    height: 40px;
    margin-top: -20px;
    font-size: 60px;
    font-weight: 100;
    color: #fff;
    text-align: center;
    border: 3px solid #fff;
    -webkit-border-radius: 23px;
    -moz-border-radius: 23px;
    border-radius: 23px;
    opacity: .5;
    filter: alpha(opacity=50);
}

.carousel-control.right {
  right: 15px;
}

#AchPic{
border-radius:5%;
padding-top:10px;
height:90px;
width:120px;
}

#AchPic:hover{
border:3px outset #e6c300;
}

#photoBook{
margin:0px 20px 40px 20px;
padding-bottom:10px;
}

#photoBook:hover{border:10px outset #E3E3E3;}

#photoItem{
padding:20px 10px 10px 10px;
}

#fa-angle-down{
font-size:24px;color:#cccccc;margin-right:10px;
float:right;
}

</style>
<script src="js/jquery.min.js"></script>
<script src="js/skel.min.js"></script>
<script src="js/util.js"></script>
<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
<script src="js/main.js"></script>
<script type="text/javascript" src="js/popup.js"></script>      
<script>

$(function(){
	$('.col-md-9.col-sm-7').on("click","#faangledown",function(){
		$('.Editor').slideToggle('fast');		
	});
});

$(function(){
	$('.col-md-9.col-sm-7').on("click","#Comments",function(){
		$('#AllComments').slideToggle('fast');		
	});
});
</script>
<script>
    var jTypes = JSON.parse('${jTypes}');
    var jUser = JSON.parse('${jUser}');
    var jAchs = JSON.parse('${jAchs}');
    var data = JSON.parse('${targets}');
    var jSpecs = JSON.parse('${jSpecs}'.replace(/\n/g,'\\n').replace(/\r/g,'\\r'));
    console.log(jSpecs);
   
    var catogoryNum = new Object();
    $.each(jTypes,function() {
    	catogoryNum[this.typeName] = 0 ;
    })
    
$(document).ready(function(){
	    var AchList = "<h3 style='font-weight: bold;'>我 的 榮 耀</h3>";
	    $.each(jAchs,function(){
	    	AchList += 
	    	'<div style="border-style:ridge;border-color:#ffe44d;border-radius:10%;text-align:center;margin:15px 0 15px 0;">' +
	    	'<div>' +
            '<img id="AchPic" style="" src="${ctx}/getAchPic?achID='+ this.achID + '" title="' + this.achDesc + '">' +
            '</div>'+
            '<div><h4>'+ this.achName + '</h4></div>'+
            '</div>'
	    });
	    $('.sidebar-item.popular').html(AchList);
	
    	liveComments = JSON.parse('${liveComments}');
    	//console.log(liveComments);
    	var lastComment ="<h3 style='font-weight: bold;'>最 新 留 言</h3>";
    	$.each(liveComments,function(){
    		lastComment += 
            '<div class="media">' +
               '<div class="pull-left">' +
                   '<a href="#"><img style="border-radius:50%;height:55px;width:55px;" src="${ctx}/GetUserPicture?id=' + this.userID +'"></a>' +
               '</div>' +
             '<div class="media-body">' +
                  '<h4><a href="#">' +  this.comment + '</a></h4>' +
                   '<p>'+ this.lastName + ' ' + this.firstName + '</p>' +
              '</div>' +
            '</div>' 
    	})
    	$('.sidebar-item.recent').html(lastComment);
    	
    	var str = "";
    	$('.carousel').carousel({
    	      interval: 6000
    	    })

		$.each(data,function(){
			var num = Math.floor(Math.random() * 3 + 1);
			catogoryNum[this.typeName]++;
			str += '<div id="photoBook" class="col-md-12 col-sm-12" >' +
			        '<div class="carousel slide" id="myCarousel">'+
			        '<div class="carousel-inner">' +
			        '<div id="photoItem" class="item active">' +
		            '<div class="single-blog two-column">' +
		            '<table style="float:right;margin-top:20px;"><th><a id="faangledown" class="fa fa-angle-down" style="position:fixed;top:20px;left:800px;"></a></th>' +
		            '<tr id="Editor1" class="Editor" style="display:none;border:1px solid #cccccc;background-color:white;line-height: 40px;"><td>上傳心得</td></tr>' +
		            '<tr id="Editor2" class="Editor" style="display:none;border:1px solid #cccccc;background-color:white;line-height: 40px;"><td>送出審核</td></tr>' +
		            '</table>'+
		            '<h2 class="post-title bold" style="width:500px;"><a href=""> 目 標 : ' + this.trgName +'</a></h2>' +
	                '<h4 class="post-author"><a href=' + location.href +'>'+ jUser.lastName + jUser.firstName +'</a></h4>' +
	                '<p> 初衷 : '+ this.intention + '</p>'+
		            '<div class="post-thumb">' +
		                '<img style="width:920px;height:470px;" src="images/userPage/' + num + '.jpg"' + 'class="img-responsive" alt="">'+
		                '<div class="post-overlay">' +
		                '</div>' +
		            '</div>' +
		            '<div class="post-content overflow">' +
		                '<div class="post-bottom overflow">'+
		                    '<ul class="nav navbar-nav post-nav">'+
		                        '<li><a href="#"><i class="fa fa-tag"></i>'+ this.typeName + '</a></li>'+
		                        '<li><a href="#"><i class="fa fa-heart"></i>'+ this.genkiBar + '</a></li>'+
		                        '<li id="Comments"><a href="#"><i class="fa fa-comments"></i>3 Comments</a></li>'+
		                    '</ul>'+
		                '</div>'+
		            '</div>'+
		            '<div class="row">' +
		            '<div class="col-md-2 col-sm-2 hidden-xs">' +
		            '<figure class="thumbnail">' +
		            '<img class="img-responsive" src="http://www.keita-gaming.com/assets/profile/default-avatar-c5d8ec086224cb6fc4e395f4ba3018c2.jpg">' +
		            '<figcaption class="text-center">username</figcaption>' +
		            '</figure>' +
		            '</div>' +
		            '<div class="col-md-10 col-sm-10">' +
		            '<div class="panel panel-default arrow left">' +
		            '<div class="panel-body">' +
		            '<header class="text-left">' +
		            '<div class="comment-user"><i class="fa fa-user"></i> username</div>' +
		            '<time class="comment-date" datetime="16-12-2014 01:05"><i class="fa fa-clock-o"></i> Dec 16, 2014</time>' +
		            '</header>' +
		            '<div class="comment-post">' +
		            '<p>Lrcitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>' +
                    '</div>' +
                    '<p class="text-right"><a href="#" class="btn btn-default btn-sm"><i class="fa fa-reply"></i> reply</a></p>' +
                '</div>' +
              '</div>' +
            '</div>' +
          '</div>' +
		            '</div>' +   //comment end 
		        '</div>'+
		        '</div>'+   //item
		        '</div>'+   //carousel-inner
		        '<div class="control-box">' +                            
            '<a data-slide="prev" href="#myCarousel" class="carousel-control left">‹</a>' +
            '<a data-slide="next" href="#myCarousel" class="carousel-control right">›</a>' +
            '</div>' +     //control-box
		       '</div>'+   //#myCarousel 
		    '</div>'
  
		});
		var spans = document.querySelectorAll('.pull-right');
		var i = 0;
		$.each(catogoryNum,function(name,value) {
			$(spans[i]).text("(" + value + ")");
			i++;
		})
		$(".col-md-9.col-sm-7").append( $("<div></div>").addClass("row").html(str) );
		
		$("#Editor1").click(popup);
	})

	
    </script>
</head>
<body>
<!-- <div id="wrapper"> -->
<!-- Header -->
<jsp:include page="header.jsp"></jsp:include>

<section id="blog" class="padding-top">
  <div class="container">
    <div class="row">
        <div class="col-md-3 col-sm-5" >
            <div class="sidebar blog-sidebar" style="margin:30px 50px 0 0;">
                <div class="sidebar-item  recent">
<!--                       <div class="media"> -->
<!--                          <div class="pull-left"> -->
<!--                              <a href="#"><img src="singlecolor/images/portfolio/project1.jpg" title="123"></a> -->
<!--                          </div> -->
<!--                       </div> -->
                 </div>
                        <div class="sidebar-item categories">
                            <h3 style='font-weight: bold;'>目 標 類 別</h3>
                            <ul class="nav navbar-stacked">
                            <c:forEach var="type" items="${types}">
                                <li><a href="#">${type.typeName}<span class="pull-right">(0)</span></a></li>
                            </c:forEach>
                            </ul>
                        </div>

                        <div class="sidebar-item popular">
<!--                             <h3>我 的 榮 耀</h3> -->
<!--                             <ul class="gallery"> -->
<!--                                 <li><a href="#"><img src="singlecolor/images/portfolio/popular1.jpg" alt=""></a></li> -->
<!--                                 <li><a href="#"><img src="singlecolor/images/portfolio/popular2.jpg" alt=""></a></li> -->
<!--                                 <li><a href="#"><img src="singlecolor/images/portfolio/popular3.jpg" alt=""></a></li> -->
<!--                             </ul> -->
                        </div>
                    </div>
                </div>
                <div class="col-md-9 col-sm-7"></div>
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
