<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css"
	integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r"
	crossorigin="anonymous">



<style>
input[type="file"] {
	padding: 5px 15px;
	border: 2px #00008b solid;
	cursor: auto -webkit-border-radius: 5px;
	border-radius: 5px;
}

input[type="text"] {
	padding: 5px 15px;
	border: 2px #00008b solid;
	cursor: auto -webkit-border-radius: 5px;
	border-radius: 5px;
}

textarea {
	padding: 5px 15px;
	border: 2px #00008b solid;
	cursor: auto -webkit-border-radius: 5px;
	border-radius: 5px;
	width: 600px;
}
</style>
<script>

$(function() {
	function preview(input) {
		 
	    if (input.files && input.files[0]) {
	        var reader = new FileReader();
	        
	        reader.onload = function (e) {
	            $('.preview').attr('src', e.target.result);
	            var KB = format_float(e.total / 1024, 2);
	            $('.size').text("檔案大小：" + KB + " KB");
	        }

	        reader.readAsDataURL(input.files[0]);
	    }
	}
	
	
	$("body").on("change", "input[name='insert_targetPic']", function (){
	    preview(this);
	})
})

</script>
<body>

	<form ENCTYPE="multipart/form-data" method="POST" action="Target_specServlet.do" role="form">
		<input type="hidden" name="input_trgetID" value="" />
				    <textarea cols="80" rows="10" name="input_target_Note"></textarea>
		<br /> 
		<label> 上傳照片 </label> 
		    <input type="file" name="insert_targetPic" style="cursor:pointer;"/>
		<br /> 
			<input type="hidden" name="action" value="Target_Spec_insert"> 
			<input type="submit" class="btn btn-success btn-lg">

       <div>
 	     <label>預覽照片</label><br>
         <img class="preview" style="width:250px; height: 200px;border-radius:10%;">
         <div class="size"></div>
         </div>
	</form>
</body>
</html>

