<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="TrgSvc" class="com.lifeeditor.service.TargetService" />		
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>挑戰任務</title>

<link href="https://cdn.datatables.net/1.10.12/css/jquery.dataTables.min.css" rel="stylesheet">
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script> -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="${ctx}/manager/js/jquery.dataTables.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script type="text/javascript">





var tr;
var numberResult;
var rateResult;
var officialTrg;
$(document).ready(function(){
	
	//*******************滑鼠點擊時，跳出的對話方塊。*****************		
	$( "#dialog" ).dialog({
	      autoOpen: false,
	      resizable: false,
	      modal: true,
	      show: {
	        effect: "fade",
	        duration: 400
	      },
	      buttons: {
	          "確定送出": function() {
  	  
	            $( this ).dialog( "close" );
	            
	     	    $(tr).find("td").toggleClass( "highlight" );	  
  	 			$(tr).find("#apply").prop('value', '報名送出')
  		 	    $(tr).find("#apply").prop('disabled', true);
  	 			$(tr).find("#apply").css('color','red');
  	 			$('#applylist>p').html("已加入新的挑戰~!&nbsp;&nbsp;" + $(tr).find('td:eq(0)').text());
 				$('#applylist').fadeTo(1000,0.6);
 				
 				$.post("userAddTargetServlet",{"targetID":tr.id, "action":"insert"},function(data){
		  			officialTrg = $(tr).find("td:eq(0)").text();


	 				$.ajax({
						"type":"get",
						"url":"${ctx}/userAddTargetServlet",
						"data":{"action":"countNames", "keyword": officialTrg},
						"success":function(data){
							numberResult = data;
							$.ajax({
								"type":"get",
								"url":"${ctx}/userAddTargetServlet",
								"data":{"action":"rateNames", "keyword": officialTrg},
								"success":function(data){
									rateResult = data;
									$(tr).find("td:eq(6)").text(numberResult + " 人");
									$(tr).find("td:eq(7)").text(rateResult + "%");
									alert("已新增至清單");
								}
							});
						}
					});
	 				
		  		});
 				
 				
//					**********************************************				
//					***ajax*比對名子來當作參數，再拿名子參數給servlet來算出數量**	

				
	          },
	          
          Cancel: function() {
            $( this ).dialog( "close" );
            console.log("Cancel");
	          }
	        },
	    }); 
	

    
});
</script>

<style>

h1, b {
	text-align: center
}

#Register {
    margin: auto;
}

.highlight {
font-weight:bold;
background-color:#c1ff80; 
color: blue; 
 }
 
.send {
background-color:#ffffe6; 
color: gray; 
font-style: italic;
 } 
 
  #applylist {
  position: fixed;
  left: 50px;
  top: 5px;
  opacity:0.6;
  
    background: #dad;
    font-weight: bold;
    font-size: 16px;
  }		
</style>

<script>

</script>

</head>
<body>
<h1>挑戰任務</h1>


<div align="center" style="display:none" >
<b>登入者ID: ${LoginOK.userID}, 帳號: ${LoginOK.account}</b>



<table id="example" class="display" cellspacing="0" width=auto >
			<thead>
				<tr>
					<th width="130px">挑戰名稱</th>
					<th width="50px">選取</th>
					<th width="50px">類別</th>
					<th width="50px">項目</th>
					<th width="600px">內容敘述</th>
					<th width="40px">難度</th>
					<th width="60px">參加人數</th>
					<th width="50px">達成率</th>
					<th width="100px">截止日期</th>
				</tr>
			</thead>
			<tbody></tbody>

		 	 
        <tfoot>

        </tfoot>
    </table>
    
</div>


<!-- *******************按下送出任務時，會淡出的提示訊息***************** -->

<div id="applylist" style="display:none">
<p></p>
</div>

<!-- *******************對話方塊中的文字，預設為隱藏。***************** -->

<div id="dialog" title="是否確認送出?">
  <p>一旦確認承接後，便無法在此頁面取消這項挑戰! 您是否確定要接受這項挑戰?</p>
</div>

</body>
<script>


