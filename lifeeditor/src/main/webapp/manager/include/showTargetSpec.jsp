<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="targetSpecSvc" class="com.lifeeditor.service.TargetSpecService" />	
<jsp:useBean id="targetSvc" class="com.lifeeditor.service.TargetService" />	
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
			$('.selHotMan').change(function(e) {
				$.post("${ctx}/TargetStatusServlet",{
					 status: $(this).val(),
					 targetID : this.id
				 });
		}); 
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
<table  style="border:2px #696969 solid; "  border='1'  id="example" class="display" cellspacing="0" width=auto>
         
		    	    <c:forEach var="trgList" items="${trgList}" varStatus="idStatus">
		    	    第${idStatus.count}次新增
					<div style="border-width:3px;border-style:dashed;border-color:#FFAC55;padding:50px"><img src="${trgList.trgPicPath}"    width="400">	</div>
					<br>
<%-- 					心得內容：<h4>${trgList.trgNote}"</h4> --%>
								
		         	</c:forEach>
		
        <thead>
	            <tr>
		                <th>使用者帳號</th>
		                <th>目標名稱</th>  
		                 <c:forEach var="trgList" items="${trgList}"  varStatus="idStatus">                 
		                <th>心得內容第${idStatus.count}次新增</th>        
		                   </c:forEach>
	            </tr>
        </thead>
  	
	            <tr align='center' valign='middle'>
						<td>${setOK.userVO.account}</td>
						<td  width="300" height="300">${setOK.targetVO.trgName} </td>			
					    <c:forEach var="trgList" items="${trgList}" >		
									<td>${trgList.trgNote} <br>
					    </c:forEach>					
														       
				</tr>	
        <tfoot>   
        </tfoot>
        
</table>
    
    審核：<select size="1" class="selHotMan" id="${setOK.targetVO.targetID}">
							<c:choose>
									<c:when test="${setOK.targetVO.status == '1'}">
												<option value="1" selected="selected">未審核</option>
												<option value="2">待審核</option>
												<option value="3">已審核</option>
										</c:when>
										<c:when test="${setOK.targetVO.status == '2'}">
												<option value="1">未審核</option>
												<option value="2" selected="selected">待審核</option>						
												<option value="3">已審核</option>					
										</c:when>
										<c:otherwise>											
												<option value="1" >未審核</option>
												<option value="2">待審核</option>
												<option value="3" selected="selected">已審核</option>
									</c:otherwise>
							</c:choose>			
                </select>
        
                <br>
                <br>
    <input type ="button"  style="background-color:pink" onclick="window.location.href = '${ctx}/manager/CheckTarget.jsp'" value="確定"></input>
    </div>
    <script>
    </script>

</body>
</html>