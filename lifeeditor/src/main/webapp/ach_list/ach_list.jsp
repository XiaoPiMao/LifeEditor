<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
<form METHOD="post" action="ach_list.do">
<jsp:useBean id="userSrc" scope="page" class="com.lifeeditor.service.user_specService" />
<b>選擇員工編號:</b>
	<select id="user" size="1" name="userID">
		 <c:forEach var="userVO" items="${userSrc.all}" > 
		   <option value="${userVO.userID}">${userVO.userID}
		 </c:forEach>   
	</select>
	<input type="submit" value="送出" />
</form>

<div style="background-image:url(../images/ach_back.jpg);border:1px solid red;height:1000px;">
<c:forEach var="achPic" items="${achList}">
	<figure style="float:left; width:200px;height:200px">
		
		<img src="getAchPic.do?achID=${achPic.achievementVO.achID}" style="width:200px;height:200px" title="${achPic.achievementVO.achDesc}" />
		<figcaption>${achPic.achievementVO.achName}</figcaption>
		
	</figure>
</c:forEach>			

</div>

</body>
</html>