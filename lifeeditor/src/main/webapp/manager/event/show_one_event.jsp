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
<a href="event_show_all_event.jsp">回展示首頁</a>
<table border='1' bordercolor='#CCCCFF' width='800'>
	<tr>
		<th>活動編號</th>
		<th>類別編號</th>
		<th>屬性編號</th>
		<th>活動名稱</th>
		<th>活動主辦單位</th>
		<th>活動地址</th>
		<th>活動時間</th>
		<th>活動照片</th>
		<th>活動描述</th>
	</tr>
	<tr align='center' valign='middle'>
	<td>${eventVO.eventID}</td>
			<td>${eventVO.typeID}</td>
			<td>${eventVO.secID}</td>
			<td>${eventVO.eventName}</td>
			<td>${eventVO.orgName}</td>
			<td>${eventVO.orgAddr}</td>
			<td>${eventVO.eventTime}</td>
			<td><img height='100' width='80' src='/lifeeditor/eventPicServlet?id=${eventVO.eventID}'></td>
			<td>${eventVO.eventDesc}</td>

</body>
</html>