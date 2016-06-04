<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<link rel="stylesheet" href="css/main.css" />
  <meta charset="utf-8">
  <title>設定目標</title>
<!--   <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"> -->
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<!--   <link rel="stylesheet" href="/resources/demos/style.css"> -->
  <style>
  	
  	
  .draggable { width: 130px; height: 130px; padding: 5px; float: left; margin: 0 10px 10px 0; font-size: .9em; }
  .ui-widget-header p, .ui-widget-content p { margin: 0; }
  #snaptarget { height: 140px; }
  .goal{margin: 10px 100px 10px 100px;}
  
  </style>
  <script>
//   var jTypes = JSON.parse('${jTypes}');
  
  $(function() {
// 	document.body.innerHTML = "<img src='data:image/jpg;base64," + jTypes[5].typePic + "'/>"
    $( "#draggable1" ).draggable({ snap: true });
    $( "#draggable2" ).draggable({ snap: ".ui-widget-header" });
    $( "#draggable3" ).draggable({ snap: ".ui-widget-header" });
    $( "#draggable4" ).draggable({ snap: ".ui-widget-header" });
    $( "#draggable5" ).draggable({ snap: ".ui-widget-header", snapMode: "outer" });
    $( "#draggable6" ).draggable({ grid: [ 20, 20 ] });
    $( "#draggable7" ).draggable({ grid: [ 80, 80 ] });
  });
  </script>
</head>
<body>
<!-- Wrapper -->
			<div id="wrapper">

				<!-- Header -->
					<header id="header">
						<h1><a href="#">Life Editor</a></h1>
						<nav class="links">
							<ul>
								<li><a href="userPage.jsp">目標</a></li>
								<li><a href="#">行事曆</a></li>
								<li><a href="#">朋友</a></li>
								<li><a href="#">關於我</a></li>
							</ul>
						</nav> <nav class="main">
							<ul>
							<c:choose>
						    	<c:when test="${ ! empty FbPicture }">
						    			<img src="${FbPicture}"></img>
								</c:when>
							<c:otherwise>
								<img height='40px' width='30px' src="HomeGetPicture">
							</c:otherwise> 
					</c:choose>
				  <a href="<c:url value='/logout_index.jsp' />" "   onclick="javascript:logout();"> 登出 </a>    
							
							
								<li class="search">
									<a class="fa-search" href="#search">Search</a>
									<form id="search" method="get" action="#">
										<input type="text" name="query" placeholder="Search" />
									</form>
								</li>
								
								<li class="menu">
									<a class="fa-bars" href="#menu">Menu</a>
								</li>
							</ul>
						</nav>
					</header>
<!-- Main -->
					
<article class="goal">	
<div style="text-align:center;margin: 10px 10px 50px 10px;"><h1>步驟一 : 請將你想要完成的目標類型拖曳到下方的類別圓圈裡</h1></div>
<div class="type">
<img id="draggable1" class="draggable ui-widget-content" src="images/goal_art.jpg" >
<img id="draggable2" class="draggable ui-widget-content" src="images/goal_education.jpg" >
<img id="draggable3" class="draggable ui-widget-content" src="images/goal_finance.jpg" >
<img id="draggable4" class="draggable ui-widget-content" src="images/goal_sport.jpg" >
<img id="draggable5" class="draggable ui-widget-content" src="images/goal_travel.jpg" >
<img id="draggable6" class="draggable ui-widget-content" src="images/goal_happy.jpg" >
<img id="draggable7" class="draggable ui-widget-content" src="images/goal_custom.jpg" ></div>
<div class="choose" style="border-style: groove;">
</div>
</article>
					




<!-- <div id="draggable" class="draggable ui-widget-content"></div> -->
<!-- <div id="draggable2" class="draggable ui-widget-content"></div> -->
<!-- <div id="draggable3" class="draggable ui-widget-content"></div> -->
<!-- <div id="draggable4" class="draggable ui-widget-content"></div> -->
<!-- <div id="draggable5" class="draggable ui-widget-content"></div> -->
 
 	</div>
</body>
</html>