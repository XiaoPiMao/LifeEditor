<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>設定目標</title>
<link href="css/jquery-ui.css" rel="stylesheet">
<link rel="stylesheet" href="css/main.css" />
<script src="js/jquery.min.js"></script>
<script src="js/jquery-ui.js"></script>
<script src="js/bootstrap.min.js"></script>

<!-- <script src="js/validate.js"></script> -->

<style>


.background{
position:fixed;
left:0px;
top:0px;
width:100vw;
height:100vh;
background-color:black;
opacity:0.5;
z-index:5555555;
display:none; 
}
.close {
background: none repeat scroll 0 0 #606061;
border-radius: 15px;
color: #FFFFFF;
font-weight: bold;
position: relative;
height:30px;
width: 30px;
float:right;
margin:3px 6px 0px 0px;
text-align: center;
}
.close:hover {
background: none repeat scroll 0 0 #00D9FF;
}
#rocket {
    display: none;
    width : 800px; 
	position: fixed;
	left: calc(50vw - 400px);
	top: 90vh;
	z-index:9999999;
}
.article {
	margin: auto;
	width: 1200px;
	text-align: center;
}
.type {
	width: 120px;
	height: 120px;
	padding: 5px;
 	float: left; 
	margin: 0 10px 10px 10px;
	cursor:move;
}
#set {
	width: 890px;
	height: auto;
	border: 2px solid #ff6666;
/*  	float: left; */
	margin: 180px 150px 50px 150px;
/* 	text-align: center; */
}
.goal {
	width: 120px;
	height: 120px;
	margin: 20px 10px 10px 40px;
}
.sec_list {
 	display: none; 
 	z-index: 2; 
 	left: 250px; 
 	width: 500px; 
	height: 360px; 
 	overflow: scroll; 
 	background-color: white; 
 	border-style: ridge;
	border-color: #66ffff;
	border-width: 3px;
}
.sec_list img{
cursor:pointer;
}
.col-md-7{
margin: 65px 5px 50px 55px;
left: 200px;
}
.secPic {
	width: 65px;
	height: 65px;
	margin: 10px 5px 10px 35px;
	float: left;
	text-align: center;
}
#myForm {
    display: none;   
	z-index: 2;
	left: 250px;
	top: 180px;
	width: 600px;
	border-width: 3px;
	border-style: ridge;
	border-color: #66ffff;
	background-color: white;
}
.form-group{
    margin:20px 0px 10px 0px;
 
}
@font-face {
    font-family: 'Pacifico';
    font-style: normal;
    font-weight: normal;
    src: local('Pacifico'), url('http://themes.googleusercontent.com/font?kit=fKnfV28XkldRW297cFLeqfesZW2xOQ-xsNqO47m55DA') format('truetype');
}
/* body { */
/*     text-align: center; */
/* } */
#button {
    display: inline-block;
    margin-top: 20%;
    display: inline-block;
    width:120px;
    height:120px;
     border-radius: 50%;
    -webkit-box-shadow:    0 8px 0 #c5376d, 0 15px 20px rgba(0, 0, 0, .35);
    -moz-box-shadow: 0 8px 0 #c5376d, 0 15px 20px rgba(0, 0, 0, .35);
    box-shadow: 0 8px 0 #c5376d, 0 15px 20px rgba(0, 0, 0, .35);
    -webkit-transition: -webkit-box-shadow .1s ease-in-out;
    -moz-transition: -moz-box-shadow .1s ease-in-out;
    -o-transition: -o-box-shadow .1s ease-in-out;
    transition: box-shadow .1s ease-in-out;
    font-size: 50px;
    color: #fff;
    position:relative;
    left:15px;
}
#button span {
    display: inline-block;
    padding: 20px 30px;
    background-color: red;
    background-image: -webkit-gradient(linear, 0% 0%, 0% 100%, from(hsla(338, 90%, 80%, .8)), to(hsla(338, 90%, 70%, .2)));
    background-image: -webkit-linear-gradient(hsla(338, 90%, 80%, .8), hsla(338, 90%, 70%, .2));
    background-image: -moz-linear-gradient(hsla(338, 90%, 80%, .8), hsla(338, 90%, 70%, .2));
    background-image: -o-linear-gradient(hsla(338, 90%, 80%, .8), hsla(338, 90%, 70%, .2));
    width:120px;
    height:120px;
    border-radius: 50%;
    -webkit-box-shadow: inset 0 -1px 1px rgba(255, 255, 255, .15);
    -moz-box-shadow: inset 0 -1px 1px rgba(255, 255, 255, .15);
    box-shadow: inset 0 -1px 1px rgba(255, 255, 255, .15);
    font-family: 'Pacifico', Arial, sans-serif;
    line-height: 1;
    text-shadow: 0 -1px 1px rgba(175, 49, 95, .7);
    -webkit-transition: background-color .2s ease-in-out, -webkit-transform .1s ease-in-out;
    -moz-transition: background-color .2s ease-in-out, -moz-transform .1s ease-in-out;
    -o-transition: background-color .2s ease-in-out, -o-transform .1s ease-in-out;
    transition: background-color .2s ease-in-out, transform .1s ease-in-out;
}
#button:hover span {
display: inline-block;
    background-color: #ec6a9c;
    text-shadow: 0 -1px 1px rgba(175, 49, 95, .9), 0 0 5px rgba(255, 255, 255, .8);
}
#button:active, #button:focus {
display: inline-block;
    -webkit-box-shadow:    0 8px 0 #c5376d, 0 12px 10px rgba(0, 0, 0, .3);
    -moz-box-shadow: 0 8px 0 #c5376d, 0 12px 10px rgba(0, 0, 0, .3);
    box-shadow:    0 8px 0 #c5376d, 0 12px 10px rgba(0, 0, 0, .3);
}
#button:active span {
display: inline-block;
    -webkit-transform: translate(0, 4px);
    -moz-transform: translate(0, 4px);
    -o-transform: translate(0, 4px);
    transform: translate(0, 4px);
}
</style>

