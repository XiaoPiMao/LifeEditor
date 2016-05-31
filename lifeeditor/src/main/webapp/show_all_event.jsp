<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="oceanKuan.*"%>
<%
    eventService eventSvc = new eventService();
    List<eventVO> list = eventSvc.getAll();
    pageContext.setAttribute("list",list);
%>
<jsp:useBean id="eventSec" scope="page" class="oceanKuan.eventService" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border='1' bordercolor='#CCCCFF' width='800'>
		<tr>
		<th>活動編號</th>
		<th>類別</th>
		<th>屬性</th>
		<th>活動名稱</th>
		<th>活動主辦單位</th>
		<th>活動地址</th>
		<th>活動時間</th>
		<th>活動照片</th>
		<th>活動描述</th>
	</tr>

	<c:forEach var="eventVO" items="${list}" >
		<tr align='center' valign='middle'>
			<td>${eventVO.eventID}</td>
			<td>${eventVO.typeID}</td>
			<td>${eventVO.secID}</td>
			<td>${eventVO.eventName}</td>
			<td>${eventVO.orgName}</td>
			<td>${eventVO.orgAddr}</td>
			<td>${eventVO.eventTime}</td>
			<td><img src="data:image/jpg;${eventVO.eventPic}"/></td>
			<td>${eventVO.eventDesc}</td>
			</td><td>
			  <FORM METHOD="post" ACTION="eventServlet.do">
			     <input type="submit" value="修改">
			     <input type="hidden" name="eventID" value="${eventVO.eventID}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="eventServlet.do">
			    <input type="submit" value="刪除">
			    <input type="hidden" name="eventID" value="${eventVO.eventID}">
			    <input type="hidden" name="action"value="delete"></FORM>
			</td>
		</tr>
	</c:forEach>
</table>
</body>
</html>