<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../css/bootstrap.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="../css/style.css" rel="stylesheet">
    <link href="../css/font-awesome.min.css" rel="stylesheet">
    <link href="../js/fancybox/jquery.fancybox.css" rel="stylesheet" />
</head>
<body>
<jsp:useBean id="targetSrc" scope="page" class="com.lifeeditor.service.TargetService" />
			<FORM id="form1" METHOD="post">
		       <b>選擇員工編號:</b>
		       <select id="target" size="1" name="targetID">
		         <c:forEach var="TargetVO" items="${targetSrc.all}" > 
		          <option value="${TargetVO.targetID}">${TargetVO.trgName}
		         </c:forEach>   
		       </select>
		       <div id="genkiMan"><span>說這很讚</span></div>		       
		       <div id="commentz"></div>
		       <input type="text" name="comment">
		       <input id="comments" type="button" value="留言"  />
		       <input id="genki" type="button" value="集氣" onclick='GenkiAjax()' />
		       </FORM>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	<script src="../js/classie.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/smoothscroll.js"></script>
	<script src="../js/jquery.stellar.min.js"></script>
	<script src="../js/fancybox/jquery.fancybox.js"></script>    
	<script src="../js/main.js"></script>
<script>
$(function(){
	$("#comments").click(function(){
		var postData = $("#form1").serializeArray();
		$.ajax({
			url : "comments.do",
	        type: "POST",
	        data : postData,
	        success:function(data){
	        	var comments = JSON.parse(data);
	        	var commentsName = comments.commentsName
	        	var comments1 = comments.comments
	        	var label = $("<label></label>").text(commentsName)
	        	var p = $("<p></p>").text(comments1)
	        	$("#commentz").append(label).append(p);
	        }
		})
			
	})
	$("#genki").click(function(){
		var postData = $("#form1").serializeArray();
		$.ajax({
			url : "genkiBar_list.do",
	        type: "POST",
	        data : postData,
	        success:function(data){
	        	var genkiMans = JSON.parse(data);
	        	var genkiMansName = genkiMans.genkiMansName
	        	document.getElementById("genkiMan").innerHTML="<span>"+genkiMansName+"、說這很讚</span>"	        }
		})
			
	})
	$("#target").change(function(){
		var postData = $("#form1").serializeArray();
		$.ajax({
			url : "genkiBar_list.do",
	        type: "POST",
	        data : postData,
	        success:function(data){
	        	
	        	
	        }
		})
			
	})
	
})


</script>
</html>