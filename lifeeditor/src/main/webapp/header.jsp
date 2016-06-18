<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Header Template</title>
<link rel="stylesheet" href="${ctx}/css/font-awesome.min.css" />
<link rel="stylesheet" href="${ctx}/css/chatroom.css" />
<%-- <link rel="stylesheet" href="${ctx }/css/addFriend/bootstrap.min.css"> --%>
<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css"> -->
<%-- <link rel="stylesheet" href="${ctx }/css/addFriend/AdminLTE.min.css"> --%>
<%-- <link rel="stylesheet" href="${ctx }/css/addFriend/skin-blue.min.css"> --%>
<!-- <script src="js/jquery.min.js"></script> -->
<style>


body {
		padding-top: 3.5em;
	}

	#header {
		display: -moz-flex;
		display: -webkit-flex;
		display: -ms-flex;
		display: flex;
		-moz-justify-content: space-between;
		-webkit-justify-content: space-between;
		-ms-justify-content: space-between;
		justify-content: space-between;
		background-color: #ffffff;
		border-bottom: solid 1px rgba(160, 160, 160, 0.3);
		height: 3.7em;
		left: 0;
		line-height: 3.8em;
		position: fixed;
		top: 0;
		width: 100%;
		z-index: 10000;
		padding-top:5px;
	}
    
    a:hover {
    border-bottom-color: transparent;
    color: #2ebaae !important;
    }
		#header a {
			color: inherit;
			text-decoration: none;
		}

		#header ul {
			list-style: none;
			margin: 0;
			padding-left: 0;
			margin:2px 0 0 10px;
			width: 500px;
		}

			#header ul li {
				display: inline-block;
				padding-left: 0;
				font-size: 0.8em;
				font-family:微軟正黑體;
			}

		#header h1 {
			height: inherit;
			line-height: inherit;
			padding: 0 0 0 1.5em;
			white-space: nowrap;
			text-transform: uppercase;
			margin:2px 0 0 30px;
			font-family: "Raleway", Helvetica, sans-serif;
			letter-spacing: 0.25em;
			font-weight: 500;
			font-size:22px;
			font-weight: bold;
			padding-left: 0.5em;
		}

			#header h1 a {
				font-size: 0.9em;
			}

		#header .links {
			-moz-flex: 1;
			-webkit-flex: 1;
			-ms-flex: 1;
			flex: 1;
			border-left: solid 1px rgba(160, 160, 160, 0.3);
			height: inherit;
			line-height: inherit;
			margin-left: 1.5em;
			overflow: hidden;
		}

			#header .links ul li {
				border-left: solid 1px rgba(160, 160, 160, 0.3);
				line-height: 1;
				margin-left: 1em;
				padding-left: 1em;
			}

				#header .links ul li:first-child {
					border-left: 0;
					margin-left: 0;
					padding-left: 0;
				}

				#header .links ul li a {
					border-bottom: 0;
					font-size: 16px;
					font-weight: 600;
					letter-spacing: 0.25em;
					font-family:Microsoft JhengHei;
				}

		#header .main {
			height: inherit;
			line-height: inherit;
			
			width:300px;
			margin-right:60px;
			float:left;
		}

			#header .main ul {
				height: inherit;
				line-height: inherit;
			}

				#header .main ul li {
					border-left: solid 1px rgba(160, 160, 160, 0.3);
					height: inherit;
					line-height: inherit;
					white-space: nowrap;
				}

					#header .main ul li > * {
						display: block;
						float: left;
					}

					#header .main ul li > a {
						text-decoration: none;
						border-bottom: 0;
						position: relative;
						text-indent: 4em;
						width: 4em;
						font-size: 16px;
						font-family: Microsoft JhengHei;
					}

						#header .main ul li > a:before {
							-moz-osx-font-smoothing: grayscale;
							-webkit-font-smoothing: antialiased;
							font-family: FontAwesome;
							font-style: normal;
							font-weight: normal;
							text-transform: none !important;
						}

						#header .main ul li > a:before {
							display: block;
							height: inherit;
							left: 0;
							line-height: inherit;
							position: absolute;
							text-align: center;
							text-indent: 0;
							top: 0;
							width: inherit;
						}
						
						#UserPicture{
						    float:left;border-radius:50%;height:50px;width:50px;
						    margin:5px 5px 0 0;
						}
						
						#UserName{
						float:left;font-size:14px;
						}

		#header form {
			margin: 0;
		}

			#header form input {
				display: inline-block;
				height: 2.5em;
				position: relative;
				top: -2px;
				vertical-align: middle;
			}

		#header #search {
			-moz-transition: all 0.5s ease;
			-webkit-transition: all 0.5s ease;
			-ms-transition: all 0.5s ease;
			transition: all 0.5s ease;
			max-width: 0;
			opacity: 0;
			overflow: hidden;
			padding: 0;
			white-space: nowrap;
		}

			#header #search input {
				width: 12em;
			}

			#header #search.visible {
				max-width: 12.5em;
				opacity: 1;
				padding: 0 0.5em 0 0;
			}

		@media screen and (max-width: 980px) {

			#header .links {
				display: none;
			}

		}

		@media screen and (max-width: 736px) {

			#header {
				height: 2.75em;
				line-height: 2.75em;
			}

				#header h1 {
					padding: 0 0 0 1em;
				}

				#header .main .search {
					display: none;
				}

		}
		
		 /* Dropdown Content (Hidden by Default) */ 
		 #showFriend { 		 		 	 
		     display: none; 
		     background-color: #f9f9f9; 
		     min-width: 160px; 
		     box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2); 	     
			 align:center;
			 position: absolute;
			 padding:10px;
			 z-index: 100001;
			 font-size:10px;
			 right:0px;
			 width:300px;
			 top:64px;
			 vertical-align:middle;
		 } 
		 #myTable{
		 	 width:300px;
		 }
		 #myTableTr{
		 	width:auto;
		 	height:auto;
		 }
		 .myChkTureBtn{
		 	width:80px;
		 	height:20px;
		 	cursor: pointer;
		 	border: 1px solid #DDDDDD;
		 	text-align:center;
		 }
		 #ChkFriTd{
		 	width:auto;
		 	height:auto;
		 }
		 
