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
<link rel="stylesheet" href="${ctx}/manager/dist/css/AdminLTE.min.css">
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

#from, #to{

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
  
#tag1 { width: 15em; }
#tag2 { width: 15em; }

.pictureDisplay { height:95px }

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
					<form id="myForm" action="${ctx}/ChallengeServlet">
						<table style="width: 100%">
							<tr>
								<td>
									<div class="ui-widget">
										挑戰名稱: <input id="tag1" type="text" name="trgName"> <br />
									</div>
								</td>
								<td><jsp:useBean id="AchmtSvc" scope="page"
										class="com.lifeeditor.service.AchievementService" /> 
									<!--**************實際上只需要用到這一行↓ ********************************-->
									<b>獎項名稱: </b> <input id="tag2" type="text" name="achName">
									<!--*************這是暫時顯示有哪些選項的EL ↓ *****************************-->
									<select id="achName" name="achName"  size="1"
									class="trophy">
										<option value=""></option>
										<c:forEach var="AchievementVO" items="${AchmtSvc.all}">
											<option value="${AchievementVO.achID}">${AchievementVO.achName}</option>
										</c:forEach>
								</select> <br /></td>
							</tr>
							<tr>
								<td><textarea id="textarea1" name="intention" form="myForm"
										rows="3" cols="50">內容描述...</textarea></td>
								<td rowspan="2">獎杯圖示:<br /> <br />
									<div id="dropZone" ondragover="dragoverHandler(event)"
										ondrop="dropHandler(event)">
										
										
<!-- 										<img height='100' width='100' -->
<!-- 										src='../ChallengeServlet?achID=1&action=showPic'  /> -->
										
																			
										</div> <br /> <br /> <br /> <br />
									<br /> <br /> <input type="file" id="file1" name="rewardPic"
									 accept="image/*" onchange="fileViewer()" /></td>
							</tr>
							<tr>
								<td>類別: <select id="selType" name="typeID" form="myForm"
									class="opt">
										<option value=""></option>
										<c:forEach var="type" items="${types }">
											<c:if test="${type.typeName != '自訂' }">
												<option value=${type.typeID }>${type.typeName }</option>
											</c:if>
										</c:forEach>
								</select> &nbsp;&nbsp;&nbsp; 項目: <select id="selSec" name="sectionID"
									form="myForm" class="opt"></select> &nbsp;&nbsp;&nbsp;&nbsp;
									難易度: <select id="difficulty" name="difficulty" form="myForm">
										<option value="1">輕鬆</option>
										<option value="2">簡單</option>
										<option value="3">普通</option>
										<option value="4">困難</option>
										<option value="5">嚴酷</option>
								</select> &nbsp;&nbsp;&nbsp; <br /> <br /></td>
							</tr>
							<tr>
								<td>本挑戰項目<br /> <br /> <label for="from">起始於:</label> <input
									type="text" id="from" name="timeStart" readonly> <label
									for="to">結束於:</label> <input type="text" id="to"
									name="timeFinish" readonly></td>
								<td><textarea id="textarea2" rows="3" cols="50"
										form="myForm" name="achDesc">獎杯描述...</textarea></td>
							</tr>

						</table>
					</form>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<button id="butt_insert" style="display: none">新增</button>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<button id="butt_update" style="display: none">更新內容</button>
				</div>

			</section>
		</div>
	</div>


	<script src="//code.jquery.com/jquery-1.10.2.js"></script>
	<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>

	<!-- *************日期選擇 ************** -->
	<script>
		$(function() {
			$("#from").datepicker({
				defaultDate : "+w",
				changeMonth : true,
				numberOfMonths : 2,
				onClose : function(selectedDate) {
					$("#to").datepicker("option", "minDate", selectedDate);
				}
			});
			$("#to").datepicker({
				defaultDate : "+1w",
				changeMonth : true,
				numberOfMonths : 2,
				onClose : function(selectedDate) {
					$("#from").datepicker("option", "maxDate", selectedDate);
				}
			});
		});
	</script>
	<!-- *************圖片拖拉 ************** -->
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
	<!-- *************圖片檔案選取 ************** -->
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
					$(show).empty();
					show.appendChild(eleImg);
				}
			}
		}
	</script>
	<!-- *************從JSON讀取檔案，匯至類別及項目下拉選單中 ************** -->
	<script>
		var trgID;
		var achID;
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

	<!-- ********************大的串連事件處理****************************************** -->
	<script>

