<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<jsp:useBean id="trgSvc" class="com.lifeeditor.service.TargetSpecService" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <title>jQuery UI Dialog - Animation</title>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
  <link rel="stylesheet" href="/resources/demos/style.css">
  
  <style>
  
  .alert
{
    font-size: 1.3em;
    padding: 1em;
    text-align: center;
    white-space: nowrap;
    width: auto;
    word-wrap: normal;
}
  
  </style>
  
  
  <script>
  $(function() {
    $( "#dialog" ).dialog({
      autoOpen: false,
      resizable: false,
      modal: true,
      show: {
        effect: "blind",
        duration: 400
      },
      buttons: {
          "確定送出": function() {
            $( this ).dialog( "close" );
          },
          Cancel: function() {
            $( this ).dialog( "close" );
          }
        },
      hide: {
        effect: "explode",
        duration: 100
      }
    });
 
    $( "#opener" ).click(function() {
      $( "#dialog" ).dialog( "open" );
    });
  });
  
  
  
  
  
  
  
  
  window.alert = function(message){
	    $(document.createElement('div'))
	        .attr({title: 'Alert', 'class': 'alert'})
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
  
  
	function myFunction() {
	    alert("I am an alert box!");
	}
  
  </script>
</head>
<body>
 

<div id="dialog" title="是否確認送出?">
  <p>一旦確認承接後，便無法在此頁面取消這項挑戰! 您是否確定要接受這項挑戰嗎?</p>
</div>
 
<button id="opener">點擊測試</button>
<button onclick="myFunction()">Try it</button>

</body>
</html>