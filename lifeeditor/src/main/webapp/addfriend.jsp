<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>好友</title>
<link rel="shortcut icon" href="favicon.ico">

<link rel="stylesheet" href="${ctx }/css/addFriend/bootstrap.min.css">
<link rel="stylesheet" href="${ctx }/js/bootstrap.js">
<link rel="stylesheet" href="${ctx }/js/bootstrap.min.js">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">		
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">	
<link rel="stylesheet" href="${ctx }/css/addFriend/AdminLTE.min.css">
<link rel="stylesheet" href="${ctx }/css/addFriend/skin-blue.min.css">
</head>
<style type="text/css">
 	.dropbtn { 
     background-color: #4CAF50; 
     color: white; 
     padding: 16px; 
     font-size: 16px; 
     border: none; 
     cursor: pointer; 
 } 

 /* The container <div> - needed to position the dropdown content */ 
 .dropdown { 
     position: relative; 
     display: inline-block; 
 } 

 /* Dropdown Content (Hidden by Default) */ 
 .dropdown-content { 
     display: none; 
     position: absolute; 
     background-color: #f9f9f9; 
     min-width: 160px; 
     box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2); 
 } */

 /* Links inside the dropdown */ 
 .dropdown-content a { 
     color: black; 
     padding: 12px 16px; 
     text-decoration: none; 
     display: block; 
 } */

 /* Change color of dropdown links on hover */ 
 .dropdown-content a:hover {background-color: #f1f1f1} 

 /* Show the dropdown menu on hover */ 
 .dropdown:hover .dropdown-content { 
     display: block; 
 } */

 /* Change the background color of the dropdown button when the dropdown content is shown */ */
 .dropdown:hover .dropbtn { 
     background-color: #3e8e41; 
 } 

 /*----------------------------------------------------------------*/ 
 .twPc-div { 
     background: #fff none repeat scroll 0 0; 
     border: 1px solid #e1e8ed; 
     border-radius: 6px; 
     height: 200px; 
     max-width: 340px; // orginal twitter width: 290px; 
     margin:0px auto;  
 } 
 .twPc-bg { 
     background-color:#F0F0F0;  
     background-position: 0 50%; 
     background-size: 100% auto; 
     border-bottom: 1px solid #e1e8ed; 
     border-radius: 4px 4px 0 0; 
     height: 95px; 
    width: 100%; 
 } 
 .twPc-block { 
     display: block !important; 
 } 
 .twPc-button { 
     margin: -35px 0px 0; 
     text-align: right; 
     width: 100%; 
 } 
 .twPc-avatarLink { 
     background-color: #fff; 
     border-radius: 6px; 
     display: inline-block !important; 
     float: left; 
     margin: -30px 5px 0 8px; 
     max-width: 100%; 
     padding: 1px; 
     vertical-align: bottom; 
 } 
 .twPc-avatarImg { 
     border: 2px solid #fff; 
     border-radius: 7px; 
    box-sizing: border-box; 
     color: #fff; 
     height: 72px; 
     width: 72px; 
 } 
 .twPc-divUser { 
     margin: 5px 0 0; 
 } 
 .twPc-divName { 
     font-size: 18px; 
     font-weight: 700; 
     line-height: 21px; 
 } 
 .twPc-divName a { 
     color: inherit !important; 
 } 
 .twPc-divStats { 
     margin-left: 11px; 
     padding: 10px 0; 
 } 
 .twPc-Arrange { 
     box-sizing: border-box; 
     display: table; 
     margin: 0; 
     min-width: 100%; 
     padding: 0; 
     table-layout: auto; 
 } 
 ul.twPc-Arrange { 
     list-style: outside none none; 
     margin: 0; 
     padding: 0; 
 } 
 .twPc-ArrangeSizeFit { 
     display: table-cell; 
     padding: 0; 
     vertical-align: top; 
 } 
 .twPc-ArrangeSizeFit a:hover { 
     text-decoration: none; 
 } 
 .twPc-StatValue { 
     display: block; 
     font-size: 18px; 
     font-weight: 500; 
     transition: color 0.15s ease-in-out 0s; 
 } 
 .twPc-StatLabel { 
     color: #8899a6; 
     font-size: 10px; 
     letter-spacing: 0.02em; 
     overflow: hidden; 
     text-transform: uppercase; 
     transition: color 0.15s ease-in-out 0s; 
 } 
 #div1{
 	position: absolute;
 	z-index: 100001;
 	width:1000px;
 }
</style>
<script src="js/jquery.min.js"></script>
<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
<script src="js/main.js"></script>

<script type="text/javascript" src="${ctx }/js/friend.js">

</script>

<body>

<jsp:include page="header.jsp"></jsp:include>

<center>
	<div class="jumbotron" style="width:1000px;color:#AAAAAA;">
			<div class="page-header">

			</div>
			<!-- 每頁不同的內容從這裡開始 -->
			
			<form name="myData" >
				<div class="form-group">
					<input type="text" class="form-control" placeholder="搜尋您的好友?" id="txtSearch" name="keyword">
					<div id="div1"></div>	
				</div>			
			</form>
				
<!-- 				<button id="btn2" type="button">顯示好友</button> -->
				<div id="div2" class="well" >
					<table>
						<tr>
							<td id="td1" style="vertical-align:top;width:500px;">
							</td>
							<td id="td2" style="vertical-align:top;width:500px;">
							</td>
						</tr>
					</table>
				</div>

			<!-- 每頁不同的內容到這裡結束 -->
		</div>		
</center>

</body>
</html>