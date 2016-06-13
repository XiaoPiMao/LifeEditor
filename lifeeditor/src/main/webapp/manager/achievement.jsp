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
	<link href="${ctx }/css/bootstrap.css" rel="stylesheet">
	<link rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
	<link rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
	<link rel="stylesheet" href="${ctx }/manager/dist/css/AdminLTE.min.css">
	<link rel="stylesheet" href="${ctx }/manager/dist/css/skins/skin-blue.min.css">

<!--[if lt IE 9]>
	  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
	  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	  <![endif]-->
<!-- 	 jQuery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
</head>
<body class="hold-transition skin-blue sidebar-mini" style="background-color:#222D32">
	<jsp:include page="/manager/include/template.jsp" />

	<div class="content-wrapper">
			<section class="content-header">
				<h1>
					成就系統 <small>設定挑戰任務功使用者挑選</small>
				</h1>
			</section>

		<section class="content">
			<jsp:include page="/manager/include/achievement.jsp"></jsp:include>
		</section>
	</div>

	<!-- Bootstrap 3.3.6 -->
	<script src="${ctx }/js/bootstrap.min.js"></script>
	<!-- AdminLTE App -->
	<script src="${ctx }/manager/dist/js/app.min.js" ></script>
</body>
</html>