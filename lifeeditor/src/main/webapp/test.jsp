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
var uploadFile;
var jTypes = JSON.parse('${jTypes}');
var jUser = JSON.parse('${jUser}');
var jAchs = JSON.parse('${jAchs}');
var data = JSON.parse('${targets}'.replace(/\n/g,'\\n').replace(/\r/g,'\\r'));
var jHaveGenki = JSON.parse('${jHaveGenki}');
var jSpecs = JSON.parse('${jSpecs}'.replace(/\n/g,'\\n').replace(/\r/g,'\\r'));




$(function(){
	//長出大頭照和名字
	$('.pull-left a').html('<img style="width:160px;height:160px" src="${ctx}/GetUserPicture?id='+ jUser.userID +'" /><div>' + getComName(jUser.firstName,jUser.lastName) +'</div>');
	
	
	//Enter送出留言
	$('.col-md-9.col-sm-7').on("keyup", "input[name='inputComment']",function (e) {
		if (e.which == 13) {
	    	//alert($(this).val());
	    	var input = $(this);
	    	var photoItem = $(this).parents('#photoItem');
	    	$.post("insertComment",{targetID:photoItem.attr('name'),comment:$(this).val()},function(){
	    		//alert(input.val());
	    		var str = "";
	    		str +=
			    	'<div class="oneComment" style="margin-left:30px;">' +
					'<div class="row"><div class="col-md-1 col-sm-2 hidden-xs" style="margin-right:-20px;">' +   //comment-left-Start
						'<figure class="thumbnail" style="width:50px;height:50px;padding:0px;">' +    
						'<img class="img-responsive" style="width:50px;height:50px;" src="${ctx}/GetUserPicture?id='+ jUser.userID+'">' +
						'</figure>' +   
					'</div>' +   //comment-left-End
					'<div class="col-md-10 col-sm-10">' +   //comment-right
						'<div class="panel panel-default arrow left">' +
			    			'<div class="panel-body">' +
			        			'<header class="text-left" style="margin-top:-15px;">' +
			        				'<div class="comment-user"><a href="getFriendPage?id='+ jUser.userID + '">'+ getComName(jUser.firstName,jUser.lastName)+'</a></div>' +
			        			'</header>' +
			        			'<div class="comment-post" style="margin-top:5px;">' +
			        				'<p>'+ input.val() +'</p>' +
			        			'</div>' +
			    			'</div>' +   
						'</div>' +
					'</div></div>' +   //comment-right-End
				'</div>' //oneComment-End
	    		input.val(""); 
	    		photoItem.find('.pastComments').append(str);
	    	})
	    }
	});
	
	//post
	$('.col-md-9.col-sm-7').on("click","#faangledown",function(){
		$(this).parents('#photoHeader').find('table').slideToggle('fast');
	});
	
	$('.col-md-9.col-sm-7').on("click","#Editor1",function(){
		$('input[type="hidden"]').val($(this).parents('#photoItem').attr("name"));
    	$('.background').show();
    	$("#inputSpec").fadeIn("slow");
    	$('.Editor').hide();
	});
	
	//顯示誰按讚
	$('.col-md-9.col-sm-7').on("mouseover",".eye",function(){
		var str = "";
		var photoitem =  $(this).parents('#photoItem');
		$.getJSON("genkiBar",{action : "whoGenki",targetID :photoitem.attr("name")},
			function(users){
				$.each(users, function() {
					str+=getComName(this.firstName,this.lastName) + '<br />';
				})
				if(str.length !=0)
					str += ">>>>>>給予集氣";
				photoitem.find('.eyeContent').html(str);
				
			}
			
		);
		
	});
	
	//關掉誰按讚
	$('.col-md-9.col-sm-7').on("mouseout",".eye",function(){
		 $(this).parents('#photoItem').find('.eyeContent').empty();
		
	});
	
	//按讚
	$('.col-md-9.col-sm-7').on("click",".fa.fa-heart",function(){
		var genki = $(this);
		if(genki.hasClass('gray')) {
			genki.removeClass('gray');
			$.post("genkiBar",{action:"insert",targetID:$(this).parents('#photoItem').attr("name")});
			
			var label = genki.next('label');
			var num = Number(label.text());
			label.text(num+1);
		}else {
			genki.addClass('gray');
			$.post("genkiBar",{action:"delete",targetID:$(this).parents('#photoItem').attr("name")});
			
			var label = genki.next('label');
			var num = Number(label.text());
			label.text(num-1);
		}
	});
	
	//完成目標
	$('.col-md-9.col-sm-7').on("click",".compltTr",function(){
		var photoItem = $(this).parents('#photoItem');
		$.post("editTarget",{action:"complete",targetID:photoItem.attr("name")});
		var today = new Date();
		photoItem.find('.post-author').html('完 成 : ' + today.getFullYear() + '-' + (today.getMonth()+1) + '-' + today.getDate());
		photoItem.find('.Editor').hide();
	});
	
	//審核
	$('.col-md-9.col-sm-7').on("click",".checkTr",function(){
		var photoItem = $(this).parents('#photoItem');
		$.post("editTarget",{action:"check",targetID:$(this).parents('#photoItem').attr("name")});
		photoItem.find('.post-author').html('審 核 中').css('color','red');
		photoItem.find('.Editor').hide();
	});
	
	
	//上傳照片的叉叉
	$('#closeBtn').click(function(){
		$('.background').hide();
		$('#inputSpec').hide();
	})
	
	//上傳完心得後恢復
    $('#postBtn').click(function(){
    	$('#inputSpec').hide();
    	$('.background').hide();
    });
	
		
		//瀏覽照片
	    function preview(input) {
			 
		    if (input.files && input.files[0]) {
		        var reader = new FileReader();
		        
		        reader.onload = function (e) {
		            $('.preview').attr('src', e.target.result);
		            uploadFile = e.target.result;
		        }

		        reader.readAsDataURL(input.files[0]);
		    }
		}
		
		$("body").on("change", "input[name='insert_targetPic']", function (){
		    preview(this);
		})
		
		//上傳心得
		$("#postBtn").click(function(){
			
			var myForm = document.querySelector("#inputSpec>form");
			var postData = new FormData(myForm);
			postData.append("action","Target_Spec_insert");
			alert($('input[type="hidden"]').val());
			alert($('textarea[name="input_target_Note"]').val());
			myForm.reset();
			$('.preview').attr("src","");
// 			 $.ajax(
// 			{
// 				url : "target_Spec/Target_specServlet.do",
// 				type: "POST",
// 				data : postData,
// 	       		processData: false,
// 				contentType: false,
// 	            success:function(data) 
// 	            {
// 				},
// 			});
			
		})// postBtn
	

	//Comments
	$('.col-md-9.col-sm-7').on("click",".comments",function(){
		var photoItem = $(this).parents('#photoItem');
		var str = "";
		$.getJSON("comment",{targetID:photoItem.attr("name")},function(comments) {
			console.log("留言:" + comments);
			$.each(comments,function(){
				str +=
			    	'<div class="oneComment" style="margin-left:30px;">' +
					'<div class="row"><div class="col-md-1 col-sm-2 hidden-xs" style="margin-right:-20px;">' +   //comment-left-Start
						'<figure class="thumbnail" style="width:50px;height:50px;padding:0px;">' +    
						'<img class="img-responsive" style="width:50px;height:50px;" src="${ctx}/GetUserPicture?id='+ this.userID+'">' +
						'</figure>' +   
					'</div>' +   //comment-left-End
					'<div class="col-md-10 col-sm-10">' +   //comment-right
						'<div class="panel panel-default arrow left">' +
			    			'<div class="panel-body">' +
			        			'<header class="text-left" style="margin-top:-15px;">' +
			        				'<div class="comment-user"><a href="getFriendPage?id='+ this.userID + '">'+ getComName(this.firstName,this.lastName)+'</a></div>' +
			        			'</header>' +
			        			'<div class="comment-post" style="margin-top:5px;">' +
			        				'<p>'+ this.comment +'</p>' +
			        			'</div>' +
			    			'</div>' +   
						'</div>' +
					'</div></div>' +   //comment-right-End
				'</div>' //oneComment-End
			});  //each END
			photoItem.find('.pastComments').html(str);
			photoItem.find('.allComments').slideToggle('fast');
		})
		
	
				
	});
	
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
	
	haveFaces = false;
    chatNum = 0;
	jFriends = '${jFriends}';
	var friendsHtml = "";
	if(jFriends.length != 0) {
		jFriends = JSON.parse(jFriends);
		$.each(jFriends,function(id,friend) {
			if(friend.firstName.charAt(0).match('[A-z]') ) {
				friendsHtml += 
					'<div id="'+ id + '" class="friend">' +
	            		'<img src="${ctx}/GetUserPicture?id=' + id + '" />' + 
	            		'<label>' + friend.firstName + '&nbsp;' + friend.lastName + '</label>' + 
	            		'<div class="online"></div>' +
	        		'</div>';
			}else {
				friendsHtml +=
					'<div id="' + id + '" class="friend">' +
	            		'<img src="${ctx}/GetUserPicture?id=' + id + '" />' + 
	            		'<label>' + friend.lastName + friend.firstName + '</label>' + 
	            		'<div class="online"></div>' +
	        		'</div>';
			}
			
		})//end each
		$('#friends').html(friendsHtml);
	}
	 
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
<script src="${ctx}/js/chatroom.js"></script>
<script>
    
    //console.log(jSpecs);
    console.log(data );
    console.log(jHaveGenki);
   
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
                   '<p>'+ getComName(this.firstName,this.lastName) + '</p>' +
              '</div>' +
            '</div>' 
    	})
    	$('.sidebar-item.recent').append(lastComment);
    	
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
		            	str+='<div style="float:right;"><i id="faangledown" class="fa fa-angle-down" style="z-index:9999;top:150px;right:270px;"></i></div>';
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
	        str += '<div class="eyeContent"></div>';
