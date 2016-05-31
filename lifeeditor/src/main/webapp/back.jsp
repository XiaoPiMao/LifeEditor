<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="oceanKuan.*"%>
<%@ page import="java.sql.*"%>
<%
	eventVO empVO = (eventVO) request.getAttribute("eventVO"); //EmpServlet.java (Concroller), 存入req的empVO物件 (包括幫忙取出的empVO, 也包括輸入資料錯誤時的empVO物件)
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<!-- 依需要參考已編譯外掛版本（如下），或各自獨立的外掛版本 -->
<script src="js/bootstrap.min.js"></script>

<title>Insert title here</title>
<body>
			
<!-- ENCTYPE="multipart/form-data"  -->
					<form  ENCTYPE="multipart/form-data"method="POST"action="eventServlet.do" role="form">
				

			   <label > 輸入事件名稱 </label> 
							<input type="text" name="inputEventName" value="1" class="form-control"id="inputEventName" /><br/>
		
				<label >輸入主辦單位 </label> 
							<input name="inputOrgName" type="text" class="form-control" /><br/>

				<label >輸入地址 </label> 
						        
						        <input name="inputOrgAddr" type="text" class="form-control" /><br/>
				<label >輸入活動時間 </label> 
				
						      <input type="date" name="inputEventTime" class="form-control" ><br/>
				<label >輸入活動描述 </label><br/>
				
							<textarea style="width: 600px; resize: none;" cols="80" rows="10"name="inputEventDesc"></textarea><br/>
						
				<label > 請輸出圖檔 </label>
				
							 <input type="file"	name="file1" /><br/>
						<input type="hidden" name="action"value="insert">
						<input	type="submit" class="btn btn-default">
					</form>
</body>
</html>