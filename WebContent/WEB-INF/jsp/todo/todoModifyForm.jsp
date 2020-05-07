<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/inc/head.jsp" %>
<title>todoModifyForm</title>
<link rel="stylesheet" type="text/css" href="${contextPath}/css/todo.css"/>
<body>
	<%@ include file="/WEB-INF/jsp/inc/header.jsp"%>
	<div class="container">
		<div class="todo_modifyform_container">
			<form action="modifyTodo" method="post">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
				<input type="hidden" name="tNum" value="${todo.tNum}">
				<input type="hidden" name="pNum" value="${todo.pNum}">
				<div class="todo_title">
					<p>제목</p>
					<input type="text" name="tTitle" value="${todo.tTitle}">
				</div>
				<div class="todo_desc">
					<p>설명</p>
					<input type="text" name="tDesc" value="${todo.tDesc}">
				</div>
				<div class="todo_mnum">			
					<p>누가</p>
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
				</div>
				<div class="todo_btn_div">
					<input type="submit" value="수정">
				</div>
			</form>
		</div>
	</div>
</body>