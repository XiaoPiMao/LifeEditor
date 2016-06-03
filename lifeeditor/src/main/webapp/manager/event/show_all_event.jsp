<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.lifeeditor.model.event.*"%>
<%@ page import="com.lifeeditor.service.*"%>
<%
    eventService eventSvc = new eventService();
    List<eventVO> list = eventSvc.getAll();
    pageContext.setAttribute("list",list);
    
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<a href="event_maintain.jsp">返回活動維護頁面</a>

<table border='1' bordercolor='#CCCCFF' width='1000'>
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
		<tr>
			<th>${eventVO.eventID}</th>
			<th>${eventVO.typeID}</th>
			<th>${eventVO.secID}</th>
			<th>${eventVO.eventName}</th>
			<th>${eventVO.orgName}</th>
			<th>${eventVO.orgAddr}</th>
			<th>${eventVO.eventTime}</th>
			<th align='center'><img height='100' width='100' src='/lifeeditor/eventPicServlet?id=${eventVO.eventID}'></th>
			<th>${eventVO.eventDesc}</th>
			<th>
			  <FORM METHOD="post" ACTION="eventServlet.do">
			     <input type="submit" value="修改">
			     <input type="hidden" name="eventID" value="${eventVO.eventID}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</th>
			<th>
			  <FORM METHOD="post" ACTION="eventServlet.do">
			    <input type="submit" value="刪除">
			    <input type="hidden" name="eventID" value="${eventVO.eventID}">
			    <input type="hidden" name="action"value="delete"></FORM>
			</th>
		</tr>
	</c:forEach>
</table>
</body>
</html>