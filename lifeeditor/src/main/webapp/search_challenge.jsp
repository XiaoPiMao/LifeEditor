<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="TrgSvc" class="com.lifeeditor.service.TargetService" />		
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>任務關鍵字搜尋</title>

<link href="https://cdn.datatables.net/1.10.12/css/jquery.dataTables.min.css" rel="stylesheet">
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<%-- <script src="${ctx}/manager/js/jquery-1.11.0.min.js"></script> --%>
<%-- <script src="${ctx}/manager/js/jquery.dataTables.min.js"></script> --%>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script type="text/javascript">

var trgID;
var trgName;
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
  	 			$(tr).find("#apply").prop('value', '已加入')
  		 	    $(tr).find("#apply").prop('disabled', true);
  	 			$(tr).find("#apply").css('color','red');
  	 			$('#applylist>p').html("已加入新的任務~!&nbsp;&nbsp;" + trgName);
 				$('#applylist').fadeTo(1000,0.6);
 				
 				$.post("userAddTargetServlet",{"targetID":trgID,"trgName":$('#targetName').val(),"intention":$('#targetIntention').val(), "action":"insertTake"},function(data){
 					
		  			alert("新的挑戰已新增至您的目標清單。");
		
		  		});
 								
//					**********************************************				
			
	          },
	          
          	取消: function() {
            $( this ).dialog( "close" );
            console.log("取消送出");
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
 
  .alert
{
    font-size: 1.3em;
    padding: 1em;
    text-align: center;
    white-space: nowrap;
    width: auto;
    word-wrap: normal;
} 
 
  #img1 {
  position: fixed;
  left: 950px;
  top: 50px;

  }		
</style>


</head>
<body>
<h1><img src="images/magnifier.gif" style="height:35px;">任務搜尋</h1>


<!-- <img src="images/ajax-loader.gif" id="img1"> -->

<div align="center">
<b>哈囉~ ${LoginOK.firstName} ，本頁面除了可以關鍵字搜尋現有的目標、也可以靠隨機的方式來產生新目標喔!</b>
<br />
<br />
 <form id="myForm" action="${ctx}/SearchTarget">


<table id="toptable" class="display" cellspacing="20" width=auto>
<tr><td>	任務搜尋: <input id="tag1" type="text" name="trgName" onkeypress="if (event.keyCode==13){ event.preventDefault();}" ></td>
<td>隨機搜尋一筆:&nbsp;&nbsp;&nbsp;&nbsp;<img src="images/guestion.gif" style="height:25px;">
<input id="tag2" type="button" value="隨機搜尋"></td><tr>
</table>

<table id="example" class="display" cellspacing="0" width=auto>
			<thead>
				<tr>
					<th width="50px">選取</th>
					<th width="130px">挑戰名稱</th>
					<th width="60px">類別</th>
					<th width="60px">項目</th>
					<th width="80px">內容敘述</th>
					<th width="50px"></th>
<!-- 					<th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th> -->
				</tr>
			</thead>
		
			<tr></tr>

		 	 
        <tfoot>

        </tfoot>
    </table>
   </form> 
</div>

<!-- *******************按下送出任務時，會淡出的提示訊息***************** -->

<div id="applylist" style="display:none">
<p></p>
</div>

<!-- *******************對話方塊中的文字，預設為隱藏。***************** -->

<div id="dialog" title="是否確認送出?">
  <p>一旦確認送出後，便無法在此頁面移除這項任務! 您是否確定要送出這項任務?</p>
  任務名稱: <input id="targetName" type="text" onkeypress="if (event.keyCode==13){ event.preventDefault();}" ><br>
  初衷: <textarea id="targetIntention"  onkeypress="if (event.keyCode==13){ event.preventDefault();}" ></textarea>
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
			'border' : '1px solid gray'  };
	var s2 = {
			'color' : '#336600',
			'background-color' : '#d9ffb3',
			'padding' : '10px',
			'text-align' : 'center',
			'font-weight':'normal',
			'border' : '1px solid green'  };
	
		
		$('tr').css(s1);
		$('#example').on("mouseover",'tr',over).on("mouseout",'tr',out);
		function over() {
			$(this).css(s2);
		};
		function out() {
			$(this).css(s1);
		};
		
		
		$('td').css(s1);
		$('#toptable').on("mouseover",'td',over).on("mouseout",'td',out);
		function over() {
			$(this).css(s2);
		};
		function out() {
			$(this).css(s1);
		};
		

		//*******************滑鼠點擊時，觸發該列。*****************	
		
		 $('#example').on("click","#apply",callDialog);
		 function callDialog () {	
				if($(this).find('td').hasClass("send") || $(this).find('td').hasClass("highlight")) {
					return;
				}
			var tr = $(this).parents('tr');
		    console.log("點擊的任務ID是: " +  tr.attr("id") + " 名稱是: " + tr.attr("name") ); //印出點，選時候所取得的任務ID值
		    $('#targetName').val(tr.attr("name"));
		    $('#targetIntention').val(tr.find("td:eq(4)").text());
			$( "#dialog" ).dialog( "open" );

		}   
	

	});
	
	
