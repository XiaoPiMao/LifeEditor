<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:useBean id="targets"
	class="com.lifeeditor.model.target.TargetDAO_JNDI" />


<!DOCTYPE html>

<html>
<head>
<title>成就系統</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>LifeEditor Manager</title>
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<link rel="stylesheet"
	href="${ctx }/manager/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
<link rel="stylesheet" href="${ctx }/manager/dist/css/AdminLTE.min.css">
<link rel="stylesheet"
	href="${ctx }/manager/dist/css/skins/skin-blue.min.css">
<link rel="stylesheet" href="${ctx}/css/style.css"> 
	<link rel="stylesheet"
		href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">

<!--[if lt IE 9]>
	  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
	  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	  <![endif]-->
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>

<style>
h1 {
	text-align: center;
}

table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
	width: 50%;
	color: blue;
	text-shadow: 1px 1px orange;
}

th, td {
	padding: 15px;
}

#dropZone {
	width: 240px;
	height: 100px;
	border: 1px solid gray;
	float: left
}

.thumb {
	height: 75px;
	margin: 5px;
}

#elements {
	padding-left: 50px;
	padding-right: 50px;
}

#textarea1 {
	padding: 1px;
	height: 130%;
}
#textarea2 {
	padding: 1px;
	height: 130%;
}

</style>
	<style>
#content {
	font-size: 14pt;
}

div#selects {
	margin-top: 15vh;
	text-align: center;
}

#selType, #selSec, option {
	width: 150px;
	font-size: 14pt;
}

.ui-autocomplete-loading {
    background: white url("http://www.guiza.net/fotos/wp-content/plugins/nextgen-gallery/admin/css/images/ui-anim_basic_16x16.gif") right center no-repeat;
  }
  
#tags { width: 15em; }


</style>

</head>

