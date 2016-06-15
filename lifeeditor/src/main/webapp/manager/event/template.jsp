<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script type="text/javascript">
		$(function(){
			var pic = "${backPhoto}";
			var pswd = "${backVO.pswd}";
			var picture = 'data:image/jpeg;base64,'+ pic; 
			var name = "${backVO.account}";
			$('img[alt="User Image"]').attr("src",picture);
		}) 
</script>

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
      <c:set var="path" value="${pageContext.request.servletPath }" />
      <ul class="sidebar-menu" style="margin-top:20px">
        <!-- Optionally, you can add icons to the links -->
        <li>
        	<a href="${ctx }/manager/report.jsp"><i class="fa fa-link"></i> 
        	<span>網站分析</span></a>
        </li>
        
        <li>
        	<a href="${ctx }/manager/editorhotman.jsp"><i class="fa fa-link"></i> 
        	<span>熱門人物</span></a>
        </li>

		<li>
        	<a href="${ctx }/manager/editorType.jsp"><i class="fa fa-link"></i> 
        	<span>編輯類別</span></a>
        </li>
        
        <li>
        	<a href="${ctx }/manager/editorSec.jsp"><i class="fa fa-link"></i> 
        	<span>編輯項目</span></a>
        </li>
        
        <li class="active">
        	<a href="${ctx }/manager/eventTemplate/event_maintain.jsp"><i class="fa fa-link"></i> 
        	<span>參考資訊</span></a></li>
        
        <li>
        	<a href="${ctx }/manager/achievement.jsp"><i class="fa fa-link"></i> 
        	<span>成就系統</span></a>
        </li>
        
        <li>
        	<a href="${ctx }/manager/CheckTarget.jsp"><i class="fa fa-link"></i> 
        	<span>成就審核</span></a>
        </li>
      </ul>
      <!-- /.sidebar-menu -->
    </section>
    <!-- /.sidebar -->
    </aside>
    

  

