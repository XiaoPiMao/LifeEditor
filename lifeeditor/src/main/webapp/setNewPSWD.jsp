<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">


  <head>

  </head>
  <style>
  </style>

  <body>
				<form action="ResetPswd.do" method="post">  
				    <span class="error" style="display: block;">${errors.passwordError}</span>  
				    帳號：<input type="text" name="userAccount" value="${param.userAccount}" readonly="readonly"/><br/>     	
				    新密碼：<input type="password" name="newPassword" /><span class="error">${errors.newPassword }</span><br/>  
				    確認新密碼：<input type="password" name="newPassword2"/><span class="error">${errors.newPassword2 }</span><br/>  
				    <input type="submit" value="修改" />  
				</form>  

  </body>
</html>

