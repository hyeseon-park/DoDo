<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/inc/head.jsp" %>
<title>todoAddForm</title>
<link rel="stylesheet" type="text/css" href="${contextPath}/css/todo.css"/>
<body>
	<%@ include file="/WEB-INF/jsp/inc/header.jsp"%>
	<div class="container">
		<div class="todo_addform_container">
			<form action="addTodo" method="post">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
				<div class="todo_title">
					<p>제목</p>
					<input type="text" name="tTitle">
				</div>
				<div class="todo_desc">
					<p>설명</p>
					<textarea rows="3" cols="20" name="tDesc"></textarea>
				</div>
				<div class="todo_mnum">			
					<p>누가</p>
					<div>
						<c:forEach items="${projectMemberList}" var="pmList">
							<div class="todo_mid" onclick="checkMember(this)">
								<p>${pmList.mId}</p>
								<input type="radio" value="${pmList.mNum}" name="mNum" style="display: none;">
							</div>
							
							<script>
								function checkMember(member) {
									let $checkInput = $(member).find("input[type='radio']");
									
									$checkInput.prop('checked', function() {
										$(".todo_mid").removeClass("mid_checked");
										$checkInput.prop('checked', true);
										$(member).addClass("mid_checked");
									});
								}
							</script>
							
						</c:forEach>
					</div>
				</div>
				<div class="todo_btn_div">
					<input type="hidden" name="pNum" value="${pNum}">
					<input type="submit" value="추가">
				</div>
			</form>
		</div>
	</div>
</body>