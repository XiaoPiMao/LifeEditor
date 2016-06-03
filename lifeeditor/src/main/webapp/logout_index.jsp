<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<%
  session.invalidate();
%>
<head>
<script>
window.location.href = "${ctx}"
</script>
</head>
<body>
</body>
</html>
