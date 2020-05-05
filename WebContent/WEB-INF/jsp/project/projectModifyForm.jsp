<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="modifyProject" method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		<input type="hidden"name="pNum" value="${project.pNum}">	
		<input type="text" name="pTitle" value="${project.pTitle}">
		<input type="text" name="pDesc" value="${project.pTitle}">
		<input type="submit" value="수정">
	</form>


</body>
</html>