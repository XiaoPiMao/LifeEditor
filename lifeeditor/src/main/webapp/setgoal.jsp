<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>jQuery UI Draggable - Snap to element or grid</title>
<!--   <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"> -->
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<!--   <link rel="stylesheet" href="/resources/demos/style.css"> -->
  <style>
  	
  	
  .draggable { width: 150px; height: 150px; padding: 5px; float: left; margin: 0 10px 10px 0; font-size: .9em; }
  .ui-widget-header p, .ui-widget-content p { margin: 0; }
  #snaptarget { height: 140px; }
  </style>
  <script>
//   var jTypes = JSON.parse('${jTypes}');
  
  $(function() {
// 	document.body.innerHTML = "<img src='data:image/jpg;base64," + jTypes[5].typePic + "'/>"
    $( "#draggable1" ).draggable({ snap: true });
    $( "#draggable2" ).draggable({ snap: ".ui-widget-header" });
    $( "#draggable3" ).draggable({ snap: ".ui-widget-header" });
    $( "#draggable4" ).draggable({ snap: ".ui-widget-header" });
    $( "#draggable5" ).draggable({ snap: ".ui-widget-header", snapMode: "outer" });
    $( "#draggable6" ).draggable({ grid: [ 20, 20 ] });
    $( "#draggable7" ).draggable({ grid: [ 80, 80 ] });
  });
  </script>
</head>
<body>
 
<div id="snaptarget" class="ui-widget-header">
  <p>I'm a snap target</p>
</div>
 
<br style="clear:both">

<img id="draggable1" class="draggable ui-widget-content" src="images/goal_art.jpg" >
<img id="draggable2" class="draggable ui-widget-content" src="images/goal_education.jpg" >
<img id="draggable3" class="draggable ui-widget-content" src="images/goal_finance.jpg" >
<img id="draggable4" class="draggable ui-widget-content" src="images/goal_sport.jpg" >
<img id="draggable5" class="draggable ui-widget-content" src="images/goal_travel.jpg" >
<img id="draggable6" class="draggable ui-widget-content" src="images/goal_happy.jpg" >
<img id="draggable7" class="draggable ui-widget-content" src="images/goal_custom.jpg" >



<!-- <div id="draggable" class="draggable ui-widget-content"></div> -->
<!-- <div id="draggable2" class="draggable ui-widget-content"></div> -->
<!-- <div id="draggable3" class="draggable ui-widget-content"></div> -->
<!-- <div id="draggable4" class="draggable ui-widget-content"></div> -->
<!-- <div id="draggable5" class="draggable ui-widget-content"></div> -->
 
 
</body>
</html>