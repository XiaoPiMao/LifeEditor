<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="trgSvc"
	class="com.lifeeditor.service.TargetSpecService" />
<!DOCTYPE HTML>
<html>
<head>
<title>Life Editor</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet" href="css/main.css" />
<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->

<script src="js/jquery.min.js"></script>
<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->

<style>
.user-icon {
	border-radius: 50%;
}

.mini-post#img {
	width: 100px;
	height: 100px;
	border-radius: 50%;
}

body {
	padding-top: 50px;
}

#masthead {
	min-height: 250px;
}

#masthead h1 {
	font-size: 30px;
	line-height: 1;
	padding-top: 20px;
}

#masthead .well {
	margin-top: 8%;
}

@media screen and (min-width: 768px) {
	#masthead h1 {
		font-size: 50px;
	}
}

.navbar-bright {
	background-color: #111155;
	color: #fff;
}

.affix-top, .affix {
	position: static;
}

@media ( min-width : 979px) {
	#sidebar.affix-top {
		position: static;
		margin-top: 30px;
		width: 228px;
	}
	#sidebar.affix {
		position: fixed;
		top: 70px;
		width: 228px;
	}
}

#sidebar li.active {
	border: 0 #eee solid;
	border-right-width: 5px;
}

</style>



</head>

<body>

	<!-- Wrapper -->
	<div id="wrapper">
		<!-- Header -->
		<header id="header">
			<h1>
				<a href="#">Life Editor</a>
			</h1>
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

	</div>



</body>
</html>
