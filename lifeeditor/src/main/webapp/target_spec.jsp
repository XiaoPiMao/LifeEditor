<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<jsp:useBean id="trgSvc" class="com.lifeeditor.service.TargetSpecService" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
#img{
    width:100px;
    height:100px;
    border-radius: 50%;
}
</style>
</head>
<body>
<table border='1' style="width: 500px; margin: auto;">
    <tr>
        <th>會員ID</th>
		<th>TargetID</th>
		<th>心得</th>
		<th>心得照片</th>
    </tr>
    <c:forEach var="Target_specVO" items="${trgSvc.all}">
		<tr align='center' valign='middle'>
			<td>${Target_specVO.userID}</td>
			<td>${Target_specVO.targetID}</td>
			<td>${Target_specVO.trgNote}</td>
			<td><img id="img" src='${Target_specVO.trgPicPath}'></td>
			
	</c:forEach>
</table>
</body>
</html>