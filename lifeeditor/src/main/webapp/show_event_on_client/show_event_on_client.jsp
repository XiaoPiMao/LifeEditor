<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.lang.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.lifeeditor.model.event.*"%>
<%@ page import="com.lifeeditor.service.*"%>
<%
       int a=19;

    eventService eventSvc = new eventService();
    
    List<eventVO> ev= eventSvc.getAll();
    eventVO eventVO=eventSvc.getOneevent(a);
    pageContext.setAttribute("event",ev);
    pageContext.setAttribute("eventVO",eventVO);
    String date=eventVO.getEventTime().toString().substring(0, 10); 
           pageContext.setAttribute("date",date);
     
    %>

<jsp:useBean id="targets"
	class="com.lifeeditor.model.target.TargetDAO_JNDI" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
<!-- Optional theme -->
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>

<script src="js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-latest.min.js"></script>

<script type="text/javascript">


$(function(){
	// 先取得必要的元素並用 jQuery 包裝
	// 再來取得 $block 的高度及設定動畫時間
	var $block = $('#abgneBlock'),
		$slides = $('ul.list', $block),
		_width = $block.width(),
		$li = $('li', $slides),
		_animateSpeed = 600;
 
	// 產生 li 選項
	var _str = '';
	for(var i=0, j=$li.length;i<j;i++){
		// 每一個 li 都有自己的 className = playerControl_號碼
		_str += '<li class="playerControl_' + (i+1) + '"></li>';
	}
 
	// 產生 ul 並把 li 選項加到其中
	// 並幫 li 加上 mouseover 事件
	$('<ul class="playerControl"></ul>').html(_str).appendTo($slides.parent()).css('left', function(){
		// 把 .playerControl 移到置中的位置
		return (_width - $(this).width()) / 2;
	}).find('li').mouseover(function(){
		var $this = $(this);
		$this.addClass('current').siblings('.current').removeClass('current');
		// 移動位置到相對應的號碼
		$slides.stop().animate({
			left: _width * $this.index() * -1
		}, _animateSpeed);
 
		return false;
	}).eq(0).mouseover();
});



$(function(){
	// 先取得必要的元素並用 jQuery 包裝
	// 再來取得 $block 的高度及設定動畫時間
	var $block = $('#abgneBlock'),
		$slides = $('ul.list', $block),
		_width = $block.width(),
		$li = $('li', $slides),
		_animateSpeed = 600, 
		// 加入計時器, 輪播時間及控制開關
		timer, _showSpeed = 3000, _stop = false;
 
	// 產生 li 選項
	var _str = '';
	for(var i=0, j=$li.length;i<j;i++){
		// 每一個 li 都有自己的 className = playerControl_號碼
		_str += '<li class="playerControl_' + (i+1) + '"></li>';
	}
 
	// 產生 ul 並把 li 選項加到其中
	var $playerControl = $('<ul class="playerControl"></ul>').html(_str).appendTo($slides.parent()).css('left', function(){
		// 把 .playerControl 移到置中的位置
		return (_width - $(this).width()) / 2;
	});
 
	// 幫 li 加上 click 事件
	var $playerControlLi = $playerControl.find('li').click(function(){
		var $this = $(this);
		$this.addClass('current').siblings('.current').removeClass('current');
 
		clearTimeout(timer);
		// 移動位置到相對應的號碼
		$slides.stop().animate({
			left: _width * $this.index() * -1
		}, _animateSpeed, function(){
			// 當廣告移動到正確位置後, 依判斷來啟動計時器
			if(!_stop) timer = setTimeout(move, _showSpeed);
		});
 
		return false;
	}).eq(0).click().end();
 
	// 如果滑鼠移入 $block 時
	$block.hover(function(){
		// 關閉開關及計時器
		_stop = true;
		clearTimeout(timer);
	}, function(){
		// 如果滑鼠移出 $block 時
		// 開啟開關及計時器
		_stop = false;
		timer = setTimeout(move, _showSpeed);
	});
 
	// 計時器使用
	function move(){
		var _index = $('.current').index();
		$playerControlLi.eq((_index + 1) % $playerControlLi.length).click();
	}
});

</script>

<style>
#abgneBlock {
	width: 940px;
	height: 600px;
	position: relative;
	overflow: hidden;
	border: 1px solid #ccc;
}
#abgneBlock ul.list {
	padding: 0;
	margin:0px auto;
	list-style: none;
	position: absolute;
	width: 9999px;
	height: 100%;
}
#abgneBlock ul.list li {
	float: left;
	width: 940px;
	height: 100%;
	text-align: center;
}
#abgneBlock .list img{
	width: 65%;
	height: 85%;
	border: 0;
	margin:0px auto;
}

#abgneBlock ul.playerControl {
    margin: 0;
    padding: 0;
    
    position: absolute;
    bottom: 5px;
    right: 5px;
    height: 14px;
}
#abgneBlock ul.playerControl li {
	float: left;
	width: 23px;
	height: 14px;
	list-style: disc;
	cursor: pointer;
	margin: 0px 2px;
	background: url(images/rect_ctrl.png) no-repeat 0 0;
}
c ul.playerControl li.current { 
	background-position: -23px 0;
}
#abgneBlock ul.playerControl li {
	float: left;
	width: 10px;
	height: 10px;
	cursor: pointer;
	margin: 0px 2px;
	background: url(images/cir_ctrl.png) no-repeat -10px 0;
}
#abgneBlock ul.playerControl li.current { 
	background-position: 0 0;
}
</style>
<script type="text/javascript">




function showimage(num){
	document.picture.src="/lifeeditor/eventPicServlet?id="+num;
document.location.href='eventShowServlet.do';


}

</script>

<body>




<!-- 將servlet取到的所有值傳到這個網頁，用foreach讀出來之後，將值放入排版的欄位，顯示出來 -->
<!-- Navigation -->


    <!-- Page Content -->
    <div class="container">

        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">近期活動
                    <small></small>
                </h1>
            </div>
        </div>
      
        <div class="row">

            <div class="col-md-8">
                <img name="picture" value="" width="750" height="500"class="img-responsive"src="/lifeeditor/eventPicServlet?id=19"  alt="">
            </div>

            <div class="col-md-4" >
                <h2>${eventVO.eventName}</h2>
                <p>${eventVO.eventDesc}</p>
                <h3>主辦單位：${eventVO.orgAddr}</h3>
                 <h3>活動地點：${eventVO.orgName}</h3>
                 <h3>活動時間：${date}</h3>
                 
                 
            </div>

        </div>
        <!-- /.row -->

        <!-- Related Projects Row -->
        <div class="row">

            <div class="col-lg-12">
                <h3 class="page-header">Related Projects</h3>
            </div>
        
        <div  id="abgneBlock">
        
        <ul class="list">
        <c:forEach var="event" items="${event}" >
            <li>
                <a onclick="showimage(${event.eventID})">
                    <img class="img-responsive portfolio-item"  width="750" height="500"src="/lifeeditor/eventPicServlet?id=${event.eventID}" alt="${event.eventName}">
                </a>
                <h2>${event.eventName}</h2>
             </li>
             
           </c:forEach>
          </ul>
        
        
          </div>
          
        </div>
        <!-- /.row -->

        <hr>

        <!-- Footer -->
        <footer>
            <div class="row">
                <div class="col-lg-12">
                    <p>LifeEditor &copy; LifeEditor 2016</p>
                </div>
            </div>
            <!-- /.row -->
        </footer>

    </div>
    <!-- /.container -->

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    




</body>
</html>