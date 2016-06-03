<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  <%@ page import="com.lifeeditor.model.event.*"%>

<%
	eventVO eventVO = (eventVO) request.getAttribute("eventVO"); //EmpServlet.java (Concroller), 存入req的empVO物件 (包括幫忙取出的empVO, 也包括輸入資料錯誤時的empVO物件)
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>


<form ENCTYPE="multipart/form-data" method="POST"
		action="eventServlet.do" role="form">
<table border="0">
	<tr>
		<td>活動編號:<font color=red><b>*</b></font></td>
		<td><%=eventVO.getEventID()%></td>
	</tr>
	<tr>
		<td>類別編號:<font color=red><b>*</b></font></td>
		<td><%=eventVO.getTypeID()%></td>
	</tr>
	<tr>
		<td>細項編號:<font color=red><b>*</b></font></td>
		<td><%=eventVO.getSecID()%></td>
	</tr>
	<tr>
		<td>活動名稱:</td>
		<td><input type="TEXT" name="updateEventName" size="45" value="<%=eventVO.getEventName()%>" /></td>
	</tr>
	<tr>
		<td>主辦單位名稱:</td>
		<td><input type="TEXT" name="updateOrgName" size="45"	value="<%=eventVO.getOrgName()%>" /></td>
	</tr>
	<td>主辦單位地址:</td>
		<td><input type="TEXT" name="updateOrgAddr" size="45"	value="<%=eventVO.getOrgAddr()%>" /></td>
	</tr>
	<tr>
		<td>活動日期:</td>
		<td bgcolor="#CCCCFF">
		    <input type="date" name="updateEventTime"value="<%=eventVO.getEventTime()%>" class="form-control" >
		 
		</td>
	</tr>
	<tr>
		<td>薪水:</td>
		<td><input type="file" name="updatefile" size="45"	value="<%=eventVO.getEventPic()%>" /></td>
		<img height='100' width='80' src='/lifeeditor/eventPicServlet?id=<%=eventVO.getEventID()%>'></td>
	</tr>
	<tr>
		<td>獎金:</td>
		<td><input type="TEXT" name="updateEventDesc" size="45" value="<%=eventVO.getEventDesc()%>" /></td>
	</tr>


	
		</select></td>
	</tr>

</table>
<br>
<input type="hidden" name="action" value="update">
<input type="hidden" name="eventID" value="<%=eventVO.getEventID()%>">
<input type="hidden" name="typeID" value="<%=eventVO.getTypeID()%>">
<input type="hidden" name="secID" value="<%=eventVO.getSecID()%>">
<input type="submit" value="送出修改"></FORM>

</body>
</html>