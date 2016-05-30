<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="userSvc" class="com.lifeeditor.service.user_specService" />	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>編輯熱門人物</title>
<link href="https://cdn.datatables.net/1.10.12/css/jquery.dataTables.min.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="js/jquery-1.12.4.min.js"></script>
<script src="js/jquery.dataTables.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('.selHotMan').change(function(e) {
// 			alert(1);
		    $.post("EditorHotMan",{
				 hotMan: $(this).val(),
				 id : this.id
			 });
		});
    $('#example').DataTable();
});
</script>
<style>
#Register {
    margin: auto;
}
</style>

</head>
<body>
<div align="center">
<table id="example" class="display" cellspacing="0" width=auto>
        <thead>
            <tr>
                <th>會員帳號</th>
                <th>會員姓名</th>
                <th>目標名稱</th>
                <th>GenkiBarTol</th>
                <th>熱門人物</th>
            </tr>
        </thead>
         <c:forEach var="user_specVO" varStatus="var" items="${userSvc.all}">
<%--          <c:if test="${var.count <= 10}"> --%>
	         <tr align='center' valign='middle'>
				<td>${user_specVO.account}</td>
				<td>${user_specVO.lastName} ${user_specVO.firstName}</td>
				<td></td>
				<td>${user_specVO.genkiBarTol}</td>
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
<%-- 		 </c:if> --%>
		 </c:forEach>
        <tfoot>
            <tr>
                <th>會員帳號</th>
                <th>會員姓名</th>
                <th>目標名稱</th>
                <th>GenkiBarTol</th>
                <th>熱門人物</th>
            </tr>
        </tfoot>
    </table>
    </div>
    <script>
// $(document).ready(function() {
//     $('.selHotMan').change(function(e) {
//     //e.preventDefault();
// //     $.ajax({
// //     	url: "EditorHotMan",
// //     	type: "post",
// // 	    data: {
// // 			 hotMan: this.val()
// // 		 }
// //     });
// 		alert(1);
// 	    $.post("EditorHotMan",{
// 			 hotMan: $(this).val(),
// 			 id : this.id
// 		 });
// 	});
// });
</script>
</body>
</html>