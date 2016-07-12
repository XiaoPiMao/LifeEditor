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
    <title>Life Editor</title>
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
    
    
    <style>
.close {
border-radius: 15px;
border-style: ridge;
border-color: #00D9FF;
border-width: 5px;
font-weight: bold;
position: relative;
height:30px;
width: 30px;
float:right;
margin:3px 6px 0px 0px;
text-align: center;
}
 
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
    margin-top: -10px;
    font-size: 60px;
    font-weight: 100;
    color: #fff;
    text-align: center;
    -webkit-border-radius: 23px;
    -moz-border-radius: 23px;
    border-radius: 23px;
    opacity: .5;
    filter: alpha(opacity=50);
    cursor:pointer;
}

.carousel-control.right {
  right: 20px;
  cursor:pointer;
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

.span8{
    height:auto;
    width:820px;
    margin:5px 0px 0px 0px;
    padding: 0px;
    box-sizing:border-box;
    -moz-box-sizing:border-box;
    -webkit-box-sizing:border-box;
    padding: 0px 20px;
}

.Editor tr:hover{
background-color:#99ffff;
font-color:white;
}

.background{
position:fixed;
left:0px;
top:0px;
width:100vw;
height:100vh;
background-color:black;
z-index:1000000000;
opacity:0.5;
display:none; 
}

input[type="file"] {
	padding: 5px 15px;
	border: 2px #00008b solid;
	cursor: auto -webkit-border-radius: 5px;
	border-radius: 5px;
	font-family:Microsoft JhengHei;
}

input[type="text"] {
	padding: 5px 15px;
	border: 2px #00008b solid;
	cursor: auto -webkit-border-radius: 5px;
	border-radius: 5px;
	font-family:Microsoft JhengHei;
}

textarea {
	padding: 5px 15px;
	border: 2px #00008b solid;
	cursor: auto -webkit-border-radius: 5px;
	border-radius: 5px;
	width: 600px;
	font-family:Microsoft JhengHei;
	margin:10px 0 10px 0;
}

label{
font-family:Microsoft JhengHei;
font-size:22px;

}
.camera{
background-image: url("images/Flat-Camera-Icon.png");
width:60px;
height:60px;
}

.camera input{
display:block;
opacity:0;
width:60px;
height:60px;
overflow:hidden;
}

.gray {
	-webkit-filter: grayscale(100%); /* Chrome, Safari, Opera */
    filter: grayscale(100%);
}

.eyeContent {
	background-color:black;
	color:white;
	line-height:1.7;
	font-size:10pt;
	padding-left:12px;
	height:auto;
	width:130px;
	position:absolute;
	bottom:70px;
	left:240px;
	z-index:1;
}
</style>
<script src="js/jquery.min.js"></script>
<script src="js/skel.min.js"></script>
<script src="js/util.js"></script>
<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
<script src="js/main.js"></script>
<script>
var jTypes = JSON.parse('${jTypes}');
var jAchs = JSON.parse('${jAchs}');
var data = JSON.parse('${targets}'.replace(/\n/g,'\\n').replace(/\r/g,'\\r'));;
var jSpecs = JSON.parse('${jSpecs}'.replace(/\n/g,'\\n').replace(/\r/g,'\\r'));








$(function(){
	
	
	
	
	//post
// 	$('.col-md-9.col-sm-7').on("click","#faangledown",function(){
// 		$(this).parents('#photoHeader').find('table').slideToggle('fast');
// 	});
	
// 	$('.col-md-9.col-sm-7').on("click","#Editor1",function(){
// 		$('input[type="hidden"]').val($(this).parents('#photoItem').attr("name"));
//     	$('.background').show();
//     	$("#inputSpec").fadeIn("slow");
//     	$('.Editor').hide();
// 	});
	
				

	
	//photoBook
	$('.col-md-9.col-sm-7').on("click",'.carousel-control.left',function(){
		
		var slides = $(this).parents('.single-blog.two-column').find('.carousel.slide');
		for(var i = 0,len=slides.length;i < len;i++) {
			var item = $(slides[i]).find('.item');
			if(item.hasClass('active')) {
				item.removeClass('active');
				if(i == 0) {
					$(slides[len - 1]).find('.item').addClass('active');
				}else {
					$(slides[i - 1]).find('.item').addClass('active');
				}
				break;
			}
		}
		
	});
	
	$('.col-md-9.col-sm-7').on("click",'.carousel-control.right',function(){
		var slides = $(this).parents('.single-blog.two-column').find('.carousel.slide');
		for(var i = 0,len=slides.length;i < len;i++) {
			var item = $(slides[i]).find('.item');
			if(item.hasClass('active')) {
				item.removeClass('active');
				if(i == len - 1) {
					$(slides[0]).find('.item').addClass('active');
				}else {
					$(slides[i + 1]).find('.item').addClass('active');
				}
				break;
			}
		}
	});
	
	
	 
	
	
});
//拿到名字
function getComName(firstName,lastName) {
	if(firstName.charAt(0).match('[A-z]')) {
		return firstName + '&nbsp;' + lastName;
	}else {
		return lastName + firstName;
	}
}

</script>

<script>
    

   
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
	
    	
    	
    	var str = "";
    	

		$.each(data,function(){
			var num = Math.floor(Math.random() * 3 + 1);
			catogoryNum[this.typeName]++;
			str += '<div id="photoBook" class="col-md-12 col-sm-12" >' +
			
		            '<div id="photoItem" class="single-blog two-column" name="' + this.targetID + '">' +   //photoItem
		            
		            '<div id="photoHeader"  style="position:relative;">' +  //photoHeader-Start
		            '<table class="Editor" style="background-color:white;display:none;width:300px;position:absolute;z-index:1;right:20px;">';
		           
		            if(this.status == 1) {
		            	 str+='<tr id="Editor1" style="border:1px solid #cccccc;line-height:50px;width:200px;height:70px;text-align:center;cursor:pointer;"><td><a>上傳心得</a></td></tr>';
		            }
		           
 					
		            if(this.trgType == 3 && this.status==1) {
 						str += '<tr class="compltTr" style="border:1px solid #cccccc;line-height:50px;width:200px;height:70px;text-align:center;cursor:pointer;"><td ><a>完成目標</a></td></tr>';
		            }else if(this.status==1 && jSpecs[this.targetID]){
		            	str += '<tr class="checkTr" style="border:1px solid #cccccc;line-height:50px;width:200px;height:70px;text-align:center;cursor:pointer;"><td ><a>送出審核</a></td></tr>';
		            }
		            
		            str +=
		            '</table>'+
		            '<h2 class="post-title bold" style="width:500px;display:inline"><a href=""> 目 標 : ' + this.trgName +'</a></h2>';
		            
		            if(this.status == 1) {
		            	str+='<div style="float:right;"></div>';
		            }
		            
		            if(this.status == 1){
		            	str += '<h4 class="post-author" style="cursor:default">開 始  : '+ this.timeStart + '&nbsp;&nbsp;&nbsp;' + '結束 : ' + this.timeFinish + '</h4>';
		            }else if(this.status ==2){
		            	str += '<h4 class="post-author" style="color:red;cursor:default">審 核 中</h4>';
		            }else {
		            	str += '<h4 class="post-author" style="cursor:default">' + '完 成 : ' + this.doneTime +'</h4>';
		            }
		            
		            str +=
	                '<p style="cursor:default"> 初 衷 : '+ this.intention + '</p>'+
	                '</div>';  //photoHeader-End
//--------------------------------------------------------------------------------------------------------//	                
	                if(!jSpecs[this.targetID]) {
		                str +='<div class="post-thumb">' +   //photo-Start
		                	  '<img style="width:920px;height:470px;" src="images/userPage/' + num + '.jpg"' + 'class="img-responsive" alt="">'+
		               	 	  '<div class="post-overlay">' +
		                	  '</div>' +
		            	    '</div>' ;   //photo-End
	                }else {
	                	$.each(t = jSpecs[this.targetID],function(i,spec){
	    	                str += '<div class="carousel slide" id="myCarousel">' +    //Carousel-Start
		    	                		'<div class="carousel-inner">' +  
		    	                  		'<div class="item';
		    	            if(i == 0) {str += ' active">';}
		    	            else { str += '">'}
		    	            str +=  '<div class="post-thumb">' +   //photo-Start
			    		                '<img style="width:920px;height:470px;" src="' + this.picPath + '">'+
			    		            '</div>' +   //photo-End
			                    	'<div class="span8"><p>' + this.trgNote +'</p></div>' +
			                        '</div>' +   //item active-End
			            		    '<div class="control-box">' +                            
			                			'<a data-slide="prev"  class="carousel-control left">‹</a>' +
			                			'<a data-slide="next"  class="carousel-control right">›</a>' +
			                		'</div>' +     //control-box-End  
			                		'</div>' +  //carousel-innerEnd
		                		'</div>' ;    //#myCarousel-End
	                	})
	                }
//--------------------------------------------------------------------------------------------------------//            		
            
                
                str+='</div>' +   //carousel-inner-End
            '</div>' +    //photoItem-End  
		    '</div>' // The End
  
		});
		var spans = document.querySelectorAll('.pull-right');
		var i = 0;
		$.each(catogoryNum,function(name,value) {
			$(spans[i]).text("(" + value + ")");
			i++;
		})
		$(".col-md-9.col-sm-7").append( $("<div></div>").addClass("row").html(str) );
		
	})
    
    </script>
