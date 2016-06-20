<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Header -->
<header id="header">
	<h1><a href="home.jsp">Life Editor</a></h1>
		<nav class="links">
			<ul>
				<li><a href="${ctx}/setgoal.jsp">目標</a></li>
				<li><a href="${ctx}/fullCalendar.jsp">行事曆</a></li>
				<li><a href="${ctx}/addfriend.jsp">朋友</a></li>
				<li><a href="${ctx}/apply_challenge.jsp">挑戰任務</a></li>
				<li><a href="${ctx}/xxxxxxxxxxxx.jsp"><img src="${ctx}/images/Bomb.png" style="width:10px;"/></a></li>
			</ul>
		</nav>
		<nav class="main">
			<ul>
				
				    <c:if test="${! empty LoginOK }">
					   <a href="UserPage"><img  src="${ctx}/GetUserPicture?id=${LoginOK.userID}" style="border-radius:50%;height:40px;width:40px;"></a>
					   <li><a href="<c:url value='/logout_index.jsp'/>"  onclick="javascript:logout();" style="overflow:visible;text-indent:0em;width:2em;">登出</a></li> 
					</c:if>
				
														
													
			   <li class="">
					<a class="fa-user" href="${ctx}/updateUser.jsp" style="overflow:visible;text-indent:2em;width:2em;"></a>
			   </li>
																	
			   <li class="menu">
					<a class=" fa-chevron-down" href="#" style="overflow:visible;text-indent:0em;width:2em;"></a>
					<a id="modal_trigger2" href="#modal" class="">登出</a>
			   </li>
			</ul>
		</nav>
</header>