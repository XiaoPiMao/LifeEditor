<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<link rel="stylesheet" href="css/main.css" />
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery-ui.js"></script>

<style>
.background{
position:fixed;
left:0px;
top:0px;
width:100vw;
height:100vh;
background-color:black;
z-index:1000000000;
opacity:0.5;
display:none; 
}

input[type="file"] {
	padding: 5px 15px;
	border: 2px #00008b solid;
	cursor: auto -webkit-border-radius: 5px;
	border-radius: 5px;
	font-family:Microsoft JhengHei;
}

input[type="text"] {
	padding: 5px 15px;
	border: 2px #00008b solid;
	cursor: auto -webkit-border-radius: 5px;
	border-radius: 5px;
	font-family:Microsoft JhengHei;
}

textarea {
	padding: 5px 15px;
	border: 2px #00008b solid;
	cursor: auto -webkit-border-radius: 5px;
	border-radius: 5px;
	width: 600px;
	font-family:Microsoft JhengHei;
	margin:10px 0 10px 0;
}

label{
font-family:Microsoft JhengHei;
font-size:22px;

}
.camera{
background-image: url("images/Flat-Camera-Icon.png");
width:60px;
height:60px;
}

.camera input{
display:block;
opacity:0;
width:60px;
height:60px;
overflow:hidden;
}
</style>

<script>
$(function() {
    
 
    $( "#opener" ).click(function() {
    	$('input[type="hidden"]').val(152);
    	$('.background').show();
    	$("#inputSpec").fadeIn("slow");
    });
    
    function preview(input) {
		 
	    if (input.files && input.files[0]) {
	        var reader = new FileReader();
	        
	        reader.onload = function (e) {
	            $('.preview').attr('src', e.target.result);
	        }

	        reader.readAsDataURL(input.files[0]);
	    }
	}
	
	
	$("body").on("change", "input[name='insert_targetPic']", function (){
	    preview(this);
	})
	
	$("#postBtn").click(function(){
		
		var myForm = document.querySelector("#inputSpec>form");
		var postData = new FormData(myForm);
		postData.append("action","Target_Spec_insert");
		 $.ajax(
		{
			url : "target_Spec/Target_specServlet.do",
			type: "POST",
			data : postData,
       		processData: false,
			contentType: false,
            success:function(data) 
            {
			},
		});
		
	})
	
	
	
  });
</script>

</head>
<body>
<div id="inputSpec" style="position:fixed;z-index:1000000001;left:calc(50vw - 300px);top:50px;display:none;width:auto;height:auto;background-color:white;border-radius:2%;">
    <form style="padding:20px 20px 20px 20px;" ENCTYPE="multipart/form-data" method="POST" action="Target_specServlet.do" role="form">
		 <input type="hidden" name="input_trgetID" value="" />
		 <div >
         <img class="preview" style="width: 580px; height: 380px;">
         <div class="size"></div>
         </div>	
		<textarea cols="60" rows="5" name="input_target_Note"></textarea>
		<br /> 
		    <div class="camera"><input type="file" name="insert_targetPic" /></div>
		<br /> 
		 <div>
         <input value="發佈" type="button" id="postBtn" style="font-size:20px;font-family:Microsoft JhengHei;border-radius:10%;width:150px;height:90px;float:right;">
         <input value="送出審合" type="button" id="checkBtn" style="font-size:20px;display:none;font-family:Microsoft JhengHei;border-radius:10%;width:150px;height:90px;float:right;">
         
	     </div>
	</form>
</div>
 
 
 
<button id="opener" style="position:fixed;">上傳心得</button>
  
<div class="background"></div>
</body>
</html>