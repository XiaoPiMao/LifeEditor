<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="targetSvc" class="com.lifeeditor.service.TargetService" />	
<jsp:useBean id="targetSpecSvc" class="com.lifeeditor.service.TargetSpecService" />	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>審核官方挑戰</title>
<link href="https://cdn.datatables.net/1.10.12/css/jquery.dataTables.min.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="${ctx}/manager/js/jquery-1.12.4.min.js"></script>
<script src="${ctx}/manager/js/jquery.dataTables.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
		 
    $('#example').DataTable();
});
</script>
<style>
#Register {
    margin: auto;
}
.btn{
}
</style>

</head>
<body>
<div align="center">
<table id="example" class="display" cellspacing="0" width=100%>
        <thead>
            <tr>
  		          
                <th>目標名稱</th>
                <th>目標ID</th>
                <th>完成獎勵</th>   
                <th>審核狀態</th>
                <th>審核GO</th>
            </tr>
        </thead>
         <c:forEach var="TargetVO" varStatus="var" items="${targetSvc.all}">
	         <tr align='center' valign='middle'>
				<td>${TargetVO.trgName}</td>
				<td>${TargetVO.targetID} </td>				
				<td>${TargetVO.achVO.achName}	</td>
				<td>	
						<c:choose>
							<c:when test="${TargetVO.status == '1'}">
								<option style="color:gray" value="1" selected="selected" color="red">未審核</option>								
							</c:when>
							<c:when test="${TargetVO.status == '2'}">								
								<option style="color:red" value="2" selected="selected">待審核</option>																		
							</c:when>
							<c:otherwise>																			
								<option style="color:#66ff33" value="3" selected="selected">已審核</option>
							</c:otherwise>
						</c:choose>
                </td> 		            
				<td>
							<form action="TargetSpecServlet" method="post">
								<input type="submit" value="前往審核">
								<input type="hidden" name="targetID"   value="${TargetVO.targetID}">
				        	</form>
				</td>
		 </c:forEach>
		 
<!-- 		 <script> -->
<!-- // 		 $("tbody").on("click",".btn",function(){ -->
<!-- // 			 var tarID = $(this).parent().parent().find('td:eq(1)'); -->
<!-- // 			 console.log(tarID.text()); -->
<!-- // 			 $.get("TargetSpecServlet",{"targetID":tarID},function(data){ -->
<!-- // 				 console.log(data); -->
				 
<!-- // 			 })    -->
<!-- // 		 }); -->
		 
<%-- // // 		  onclick="window.location.href = '${ctx}/manager/showTargetSpec.jsp'" --%>
<!-- // // 		  -->
<!-- 		 </script>     -->
		 
		 
		 
<!-- 		 <FORM METHOD="post" ACTION="TargetSpecServlet" > -->
<!-- 		       <b>選擇targetID:</b> -->
<!-- 		       <select size="1" name="userID"> -->
<%-- 		         <c:forEach var="TargetVO" items="${targetSvc.all}" >  --%>
<%-- 		          <option value="${TargetVO.targetID}">${TargetVO.targetID} --%>
<%-- 		         </c:forEach>    --%>
<!-- 		       </select> -->
<!-- 		       <input type="submit" value="送出"> -->
<!-- 		       <input type="hidden" name="action" value="getOne_For_Update"> -->
<!-- 		    </FORM> -->

        <tfoot>
            <tr>
               <th>目標名稱</th>
                <th>目標ID</th>
                 <th>完成獎勵</th> 
                <th>審核狀態</th>
                <th>審核GO</th>
               
            </tr>
        </tfoot>
    </table>
    
    </div>
    <script>
</script>
</body>
</html>