</head>
<body>
<div style="position:fixed;"><a href="${ctx}/manager/editorhotman.jsp"><img src="${ctx}/images/backbtn.png" style="border-style:outset;width:120px;height:100px;"></a></div>

<div id="inputSpec" style="position:fixed;z-index:1000000001;left:calc(50vw - 300px);top:50px;display:none;width:auto;height:auto;background-color:white;border-radius:2%;">
    <div id="closeBtn" class="close" style="background-colorr:red;">X</div>
    <form style="padding:20px 20px 20px 20px;" ENCTYPE="multipart/form-data" method="POST" action="Target_specServlet.do" role="form">
		 <input type="hidden" name="input_trgetID" value="" />
		 <div >
         <img class="preview" style="width: 580px; height: 380px;">
         <div class="size"></div>
         </div>	
		<textarea cols="60" rows="5" name="input_target_Note"></textarea>
		<br /> 
		    <div class="camera"><input type="file" name="insert_targetPic" /></div>
		<br /> 
		 <div>
         <input value="發佈" type="button" id="postBtn" style="font-size:20px;font-family:Microsoft JhengHei;border-radius:10%;width:80px;height:50px;float:right;margin-button:5px;">
	     </div>
	</form>
	
</div>

<section id="blog" class="padding-top">
  <div class="container">
    <div class="row">
        <div class="col-md-3 col-sm-5" >
            <div class="sidebar blog-sidebar" style="margin:30px 50px 0 0;">
                <div class="sidebar-item  recent">
                      <div class="media">
                         <div class="pull-left">
                             <a href="#"><img style="width:160px;height:160px" src="${ctx}/GetUserPicture?id=${param.id}" title=""></a>
                         </div>
                      </div>
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
<!--                             </ul> -->
                        </div>
                    </div>
                </div>
                <div class="col-md-9 col-sm-7"></div>
            </div>
        </div>
    </section>
			
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

    <div class="background"></div>
</body>
</html>
