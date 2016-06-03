<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" href="favicon.ico">
<link rel="stylesheet" href="${ctx }/manager/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">		
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">	
<link rel="stylesheet" href="${ctx }/manager/dist/css/AdminLTE.min.css">
<link rel="stylesheet" href="${ctx }/manager/dist/css/skins/skin-blue.min.css">
</head>
<script src="${ctx }/plugins/jQuery/jQuery-2.2.0.min.js"></script>	
<script src="${ctx }/manager/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">

 
// $(document).ready(function() { 
	
//  	var testValue =""//全裕變數 
//  	var txt = document.getElementById("txtSearch"); //抓取TextBox值
//  	getData(); //產生MyFriend Session
 	
//  	$("#txtSearch").keyup(function() { //如果Keyup時
//  	  if(txt.value.trim() != testValue){ //判斷不是空值
//  		$.ajax({
// 			  type:"POST",
// 			  dataType: 'json',
// 			  url: '/lifeeditor/com.lifeeditor.invite_list/getDataFromDB',
// 			  data: {'txt':txt.value.trim()},
// 			  success: function selectData(result){
// 				  var show = document.getElementById("div1"); //顯示的Div
// 			      show.style.display = "block";
				  
// 			      if (show.childNodes.length > 0) { //先刪除舊有資料
// 			      show.removeChild(show.childNodes[0]);
// 			      }//End if	
// 			      var eleDiv = document.createElement("div");
// 			 	  eleDiv.className = "list-group";
			 	  
// 			 	 for (var j = 0, max = result.length; j < max; j++) { //取出所有資料
		 				
// 			 			var table = document.createElement('table'); //table放性名跟按鈕
// 			 			var tr1 = document.createElement('tr');
// 			 			var td1 = document.createElement('td');
// 			 			var tr2 = document.createElement('tr');
// 			 			var td2 = document.createElement('td');
			 			
// 			 			var span = document.createElement('span');
// 			 			var picture = 'data:image/jpeg;base64,'+ result[j].Picture; //Base64轉img
// 						var txtBtn = document.createTextNode(result[j].Name); 
// 						var eleImg = document.createElement("img");
// 						var eleBtn = document.createElement("button"); 
// 						var addFriendbtn = document.createElement("button");
// 						var t = document.createTextNode("加為好友");
// 						var user = result[j].Userid;
											
// 						addFriendbtn.appendChild(t); 
// 						span.style.fontSize = "20px";
// 						span.appendChild(txtBtn);
						
						
// 						eleImg.setAttribute("src",picture);
// 						eleImg.setAttribute("width",60);
// 						eleImg.setAttribute("height",60);
// 					    eleImg.className = "img-thumbnail"
// 					    eleImg.style.float="left";
					    
// 						eleBtn.className = "list-group-item"; 
// 						eleBtn.setAttribute("type", "button"); 
						
// 						addFriendbtn.className = "btn btn-primary";
// 						addFriendbtn.setAttribute("type","button");

// 						addFriendbtn.setAttribute("value",user);
						
// 						addFriendbtn.addEventListener('click',function(){ //綁定一個click事件傳值新增好友	
// 							this.firstChild.nodeValue = "已送出邀請";
// 							test(this.value);
// 						}, true);
						
// 						table.appendChild(tr1).appendChild(td1).appendChild(span);
// 						table.appendChild(tr2).appendChild(td2).appendChild(addFriendbtn);
// 						table.style.float="left";
						
// 						eleBtn.appendChild(eleImg);
// 						eleBtn.appendChild(table);
// 						eleDiv.appendChild(eleBtn);	
// 						//document.getElementById("div1").appendChild(eleDiv);
// 						show.appendChild(eleDiv);	
// 				}//End for
				
// // 		 		var txt = document.getElementById("txtSearch");
// // 		 		txt = null;
// 			  }//End success 
			 
//  	   }); //End keyup	
//  	testValue = txt.value;
//    }
//  //	  else{ //如果空值時，刪除所有節點 if--else---
// // 		var show = document.getElementById("div1");
// //     	show.style.display = "block";
// //    		if (show.childNodes.length > 0) {
// //    	 		show.removeChild(show.childNodes[0]);
// //    		} // End if-----						    		
// //   };//End if
//  });	//End keyup  

