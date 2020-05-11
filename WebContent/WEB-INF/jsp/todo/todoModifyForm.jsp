<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/inc/head.jsp" %>
<title>todoModifyForm</title>
<link rel="stylesheet" type="text/css" href="${contextPath}/css/todoForm.css"/>
<body>
	<%@ include file="/WEB-INF/jsp/inc/header.jsp"%>
	<div class="container">
		<div class=todo_modifyform_container>
			<form action="modifyTodo" method="post">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
				<input type="hidden" name="tNum" value="${todo.tNum}">
				<input type="hidden" name="pNum" value="${todo.pNum}">
				<div class="todo_title">
					<p>Title</p>
					<input type="text" name="tTitle" value="${todo.tTitle}">
				</div>
				<div class="todo_desc">
					<p>Description</p>
					<textarea rows="3" cols="20" name="tDesc" class="todo_desc_textarea">${todo.tDesc}</textarea>
				</div>
				
				<script>
					$('.todo_desc_textarea').on('keyup', function() {
						if($(this).val().length > 30) {
							alert("글자수는 30자 이내로 제한됩니다.");
							$(this).val($(this).val().substring(0, 30));
						}
					});
				</script>
				
				<div class="todo_mnum">			
					<p>Who</p>
					<div>
						<c:forEach items="${projectMemberList}" var="pmList">
							<c:choose>
								<c:when test="${pmList.mNum eq mNum}">
									<div class="todo_mid mid_checked" onclick="checkMember(this)">
										<p>${pmList.mId}</p>
										<input type="radio" value="${pmList.mNum}" name="mNum" style="display: none;">
									</div>
								</c:when>
								<c:otherwise>
								
									<div class="todo_mid" onclick="checkMember(this)">
										<p>${pmList.mId}</p>
										<input type="radio" value="${pmList.mNum}" name="mNum" style="display: none;">
									</div>
								</c:otherwise>
							</c:choose>
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
					<input type="submit" value="EDIT">
				</div>
			</form>
		</div>
	</div>
</body>