<script>
	var types = JSON.parse('${jTypes}');
	var secs = JSON.parse('${secs}');
	// 	console.log('${jTypes}');
	//	console.log('${secs}');
	//	console.log(secs[1][0].secName);
	$(document).ready(
			   function() {
					var frag = $(new DocumentFragment());
					$.each(types, function(i, type) {
						var div = $("<div></div>");
						//<img id="type1" class="type" src="type.typePic" alt="typeName">
//	 					if (type.typeName != "自訂") {
							var img = $("<img>").attr("id", type.typeID).addClass(
									"type").attr("src",
									"getTypePic?typeID=" + type.typeID).attr(
									"alt", type.typeName);
//	 					} 
//	 					else {
//	 						var img = $("<img>").attr("src",
//	 								"data:image/png;base64," + type.typePic).attr(
//	 								"alt", type.typeName).css({
//	 							width : "120px",
//	 							height : "120px",
//	 							padding : "5px",
//	 							float : "left",
//	 							margin : "0 10px 10px 10px"
//	 						});
//	 					}
						div.append(img);
						frag.append(div);
					})
					$(".type_list").append(frag);
					
				   document.getElementById('button').onclick = (function() {
					    document.getElementsByTagName('span')[0].innerHTML = 'GO';
					    return false;
					});
				   $('#circle3').click(function(){
						var form = $('#myForm')
						var data = form.serializeArray();
						var action = new Object();
						action.name = "action";
						action.value = "insert";
						data.push(action);
						var typeID = new Object();
						typeID.name = "typeID";
						typeID.value = $('#circle1 img').attr('id');
						data.push(typeID);
						var sectionID =  new Object();
						sectionID.name = "sectionID";
						sectionID.value = $('#circle2 img').attr('id');
						data.push(sectionID);
						console.log(JSON.stringify(data));
						$.post('target',data,function(data){
							$('#errorMsg').text(data);
							if(data.length == 0) {
								$("#set").css("height",$("#set").height())
								form.css("display","none");
								go();
							}
						})
						
			         });
				   
				   $('#resetBtn').click(function(){
						document.getElementById("myForm").reset();
						$("#errorMsg").text("");
					})
				
			
				$(".type").draggable({
					helper : "clone",
					revert : "invalid"
				});
				$(".goal:first").droppable(
						{
							accept : ".type",
							drop : function(ev, ui) {
								$(this).attr("src", ui.draggable.attr("src"));
								$(this).attr("id",ui.draggable.attr("id"));
                                if($(this).attr("id") ==0){
                                	$("#circle3").fadeIn("slow");
									$("#myForm").fadeIn("slow");
                                }else{
                                $('#word').html('<div><h1>點擊想完成的項目</h1></div');
								$('#secs').empty();
								$("#secs").html('<div><a href="${pageContext.request.requestURL}" title="Close" class="close">X</a></div>');
								$("#circle2").fadeIn("slow");
								$.each(secs[ui.draggable.attr("id")], function(
										i, sec) {
									var d = $("#secs");
									var s = $("<img>").attr("id", sec.secID)
											.attr(
													"src",
													"getSecPic?secID=" + sec.secID).attr(
													"title", sec.secName)
											.addClass("secPic");
									$(s).draggable({
										helper : "clone",
										revert : "invalid"
									});
									d.append(s);
                                    
									(s).click(function() {
									    $('#word').html('<div><h1>填寫內文</h1></div');
										var circle2 = $('#circle2');
										circle2.empty();
										var label = $("<label></label>").text($(this).attr("title"))
																		.css({
																			"display" : "block",
																			"font-size" : "12pt",
																			"position" : "relative",
																			"top" : "-10px",
																			"font-family":"Segoe UI",
																			"font-weight":"680"
																		})
										
										
										var img = $("<img></img>").attr("src",
												$(this).attr("src")).css({
													"width" : "60%",
													"height" : "60%"
												}).attr("id",$(this).attr("id"));
										
										var div = $("<div></div>").css({
											"width" : "120px",
											"height" : "120px",
											"border" : "5px solid black",
											"border-radius" : "60px",
											"padding-top" : "10px",
											"text-align" : "center",
											"position" : "relative",
											"left" : "40px",
											"top" : "10px"
										});
										div.append(img);
										div.append(label);
										circle2.append(div);
										
										$('#secs').empty().hide();
										
										$("#circle3").fadeIn("slow");
										
										$("#myForm").fadeIn("slow");
									});
								});
								
								$("#secs").fadeIn("slow");
							}} //else end
						});
				function go(){
					$('.background').show();
					$('.background').html('<audio autoplay src="sound/rocket.mp3" ></audio>');
					$("#rocket").fadeIn("fast");
					$('#rocket').animate({
						//'left':'0px',
						'top':-$(this).height(),
	 					'opacity':'0',
						//'width':'50px',
						//'height':'50px'
					},2500,function(){location.href='${ctx}/UserPage';}
					);
				};		
				
			});
