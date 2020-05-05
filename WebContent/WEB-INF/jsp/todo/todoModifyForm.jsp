<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/inc/head.jsp" %>
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
		<input type="hidden" name="pNum" value="${todo.pNum}">
		제목
		<input type="text" name="tTitle" value="${todo.tTitle}">
		설명
		<input type="text" name="tDesc" value="${todo.tDesc}">
		누가
		<div>
			<c:forEach items="${projectMemberList}" var="pmList">
				<div onclick="checkMember(this)">
					<p>${pmList.mId}</p>
					<input type="radio" value="${pmList.mNum}" name="mNum" style="display: none;">
				</div>
				
				<script>
					function checkMember(member) {
						let $checkInput = $(member).find("input[type='radio']");
						$checkInput.prop('checked', function() {
							$checkInput.prop('checked', true);
						});
					}
				</script>
				
			</c:forEach>
		</div>

		<input type="submit" value="수정">
	</form>
</body>
</html>