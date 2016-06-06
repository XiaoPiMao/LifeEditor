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
      <!-- 使用者的小天地 -->
      <nav class="navbar navbar-default navbar-fixed-top" role="banner">
  <div class="container">
    <div class="navbar-header">
      <button class="navbar-toggle" type="button" data-toggle="collapse" data-target=".navbar-collapse">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a href="/" class="navbar-brand">Bootply</a>
    </div>
    <nav class="collapse navbar-collapse" role="navigation">
      <ul class="nav navbar-nav">
        <li>
          <a href="#sec">Get Started</a>
        </li>
        <li>
          <a href="#sec">Edit</a>
        </li>
        <li>
          <a href="#sec">Visualize</a>
        </li>
        <li>
          <a href="#sec">Prototype</a>
        </li>
      </ul>
    </nav>
  </div>
</nav>

<div id="masthead">  
  <div class="container">
      <div class="row">
        <div class="col-md-7">
          <h1>Bootstrap Sidebar
            <p class="lead">With Affix and Scrollspy</p>
          </h1>
        </div>
        <div class="col-md-5">
            <div class="well well-lg"> 
              <div class="row">
                <div class="col-sm-6">
        	      	<img src="//placehold.it/180x100" class="img-responsive">
                </div>
                <div class="col-sm-6">
	              	Some text here
                </div>
              </div>
            </div>
        </div>
      </div> 
  </div><!--/container-->
</div><!--/masthead-->

<!--main-->
<div class="container">
<div class="col-md-3 scrollspy">
  <ul id="nav" class="nav hidden-xs hidden-sm" data-spy="affix">
    <li>
      <a href="#web-design">Web Design</a>
    </li>
    <li>
      <a href="#web-development">Web Development</a>
      <ul class="nav">
        <li>
          <a href="#ruby">
            <span class="fa fa-angle-double-right"></span>Ruby
          </a>
        </li>
        <li>
          <a href="#python">
            <span class="fa fa-angle-double-right"></span>Python
          </a>
        </li>

      </ul><!--end of sub navigation-->
    </li>    

  </ul><!-- end of main navigation -->
</div>
<div class="col-md-9">
  <section id="web-design">
  </section>
  <section id="web-development">
    <section id="ruby">
    </section>
    <section id="python">
    </section>

  </section>
</div>



</div>



</body>
</html>
