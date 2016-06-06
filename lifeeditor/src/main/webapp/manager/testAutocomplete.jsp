<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet" href="css/bootstrap.min.css">


</head>
<body>

	<div class="container">
		<div class="row">
		    <div class="col-md-3">
		       <div class="list-group">
  <a href="jQueryFirst.html" class="list-group-item">jQueryFirst</a>
  <a href="WritingStyle.html" class="list-group-item">jQueryWritingStyle</a>
  <a href="jQuerySelectors.html" class="list-group-item">jQuerySelectors</a>
  <a href="jQueryDOM.html" class="list-group-item">jQueryDOM</a>
  <a href="jQueryCSS.html" class="list-group-item">jQueryCSS</a>
  <a href="jQueryEach.html" class="list-group-item">jQueryEach</a>
  <a href="jQueryEvent.html" class="list-group-item">jQueryEvent</a>
  <a href="jQueryEffects.html" class="list-group-item">jQueryEffects</a>
  <a href="jQueryAjax.html" class="list-group-item">jQueryAjax</a>
  <a href="jQueryUI.html" class="list-group-item">jQueryUI</a>
  
</div>
		    </div>
		    <div class="col-md-9">
		    <div class="jumbotron">
			<div class="page-header">
				<h3>jQuery DOM</h3>
			</div>
			<!-- 每頁不同的內容從這裡開始 -->
 <a href="jQuerySelectors.html">Selectors</a> | <a href="jQueryFirst.html">First</a> | <a href="http://tw.yahoo.com">YAHOO</a> | <a href="http://www.google.com.tw">Google</a>
    <hr />
    <input type="text" id="txtName" /><input type="button" value="Click" id="buttonClick" disabled /><span id="span1"></span>
    <br />
    <select id="select1">
        <option value="a">Item1</option>
        <option value="b">Item2</option>
        <option value="c" selected>Item3</option>
        <option value="d">Item4</option>
    </select>
    <span id="span2"></span>
    <hr />
    <input type="button" value="check" id="buttonToggle" /><br />
    <input type="checkbox" id="Toggle" />Toggle All<br />
    <input type="checkbox" value="a1" />A1
    <input type="checkbox" value="a2" />A2
    <input type="checkbox" value="a3" />A3
    <input type="checkbox" value="a4" />A4
    <input type="checkbox" value="a5" />A5
    <input type="checkbox" value="a6" />A6
    <hr />
    <h1 id="myH">write less, do more</h1>




		<!-- Site footer -->
		<footer class="footer">
			<p>&copy; IIIEDU</p>
		</footer>

	</div>
	<!-- /container -->


	<script src="js/jquery-1.12.3.min.js"></script>
	<script src="js/bootstrap.min.js"></script>

	<script>
    $(function () {
        var myName = $('#txtName');
        myName.val('guest'); //寫入

        $('#buttonClick').click(function () {

           var txt = myName.val(); //讀取

          $('#span1').text("<h2>Hello " + txt + "</h2>");  //寫入

           console.log($('#span1').html()); //讀取
            
        });


        $('#select1').change(function(){

 		   var sel = $('#select1>:selected');

          var v = sel.val();  //var v = $(this).val();
          var t = sel.text();
          var i = sel.index();
 		   
 		   $('#span2').text(i + "," + v + "," + t);

 	   });




 $('#Toggle').change(function(){	 
	 //this vs $(this)	 
	 var b = $(this).prop('checked');
	 $(':checkbox').prop('checked',b);
 });

        $('#buttonToggle').click(function () {
            //切換所有checkbox的勾選狀態
            
            //切換各自checkbox的勾選狀態
//             $(':checkbox').each(function(){
//             	var b = !$(this).prop('checked');
//             	$(this).prop('checked',b);
//             });
            
            //用console.log顯示有被勾選checkbox的value
            $(':checkbox[id!="Toggle"]').each(function(){
            	if($(this).prop('checked')){
            	    console.log($(this).val()); 
            	}
            })
            
        });

        


    });
</script>


</body>

</html>