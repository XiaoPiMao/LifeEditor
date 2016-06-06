<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <jsp:useBean id="userSvc" class="com.lifeeditor.service.user_specService" /> --%>
<jsp:useBean id="TrgSvc" class="com.lifeeditor.service.TargetService" />		
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>挑戰任務</title>
<link href="https://cdn.datatables.net/1.10.12/css/jquery.dataTables.min.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="${ctx}/manager/js/jquery-1.12.4.min.js"></script>
<script src="${ctx}/manager/js/jquery.dataTables.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('.selHotMan').change(function(e) {
// 			alert(1);
		    $.post("${ctx}/EditorHotMan",{
				 hotMan: $(this).val(),
				 id : this.id
			 });
		});
    $('#example').DataTable();
});
</script>

<style>

h1, b {
	text-align: center
}

#Register {
    margin: auto;
}
</style>

</head>
<body>
<h1>挑戰任務</h1>

<div align="center">
<b>登入者ID: ${LoginOK.userID}, 帳號: ${LoginOK.account}</b>
<table id="example" class="display" cellspacing="0" width=auto>
			<thead>
				<tr>
					<th width="130px">挑戰名稱</th>
					<th width="50px">類別</th>
					<th width="50px">項目</th>
					<th width="600px">內容敘述</th>
					<th width="40px">難度</th>
					<th width="60px">參加人數</th>
					<th width="50px">達成率</th>
					<th width="40px">選取</th>
					<th width="100px">截止日期</th>
<!-- 					<th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th> -->
				</tr>
			</thead>
			<c:forEach var="TargetVO" varStatus="var" items="${TrgSvc.allofficial}">
			<tr align='center' valign='middle'>
			

				<td>${TargetVO.trgName}</td>
				<td>${TargetVO.typeVO.typeName}</td>
				<td>${TargetVO.sectionVO.secName}</td>
				<td>${TargetVO.intention}</td>
				<td>
<%-- 				${TargetVO.difficulty} --%>
				<c:if test="${TargetVO.difficulty == '1'}" >輕鬆</c:if>
				<c:if test="${TargetVO.difficulty == '2'}" >簡單</c:if>
				<c:if test="${TargetVO.difficulty == '3'}" >普通</c:if>
				<c:if test="${TargetVO.difficulty == '4'}" >困難</c:if>
				<c:if test="${TargetVO.difficulty == '5'}" >嚴酷</c:if>
				</td>
				<td>0人</td>
				<td>0%</td>
				<td>
				<input type="checkbox" class="apply" id="xx" value="${TargetVO.targetID}">
<%-- 				<c:choose> --%>
<%-- 					<c:when test="${user_specVO.hotMan == '1'}"> --%>
<!-- 						<option value="1" selected="selected">是</option> -->
<!-- 						<option value="0">否</option> -->
<%-- 					</c:when> --%>
<%-- 					<c:otherwise> --%>
<!-- 						<option value="1" >是</option> -->
<!-- 						<option value="0" selected="selected">否</option> -->
<%-- 					</c:otherwise> --%>
<%-- 				</c:choose> --%>
					
				</td>
				<td>${TargetVO.timeFinish}</td>

		 </c:forEach>
        <tfoot>

        </tfoot>
    </table>
    <button type="button" id="buttonToggle" >送出參加</button>
<!--      onclick="console.log('Hello world!')"  -->
    </div>
</body>
<script>
$(function(){
			$(':checkbox').click(function () {
// 	        $('#buttonToggle').click(function () {
	            $(':checkbox').each(function(){
	            	if($(this).prop('checked')){
	            	    console.log($(this).val()); 
	            	}
	            })      
	        });
	        
// 	    //*******************


	var s1 = {
			'color' : 'black',
			'background-color' : 'white',
			'padding' : '10px',
			'text-align' : 'center',
			'border' : '1px solid red'
		};
		var s2 = {
			'color' : '#336600',
			'background-color' : '#d9ffb3',
			'padding' : '10px',
			'text-align' : 'center',
			'border' : '1px solid green'
		};

		$('tr').css(s1).mouseover(over).mouseout(out);

		function over() {

			$(this).css(s2);

		}
		;
		function out() {

			$(this).css(s1);
		}
		;

	});
</script>
</html>