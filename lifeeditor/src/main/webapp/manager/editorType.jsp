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
<link rel="stylesheet" href="${ctx }/manager/bootstrap/css/bootstrap.min.css">
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
				
<script type="text/javascript">
		window.onload = function(){	
			
			var name = "${backVO.account}";
			var pswd = "${backVO.pswd}";
			var pic = "${photo}";
			//console.log(picture);
			var picture = 'data:image/jpeg;base64,'+ pic;
			for(var i = 1 ;i<=4;i++){
				document.getElementById("img"+i).src=picture;
			}
			
		};
</script>
</head>
<header class="main-header">
	
    <!-- Logo -->
    <a href="index2.html" class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini">LifeEditor</span>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg">LifeEditor</span>
    </a>

    <!-- Header Navbar -->
    <nav class="navbar navbar-static-top" role="navigation">
    
      <!-- Navbar Right Menu -->
      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
         
          <li class="dropdown user user-menu">
            <!-- Menu Toggle Button -->
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <!-- The user image in the navbar-->
              <img id="img3"  class="user-image" alt="User Image">
              <!-- hidden-xs hides the username on small devices so only the image appears. -->
              <span class="hidden-xs">${backVO.account}</span>
            </a>
            <ul class="dropdown-menu">
              <!-- The user image in the menu -->
              <li class="user-header">
                <img id="img2"  class="img-circle" alt="User Image">

                <p>
                  ${backVO.account} - Web Developer
                  <small>Member since Nov. 2012</small>
                </p>
              </li>
              <!-- Menu Body -->
             
              <!-- Menu Footer-->
              <li class="user-footer">
                <div class="pull-left">
                  <a href="#" class="btn btn-default btn-flat">Profile</a>
                </div>
                <div class="pull-right">
                  <a href="${ctx }/manager/Backstage.jsp" class="btn btn-default btn-flat">Sign out</a>
                </div>
              </li>
            </ul>
          </li>
          <!-- Control Sidebar Toggle Button -->
          <li>
            <a href="#" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a>
          </li>
        </ul>
      </div>
    </nav>
    </header>
    <aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
		
      <!-- Sidebar user panel (optional) -->
      <div class="user-panel">
        <div class="pull-left image">
          <img id="img1"  class="img-circle" alt="User Image">
        </div>
        <div class="pull-left info">
<%--         <c:forEach var="user" items="${backVO}" varStatus="vs"></c:forEach>  --%>
          <p>${backVO.account}</p>
          <!-- Status -->
          <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
        </div>
      </div>

      <!-- Sidebar Menu -->
      <ul class="sidebar-menu" style="margin-top:20px">
        <!-- Optionally, you can add icons to the links -->
        <li class="active"><a href="#"><i class="fa fa-link"></i> <span>系統分類</span></a></li>
        <li><a href="#"><i class="fa fa-link"></i> <span>參考資訊</span></a></li>
        <li><a href="#"><i class="fa fa-link"></i> <span>熱門人物</span></a></li>
        <li><a href="#"><i class="fa fa-link"></i> <span>成就系統</span></a></li>
        <li><a href="#"><i class="fa fa-link"></i> <span>分析</span></a></li>
        <li><a href="#"><i class="fa fa-link"></i> <span>審核</span></a></li>
      </ul>
      <!-- /.sidebar-menu -->
    </section>
    <!-- /.sidebar -->
    </aside>
<body class="hold-transition skin-blue sidebar-mini">

		<div class="content-wrapper">
			<section class="content-header">
				<h1>
					編輯類別 <small>life Editor</small>
				</h1>

			</section>

			<section class="content">

				<jsp:include page="_backstage/addType.jsp"></jsp:include>

			</section>
		</div>


	<!-- jQuery 2.2.0 -->
	<script src="${ctx }/plugins/jQuery/jQuery-2.2.0.min.js"></script>
	<!-- Bootstrap 3.3.6 -->
	<script src="${ctx }/manager/bootstrap/js/bootstrap.min.js"></script>
	<!-- AdminLTE App -->
	<script src="${ctx }/manager/dist/js/app.min.js"></script>
	<script src="${ctx }/js/fancybox/jquery.fancybox.js"></script> 
</body>
</html>