<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:forEach var="TrgSpecVO" items="${list}" >
			<th>${TargetspecVO.trgNote}</th>
			<th>
			<img height='100' width='100' src='/lifeeditor/Target_specServlet?id=${TargetspecVO.trgSpecID}'></th>
	<form  ENCTYPE="multipart/form-data"method="POST"action="Target_specServlet.do" role="form">
			  <input type="file"	name="updatefile" /><br/>
			     <input type="submit" value="送出修改"><br/>
			     <input type="hidden" name="trgSpecID" value="${TargetspecVO.trgSpecID}">
			     <input type="hidden" name="action"	value="getOne_TargetSpec_For_Update"></FORM>
			</th>
</c:forEach>
</body>
</html>