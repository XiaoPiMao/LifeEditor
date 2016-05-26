<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<!DOCTYPE html>

<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>LifeEditor Manager</title>
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<link rel="stylesheet"
	href="${ctx }/manager/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
<link rel="stylesheet" href="${ctx }/manager/dist/css/AdminLTE.min.css">
<link rel="stylesheet"
	href="${ctx }/manager/dist/css/skins/skin-blue.min.css">

<!--[if lt IE 9]>
	  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
	  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	  <![endif]-->
</head>

<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">
		<header class="main-header">
			<jsp:include page="template/header.jsp"></jsp:include>
		</header>
		<aside class="main-sidebar">
			<jsp:include page="template/aside.jsp"></jsp:include>
		</aside>
		<div class="content-wrapper">
			<section class="content-header">
				<h1>
					標題放在這 <small>簡單描述</small>
				</h1>

			</section>

			<section class="content">

				<h2>內容放在這</h2>

			</section>
		</div>
	</div>

	<!-- jQuery 2.2.0 -->
	<script src="${ctx }/plugins/jQuery/jQuery-2.2.0.min.js"></script>
	<!-- Bootstrap 3.3.6 -->
	<script src="${ctx }/manager/bootstrap/js/bootstrap.min.js"></script>
	<!-- AdminLTE App -->
	<script src="${ctx }/manager/dist/js/app.min.js"></script>
</body>
</html>