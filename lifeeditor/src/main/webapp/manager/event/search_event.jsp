<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.lifeeditor.service.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<a href="event_maintain.jsp">返回活動維護頁面</a>
  

  <jsp:useBean id="eventSvc" scope="page" class="com.lifeeditor.service.eventService" />
   
  <li>
     <FORM METHOD="post" ACTION="eventServlet.do" >
       <b>依活動編號查詢:</b>
       <select size="1" name="eventID">
         <c:forEach var="eventVO" items="${eventSvc.all}" > 
          <option value="${eventVO.eventID}">${eventVO.eventID}
         </c:forEach>   
       </select>
       <input type="submit" value="送出">
       <input type="hidden" name="action" value="getOne_For_Display">
    </FORM>
  </li>
  
  <li>
     <FORM METHOD="post" ACTION="eventServlet.do" >
       <b>依活動名稱查詢:</b>
       <select size="1" name="eventID">
         <c:forEach var="eventVO" items="${eventSvc.all}" > 
          <option value="${eventVO.eventID}">${eventVO.eventName}
         </c:forEach>   
       </select>
       <input type="submit" value="送出">
       <input type="hidden" name="action" value="getOne_For_Display">
     </FORM>
  </li>
</ul>


</body>
</html>