//--------------------------------------------------------------------------------------------------------//            		
            str  +='<div class="post-content overflow">' +      //Icon
	                '<div class="post-bottom overflow">'+   
	                    '<ul class="nav navbar-nav post-nav">'+
	                        '<li><a href="#"><i class="fa fa-tag"></i>'+ this.typeName + '</a></li>';
	                        if(jHaveGenki[this.targetID]) {
	                        	str+='<li style="cursor:pointer"><a><i class="fa fa-heart"></i><label style="font-weight:300;font-size:18px;">'+ this.genkiBar + '</label></a></li>';
	                        }else {
	                        	str+='<li style="cursor:pointer"><a><i class="fa fa-heart gray"></i><label style="font-weight:300;font-size:18px;">'+ this.genkiBar + '</label></a></li>';
	                        }
		               str+='<li class="eye"><a><i class="fa fa-eye fa-lg" style="position:relative;top:3px;"></i></a></i>'+
		            	   '<li class="comments" style="cursor:pointer"><a><i class="fa fa-comments"></i> Comments</a></li>'+
	                    '</ul>'+
	                '</div>'+
	            '</div>'+ 
	            
	            '<div class="row allComments" style="display:none">' +    //comments-Start
	            '<div class="pastComments"></div>'+  //pastComments
                
                '<div class="myComment" style="margin-left:30px;">' +
	            	'<div class="row"><div class="col-md-1 col-sm-2 hidden-xs" style="margin-right:-20px;">' +   //comment-left-Start
	            		'<figure class="thumbnail" style="width:50px;height:50px;padding:0px;">' +    
	            			'<img class="img-responsive" style="width:50px;height:50px;style="margin-right:-20px;" src="${ctx}/GetUserPicture?id=' + jUser.userID + '">' +
	            		'</figure>' +   
	            	'</div>' +   //comment-left-End
	            	'<div class="col-md-10 col-sm-10">' +   //comment-right
	            		'<div class="panel panel-default arrow left">' +
		            		'<div class="panel-body">' +
			            		'<header class="text-left">' +
			            			'<div class="comment-user" style="margin-top:-15px;"><a href="">'+ getComName(jUser.firstName,jUser.lastName) +'</a></div>' +
			            		'</header>' +
		            			'<div class="comment-post" style="margin-top:5px;">' +
		            			'<input name="inputComment" placeholder="留言......" style="width:100%"/>' +
                			'</div>' +
                		'</div>' +   
                	'</div></div>' +//comment-right-End
                '</div>' +//myComment
                '</div>' +   //comments-End
                
                '</div>' +   //carousel-inner-End
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
<!-- <div id="wrapper"> -->
<!-- Header -->
<jsp:include page="header.jsp"></jsp:include>

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
         <input value="發佈" type="button" id="postBtn" style="font-size:20px;font-family:Microsoft JhengHei;border-radius:10%;width:80px;height:50px;float:right;margin-bottom:25px;">
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
                             <a href="#"></a>
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

    <div class="background"></div>
</body>
</html>
