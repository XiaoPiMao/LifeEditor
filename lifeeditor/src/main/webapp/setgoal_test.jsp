<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>測試版_設定目標</title>
<link href="css/jquery-ui.css" rel="stylesheet">
<link rel="stylesheet" href="css/main.css" />
<script src="js/jquery.min.js"></script>
<script src="js/jquery-ui.js"></script>
<style>
.types { width: 120px; height: 120px; padding: 5px; float: left; margin: 0 10px 10px 0; font-size: .9em; }
#set{
width:600px;
height:200px;
border:2px solid black;
float:left;
}
.goal{margin: auto;}
</style>
<script>
    $(document).ready(function(){
    	
    	$("#type dt").draggable({helper:"clone"});
    	$("#set").droppable({drop:function(event,ui){
    		
    		$("#sets").append($("#art").text(ui.draggable.text()));
    	}});
    });
    
</script>
</head>
<body>
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
<!-- 							<ul> -->
<%-- 							<c:choose> --%>
<%-- 						    	<c:when test="${ ! empty FbPicture }"> --%>
<%-- 						    			<img src="${FbPicture}"></img> --%>
<%-- 								</c:when> --%>
<%-- 							<c:otherwise> --%>
<!-- 								<img height='40px' width='30px' src="HomeGetPicture"> -->
<%-- 							</c:otherwise>  --%>
<%-- 					</c:choose> --%>
<%-- 				  <a href="<c:url value='/logout_index.jsp' />" "   onclick="javascript:logout();"> 登出 </a>     --%>
							
							
<!-- 								<li class="search"> -->
<!-- 									<a class="fa-search" href="#search">Search</a> -->
<!-- 									<form id="search" method="get" action="#"> -->
<!-- 										<input type="text" name="query" placeholder="Search" /> -->
<!-- 									</form> -->
<!-- 								</li> -->
								
<!-- 								<li class="menu"> -->
<!-- 									<a class="fa-bars" href="#menu">Menu</a> -->
<!-- 								</li> -->
<!-- 							</ul> -->
						</nav>
					</header>
<!-- Main -->
<article class="goal">	
<div style="text-align:center;margin: 10px 10px 50px 10px;"><h1>步驟一 : 請將你想要完成的目標類型拖曳到下方的類別圓圈裡</h1></div>
<div id="type">
<dt>art<img class="types" src="images/goal_art.jpg" ></dt>
<img id="art" class="types" src="images/goal_art.jpg" >
<!--     <ul class="types"> -->
<!--        <li>art<img class="types" src="images/goal_art.jpg" ></li> -->
<!--        <li><img  src="images/goal_education.jpg" ></li> -->
<!--        <li><img  src="images/goal_finance.jpg" ></img></li> -->
<!--        <li><img  src="images/goal_travel.jpg" ></img></li> -->
<!--        <li><img  src="images/goal_happy.jpg" ></li> -->
<!--        <li><img  src="images/goal_custom.jpg" ></li> -->
    </ul>

</div>
<!-- <div class="type"> -->
<!-- <img  src="images/goal_art.jpg" ></img> -->
<!-- <img  src="images/goal_education.jpg" ></img> -->
<!-- <img  src="images/goal_finance.jpg" ></img> -->
<!-- <img  src="images/goal_sport.jpg" ></img> -->
<!-- <img  src="images/goal_travel.jpg" ></img> -->
<!-- <img  src="images/goal_happy.jpg" ></img> -->
<!-- <img  src="images/goal_custom.jpg" ></div> -->

<div id="set">
   <h2>設定目標</h2>
   <dl id="sets"></dl>
</div>
</article>










 	</div>
</body>
</html>