</style>


</head>

<body>
<jsp:include page="/include/chatroom.jsp" />
<!-- Header -->
<header id="header">
	<h1><a href="home.jsp">Life Editor</a></h1>
		<nav class="links">
			<ul style="width:1000px;">
				<li><a href="${ctx}/setgoal.jsp">目標</a></li>
				<li><a href="${ctx}/fullCalendar.jsp">行事曆</a></li>
				<li><a href="${ctx}/addfriend.jsp">朋友</a></li>
				<li><a href="${ctx}/ShowChallenge">挑戰任務</a></li>				
				<li>
					<!--  <form name="myData" >
						<div class="form-group">
							<input type="text" placeholder="搜尋您的好友?" class="form-control" id="txtSearch" name="keyword" class="fa fa-search" style="width:400px;height:30px"/>
						</div>
					</form>-->
				</li>									
			</ul>
				
		
		</nav>
		
		<nav class="main">	
			<ul>
				<c:if test="${! empty LoginOK }">
					   <a href="UserPage"><img  id="UserPicture" src="${ctx}/GetUserPicture?id=${LoginOK.userID}" ></a>
					   <li id="UserName" style="float:left;font-size:15px;weight:bold;"><a href="UserPage" style="text-indent:0em;">${LoginOK.lastName} ${LoginOK.firstName}</a></li>
			    </c:if>
														
<%-- 													 	<c:if test="${! empty LoginOK }"> --%>
<%-- 																  <a href="<c:url value='/logout_index.jsp'/>"    onclick="javascript:logout();">登出</a>     --%>
<%-- 														</c:if>	 --%>
			   <li>									
					<a id="friend_icon" class="fa-user" data-toggle="dropdown"  style="overflow:visible;text-indent:2em;width:2em;cursor: pointer;"></a>
					
			   </li>
																	
			   <li>
					<a id="dropdown_icon" class=" fa-chevron-down"  style="overflow:visible;text-indent:0em;width:2em;"></a>
			   </li>
			</ul>

			<ul class="dropdown_area" id="dropdown" style="display:none;">
			    <li style="display:list-item;position:fixed;right:195px;top:50px;z-index: 10000;"><a href="${ctx}/updateUser.jsp">設定</a></li>
			    <li style="display: list-item;position:fixed;right:195px;top:100px;z-index: 10000;"><a href="<c:url value='/logout_index.jsp'/>" onclick="javascript:logout();">登出</a></li>
			</ul>
		</nav>				
</header>
		<div id="showFriend" >
		</div>	
