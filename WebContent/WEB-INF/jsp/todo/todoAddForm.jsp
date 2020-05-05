<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/inc/head.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>todoAddForm</title>
</head>
<body>
	<form action="addTodo" method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		제목
		<input type="text" name="tTitle">
		설명
		<input type="text" name="tDesc">
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
				
		<input type="hidden" name="pNum" value="${pNum}">
		<input type="submit" value="추가">
	</form>
</body>
</html>