// });	//End document 
	function getData() { //創建Session 所有此帳號的好友清單
		 $.get("/lifeeditor/com.lifeeditor.invite_list/getUserData");
	 } 
	 function test(value){
			$.ajax({
				type:"POST",
				dataType:"text",
				url: '/lifeeditor/com.lifeeditor.invite_list/addFriendServlet',
				data: {'id':value},	
				success: function (){
					
				}
			});
	 }
$(document).ready(function(){
	
	var testValue =""//全裕變數 
	var txt = document.getElementById("txtSearch"); //抓取TextBox值
	getData(); //產生Session

	$("#txtSearch").keyup(function() { //如果Keyup時	
	
		if(txt.value.trim() != testValue || txt.value.trim().match(/[^a-z^A-Z^0-9]/g)){ //判斷不是空值
			$.ajax({
				  type:"POST",
				  dataType: 'json',
				  url: '/lifeeditor/com.lifeeditor.invite_list/getDataFromDB',
				  data: {'txt':txt.value.trim()},
				  success: function selectData(result){
					  var show = document.getElementById("div1"); //顯示的Div
				     	show.style.display = "block";
					  
				    		if (show.childNodes.length > 0) { //先刪除舊有資料
				    	 		show.removeChild(show.childNodes[0]);
				    		}//End if	
				    		var eleDiv = document.createElement("div");
				 			eleDiv.className = "list-group";
				 			
				 			for (var j = 0, max = result.length; j < max; j++) { //取出所有資料
				 				
				 			var table = document.createElement('table'); //table放性名跟按鈕
				 			var tr1 = document.createElement('tr');
				 			var td1 = document.createElement('td');
				 			var tr2 = document.createElement('tr');
				 			var td2 = document.createElement('td');
				 			
				 			var span = document.createElement('span');
				 			var picture = 'data:image/jpeg;base64,'+ result[j].Picture; //Base64轉img
							var txtBtn = document.createTextNode(result[j].Name); 
							var eleImg = document.createElement("img");
							var eleBtn = document.createElement("button"); 
							var addFriendbtn = document.createElement("button");
							var t = document.createTextNode("加為好友");
							var user = result[j].Userid;
												
							addFriendbtn.appendChild(t); 
							span.style.fontSize = "20px";
							span.appendChild(txtBtn);
							
							
							eleImg.setAttribute("src",picture);
							eleImg.setAttribute("width",60);
							eleImg.setAttribute("height",60);
						    eleImg.className = "img-thumbnail"
						    eleImg.style.float="left";
						    
							eleBtn.className = "list-group-item"; 
							eleBtn.setAttribute("type", "button"); 
							
							addFriendbtn.className = "btn btn-primary";
							addFriendbtn.setAttribute("type","button");

							addFriendbtn.setAttribute("value",user);
							
							addFriendbtn.addEventListener('click',function(){ //綁定一個click事件傳值新增好友	
								this.firstChild.nodeValue = "已送出邀請";
								test(this.value);
							}, true);
							
							table.appendChild(tr1).appendChild(td1).appendChild(span);
							table.appendChild(tr2).appendChild(td2).appendChild(addFriendbtn);
							table.style.float="left";
							
							eleBtn.appendChild(eleImg);
							eleBtn.appendChild(table);

							eleDiv.appendChild(eleBtn);		
							}
				 			document.getElementById("div1").appendChild(eleDiv);
// 				 			var txt = document.getElementById("txtSearch");
// 				 			txt = null;
				 					 				 			
				     } //End for
			   }); //End Success
			testValue = txt.value;
	   }else{ //如果空值時，刪除所有節點 if--else---
			var show = document.getElementById("div1");
	     	show.style.display = "block";
	    		if (show.childNodes.length > 0) {
	    	 		show.removeChild(show.childNodes[0]);
	    		} // End if-----						    		
  	   };//End if
}); //End ready
}); //End ready			
			

</script>
<body>
<center>
	<div class="jumbotron" style="width:1000px">
			<div class="page-header">
				<h3>
					搜尋好友 <small>AutoComplete</small>
				</h3>
				
			</div>
			<!-- 每頁不同的內容從這裡開始 -->
			
			<form name="myData" >
				<div class="form-group">
					<input type="text" class="form-control" id="txtSearch"
						name="keyword"   >
				</div>
			</form>
				<div id="div1"></div>


			<!-- 每頁不同的內容到這裡結束 -->
		</div>
</center>
	
</body>
</html>