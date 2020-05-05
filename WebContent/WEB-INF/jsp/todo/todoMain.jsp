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
	<input type="button" value="todo 추가" onclick="location.href='todoAddForm'">
	
	<c:forEach items="${todoMap}" var="todoMap" varStatus="status">
		<div>${todoMap.key}</div>
		<c:forEach items="${todoMap.value}" var="todoValue">
			<div>${todoValue.tTitle}</div>
			<div>${todoValue.tDesc}</div>
			<div>${todoValue.tStartDate}</div>
			<div>${todoValue.tEndDate}</div>
			<input type="button" value="this todo 수정" onclick="location.href='todoModifyForm?tNum=${todoValue.tNum}'">
			<hr>
		</c:forEach>
		<hr>
	</c:forEach>

</body>
</html>