<script>
$(function(){
	$('#dropdown_icon').click(function(){
      $('#dropdown').slideToggle('fast');		
	});
	

	function deleteFriend(value,status){
		 $.ajax({
			 	type:"POST",
			 	dataType:"text",
			 	url: '/lifeeditor/com.lifeeditor.invite_list/ChkInviterServlet',
			 	data: {'id':value,'status':status},	
				success: function (){
					
				}
		 });
	 }
	 function addInviter(value,status){
		 $.ajax({
				type:"POST",
				dataType:"text",
				url: '/lifeeditor/com.lifeeditor.invite_list/ChkInviterServlet',
				data: {'id':value,'status':status},	
				success: function (){
					
				}
			});
	 }
	 function deleteInviter(value,status){
		 $.ajax({
				type:"POST",
				dataType:"text",
				url: '/lifeeditor/com.lifeeditor.invite_list/ChkInviterServlet',
				data: {'id':value,'status':status},	
				success: function (){
					
				}
			});
	 }
	var count = 2; //控制按鈕 check的
	$('#friend_icon').click(function(){
		  if(count % 2 == 0){ //記數判斷		 		  
			$.ajax({
				type:"POST",
				dataType:"json",
				url: '/lifeeditor/com.lifeeditor.invite_list/checkFriendServlet',
				success: function (data){
					var myDiv = document.getElementById("showFriend");
					//var myDiv = document.createElement("div");
					myDiv.style.display = "block";
					
					if (myDiv.childNodes.length > 0) { //先刪除舊有資料
		    			myDiv.removeChild(myDiv.childNodes[0]);								
		    		}//End if	
					var txt1 = document.createTextNode("好友確認");
		 			var txth3 = document.createElement("H4");
		 			txth3.setAttribute("class","text-warning");
		 			txth3.appendChild(txt1);
		 			myDiv.appendChild(txth3);
					var myTable = document.createElement("table");
					myTable.setAttribute("id","myTable");			
					for(var i = 0;i<data.length;i++){
						
						var myImg = document.createElement("img");
						var myName = document.createElement("a");
						var myChkTureBtn = document.createElement("button");
						var myChkFalseBtn = document.createElement("button");
						var chkTure = document.createTextNode("接受邀請");
						var chkFalse = document.createTextNode("拒絕邀請");
						
						var tr1 = document.createElement("tr");
						tr1.setAttribute("id","myTableTr");
						var td1 = document.createElement("td");
						td1.setAttribute("id","ChkFriTd");
						var td2 = document.createElement("td");
						td2.setAttribute("id","ChkFriTd");
						var td3 = document.createElement("td");
						td3.setAttribute("id","ChkFriTd");
						var td4 = document.createElement("td");
						td4.setAttribute("id","ChkFriTd");

						var name = document.createTextNode(data[i].Name);
						
						
						myImg.setAttribute("src",'/lifeeditor/GetUserPicture?id='+data[i].Userid);  //照片設置
						myImg.setAttribute("width",30);
						myImg.setAttribute("height",30);
						myImg.setAttribute("class","img-circle");
						myImg.style.float="left";          //照片設置結束.....
						
						
						myChkTureBtn.appendChild(chkTure);
						myChkTureBtn.setAttribute("type","button");
						myChkTureBtn.setAttribute("value",data[i].Userid);						
						myChkTureBtn.setAttribute("id",data[i].Userid);
						myChkTureBtn.setAttribute("class","btn btn-primary btn-sm");
						myChkTureBtn.addEventListener('click',function(){ //綁定一個click事件傳值新增好友	
							this.firstChild.nodeValue = "成為好友";
							addInviter(this.value,"makeFriend");
						}, true);
						
						myChkFalseBtn.appendChild(chkFalse);
						myChkFalseBtn.setAttribute("type","button");
						myChkFalseBtn.setAttribute("value",data[i].Userid);
						myChkFalseBtn.setAttribute("id",data[i].Userid);
						myChkFalseBtn.setAttribute("class","btn btn-danger btn-sm");
						myChkFalseBtn.addEventListener('click',function(){ //綁定一個click事件傳值新增好友	
							var parent = this.parentNode;
							if(window.confirm('確定拒絕?')){	
							deleteInviter(this.value,"delete");
							parent.parentNode.style.display = "none";
							}else{}
							//test(this.value);
						}, true);
						
						
						td1.appendChild(myImg);
						tr1.appendChild(td1);
						
						myName.appendChild(name);
						td2.appendChild(myName);
						tr1.appendChild(td2);
						
						td3.appendChild(myChkTureBtn);
						tr1.appendChild(td3);
						
						td4.appendChild(myChkFalseBtn);
						tr1.appendChild(td4);
						myTable.appendChild(tr1);
		 			
						myDiv.appendChild(myTable);					
						
					}
				}
			});
			count = count + 1; //控制開關
		}else{
			var myDiv = document.getElementById("showFriend");
			if (myDiv.childNodes.length > 0) { //先刪除舊有資料
				myDiv.removeChild(myDiv.childNodes[0]);
			}//End if	
			myDiv.style.display = "none";
			count = count + 1; //控制開關
		} 
		});
});
</script>		
<script>
		
        window.fbAsyncInit = function() {
                FB.init({
               	appId : '236995580009135',
                status: true,
                cookie: true,
                xfbml: true,
                version : 'v2.6' 
            });
        };
        (function(d, s, id) {
					var js, fjs = d.getElementsByTagName(s)[0];
					if (d.getElementById(id))
						return;
					js = d.createElement(s);
					js.id = id;
					js.src = "//connect.facebook.net/zh_TW/sdk.js";
					fjs.parentNode.insertBefore(js, fjs);
			}(document, 'script', 'facebook-jssdk'));
        function logout() {
            FB.logout(function(response) {
            });
        }
        </script>
<!-- 			</script> -->

</body>
</html>

