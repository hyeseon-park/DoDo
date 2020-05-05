<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>todoAddForm</title>
</head>
<body>
	<form action="addTodo" method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		제목<input type="text" name="tTitle">
		설명<input type="text" name="tDesc">
		누가<input type="number" name="mNum">
<!-- 		시작날짜<input type="text" name="tStartDate"> -->
<!-- 		종료날짜<input type="text" name="tEndDate"> -->
		<input type="hidden" name="pNum" value="${pNum}">
		<input type="submit" value="추가">
	</form>
</body>
</html>