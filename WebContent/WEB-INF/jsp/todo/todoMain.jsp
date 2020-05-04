<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/inc/head.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>todoMain</title>
</head>
<body>
	<input type="button" value="todo 추가" onclick="location.href='todoForm'">

	<c:forEach items="${todoList}" var="todo">
		<div>
			<p>${todo.tNum }</p>
			<p>${todo.tTitle }</p>
			<p>${todo.tDesc }</p>
		</div>
	</c:forEach>

</body>
</html>