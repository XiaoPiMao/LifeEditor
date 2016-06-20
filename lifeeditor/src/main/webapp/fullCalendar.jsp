<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link href='css/fullCalendar/fullcalendar.css' rel='stylesheet' />
<link href='css/fullCalendar/fullcalendar.print.css' rel='stylesheet' media='print' />
<link href='css/bootstrap.css' rel='stylesheet' />
<!-- <script src='js/fullCalendar/moment.min.js'></script> -->
<script src='js/fullCalendar/moment.js'></script>
<script src='js/jquery.min.js'></script>
<script src='js/fullCalendar/jquery.js'></script>
<script src='js/bootstrap.min.js'></script>
<script src='js/fullCalendar/fullcalendar.js'></script>
<script src='js/fullCalendar/lang-all.js'></script>
	<style>
		body {
		margin: 40px 10px;
		padding: 0;
		font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
		font-size: 14px;
		}
	
		#calendar {
			max-width: 900px;
			margin: 0 auto;
			color:#220088;
			cursor: pointer; 
		}
		#myModal {
   			 position: fixed;
   			 top: 30%;

		}
	</style>
	<script>
	
$(document).ready(function() {
			
		$("div.fc-content").each(function (){
			$(this).draggable(function(){			
			});
		});
		
		$('#calendar').fullCalendar({		
// 			lang: 'zh-tw',
			eventClick: function(calEvent, jsEvent, view) {
				getTotal(calEvent.id);
		    },
			header: {
				left: 'prev,next today',
				center: 'title',
				right: 'year,month,basicWeek,basicDay'
			},
			defaultView: 'year',
			defaultDate: new Date(),
			editable: true,
			eventLimit: true, // allow "more" link when too many events
			eventStartEditable :false,
			events:'/lifeeditor/com.lifeeditor.schedule/ChkScheduleServlet'			
		});		
		var modal = $('#myModal');
		
		function getTotal(data){		
			$.ajax({
			type:"POST",
			dataType:"json",
			data:{"id":data},
			url: '/lifeeditor/com.lifeeditor.schedule/ShowDetailServlet',
			success:function getJson(result){
	
				var br = document.createElement("br");
				var br1 = document.createElement("br");
				var br2 = document.createElement("br");
				var myTitle = document.getElementById("myModalLabel"); //modal的標題
				var myTitleNode = document.createTextNode(result[0].TypeName + "類");//標題文字
				
				var myDiv = document.getElementById("myText"); //內容擺放-----主要Div	
				
				var myDetailTable = document.createElement("table"); //內容用table包裝
				myDetailTable.setAttribute("width","auto");
				var tr1 = document.createElement("tr");
				var td1 = document.createElement("td");
				var td2 = document.createElement("td");
				var tr12 = document.createElement("tr");
				var td12 = document.createElement("td");
				td12.setAttribute("width",100);
				var td22 = document.createElement("td");
				var tr13 = document.createElement("tr");
				var td13 = document.createElement("td");
				var td23 = document.createElement("td");
				var tr14 = document.createElement("tr");
				var td14 = document.createElement("td");
				var td24 = document.createElement("td");
				var tr15 = document.createElement("tr");
				var td15 = document.createElement("td");
				var td25 = document.createElement("td");
				var tr16 = document.createElement("tr");
				var td16 = document.createElement("td");
				var td26 = document.createElement("td");
				
				var userNameTitle = document.createTextNode("立定人 :");
 				var userName = document.createTextNode(result[0].Name); //內容值
 				var targetItemTitle = document.createTextNode("目標項目 :");
 				var targetItem = document.createTextNode(result[0].SecName);
 				var targetTitle = document.createTextNode("目標 :");
 				var target = document.createTextNode(result[0].TargerName);
 				var intentionTitle = document.createTextNode("初衷 :");
 				var intention = document.createTextNode(result[0].Intention);
 				var timeStartTitle = document.createTextNode("開始時間 :");
 				var timeStart = document.createTextNode(result[0].TimeStart);
 				var timeFinishTitle = document.createTextNode("結束時間 :");
 				var timeFinish = document.createTextNode(result[0].TimeFinish);
 				
 				if(myTitle.childNodes.length > 0){
 				myTitle.removeChild(myTitle.childNodes[0]);
 				} //如果有舊資料 移除
 				if(myDiv.childNodes.length > 0){
 						myDiv.removeChild(myDiv.childNodes[0]);
 				} //如果有舊資料 移除
 				
 				myTitle.appendChild(myTitleNode); //Title 部分
 				
 				td1.appendChild(userNameTitle);
 				td2.appendChild(userName);
 				tr1.appendChild(td1);
 				tr1.appendChild(td2); //------第一個tr
 				
 				td12.appendChild(targetItemTitle);
 				td22.appendChild(targetItem);
 				tr12.appendChild(td12);
 				tr12.appendChild(td22); //------第二個tr
 				
 				td13.appendChild(targetTitle);
 				td23.appendChild(target);
 				tr13.appendChild(td13);
 				tr13.appendChild(td23); //-----第三個tr
 				
 				td14.appendChild(intentionTitle);
 				td24.appendChild(intention);
 				tr14.appendChild(td14);
 				tr14.appendChild(td24); //------第四個tr
 				
 				td15.appendChild(timeStartTitle);
 				td25.appendChild(timeStart);
 				tr15.appendChild(td15);
 				tr15.appendChild(td25); //-----第五個tr
 				
 				td16.appendChild(timeFinishTitle);
 				td26.appendChild(timeFinish);
 				tr16.appendChild(td16);
 				tr16.appendChild(td26);
 				
 				myDetailTable.appendChild(tr1);
 				myDetailTable.appendChild(tr12);
 				myDetailTable.appendChild(tr13);
 				myDetailTable.appendChild(tr14);
 				myDetailTable.appendChild(tr15);
 				myDetailTable.appendChild(tr16);

 				myDiv.appendChild(myDetailTable);
				modal.modal({show:true}); //把modal展現
			}
			});
		}
});
	</script>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<br>
<br>
	<div id='calendar'></div>
<!-- Modal -->
<div class="modal fade" id="myModal">
  <div class="modal-dialog modal-lg" >
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
        <h4 class="modal-title" id="myModalLabel"></h4>
      </div>
      <div class="modal-body" id = "myText">
 
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
</body>
</html>