var firstChg = true;
$(function(){
	
	$('#butt_insert').click(function() {
		$("#myForm").submit();
	});
	
	$('#butt_update').click(function() {
		updateForm();
	});
	
	
	
	$('#achName').change(function(){
		//*************成就選項選過以後，即消除第一行空白列的選項**************
		if(firstChg == true) {
			$(this).find("option")[0].remove();
			firstChg = false;
		}
		//*************找出成就名稱所對應的敘述，放到textarea2**************
		var sel = $('#achName>:selected');
		var v = sel.val();
		$.get("${ctx}/AchievementServlet",{"achID": v},function(desc){
			$('#textarea2').val(desc);
		} );
		
	});
	
	//*************jQuery Autocomplete-Remote JSONP Datasource**************
	function log( message ) {
		var targets;
	      $( "<div>" ).text( message ).prependTo( "#log" );
	      $( "#log" ).scrollTop( 0 );
	}
	 
	    $( "#tag1" ).autocomplete({
	      source: function( request, response ) {
	        $.ajax({
	          url: "${ctx}/ChallengeServlet",
	          dataType: "text",
	          data: {"action":"autoComplete","keyword": $("#tag1" ).val()},
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
	        		trgID = target.targetID;
	        		achID = target.achVO.achID;
	        		$("#textarea1").val(target.intention);
	        		$("#from").val(target.timeStart);
	        		$("#to").val(target.timeFinish);
	        		$("#difficulty").val(target.difficulty);  
	        		$("#tag2").val(target.achVO.achName);
	        		$("#textarea2").val(target.achVO.achDesc);
// 	        		$("#selType").val(target.typeID);
	        		$("#selType").val(target.typeVO.typeID);
//  	        	$("#selSec").val(target.sectionID);
					optSec();
 	        		$("#selSec").val(target.sectionVO.secID);
 	        		var eleImg = document.createElement("img");
					eleImg.setAttribute("src", "${ctx}/ChallengeServlet?action=showPic&achID=" + achID);  
					eleImg.setAttribute("class", "pictureDisplay"); 
					$("#dropZone").empty();
					$("#dropZone").append(eleImg);
 	        		judge();
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
	    
	    $( "#tag2" ).autocomplete({
		      source: function( request, response ) {
		        $.ajax({
		          url: "${ctx}/AchievementServlet",
		          dataType: "text",
		          data: {"action":"autoComplete","keyword": $("#tag2" ).val()},
		          success: function( data ) {
		        	    	  
		        	  var res = new Array();
		        	  achievements = JSON.parse(data);
		        	  console.log(data);
						$.each(achievements, function(index, achievement){
						console.log(achievement.achName);
						res.push(achievement.achName);		
					});
						response(res);	
						
		          }
		        });
		      },
		      minLength: 1,
		      select: function( event, ui ) {
		        $.each(achievements, function(i,achievement) {
		        	if(achievement.achName == ui.item.label) {
		        	achID = achievement.achID;
		        		$("#textarea2").val(achievement.achDesc);
 	        		var eleImg = document.createElement("img");
					eleImg.setAttribute("src", "${ctx}/ChallengeServlet?action=showPic&achID=" + achID);  
					eleImg.setAttribute("class", "pictureDisplay"); 
					$("#dropZone").empty();
					$("#dropZone").append(eleImg);
		        	judge();
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
	   	  
	//*************資料完成後可送進資料庫的功能************** 
	  //callback handler for form submit
	    $("#myForm").submit(function(e)
	    {
	        var postData = new FormData(this);
	        postData.append("action","insert");
	        postData.append("achID",achID);
	        var formURL = $(this).attr("action");
//  	        alert(JSON.stringify(postData));
	        
	        $.ajax(
	        {
	            url : formURL,
	            type: "POST",
	            data : postData,
	            processData: false,
	            contentType: false,
	            success:function(data) 
	            {
	                //data: return data from server
        		window.location.href = "${ctx}/manager/achievement.jsp"
	                alert("資料寫入成功");
	            },
// 	            error: function(jqXHR, textStatus, errorThrown) 
// 	            {
// 	                //if fails      
// 	            }
	        });
	        e.preventDefault(); //STOP default action
	        //e.unbind(); //unbind. to stop multiple form submit.
	    });
      
	  //*************更新先前已經輸入過的資料**************
		function updateForm() {
		  	var myForm = document.querySelector("#myForm");
			var postData = new FormData(myForm);
			postData.append("action","update");
			postData.append("targetID",trgID);
			postData.append("achID",achID);
			var formURL = $(myForm).attr("action");
			 $.ajax(
			{
				url : formURL,
				type: "POST",
				data : postData,
           		processData: false,
				contentType: false,
	            success:function(data) 
	            {
				//data: return data from server
				window.location.href = "${ctx}/manager/achievement.jsp"
				    alert("資料寫入成功");
					
				},
			});
		}
	  //*************驗證不過，把按鈕藏起來**************
		$(document).ready(function() {
			$('#selType').change(function() {
				judge();
			});
// 			$("input").blur(function() {
// 				judge();
// 			});
			$("input").change(function(){
				judge();
			});
		});
		function judge() {
			var from1 = $('#tag1').val();
			var from2 = $('#from').val();
			var from3 = $('#to').val();
			var from4 = $('#selType').val();
			var from5 = $('#tag2').val();
			if (from1.length == 0 || from2.length == 0 || from3.length == 0 || from4.length == 0  || from5.length == 0) {
				
				$("#butt_insert").hide();
				$("#butt_update").hide();
			} else {
				$("#butt_insert").show();
				$("#butt_update").show();
			}
		}

	});
</script>


</body>
</html>