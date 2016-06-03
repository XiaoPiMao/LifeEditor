<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.lifeeditor.model.target.*"%>
<%@ page import="com.lifeeditor.service.TargetService"%>

<%-- 此頁練習採用 EL 的寫法取值 --%>

<%
    TargetService TrgSvc = new TargetService();
    List<TargetVO> list = TrgSvc.getAll();
    pageContext.setAttribute("list",list);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
h1 {
	text-align: center
}



</style>
</head>

<body>
<h1>挑戰任務</h1>

<table border='1' bordercolor='#CCCCFF' width='800' align="center">
	<tr>
		<th>挑戰名稱</th>
		<th>類別</th>
		<th>項目</th>
		<th>內容敘述</th>
		<th>難度</th>
		<th>截止日期</th>
		<th>參加人數</th>
		<th>達成率</th>
		<th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
	</tr>


</table>


</body>
</html>