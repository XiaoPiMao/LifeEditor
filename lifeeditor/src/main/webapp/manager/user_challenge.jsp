<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.lifeeditor.model.target.*"%>
<%@ page import="com.lifeeditor.service.TargetService"%>

<%-- 此頁練習採用 EL 的寫法取值 --%>

<%
    TargetService TrgSvc = new TargetService();
    List<TargetVO> list = TrgSvc.getAllofficial();
    pageContext.setAttribute("list",list);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
h1, b {
	text-align: center
}



</style>
</head>

<body>
<h1>挑戰任務</h1>

<table border='1' bordercolor='#CCCCFF' width='1000' align="center">
	<tr>
		<th width="110px">挑戰名稱</th>
		<th width="50px">類別</th>
		<th width="50px">項目</th>
		<th>內容敘述</th>
		<th width="30px">難度</th>
		<th width="100px">截止日期</th>
		<th>參加人數</th>
		<th>達成率</th>
		<th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
	</tr>
	<%@ include file="page1.file" %> 
	<c:forEach var="TargetVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		<tr align='center' valign='middle'>
			<td>${TargetVO.trgName}</td>
			<td>${TargetVO.typeVO.typeName}</td>
			<td>${TargetVO.sectionVO.secName}</td>
			<td>${TargetVO.intention}</td>
			<td>${TargetVO.difficulty}</td>
			<td>${TargetVO.timeFinish}</td>
			<td>
<%-- 	          ${empVO.deptVO.deptno}【<font color=orange>${empVO.deptVO.dname}</font> - ${empVO.deptVO.loc}】                --%>
			</td>
			<td>
<%-- 			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/emp/emp.do"> --%>
<!-- 			     <input type="submit" value="修改"> -->
<%-- 			     <input type="hidden" name="empno" value="${empVO.empno}"> --%>
<!-- 			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM> -->
			</td>
			<td>
<%-- 			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/emp/emp.do"> --%>
<!-- 			    <input type="submit" value="刪除"> -->
<%-- 			    <input type="hidden" name="empno" value="${empVO.empno}"> --%>
<!-- 			    <input type="hidden" name="action"value="delete"></FORM> -->
			</td>
		</tr>
	</c:forEach>
</table>
<%@ include file="page2.file" %>



</body>
</html>