</script>

</head>
<body>
	<div id="wrapper">


		<jsp:include page="header.jsp"></jsp:include>


		<!-- Main -->
		<article class="article">
			
			<div class="type_list"
				style="text-align: center; margin: 10px 10px 50px 100px;">
			</div>
<!------------ set goal ------------>
			<div class="row" id="set">
<!------------ step ------>
						
<!------------circle -------------->
			<div class="col-md-5">
			 <div id="circle1" ><img class="goal" src="images/sec_list/goal.png"></div>
			 <div id="circle2" style="display:none;"><img class="goal" src="images/sec_list/sec.png"></div>
			 <div id="circle3" style="display:none;"><div id="button"><span style="cursor:pointer">GO</span></div></div>
			</div>
			
<!------------form ----------------->
			<div class="col-md-7">
			<div id="word" style="text-align: center; margin: 0px 10px 20px 0px;">
				<h1>將想要完成的目標類型拖曳到左方的類別圓圈裡</h1>
			</div>
             <div id="secs" class="sec_list"></div>
			
					<div>
					<form id="myForm" method="POST" action="target">
						<div class="form-group">
							<label style="display:inline;margin-right:10px;">名  稱 : </label>
							<input style="display:inline; width: 30em;" placeholder="" type="text" name="trgName">
						</div>
						<div class="form-group">
							<label style="display:inline;margin-right:10px;">初  衷 : </label> 
							<input style="display:inline; width: 30em;" type="text" name="intention">
						</div>
						<div class="form-group">
							<label style="display:inline;margin-right:10px;">開  始 : </label> 
							<input style="display:inline; width: 30em;" type="date" name="timeStart">
						</div>
						<div class="form-group">
							<label style="display:inline;margin-right:10px;">結  束 : </label> 
							<input style="display:inline;width: 30em;" type="date" name="timeFinish">
						</div>
						<div class="form-group">
							<label style="display:inline;margin-right:10px;">順   序 : </label> 
							<select style="display:inline;width: 30em;" form="myForm" name="priority">
								<option value="1">十萬火急!一定要完成</option>
								<option value="2" selected>普通</option>
								<option value="3">享受過程~慢慢來~</option>
							</select>
						</div>
						<div class="form-group">
							<label style="display:inline;margin-right:10px;">隱   私 : </label> 
							<select style="display:inline;width: 30em;" form="myForm" name="privacy">
								<option value="1">公開</option>
								<option value="2">朋友</option>
								<option value="3">私人</option>
							</select>
						</div>
						<div id="errorMsg" style="display:inline;width: 30em;color:red;"></div>
						<div class="form-group">
<!-- 							<input id="resetBtn" value="重設" type="button"/> -->
						</div>
						
					</form>
					</div>
			</div>
            </div>
			
		</article>
		<div class="background"></div>
		<img src="images/start.png" id="rocket">
	</div>
</body>
</html>
