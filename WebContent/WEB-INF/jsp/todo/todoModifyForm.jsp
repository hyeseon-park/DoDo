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
		<input type="hidden" name="tNum" value="${todo.tNum}">
		제목<input type="text" name="tTitle" value="${todo.tTitle}">
		설명<input type="text" name="tDesc" value="${todo.tDesc}">
		누가<input type="number" name="mNum" value="${todo.mNum}">
<%-- 		시작날짜<input type="text" name="tStartDate" value="${todo.tStartDate}"> --%>
<%-- 		종료날짜<input type="text" name="tEndDate" value="${todo.tEndDate}"> --%>
		<input type="hidden" name="pNum" value="${todo.pNum}">
		<input type="submit" value="수정">
	</form>
</body>
</html>