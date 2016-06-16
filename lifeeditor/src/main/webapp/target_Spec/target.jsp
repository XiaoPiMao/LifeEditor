<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>

<script src="https://code.jquery.com/jquery-2.2.4.js" integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI="   crossorigin="anonymous"></script>

<body>
<style>
input[type="file"]{padding:5px 15px; border:2px #00008b solid;
cursor:pointer;
-webkit-border-radius: 5px;
border-radius: 5px; }

input[type="text"]{padding:5px 15px; border:2px #00008b solid;
cursor:pointer;
-webkit-border-radius: 5px;
border-radius: 5px; }
textarea{padding:5px 15px; border:2px #00008b solid;
cursor:pointer;
-webkit-border-radius: 5px;
border-radius: 5px; }
</style>
	<form ENCTYPE="multipart/form-data" method="POST"action="Target_specServlet.do" role="form">
	<label>請輸入TARGETID</label><br />
		<input type="TEXT" name="input_trgetID" value="請輸入TARGETID" /><br /><br />
		<label>請輸入心得</label><br />
		<textarea style="width: 600px;" cols="80" rows="10"name="input_target_Note"></textarea>
		<br /> 
		<label> 請輸出圖檔 </label> <input type="file"	name="insert_targetPic" /><br /> 
		<input type="hidden" name="action"	value="Target_Spec_insert"> 
		<input type="submit"class="btn btn-success btn-lg">
		
	
	</form>
</body>
</html>

