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
				console.log(result);
				
				var myTitle = document.getElementById("myModalLabel"); //modal的標題
				var myTitleNode = document.createTextNode(result[0].TypeName);//標題文字
				
				var myDiv = document.getElementById("myText"); //內容擺放			
 				var myBody = document.createTextNode("123456"); //內容值
 				
 				myTitle.removeChild(myTitle.childNodes[0]);
 				myDiv.removeChild(showFriend1.childNodes[i]);
 				
 				myTitle.appendChild(myTitleNode);
 				myDiv.appendChild(myBody);
				modal.modal({show:true}); //把modal展現
			}
			});
		}
});
	</script>
</head>
<body>
	<div id='calendar'></div>
<!-- Modal -->
<div class="modal fade" id="myModal">
  <div class="modal-dialog" >
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