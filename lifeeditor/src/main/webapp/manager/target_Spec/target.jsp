<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

					<form  ENCTYPE="multipart/form-data"method="POST"action="Target_specServlet.do" role="form">
				
                                   <input type="TEXT"	name="input_trgetID"value="請輸入TARGETID"/><br/>
			  
	
						      
							<textarea style="width: 600px; resize: none;" cols="80" rows="10"name="input_target_Note"></textarea><br/>
						
				<label > 請輸出圖檔 </label>
				
							 <input type="file"	name="insert_targetPic" /><br/>
						<input type="hidden" name="action"value="Target_Spec_insert">
						<input	type="submit" class="btn btn-default">
					</form>
</body>
</html>