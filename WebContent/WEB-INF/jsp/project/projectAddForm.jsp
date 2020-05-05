<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>projectForm</title>
</head>
<body>
	<form action="addProject" method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">	
		<input type="text" name="pTitle">
		<input type="text" name="pDesc">
		<input type="submit" value="생성">
	</form>
</body>
</html>