//***************套用特殊的alert樣式 *************//

window.alert = function(message){
    $(document.createElement('div'))
        .attr({title: '送出成功', 'class': 'alert'})
        .html(message)
        .dialog({
            buttons: {OK: function(){$(this).dialog('close');}},
            close: function(){$(this).remove();},
            draggable: true,
            modal: true,
            resizable: false,
            width: 'auto'
        });
};	
//*****************Loading畫面*******************	
// 			$('#img1').hide();
// 			$("#img1").fadeToggle("slow");
// 			$("#img1").fadeToggle(10000);

			
//*****************autocomplete*******************			
function log( message ) {
	var targets;
      $( "<div>" ).text( message ).prependTo( "#log" );
      $( "#log" ).scrollTop( 0 );
}
 
    $( "#tag1" ).autocomplete({
      source: function( request, response ) {
        $.ajax({
          url: "${ctx}/SearchTarget",
          dataType: "text",
          data: {"action":"keyWordSearch","keyword": $("#tag1" ).val()},
          success: function( data ) {
        	  var res = new Array();
        	  if(data.length != 0) {
	        	targets = JSON.parse(data);
	        	console.log(data);
				$.each(targets, function(index, target){
					console.log(target.trgName);
					res.push(target.trgName);		
				});
        	  }
				response(res);			
          }
        });
      },
      minLength: 1,
      select: function( event, ui ) {
        $.each(targets, function(i,target) {
        	if(target.trgName == ui.item.label) {
        		trgID = target.targetID;


		   	$('table>tbody').on('click','.btn-danger',function(){
			 		 $(this).parents("tr").remove();
			})       		

        		var frg = $(new DocumentFragment());
				var applied = false;
				var ut;
		   		tr = $("<tr></tr>").attr({"id":target.targetID, "name":target.trgName, "align":"center", "valign":"middle"})
        		console.log("產生的任務ID是: " +  $(tr).attr("id") +" 名稱是: " + $(tr).attr("name"));
	   			trgID = $(tr).attr("id");
	   			trgName = $(tr).attr("name");
				var input = $("<input></input>").attr({"type":"button","value":"設定目標","id":"apply"});
				tr.append($("<td></td>").append(input));
        		var td = $("<td></td>").text(target.trgName);
				tr.append(td);	
				tr.append($("<td></td>").text(target.typeVO.typeName));
				tr.append($("<td></td>").text(target.sectionVO.secName));
				tr.append($("<td></td>").text(target.intention));
				tr.append("<td><a href='#' class='btn btn-danger'>移除</a></td>");
				frg.append(tr);			  
		
				$('#example>tbody').append(frg);
				$('div[align="center"]').css("display","block");		   	
				 	
        	}
        })
      },
      open: function() {
        $( this ).removeClass( "ui-corner-all" ).addClass( "ui-corner-top" );
      },
      close: function() {
        $( this ).removeClass( "ui-corner-top" ).addClass( "ui-corner-all" );
      }
    });	
	
	
   
  //*****************按下隨機生產鈕*******************		
  
    $('#tag2').click(function() {
    	$.getJSON('${ctx}/SearchTarget',{"action":"getRandomTarget"},function(target){
    		
	
	    		$('table>tbody').on('click','.btn-danger',function(){
	   	 		 	$(this).parents("tr").remove();
	   			})       		
			
	   		var frg = $(new DocumentFragment());
	   		var applied = false;
	   		var ut;
	   		tr = $("<tr></tr>").attr({"id":target.targetID, "name":target.trgName, "align":"center", "valign":"middle"})
	   		console.log("產生的任務ID是: " +  $(tr).attr("id") +" 名稱是: " + $(tr).attr("name"));
	   		trgID = $(tr).attr("id");
	   		trgName = $(tr).attr("name");
	   		var input = $("<input></input>").attr({"type":"button","value":"設定目標","id":"apply"});
	   		tr.append($("<td></td>").append(input));
	   		var td = $("<td></td>").text(target.trgName);
	   		tr.append(td);	
	   		tr.append($("<td></td>").text(target.typeVO.typeName));
	   		tr.append($("<td></td>").text(target.sectionVO.secName));
	   		tr.append($("<td></td>").text(target.intention));
	   		tr.append("<td><a href='#' class='btn btn-danger'>移除</a></td>");
	   		frg.append(tr);			  
	
	   		$('#example>tbody').append(frg);
	   		$('div[align="center"]').css("display","block");	
	    		
    
    		
    	});
    	
      		   	
    	
    });

	
  

  
	
	
</script>
</html>