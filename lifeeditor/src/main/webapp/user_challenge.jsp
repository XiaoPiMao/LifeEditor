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
<script src="${ctx}/manager/js/jquery-1.12.4.min.js"></script>
<script src="${ctx}/manager/js/jquery.dataTables.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script type="text/javascript">

var tr;

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
  	 			$(tr).find("#apply").prop('value', '已報名')
  		 	    $(tr).find("#apply").prop('disabled', true);
  	 			$(tr).find("#apply").css('color','red');
 				$('#applylist').fadeTo(1000,0.6);
 				
//  				$.post("userAddTargetServlet",{"targetID":id, "action":"insert"},function(data){
// 		  			alert("已新增至清單");
// 		  		});

	          },
	          
          Cancel: function() {
            $( this ).dialog( "close" );
            console.log("Cancel");
            
            $(tr).one( "click",callDialog)
	         
	          }
	        },
	    }); 
	//*******************滑鼠點擊時，勾選該列。*****************		
	$( "tr" ).one( "click",callDialog);
	function callDialog () {	
		
	    console.log("任務ID是: " +  $(this).attr("id")); //印出點，選時候所取得的任務ID值
	    console.log("任務名稱是: " +  $(this).attr("id")); //印出點，選時候所取得的任務ID值
	    tr = this;  	  //把tr用全域變數存起來，以免到時候this換人 			      
		$( "#dialog" ).dialog( "open" );

	}
	    
	$('.selHotMan').change(function(e) {
		    $.post("${ctx}/EditorHotMan",{
				 hotMan: $(this).val(),
				 id : this.id
			 });
		});
    $('#example').DataTable();
 
    
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
 
  #applylist {
  position: absolute;
  left: 50px;
  top: 5px;
  opacity:0.6;
  
    background: #dad;
    font-weight: bold;
    font-size: 16px;
  }		
</style>

<script>
//***************所有的官方挑戰 (trgType=1的)*************

$.ajax({
	url : "${ctx}/userAddTargetServlet",
	dataType : "json",
	data : {
		"action" : "showAllOfficial"
	},
	success : function(data) {

		$.each(data, function(index, official) {
			console.log("挑戰名稱:     選取:    類別:   項目:   內容敘述:   難度:   參加人數:   達成率:   截止日期:");
			console.log(official.trgName + official.typeVO.typeID + official.sectionVO.secID + official.intention + official.difficulty + official.timeFinish);
		  //console.log("data :" + data[index].trgName);

		});

	}
});
</script>

</head>
<body>
<h1>挑戰任務</h1>


<div align="center">
<b>登入者ID: ${LoginOK.userID}, 帳號: ${LoginOK.account}</b>

<table id="example" class="display" cellspacing="0" width=auto>
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
<!-- 					<th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th> -->
				</tr>
			</thead>
			<c:forEach var="TargetVO" varStatus="var" items="${TrgSvc.allofficial}">
			<tr id=${TargetVO.targetID } align='center' valign='middle'>
				<td>${TargetVO.trgName}</td>
				<td>
				<input type='button' value='我要參加' id='apply'>
<!-- 				<button id="apply">我要參加</button>		 -->
				</td>
				<td>${TargetVO.typeVO.typeName}</td>
				<td>${TargetVO.sectionVO.secName}</td>
				<td>${TargetVO.intention}</td>
				<td>
				<c:if test="${TargetVO.difficulty == '1'}" >輕鬆</c:if>
				<c:if test="${TargetVO.difficulty == '2'}" >簡單</c:if>
				<c:if test="${TargetVO.difficulty == '3'}" >普通</c:if>
				<c:if test="${TargetVO.difficulty == '4'}" >困難</c:if>
				<c:if test="${TargetVO.difficulty == '5'}" >嚴酷</c:if>
				</td>
				<td>0人</td>
				<td>0%</td>
				<td>${TargetVO.timeFinish}</td>
				</tr>
		 </c:forEach>
		 	 
        <tfoot>

        </tfoot>
    </table>
    
</div>

<div id="applylist" style="display:none">
<p>已加入新的挑戰!</p>
</div>

<div id="dialog" title="是否確認送出?">
  <p>一旦確認承接後，便無法在此頁面取消這項挑戰! 您是否確定要接受這項挑戰嗎?</p>
</div>

</body>
<script>


$(function(){        
// 	    //*******************滑鼠指到時，改變樣式。*****************

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
	
		$('tr').css(s1).mouseover(over).mouseout(out);
		function over() {
			$(this).css(s2);
		};
		function out() {
			$(this).css(s1);
		};
		
	

	// ***************顯示目前使用者所選過，與官方挑戰同名(trgType=2)的任務名稱~*************
	$.ajax({
			url : "${ctx}/userAddTargetServlet",
			dataType : "json",
			data : {
				"action" : "showAllChallengeName"
			},
			success : function(data) {

				$.each(data, function(index, target) {
					console.log("data :" + target.trgName);
				  //console.log("data :" + data[index].trgName);

				});

			}
		});

	});
</script>
</html>