<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">
		<header class="main-header">
			<jsp:include page="template/template.jsp"></jsp:include>
		</header>
		<aside class="main-sidebar">
			<jsp:include page="template/template.jsp"></jsp:include>
		</aside>
		<div class="content-wrapper">
			<section class="content-header">
				<h1>
					成就系統 <small>設定挑戰任務功使用者挑選</small>
				</h1>

			</section>

			<section class="content">

				<div id="elements">

					<table style="width: 100%">


						<tr>
							<td> <div class="ui-widget">
							<form action="demo_form.asp">
									挑戰名稱: <input id="tags" type="text" name="Challenge" >
								</form> <br />
								</div>
								</td>
							<td><jsp:useBean id="AchmtSvc" scope="page"
									class="com.lifeeditor.service.AchievementService" />

								<form method="post" action="achievement.do">
									<b>獎項名稱: </b> <select id="achName" size="1" name="achievement"
										class="trophy">
										<option value=""></option>
										<c:forEach var="AchievementVO" items="${AchmtSvc.all}">
											<option value="${AchievementVO.achID}">${AchievementVO.achName}
										</c:forEach>
									</select>
								</form> <br /></td>
						</tr>
						<tr>
							<td><textarea id="textarea1" rows="3" cols="50">內容描述...</textarea></td>
							<td rowspan="2">獎杯圖示:<br />
							<br />
								<div id="dropZone" ondragover="dragoverHandler(event)"
									ondrop="dropHandler(event)"></div>
								<br />
							<br />
							<br />
							<br />
							<br />
							<br /> <input type="file" id="file1" multiple="multiple"
								accept="image/*" onchange="fileViewer()" /></td>
						</tr>
						<tr>
							<td>類別: <select id="selType" class="opt">
									<option value=""></option>
									<c:forEach var="type" items="${types }">
										<c:if test="${type.typeName != '自訂' }">
											<option value=${type.typeID }>${type.typeName }</option>
										</c:if>
									</c:forEach>
							</select> &nbsp;&nbsp;&nbsp; 項目: <select id="selSec" class="opt"></select>
								&nbsp;&nbsp;&nbsp;&nbsp; 難易度: <select id="difficulty">
									<option value="1">簡單</option>
									<option value="2">普通</option>
									<option value="3">一般</option>
									<option value="4">困難</option>
									<option value="5">極嚴峻</option>
							</select> &nbsp;&nbsp;&nbsp; <br /> <br /></td>
						</tr>
						<tr>
							<td>本挑戰項目<br />
							<br /> <label for="from">起始於:</label> <input type="text"
								id="from" name="from"> <label for="to">結束於:</label> <input
								type="text" id="to" name="to"></td>
							<td><textarea id="textarea2" rows="3" cols="50">獎杯描述...</textarea></td>

						</tr>

					</table>
					<br /> &nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="送出更新">

				</div>

			</section>
		</div>
	</div>





	<script src="//code.jquery.com/jquery-1.10.2.js"></script>
	<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>

	
	<script>
		$(function() {
			$("#from").datepicker({
				defaultDate : "+1w",
				changeMonth : true,
				numberOfMonths : 3,
				onClose : function(selectedDate) {
					$("#to").datepicker("option", "minDate", selectedDate);
				}
			});
			$("#to").datepicker({
				defaultDate : "+1w",
				changeMonth : true,
				numberOfMonths : 3,
				onClose : function(selectedDate) {
					$("#from").datepicker("option", "maxDate", selectedDate);
				}
			});
		});
	</script>
	<script>
		function dragoverHandler(e) {
			e.preventDefault();
		}

		function dropHandler(e) {
			e.preventDefault(); //停止預設動作(預設為任一個標籤都不能被拖)
			e.stopPropagation(); //取消氣泡
			var theFiles = e.dataTransfer.files;

			for (var i = 0; i < theFiles.length; i++) {
				var reader = new FileReader();
				reader.readAsDataURL(theFiles[i]);
				reader.onload = function(e) {
					var fileContent = e.target.result;
					var eleImg = document.createElement("img");
					eleImg.setAttribute("src", fileContent);
					eleImg.setAttribute("class", "thumb");
					var show = document.getElementById("dropZone");
					show.appendChild(eleImg);

				}
			}
		}
	</script>
	<script>
		function fileViewer() {
			var myFiles = document.getElementById("file1").files;
			for (var i = 0; i < myFiles.length; i++) {
				var reader = new FileReader();
				reader.readAsDataURL(myFiles[i]);
				reader.onload = function(e) {
					var fileContent = e.target.result;

					var eleImg = document.createElement("img");
					eleImg.setAttribute("src", fileContent);
					eleImg.setAttribute("class", "thumb");

					var show = document.getElementById("dropZone");
					show.appendChild(eleImg);
				}
			}
		}
	</script>
	<script>
		var allSecs = JSON.parse('${secs}');

		onload = function() {
			selects = document.querySelectorAll("select.opt");
			selects[0].onchange = optSec;
		}

		var firstSec = true;		
		function optSec() {
			if(firstSec == true) {
				$(selects[0]).find("option")[0].remove();
				firstSec = false;
			}
			while (selects[1].childNodes.length > 0)
				selects[1].removeChild(selects[1].lastChild);
			var secs = allSecs[selects[0].value];
			for (var i = 0, max = secs.length; i < max; i++) {
				addOpt(secs[i].secID, secs[i].secName);
			}
		}

		function addOpt(value, text) {
			var opt = document.createElement("option");
			opt.value = value;
			opt.innerText = text;
			selects[1].appendChild(opt);
		}
	</script>

	<!-- jQuery 2.2.0 -->
	<script src="${ctx }/plugins/jQuery/jQuery-2.2.0.min.js"></script>
	<!-- Bootstrap 3.3.6 -->
	<script src="${ctx }/manager/bootstrap/js/bootstrap.min.js"></script>
	<!-- AdminLTE App -->
	<script src="${ctx }/manager/dist/js/app.min.js"></script>
	<script src="${ctx }/js/jquery-ui.js"></script>



<script>
	var firstChg = true;

$(function(){
	
	
	$('#achName').change(function(){
		if(firstChg == true) {
			$(this).find("option")[0].remove();
			firstChg = false;
		}
		var sel = $('#achName>:selected');
		var v = sel.val();
		$.get("${ctx}/AchievementServlet",{"achID": v},function(desc){
			$('#textarea2').val(desc);
		} );
		
	});
	
	function log( message ) {
		var targets;
	      $( "<div>" ).text( message ).prependTo( "#log" );
	      $( "#log" ).scrollTop( 0 );
	    }
	 
	    $( "#tags" ).autocomplete({
	      source: function( request, response ) {
	        $.ajax({
	          url: "${ctx}/ChallengeServlet",
	          dataType: "text",
	          data: {"action":"autoComplete","keyword": $("#tags" ).val()},
	          success: function( data ) {
	        	    	  
	        	  var res = new Array();
	        	  targets = JSON.parse(data);
	        	  console.log(data);
					$.each(targets, function(index, target){
					console.log(target.trgName);
					res.push(target.trgName);		
				});
					response(res);	
	          }
	        });
	      },
	      minLength: 1,
	      select: function( event, ui ) {
	        $.each(targets, function(i,target) {
	        	if(target.trgName == ui.item.label) {
	        		$("#textarea1").val(target.intention);
	        		$("#from").val(target.timeStart);
	        		$("#to").val(target.timeFinish);
	        		$("#difficulty").val(target.difficulty);  		
	        		$("#selType").val(target.typeID);
	        		optSec();
 	        		$("#selSec").val(target.sectionID);
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
	
	   	    
	
});
    
</script>


</body>
</html>