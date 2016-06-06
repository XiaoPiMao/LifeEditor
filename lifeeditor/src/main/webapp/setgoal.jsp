<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>測試版_設定目標</title>
<link href="css/jquery-ui.css" rel="stylesheet">
<link rel="stylesheet" href="css/main.css" />
<script src="js/jquery.min.js"></script>
<script src="js/jquery-ui.js"></script>
<style>
.set_goal {
	margin: auto;
	width: 1200px;
	text-align: center;
}

.type {
	width: 120px;
	height: 120px;
	padding: 5px;
	float: left;
	margin: 0 10px 10px 10px;
}

#set {
	width: 880px;
	height: 220px;
	border: 2px solid black;
	float: left;
	margin: 30px 10px 50px 150px;
	text-align: center;
}

.goal {
	width: 120px;
	height: 120px;
	display: inline-block;
	float: left;
	margin: 45px 10px 45px 60px;
}

.sec_list {
	display: none;
	position: absolute;
	z-index: 2;
	left: 55px;
	top: 180px;
}
</style>

<script>
	var types = JSON.parse('${jTypes}');
	console.log('${jTypes}');

	$(document).ready(
			function() {
				var frag = $(new DocumentFragment());
				$.each(types, function(i, type) {
					console.log(type.typeID);
					console.log(type.typeName);
					var div = $("<div></div>");
					//<img id="type1" class="type" src="type.typePic" alt="typeName">
					if (type.typeName != "自訂") {
						var img = $("<img>").addClass("type").attr("src",
								"data:image/png;base64," + type.typePic).attr(
								"alt", type.typeName);
					} else {
						var img = $("<img>").attr("src",
								"data:image/png;base64," + type.typePic).attr(
								"alt", type.typeName).css({
							width : "120px",
							height : "120px",
							padding : "5px",
							float : "left",
							margin : "0 10px 10px 10px"
						});
					}
					div.append(img);
					frag.append(div);
				})
				$(".type_list").append(frag);

				$(".type").draggable({
					helper : "clone",
					revert : "invalid"
				});

				$(".goal").droppable({
					accept : ".type",
					drop : function(ev, ui) {
						$("#1").attr("src", ui.draggable.attr("src"));
						$("#sport").fadeIn("slow");
					}
				});
			});
</script>

<!-- 細項:jQuery帶出圖 http://jsfiddle.net/8VY52/249/ -->

</head>
<body>
	<div id="wrapper">

		<!-- Header -->
		<header id="header">
			<h1>
				<a href="#">Life Editor</a>
			</h1>
			<nav class="links">
				<ul>
					<li><a href="userPage.jsp">目標</a></li>
					<li><a href="#">行事曆</a></li>
					<li><a href="#">朋友</a></li>
					<li><a href="#">關於我</a></li>
				</ul>
			</nav>
			<nav class="main">
				<!-- 							<ul> -->
				<%-- 							<c:choose> --%>
				<%-- 						    	<c:when test="${ ! empty FbPicture }"> --%>
				<%-- 						    			<img src="${FbPicture}"></img> --%>
				<%-- 								</c:when> --%>
				<%-- 							<c:otherwise> --%>
				<!-- 								<img height='40px' width='30px' src="HomeGetPicture"> -->
				<%-- 							</c:otherwise>  --%>
				<%-- 					</c:choose> --%>
				<%-- 				  <a href="<c:url value='/logout_index.jsp' />" "   onclick="javascript:logout();"> 登出 </a>     --%>


				<!-- 								<li class="search"> -->
				<!-- 									<a class="fa-search" href="#search">Search</a> -->
				<!-- 									<form id="search" method="get" action="#"> -->
				<!-- 										<input type="text" name="query" placeholder="Search" /> -->
				<!-- 									</form> -->
				<!-- 								</li> -->

				<!-- 								<li class="menu"> -->
				<!-- 									<a class="fa-bars" href="#menu">Menu</a> -->
				<!-- 								</li> -->
				<!-- 							</ul> -->
			</nav>
		</header>
		<!-- Main -->
		<article class="set_goal">

			<div style="text-align: center; margin: 10px 10px 50px 10px;">
				<h1>步驟一 : 請將你想要完成的目標類型拖曳到下方的類別圓圈裡</h1>
			</div>

			<div class="type_list"
				style="text-align: center; margin: 10px 10px 50px 100px;">
				<!-- 				<div> -->
				<!-- 					<img id="type1" class="type" src="type.typePic" alt="typeName"> -->
				<!-- 				</div> -->
				<!-- 				<div> -->
				<!-- 					<img id="type2" class="type" src="images/type2.png" alt="藝術"> -->
				<!-- 				</div> -->
				<!-- 				<div> -->
				<!-- 					<img id="type3" class="type" src="images/type3.png" alt="運動"> -->
				<!-- 				</div> -->
				<!-- 				<div> -->
				<!-- 					<img id="type4" class="type" src="images/type4.png" alt="教育"> -->
				<!-- 				</div> -->
				<!-- 				<div> -->
				<!-- 					<img id="type5" class="type" src="images/type5.png" alt="旅遊"> -->
				<!-- 				</div> -->
				<!-- 				<div> -->
				<!-- 					<img id="type6" class="type" src="images/type6.png" alt="娛樂"> -->
				<!-- 				</div> -->
				<!-- 				<div> -->
				<!-- 					<img id="type0" -->
				<!-- 						style="width: 120px; height: 120px; padding: 5px; float: left; margin: 0 10px 10px 10px;" -->
				<!-- 						src="images/type0.png" alt="自訂"> -->
				<!-- 				</div> -->
			</div>

			<div id="set">
				<div style="position: relative">
					<img id="1" class="goal" src="images/goal.png">
					<div id="sport" class="sec_list">
						<img style="width: 500px; height: 380px;"
							src="images/sport_list.png">
					</div>
				</div>
				<div>
					<img id="2" class="goal" src="images/sec.png">
				</div>
				<div>
					<img id="3" class="goal" src="images/detail.png">
				</div>
				<div>
					<img id="4" class="goal" src="images/confirm.png">
				</div>
			</div>


		</article>
	</div>


</body>

</html>