<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>todoMain</title>
</head>
<body>
	<form action="addTodo" method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		Title<input type="text" name="tTitle">
		Description<input type="text" name="tDesc">
		Start Date<input type="date" name="tStartDate">
		End Date<input type="date" name="tEndDate">
		Is Complete<input type="number" name="tIsComplete">
		mNum<input type="number" name="mNum">
		pNum<input type="number" name="pNum">
		<input type="submit" value="추가">
	</form>
</body>
</html>