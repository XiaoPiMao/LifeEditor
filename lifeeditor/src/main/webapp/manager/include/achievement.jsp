<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
						class="com.lifeeditor.service.AchievementService" /> <!--**************實際上只需要用到這一行↓ ********************************-->
					<b>獎項名稱: </b> <input id="tag2" type="text" name="achName">
					<!--*************這是暫時顯示有哪些選項的EL ↓ *****************************-->
					<select id="achName" name="achName" size="1" class="trophy">
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


					</div> <br /> <br /> <br /> <br /> <br /> <br /> <input type="file"
					id="file1" name="rewardPic" accept="image/*"
					onchange="fileViewer()" /></td>
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
					form="myForm" class="opt"></select> &nbsp;&nbsp;&nbsp;&nbsp; 難易度: <select
					id="difficulty" name="difficulty" form="myForm">
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
					for="to">結束於:</label> <input type="text" id="to" name="timeFinish"
					readonly></td>
				<td><textarea id="textarea2" rows="3" cols="50" form="myForm"
						name="achDesc">獎杯描述...</textarea></td>
			</tr>

		</table>
	</form>
	&nbsp;&nbsp;&nbsp;&nbsp;
	<button id="butt_insert" style="display: none">新增</button>
	&nbsp;&nbsp;&nbsp;&nbsp;
	<button id="butt_update" style="display: none">更新內容</button>
</div>

