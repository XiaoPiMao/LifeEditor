<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改個人資料</title>
</head>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>

<script src="https://code.jquery.com/jquery-2.2.4.js" integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI="   crossorigin="anonymous"></script>

<style>
#div1{
margin: auto;
width:1000px;  
}
label{
font-size:14pt;
}
span{
font-size:12pt;
color:red;
float: right;;
}
</style>
<body>
<div id="div1" class="container-fluid">
	<div class="row">
		<div class="col-md-6">
		<div>
		<img width="300px" src="getPicture.do" >
		</div>
		<div style="font-size:16pt" class="form-group">
		<label>帳號</label>
		<p>${user_specVO.account}</p>
		</div>
		
		
		<div>
		<label>預覽大頭貼</label><br>
        <img class="preview" style="max-width: 450px; max-height: 400px;">
        <div class="size"></div>
		</div>
		
</div>
		<div class="col-md-6">
	<FORM METHOD="post" ACTION="user_spec.do" name="form1" enctype="multipart/form-data">
	<div class="form-group">
		<label for="exampleInputlastName">姓氏</label>
		<input type="TEXT" class="form-control" id="exampleInputlastName" name="lastName" value="${user_specVO.lastName}" size="22"><span>&nbsp&nbsp&nbsp${errorMsgs.errorlastName}</span>
	</div>
	<div class="form-group">
		<label for="exampleInputfirstName">姓名</label>
		<input type="TEXT" class="form-control" id="exampleInputfirstName" name="firstName" value="${user_specVO.firstName}" size="22" /><span>&nbsp&nbsp&nbsp${errorMsgs.errorfirstName}</span>
	</div>
	<div class="form-group">
		<label for="exampleInputgender">性別</label><br>
		<input  id="exampleInputgender" type="radio" name="gender" value="M" size="22" CHECKED />男
		<input  id="exampleInputgender" type="radio" name="gender" value="F" size="22" />女
		<span>&nbsp&nbsp&nbsp${errorMsgs.errorgender}</span>
	</div>
	<div class="form-group">
		<label for="exampleInputbirthdate">生日</label>
		<input type="date" class="form-control" id="exampleInputbirthdate" name="birthdate" value="${user_specVO.birthdate}" size="22"  /><span>&nbsp&nbsp&nbsp${errorMsgs.errorbirthdate}</span>
	</div>
	<div class="form-group">
		<label for="exampleInputemail">電子信箱</label>
		<input type="TEXT" class="form-control" id="exampleInputemail" name="email" value="${user_specVO.email}" size="22"  /><span>&nbsp&nbsp&nbsp${errorMsgs.erroremail}</span>
	</div>
	<div class="form-group">
		<label for="exampleInputaddress">住址</label>
		<input type="TEXT" class="form-control" id="exampleInputaddress" name="address" value="${user_specVO.address}" size="22"  /><span>&nbsp&nbsp&nbsp${errorMsgs.erroraddress}</span>
	</div>
	<div class="form-group">
		<label  for="exampleInputphone">電話號碼</label>
		<input type="TEXT"  class="form-control" id="exampleInputphone" name="phone" value="${user_specVO.phone}" size="22"  /><span>&nbsp&nbsp&nbsp${errorMsgs.errorphone}</span>
	</div>
	<div class="form-group">
		<label for="exampleInputpicture">更新大頭貼</label>
		<input type="file" id="exampleInputpicture" class="upl" name="picture" size="22"  /><span>&nbsp&nbsp&nbsp${errorMsgs.errorpicture}</span>
	</div>
<br>
<div >
<input type="hidden" name="action" value="update">
<input type="submit" class="btn btn-default" value="送出新增"><span>&nbsp&nbsp&nbsp${errorMsgs.errorCaptcha}</span>
</div>
</FORM>
		</div>
	</div>
</div>

<script>
$(function (){
	 
    function format_float(num, pos)
    {
        var size = Math.pow(10, pos);
        return Math.round(num * size) / size;
    }
 
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
 
    $("body").on("change", ".upl", function (){
        preview(this);
    })
    
})
</script>
</body>
</html>