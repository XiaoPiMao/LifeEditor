<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ page import="com.lifeeditor.service.*"%>
       <%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
 <jsp:useBean id="TargetSvc" scope="page" class="com.lifeeditor.service.TargetSpecService" />
					<form  ENCTYPE="multipart/form-data"method="POST"action="Target_specServlet.do" role="form">
       <b>依活動編號查詢:</b>
       <select size="1" name="trgSpecID">
         <c:forEach var="targetspecVO" items="${TargetSvc.all1}" > 
          <option value="${targetspecVO.trgSpecID}">${targetspecVO.trgSpecID}
         </c:forEach>   
       </select>
      <input type="submit" value="選擇TargetSpecID"><br/>
			     <input type="hidden" name="trgSpecID" value="${TargetspecVO.trgSpecID}">
			     <input type="hidden" name="action"	value="getOne_TargetSpec_For_Update"></FORM>
    </FORM>
                 
</body>
</html>