$(function(){        

	//***************所有的官方挑戰 (trgType=1的)*************//
var oc;
var ut;

$.ajax({
	url : "${ctx}/userAddTargetServlet",
	dataType : "json",
	data : {
		"action" : "showAllOfficial"
	},
	success : function(data) {
		oc = data;
		console.log(data);
		
		//***************顯示目前使用者所選過，與官方挑戰同名(trgType=2)的任務名稱~*************

		$.ajax({
			url : "${ctx}/userAddTargetServlet",
			dataType : "json",
			data : {
				"action" : "showAllChallengeName"
			},
			success : function(data) {
				ut = data;
				console.log(data);
				addTable();
			}
		});

	}
});




var s1 = {
		'color' : 'black',
		'background-color' : 'white',
		'padding' : '10px',
		'text-align' : 'center',
		'font-weight':'normal',
		'border' : '1px solid red'  };
var s2 = {
		'color' : '#336600',
		'background-color' : '#d9ffb3',
		'padding' : '10px',
		'text-align' : 'center',
		'font-weight':'normal',
		'border' : '1px solid green'  };

		
		function addTable() {
			var frg = $(new DocumentFragment());
			
			$.each(oc,function(i,official){
				officialTrg = official.trgName;
				//*********************************************************************
//				***ajax*比對名子來當作參數，再拿名子參數給servlet來算出數量**				
				$.ajax({
					"type":"get",
					"url":"${ctx}/userAddTargetServlet",
					"async": false,
					"data":{"action":"countNames", "keyword": officialTrg},
					"success":function(data){
						numberResult = data;	
					}
				});
//					**********************************************				
//					***ajax*比對名子來當作參數，再拿名子參數給servlet來算出數量**	

				if(numberResult !=0 ){
					$.ajax({
						"type":"get",
						"url":"${ctx}/userAddTargetServlet",
						"async": false,
						"data":{"action":"rateNames", "keyword": officialTrg},
						"success":function(data){
							rateResult = data;	
						}
					});
					
					
				}
				
				
				
				var applied = false;
				var tr = $("<tr></tr>").attr({"id":official.targetID,
									 "align":"center",
									 "valign":"middle"
				})
				$.each(ut,function(i,target){
					if(official.trgName == target.trgName) {
						applied = true;
						return false;
					}
				})
				
				if(applied) {
					var td = $("<td></td>").text(official.trgName).addClass("send");
					tr.append(td);
					
					
					var input = $("<input></input>").attr({"type":"button","value":"已報名","id":"apply", "disabled": true}).css('font-style', 'italic');
					tr.append($("<td></td>").addClass("send").append(input));				
					tr.append($("<td></td>").text(official.typeVO.typeName).addClass("send"));
					tr.append($("<td></td>").text(official.sectionVO.secName).addClass("send"));
					tr.append($("<td></td>").text(official.intention).addClass("send"));	
					var difficulty = "";
					switch(official.difficulty) {
						case 1 : difficulty = "輕鬆";break;
						case 2 : difficulty = "簡單";break;
						case 3 : difficulty = "普通";break;
						case 4 : difficulty = "困難";break;
						case 5 : difficulty = "嚴酷";break;
					}
					tr.append($("<td></td>").text(difficulty).addClass("send"));
					tr.append($("<td></td>").text(numberResult + " 人").addClass("send"));
					tr.append($("<td></td>").text(rateResult + "%").addClass("send"));
					tr.append($("<td></td>").text(official.timeFinish).addClass("send"));
				}
				else {
					var td = $("<td></td>").text(official.trgName);
					tr.append(td);	
					var input = $("<input></input>").attr({"type":"button","value":"我要參加","id":"apply"});
					tr.append($("<td></td>").append(input));
					tr.append($("<td></td>").text(official.typeVO.typeName));
					tr.append($("<td></td>").text(official.sectionVO.secName));
					tr.append($("<td></td>").text(official.intention));
					var difficulty = "";
					switch(official.difficulty) {
						case 1 : difficulty = "輕鬆";break;
						case 2 : difficulty = "簡單";break;
						case 3 : difficulty = "普通";break;
						case 4 : difficulty = "困難";break;
						case 5 : difficulty = "嚴酷";break;
					}
					tr.append($("<td></td>").text(difficulty));
					tr.append($("<td></td>").text(numberResult + " 人"));
					tr.append($("<td></td>").text(rateResult + "%"));
					tr.append($("<td></td>").text(official.timeFinish));
			
				}
				frg.append(tr);			  
			})
			$('#example>tbody').append(frg);
			$('div[align="center"]').css("display","block");
			$('#example').DataTable();
			
			//*******************滑鼠指到時，改變樣式。*****************		
			
			
				$('tbody>tr').css(s1).mouseover(over).mouseout(out);
				function over() {
					$(this).css(s2);
				};
				function out() {
					$(this).css(s1);
				};
				
				//*******************滑鼠點擊時，勾選該列。*****************		
				$( "tbody>tr" ).on( "click",callDialog);
				function callDialog () {	
 					if($(this).find('td').hasClass("send") || $(this).find('td').hasClass("highlight")) {
 						return;
 					}
						
				    console.log("任務ID是: " +  $(this).attr("id")); //印出點，選時候所取得的任務ID值
				    tr = this;  	  //把tr用全域變數存起來，以免到時候this換人 	
				    console.log($(tr).find('td:eq(0)').text());			    
				    
					$( "#dialog" ).dialog( "open" );

				}
		}
		
});



		
	

	
</script>
</html>