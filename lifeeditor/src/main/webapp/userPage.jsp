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

body {
 padding-top:50px;
}

#masthead { 
 min-height:250px;
}

#masthead h1 {
 font-size: 30px;
 line-height: 1;
 padding-top:20px;
}

#masthead .well {
 margin-top:8%;
}

@media screen and (min-width: 768px) {
  #masthead h1 {
    font-size: 50px;
  }
}

.navbar-bright {
 background-color:#111155;
 color:#fff;
}

.affix-top,.affix{
 position: static;
}

@media (min-width: 979px) {
  #sidebar.affix-top {
    position: static;
  	margin-top:30px;
  	width:228px;
  }
.container  .row  .col-2  .col-3  .col-4  .col-6  .well  .btn   h1  h2  a  p  ul  li  span  img  table  form  hr  
  
  #sidebar.affix {
    position: fixed;
    top:70px;
    width:228px;
  }
}

#sidebar li.active {
  border:0 #eee solid;
  border-right-width:5px;
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
      <!-- 使用者的小天地 start -->
<div id="tabs">
  <ul>
    < <li><a href="#tabs-1">目標3</a></li>
    <li><a href="#tabs-2">目標2</a></li>
    <li><a href="#tabs-3">目標1</a></li>
  </ul>
<div id="tabs-1">
    <h2>目標3名稱</h2>
<!--     <p>目標心得</p> -->
    <img src="images/port03.jpg" >
  </div>
  <div id="tabs-2">
    <h2>目標2名稱</h2>
<!--     <p>目標心得</p> --> 
     <img src="images/port02.jpg" >
  </div>
  <div id="tabs-3">
    <h2>目標1名稱</h2>
<!--     <p>目標心得</p> --> 
     <img src="images/port01.jpg" >
  </div>
</div>

<!-- 使用者的小天地 end -->

 
</body>
</html>



</body>
</html>
