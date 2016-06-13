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
<link rel="stylesheet" href="${ctx }/js/bootstrap.js">
<link rel="stylesheet" href="${ctx }/js/bootstrap.min.js">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">		
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">	
<link rel="stylesheet" href="${ctx }/manager/dist/css/AdminLTE.min.css">
<link rel="stylesheet" href="${ctx }/manager/dist/css/skins/skin-blue.min.css">
</head>
<style>
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
}

/* Links inside the dropdown */
.dropdown-content a {
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
}

/* Change color of dropdown links on hover */
.dropdown-content a:hover {background-color: #f1f1f1}

/* Show the dropdown menu on hover */
.dropdown:hover .dropdown-content {
    display: block;
}

/* Change the background color of the dropdown button when the dropdown content is shown */
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
</style>
<script src="${ctx }/plugins/jQuery/jQuery-2.2.0.min.js"></script>	
<script src="${ctx }/manager/bootstrap/js/bootstrap.min.js"></script>

<script type="text/javascript" src="${ctx }/js/friend.js">

// 	function getData() { //創建Session 所有此帳號的好友清單
// 		 $.get("/lifeeditor/com.lifeeditor.invite_list/getUserFriendServlet");
// 	 } 
// 	 function test(value){
// 			$.ajax({
// 				type:"POST",
// 				dataType:"text",
// 				url: '/lifeeditor/com.lifeeditor.invite_list/addFriendServlet',
// 				data: {'id':value},	
// 				success: function (){
					
// 				}
// 			});
// 	 }
// 	 function deleteInviter(value,status){
// 		 $.ajax({
// 				type:"POST",
// 				dataType:"text",
// 				url: '/lifeeditor/com.lifeeditor.invite_list/ChkInviterServlet',
// 				data: {'id':value,'status':status},	
// 				success: function (){
					
// 				}
// 			});
// 	 }
// 	 function addInviter(value,status){
// 		 $.ajax({
// 				type:"POST",
// 				dataType:"text",
// 				url: '/lifeeditor/com.lifeeditor.invite_list/ChkInviterServlet',
// 				data: {'id':value,'status':status},	
// 				success: function (){
					
// 				}
// 			});
// 	 }
// $(document).ready(function(){
// 	var testValue =""//全裕變數 
// 	var txt = document.getElementById("txtSearch"); //抓取TextBox值
// 	var count = 2; //控制按鈕 check的
// 	//getData(); //產生Session

// 	$("#txtSearch").keyup(function() { //如果Keyup時	
	
// 		if(txt.value.trim() != testValue || txt.value.trim().match(/[^a-z^A-Z^0-9]/g)){ //判斷不是空值
// 			$.ajax({
// 				  type:"POST",
// 				  dataType: 'json',
// 				  url: '/lifeeditor/com.lifeeditor.invite_list/getDataFromDB',
// 				  data: {'txt':txt.value.trim()},
// 				  success: function selectData(result){
// 					  var show = document.getElementById("div1"); //顯示的Div
// 				     	show.style.display = "block";
					  
// 				    		if (show.childNodes.length > 0) { //先刪除舊有資料
// 				    	 		show.removeChild(show.childNodes[0]);
// 				    		}//End if	
// 				    		var eleDiv = document.createElement("div");
// 				 			eleDiv.className = "list-group";
				 			
// 				 			for (var j = 0, max = result.length; j < max; j++) { //取出所有資料
				 				
// 				 			var table = document.createElement('table'); //table放性名跟按鈕
// 				 			var tr1 = document.createElement('tr');
// 				 			var td1 = document.createElement('td');
// 				 			var tr2 = document.createElement('tr');
// 				 			var td2 = document.createElement('td');
				 			
// 				 			var span = document.createElement('span');
// 				 			var picture = 'data:image/jpeg;base64,'+ result[j].Picture; //Base64轉img
// 							var txtBtn = document.createTextNode(result[j].Name); 
// 							var eleImg = document.createElement("img");
// 							var eleBtn = document.createElement("button"); 
// 							var addFriendbtn = document.createElement("button");
// 							var t = document.createTextNode("加為好友");
// 							var user = result[j].Userid;
												
// 							addFriendbtn.appendChild(t); 
// 							span.style.fontSize = "20px";
// 							span.appendChild(txtBtn);
							
							
// 							eleImg.setAttribute("src",picture);
// 							eleImg.setAttribute("width",60);
// 							eleImg.setAttribute("height",60);
// 						    eleImg.className = "img-thumbnail"
// 						    eleImg.style.float="left";
						    
// 							eleBtn.className = "list-group-item"; 
// 							eleBtn.setAttribute("type", "button"); 
							
// 							addFriendbtn.className = "btn btn-primary";
// 							addFriendbtn.setAttribute("type","button");

// 							addFriendbtn.setAttribute("value",user);
							
// 							addFriendbtn.addEventListener('click',function(){ //綁定一個click事件傳值新增好友	
// 								this.firstChild.nodeValue = "已送出邀請";
// 								test(this.value);
// 							}, true);
							
// 							table.appendChild(tr1).appendChild(td1).appendChild(span);
// 							table.appendChild(tr2).appendChild(td2).appendChild(addFriendbtn);
// 							table.style.float="left";
							
// 							eleBtn.appendChild(eleImg);
// 							eleBtn.appendChild(table);

// 							eleDiv.appendChild(eleBtn);		
// 							}
// 				 			document.getElementById("div1").appendChild(eleDiv);

				 					 				 			
// 				     } //End for
// 			   }); //End Success
// 			testValue = txt.value;
// 	   }else { 
// 			var show = document.getElementById("div1");
// 	     	show.style.display = "block";
// 	    		if (show.childNodes.length > 0) {
// 	    	 		show.removeChild(show.childNodes[0]);
// 	    	} // End if-----

//   	   };//End if
// }); //End ready
// // 	$("#show").blur(function(){ //離開時
// // 		 var show = document.getElementById("div1");
// // 	     	show.style.display = "block";
// // 	    		if (show.childNodes.length > 0) {
// // 	    	 		show.removeChild(show.childNodes[0]);
// // 	    	}
// // 		 document.getElementById("txtSearch").value = "";		 
// // 	 });
// 	$('#btn1').click(function(){
// 	  if(count % 2 == 0){ //記數判斷
// 		$.ajax({
// 			type:"POST",
// 			dataType:"json",
// 			url: '/lifeeditor/com.lifeeditor.invite_list/checkFriendServlet',
// 			success: function (data){
// 				var myDiv = document.getElementById("divContent");
// 				myDiv.style.display = "block";
// 				if (myDiv.childNodes.length > 0) { //先刪除舊有資料
// 	    			myDiv.removeChild(myDiv.childNodes[0]);								
// 	    		}//End if	

// 				var myTable = document.createElement("table");
							
// 				for(var i = 0;i<data.length;i++){
					
// 					var myImg = document.createElement("img");
// 					var myName = document.createElement("a");
// 					var myChkTureBtn = document.createElement("button");
// 					var myChkFalseBtn = document.createElement("button");
// 					var chkTure = document.createTextNode("接受邀請");
// 					var chkFalse = document.createTextNode("拒絕邀請");
					
// 					var tr1 = document.createElement("tr");
// 					var td1 = document.createElement("td");
// 					var td2 = document.createElement("td");
// 					var td3 = document.createElement("td");
// 					var td4 = document.createElement("td");
					
// 					var picture = 'data:image/jpeg;base64,'+ data[i].Picture;
// 					var name = document.createTextNode(data[i].Name);
					
					
// 					myImg.setAttribute("src",picture);  //照片設置
// 					myImg.setAttribute("width",30);
// 					myImg.setAttribute("height",30);
// 					myImg.setAttribute("class","img-circle");
// 					myImg.style.float="left";          //照片設置結束.....
					
					
// 					myChkTureBtn.appendChild(chkTure);
// 					myChkTureBtn.setAttribute("type","button");
// 					myChkTureBtn.setAttribute("value",data[i].Userid);
// 					myChkTureBtn.className = "btn btn-primary btn-sm";
// 					myChkTureBtn.addEventListener('click',function(){ //綁定一個click事件傳值新增好友	
// 						this.firstChild.nodeValue = "成為好友";
// 						addInviter(this.value,"makeFriend");
// 					}, true);
					
// 					myChkFalseBtn.appendChild(chkFalse);
// 					myChkFalseBtn.setAttribute("type","button");
// 					myChkFalseBtn.setAttribute("value",data[i].Userid);
// 					myChkFalseBtn.className = "btn btn-danger btn-sm";
// 					myChkFalseBtn.addEventListener('click',function(){ //綁定一個click事件傳值新增好友	
// 						var parent = this.parentNode;
// 						if(window.confirm('確定拒絕?')){						
// 						deleteInviter(this.value,"delete");
// 						parent.parentNode.style.display = "none";
// 						}else{}
// 						//test(this.value);
// 					}, true);
					
					
// 					td1.appendChild(myImg);
// 					tr1.appendChild(td1);
					
// 					myName.appendChild(name);
// 					td2.appendChild(myName);
// 					tr1.appendChild(td2);
					
// 					td3.appendChild(myChkTureBtn);
// 					tr1.appendChild(td3);
					
// 					td4.appendChild(myChkFalseBtn);
// 					tr1.appendChild(td4);
// 					myTable.appendChild(tr1);
// 					myDiv.appendChild(myTable);
					
// 				}

// 			}
// 		});
// 		count = count + 1; //控制開關
// 	}else{
// 		var myDiv = document.getElementById("divContent");
// 		myDiv.style.display = "none";
// 		count = count + 1; //控制開關
// 	} 
// 	})
	
// }); //End ready					

// //data-placement 設定視窗出現位置
// //data-content 設定資料內容
</script>
<body>
<center>
	<div class="jumbotron" style="width:1000px">
			<div class="page-header">
				<h3>
					好友 <small>功能</small>
				</h3>
						<div class="dropdown" style="float:left">
		  				<button id="btn1" type="button" data-toggle="dropdown"><img src="${ctx }/images/addfri.jpg">
		  				</button>
		  				<div id="divContent" class="dropdown-content" style="width:300px;font-size:10px" >
						</div>
							
						</div> 		       			  		    			  
			</div>
			<!-- 每頁不同的內容從這裡開始 -->
			
			<form name="myData" >
				<div class="form-group">
					<input type="text" class="form-control" id="txtSearch"
						name="keyword"   >
				</div>
			</form>
				<div id="div1"></div>
				<button id="btn2" type="button"  >顯示好友</button>
				<div id="div2" class="well" >
					<table >
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
		<div class="twPc-div">
    		<a class="twPc-bg twPc-block"></a>
    		<div class="twPc-button">
            <!-- Twitter Button | you can get from: https://about.twitter.com/tr/resources/buttons#follow -->
            <input type="button" class="btn btn-info" value="解除朋友關係">
            <!-- Twitter Button -->   
		</div>		
		<div>	
		<a title="Mert Salih Kaplan" href="https://twitter.com/mertskaplan" class="twPc-avatarLink">
			<img alt="Mert Salih Kaplan" src="https://pbs.twimg.com/profile_images/378800000352678934/34f9e192635975bf42e534434e2b6273_bigger.jpeg" class="twPc-avatarImg">
			
		</a>

		<div class="twPc-divUser">
			<div class="twPc-divName">
				<a >Mert S. Kaplan</a>
			</div>
			<span>
				<a >@<span>mertskaplan</span></a>
			</span>
		</div>

	</div>
</div>			
</center>

</body>
</html>