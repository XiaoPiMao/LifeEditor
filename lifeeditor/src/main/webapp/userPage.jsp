<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="trgSvc"
	class="com.lifeeditor.service.TargetSpecService" />
<!DOCTYPE HTML>
<html>
<head>
<title>User Blog</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="css/main.css" />
<script src="js/jquery.min.js"></script>
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->


<style>
.cover {
	width: 1100px;
	height: 300px;
	border: 3px solid #73AD21;
	margin: auto;
	margin-top:50px;
	padding: 10px;
}

#tabs{
    margin: auto;
    width: 100px;
    border: 3px solid #73AD21;
    left:500px;
}
</style>



</head>

<body>
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
		</nav>
		<nav class="main">
			<ul>
				<c:if test="${ ! empty LoginOK }">
					<a href="<c:url value='/logout_index.jsp' />"> 登出 </a>
				</c:if>
				<c:if test="${! empty LoginOK }">
					<img height='40px' width='30px' src="images/3.jpg">
				</c:if>
				<li class="search"><a class="fa-search" href="#search">Search</a>
					<form id="search" method="get" action="#">
						<input type="text" name="query" placeholder="Search" />
					</form></li>
				<li class="menu"><a class="fa-bars" href="#menu">Menu</a></li>
			</ul>
		</nav>
	</header>

	<!------------------------------ 使用者的小天地 start -------------------------------------->

	<article>

		<!-- 使用者封面 -->
		<header>
			<div class="cover"></div>
		</header>
		<!-- 左:目標列 -->
		<div id="tabs" style="float: left;">
			<ul>
				<li><a href="#tabs-1">目標3</a></li>
				<li><a href="#tabs-2">目標2</a></li>
				<li><a href="#tabs-3">目標1</a></li>
			</ul>
		</div>
		<br> <br> <br> <br> <br> <br> <br>
		<br>
		<!-- 中間:目標內容 -->
		<div style="text-align: center; margin: auto;">
			<div id="tabs-1">
				<h2>目標3名稱</h2>
				<!--     <p>目標心得</p> -->
				<img src="images/port03.jpg">
			</div>
			<div id="tabs-2">
				<h2>目標2名稱</h2>
				<!--     <p>目標心得</p> -->
				<img src="images/port02.jpg">
			</div>
			<div id="tabs-3">
				<h2>目標1名稱</h2>
				<!--     <p>目標心得</p> -->
				<img src="images/port01.jpg">
			</div>
		</div>

	</article>
	<!-- 使用者的小天地 end -->


</body>
</html>



</body>
</html>
