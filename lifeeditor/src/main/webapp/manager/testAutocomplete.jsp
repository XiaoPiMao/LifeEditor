<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta charset="utf-8">
  <title>jQuery UI Autocomplete - Remote JSONP datasource</title>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
  <style>
  .ui-autocomplete-loading {
    background: white url("http://www.guiza.net/fotos/wp-content/plugins/nextgen-gallery/admin/css/images/ui-anim_basic_16x16.gif") right center no-repeat;
  }
  #city { width: 25em; }
  #tags { width: 15em; }
  </style>
  <script>
  $(function() {
    function log( message ) {
      $( "<div>" ).text( message ).prependTo( "#log" );
      $( "#log" ).scrollTop( 0 );
    }
 
    $( "#city" ).autocomplete({
      source: function( request, response ) {
        $.ajax({
          url: "http://gd.geobytes.com/AutoCompleteCity",
          dataType: "jsonp",
          data: {
            q: request.term
          },
          success: function( data ) {
            response( data );
          }
        });
      },
      minLength: 3,
      select: function( event, ui ) {
        log( ui.item ?
          "Selected: " + ui.item.label :
          "Nothing selected, input was " + this.value);
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
  
  
  
  
  
  
  
  
  
  
  
  <script>
  $(function() {
    function log( message ) {
       $( "<div>" ).text( message ).prependTo( "#textarea1" );
      $( "#textarea1" ).scrollTop( 0 );
    }
 
    $( "#tags" ).autocomplete({
      source: function( request, response ) {
        $.ajax({
          url: "${ctx}/ChallengeServlet",
          dataType: "text",
          data: {"keyword": $("#tags" ).val()},
          success: function( data ) {
        	  
        	  
        	  var res = new Array();
        	  var targets = JSON.parse(data);
        	  
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
        log( ui.item ?
          "Selected: " + ui.item.label :
          "Nothing selected, input was " + this.value);
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
  
 
  
</head>
<body>
 
<div class="ui-widget">
  <label for="city">城市搜尋: </label>
  <input id="city">
</div>
 
<div class="ui-widget" style="margin-top:2em; font-family:Arial">
  結果:
  <div id="log" style="height: 200px; width: 300px; overflow: auto;" class="ui-widget-content"></div>
</div>
 
 <div class="ui-widget">
 <label for="challenge">
挑戰名稱:</label>
 <input id="tags" type="text" name="Challenge">
 </div>
 
 <div class="ui-widget" style="margin-top:2em; font-family:Arial">
  結果:
  <div id="textarea1" style="height: 200px; width: 300px; overflow: auto;" class="ui-widget-content"></div>
</div>
 
 
</body>
</html>