<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.lifeeditor.model.event.*"%>
<%@ page import="java.sql.*"%>
<jsp:useBean id="targets"
	class="com.lifeeditor.model.target.TargetDAO_JNDI" />
<%
	eventVO eventVO = (eventVO) request.getAttribute("eventVO"); //EmpServlet.java (Concroller), 存入req的empVO物件 (包括幫忙取出的empVO, 也包括輸入資料錯誤時的empVO物件)
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
			<a href="event_maintain.jsp">返回活動維護頁面</a>
<!-- ENCTYPE="multipart/form-data"  -->
					<form  ENCTYPE="multipart/form-data"method="POST"action="eventServlet.do" role="form">
					<label > 選擇活動類別 </label>
					
					<select id="selType" name="typeID" class="opt">
										<option value=""></option>
										<c:forEach var="type" items="${types }">
											<c:if test="${type.typeName != '自訂' }">
												<option value=${type.typeID }>${type.typeName }</option>
											</c:if>
										</c:forEach>
								</select> <br/>
								<label >選擇活動細項 </label>
								 <select id="selSec" name="secID" class="opt"></select><br/>
	
				

			   <label > 輸入事件名稱 </label> 
							<input type="text" name="inputEventName" value="" class="form-control"id="inputEventName" /><br/>
		
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
<!-- *************從JSON讀取檔案，匯至類別及項目下拉選單中 ************** -->
	<script>
		var trgID;
		var achID;
		var allSecs = JSON.parse('${secs}');

		onload = function() {
			selects = document.querySelectorAll("select.opt");
			selects[0].onchange = optSec;
		}

		var firstSec = true;		
		function optSec() {
			if(firstSec == true) {
				$(selects[0]).find("option")[0].remove();
				firstSec = false;
			}
			while (selects[1].childNodes.length > 0)
				selects[1].removeChild(selects[1].lastChild);
			var secs = allSecs[selects[0].value];
			for (var i = 0, max = secs.length; i < max; i++) {
				addOpt(secs[i].secID, secs[i].secName);
			}
		}

		function addOpt(value, text) {
			var opt = document.createElement("option");
			opt.value = value;
			opt.innerText = text;
			selects[1].appendChild(opt);
		}
	</script>

	<!-- jQuery 2.2.0 -->
	<script src="${ctx }/plugins/jQuery/jQuery-2.2.0.min.js"></script>
	<!-- Bootstrap 3.3.6 -->
	<script src="${ctx }/manager/bootstrap/js/bootstrap.min.js"></script>
	<!-- AdminLTE App -->
	<script src="${ctx }/manager/dist/js/app.min.js"></script>
	<script src="${ctx }/js/jquery-ui.js"></script>
</body>
</html>