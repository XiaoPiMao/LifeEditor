<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link href='css/fullCalendar/fullcalendar.css' rel='stylesheet' />
<link href='css/fullCalendar/fullcalendar.print.css' rel='stylesheet' media='print' />

<!-- <script src='js/fullCalendar/moment.min.js'></script> -->
<script src='js/fullCalendar/moment.js'></script>
<script src='js/jquery.min.js'></script>
<script src='js/fullCalendar/jquery.js'></script>
<!-- <script src='js/fullCalendar/fullcalendar.min.js'></script> -->
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
			
			lang: 'zh-tw',
			eventClick: function(calEvent, jsEvent, view) {
				$.ajax({
					type:"POST",
					dataType:"json",
					data:{"id":calEvent.id},
					url: '/lifeeditor/com.lifeeditor.schedule/ShowDetailServlet',
					success:function(data){
						$(this).popover({container: ".parent"});
				        $(this).popover('show');
					}
				});
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
});
// 			events: [
// 				{
// 					id:999,
// 					title: 'All Day Event',
// 					start: '2016-05-01',
// 					color: 'Green',   // 更改 顏色 
// 				    textColor: 'White' // 文字顏色
				   
// 				},
// 				{
// 					id:998,
// 					title: 'Long Event',
// 					start: '2016-05-07'
// 				},
// 				{
// 					title: 'Repeating Event',
// 					color: 'Red',   // 更改 顏色 
// 				    textColor: 'White' ,// 文字顏色
// 					start: '2016-05-09T16:00:00'
// 				},
// 				{
// 					title: 'Repeating Event',
// 					color: 'Black',   // 更改 顏色 
// 				    textColor: 'White' ,// 文字顏色
// 					start: '2016-05-16T16:00:00'
// 				},
// 				{
// 					title: 'Conference',
// 					start: '2016-05-11'

// 				},
// 				{
// 					title: 'Meeting',
// 					start: '2016-05-12T10:30:00'

// 				},
// 				{
// 					title: 'Lunch',
// 					start: '2016-05-12T12:00:00',
// 					end:'2016-05-13'
// 				},
// 				{
// 					title: 'Meeting',
// 					start: '2016-05-12T14:30:00'
// 				},
// 				{
// 					title: 'Happy Hour',
// 					start: '2016-05-12T17:30:00'
// 				},
// 				{
// 					title: 'Dinner',
// 					start: '2016-05-12T20:00:00'
// 				},
// 				{
// 					title: 'Birthday Party',
// 					start: '2016-05-13T07:00:00'
// 				},
// 				{
// 					title: 'Click for Google',
// 					url: 'http://google.com/',
// 					start: '2016-05-28'
// 				}
// 			]
			
// 		});
								
// 	});
	</script>
</head>
<body>
	<div id='calendar'></div>
</body>
</html>