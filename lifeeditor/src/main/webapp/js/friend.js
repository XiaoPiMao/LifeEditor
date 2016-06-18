	function getData() { //創建Session 所有此帳號的好友清單
//		 $.get("/lifeeditor/com.lifeeditor.invite_list/getUserFriendServlet");
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
$(document).ready(function(){
	var testValue =""//全裕變數 
	var txt = document.getElementById("txtSearch"); //抓取TextBox值
	var count = 2; //控制按鈕 check的
//	getData(); //產生Session
	$("#txtSearch").keyup(function(e) { //如果Keyup時	
		if(txt.value == "" ){ //判斷是否為空
			var show = document.getElementById("div1");
			show.style.display = "block";			    
    		if (show.childNodes.length > 0) { //先刪除舊有資料
    	 		show.removeChild(show.childNodes[0]);
    		}//End if
    		testValue = "";
		}else{
		if(txt.value.trim() != testValue || txt.value.trim().match(/[^a-z^A-Z^0-9]/g)){ //判斷不是空值且是中英數字
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
//				 			var picture = 'data:image/jpeg;base64,'+ result[j].Picture; //Base64轉img
							var txtBtn = document.createTextNode(result[j].Name); 
							var eleImg = document.createElement("img");
							var eleBtn = document.createElement("button"); 
							var addFriendbtn = document.createElement("button");
							var t = document.createTextNode("加為好友");
							var user = result[j].Userid;
												
							addFriendbtn.appendChild(t); 
							span.style.fontSize = "20px";
							span.appendChild(txtBtn);
							
							
							eleImg.setAttribute("src",'/lifeeditor/GetUserPicture?id='+result[j].Userid);
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
				 			show.appendChild(eleDiv);
				 			
				 					 				 			
				     } //End for
			   }); //End Success
			testValue = txt.value;
			
	   }else { 
		   
			var show = document.getElementById("div1");
	     	show.style.display = "block";
	    		if (show.childNodes.length > 0) {
	    	 		show.removeChild(show.childNodes[0]);	    	 	
	    		}

  	   };//End if
	};
}); //End ready
// 	$("#show").blur(function(){ //離開時
// 		 var show = document.getElementById("div1");
// 	     	show.style.display = "block";
// 	    		if (show.childNodes.length > 0) {
// 	    	 		show.removeChild(show.childNodes[0]);
// 	    	}
// 		 document.getElementById("txtSearch").value = "";		 
// 	 });
	$('#btn1').click(function(){
	  if(count % 2 == 0){ //記數判斷	  
		$.ajax({
			type:"POST",
			dataType:"json",
			url: '/lifeeditor/com.lifeeditor.invite_list/checkFriendServlet',
			success: function (data){
				var myDiv = document.getElementById("divContent");
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
							
				for(var i = 0;i<data.length;i++){
					
					var myImg = document.createElement("img");
					var myName = document.createElement("a");
					var myChkTureBtn = document.createElement("button");
					var myChkFalseBtn = document.createElement("button");
					var chkTure = document.createTextNode("接受邀請");
					var chkFalse = document.createTextNode("拒絕邀請");
					
					var tr1 = document.createElement("tr");
					var td1 = document.createElement("td");
					var td2 = document.createElement("td");
					var td3 = document.createElement("td");
					var td4 = document.createElement("td");
					
//					var picture = 'data:image/jpeg;base64,'+ data[i].Picture;
					var name = document.createTextNode(data[i].Name);
					
					
					myImg.setAttribute("src",'/lifeeditor/GetUserPicture?id='+data[i].Userid);  //照片設置
					myImg.setAttribute("width",30);
					myImg.setAttribute("height",30);
					myImg.setAttribute("class","img-circle");
					myImg.style.float="left";          //照片設置結束.....
					
					
					myChkTureBtn.appendChild(chkTure);
					myChkTureBtn.setAttribute("type","button");
					myChkTureBtn.setAttribute("value",data[i].Userid);
					myChkTureBtn.className = "btn btn-primary btn-sm";
					myChkTureBtn.addEventListener('click',function(){ //綁定一個click事件傳值新增好友	
						this.firstChild.nodeValue = "成為好友";
						addInviter(this.value,"makeFriend");
					}, true);
					
					myChkFalseBtn.appendChild(chkFalse);
					myChkFalseBtn.setAttribute("type","button");
					myChkFalseBtn.setAttribute("value",data[i].Userid);
					myChkFalseBtn.className = "btn btn-danger btn-sm";
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
		var myDiv = document.getElementById("divContent");
		if (myDiv.childNodes.length > 0) { //先刪除舊有資料
			myDiv.removeChild(myDiv.childNodes[0]);
		}//End if	
		myDiv.style.display = "none";
		count = count + 1; //控制開關
	} 
	});
	$('#btn2').click(function(){ //顯示好友

		$.ajax({
				type:"POST",
				dataType:"json",
				url: '/lifeeditor/com.lifeeditor.invite_list/showFriendServlet',
				success: function (data){
					
					var showFriend1 = document.getElementById("td1");
					var showFriend2 = document.getElementById("td2");
					
					for(var i = showFriend1.childNodes.length - 1; i >= 0; i--){
						showFriend1.removeChild(showFriend1.childNodes[i]);
					}
					for(var i = showFriend2.childNodes.length - 1; i >= 0; i--){
						showFriend2.removeChild(showFriend2.childNodes[i]);
					}					
			
					for(var i = 0 ; i < data.length;i++){
						
						var myDiv = document.createElement("div"); //包名片的Div
						var userTitleDiv = document.createElement("div");//名片title
						var userTitleA = document.createElement("a");//名片title a
						var userImgA = document.createElement("a");
						var userImage = document.createElement("img");
						var userBodyDiv = document.createElement("div");
						var userNameDiv = document.createElement("div");
						var userNameA = document.createElement("a");
						var userIDspan = document.createElement("span");
						var userIDA = document.createElement("a");
						var userIDAspan = document.createElement("span");
						
						var Name = document.createTextNode(data[i].Name); //姓名
						
						
						userTitleA.setAttribute("class","twPc-bg twPc-block");
						userTitleDiv.setAttribute("class","twPc-div");
						
						var unFriendBtnDiv = document.createElement("div");
						unFriendBtnDiv.setAttribute("class","twPc-button");
						
						var unFriendBtn = document.createElement("button");
						//unFriendBtn.setAttribute("class","btn btn-info");
						unFriendBtn.setAttribute("value",data[i].Userid);
						var unFriendText = document.createElement("img");
						unFriendText.setAttribute("src","images/deleteFriend.jpg");
						unFriendBtn.addEventListener('click',function(){ //綁定一個click事件傳值新增好友			
							if(window.confirm('確定刪除?')){						
							deleteInviter(this.value,"delete");
							deleteFriend(this.value,"deleteFriend");
							this.parentNode.parentNode.parentNode.style.display="none";
							}else{}
						}, true);
						
						unFriendBtn.appendChild(unFriendText);
						unFriendBtnDiv.appendChild(unFriendBtn);
						
						userTitleDiv.appendChild(userTitleA); //黑框
						userTitleDiv.appendChild(unFriendBtnDiv);
						
						userImgA.setAttribute("class","twPc-avatarLink");
						userImgA.setAttribute("href","*");
						userImgA.setAttribute("title",Name);
						
						userImage.setAttribute("alt",Name);
						userImage.setAttribute("src",'/lifeeditor/GetUserPicture?id='+data[i].Userid);
						userImage.setAttribute("width",72);
						userImage.setAttribute("height",72);
						userImage.setAttribute("class","img-thumbnail");
						
						userImgA.appendChild(userImage); //圖片
						
						var controlDiv = document.createElement("div");
						
						controlDiv.setAttribute("class","twPc-divUser");
						controlDiv.appendChild(userImgA);
						
						userBodyDiv.setAttribute("class","twPc-divUser");
						userNameDiv.setAttribute("class","twPc-divName");
						userNameA.setAttribute("href","*");
											
						userNameA.appendChild(Name);
						userNameDiv.appendChild(userNameA);
						userBodyDiv.appendChild(userNameDiv);
						
						userIDA.setAttribute("href","*");				
						var BodyAccount = document.createTextNode(data[i].Account);
						userIDAspan.appendChild(BodyAccount);
						userIDA.appendChild(userIDAspan); //ID標籤
						var Endspan = document.createElement("span");
						Endspan.appendChild(userIDA);
						userBodyDiv.appendChild(Endspan);
						
						userTitleDiv.appendChild(userImgA);
						userTitleDiv.appendChild(userBodyDiv);

						
						myDiv.appendChild(userTitleDiv);

						
						if(i % 2 == 1){
							showFriend1.appendChild(myDiv);
						}else if(i % 2 == 0 || i ==0){
							showFriend2.appendChild(myDiv);
						}

					}
					
				}
			});
	});
}); //End ready					

//data-placement 設定視窗出現位置
//data-content 設定資料內容
