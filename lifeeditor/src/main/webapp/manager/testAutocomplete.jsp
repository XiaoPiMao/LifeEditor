<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <jsp:useBean id="userSvc" class="com.lifeeditor.service.user_specService" /> --%>
<jsp:useBean id="TrgSvc" class="com.lifeeditor.service.TargetService" />		
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>編輯熱門人物</title>
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
<table id="example" class="display" cellspacing="0" width=auto>
			<thead>
				<tr>
					<th width="130px">挑戰名稱</th>
					<th width="50px">類別</th>
					<th width="50px">項目</th>
					<th width="600px">內容敘述</th>
					<th width="40px">難度</th>
					<th width="40px">參加人數</th>
					<th>達成率</th>
					<th width="40px">我要參加</th>
					<th width="100px">截止日期</th>
					<th>詳細資訊</th>
<!-- 					<th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th> -->
				</tr>
			</thead>
			<c:forEach var="TargetVO" varStatus="var" items="${TrgSvc.all}">
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
				<input type="checkbox" class="apply" id="${TargetVO.targetID}" value="1">
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
				<td>
				<select size="1" class="selHotMan" id="${user_specVO.userID}">
				<c:choose>
					<c:when test="${user_specVO.hotMan == '1'}">
						<option value="1" selected="selected">是</option>
						<option value="0">否</option>
					</c:when>
					<c:otherwise>
						<option value="1" >是</option>
						<option value="0" selected="selected">否</option>
					</c:otherwise>
				</c:choose>
                </select></td> 

		 </c:forEach>
        <tfoot>

        </tfoot>
    </table>
    </div>

</body>
</html>