<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>todoModifyForm</title>
</head>
<body>
	<form action="modifyTodo" method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		tNum<input type="number" name="tNum" value="${todo.tNum }">
		Title<input type="text" name="tTitle" value="${todo.tTitle }">
		Description<input type="text" name="tDesc" value="${todo.tDesc }">
		mNum<input type="number" name="mNum" value="${todo.mNum }">
		pNum<input type="number" name="pNum" value="${todo.pNum }">
		<input type="submit" value="수정">
	</form>
</body>
</html>