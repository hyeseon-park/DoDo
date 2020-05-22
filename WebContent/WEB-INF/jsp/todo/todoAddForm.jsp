<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/inc/head.jsp" %>
<title>DoDo</title>
<link rel="stylesheet" type="text/css" href="${contextPath}/css/todoForm.css"/>
<body>
	<%@ include file="/WEB-INF/jsp/inc/header.jsp"%>
	<div class="container">
		<div class="form_container todo_addform_container">
			<form action="addTodo" method="post">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
				<div class="todo_title">
					<p>Title</p>
					<input type="text" name="tTitle" class="todo_title_input" autocomplete="off">
				</div>
				
				<script>
					$('.todo_title_input').on('keyup', function() {
						if($(this).val().length > 15) {
							alert("글자수는 15자 이내로 제한됩니다.");
							$(this).val($(this).val().substring(0, 30));
						}
					});
				</script>
				
				<div class="todo_desc">
					<p>Description</p>
					<textarea rows="3" cols="20" name="tDesc" class="todo_desc_textarea"></textarea>
				</div>
				
				<script>
					$('.todo_desc_textarea').on('keyup', function() {
						if($(this).val().length > 30) {
							alert("글자수는 30자 이내로 제한됩니다.");
							$(this).val($(this).val().substring(0, 30));
						}
					});
				</script>				
				
				<input type="hidden" value="${mNum}" name="mNum">
				<div class="todo_btn_div">
					<input type="hidden" name="pNum" value="${pNum}">
					<input type="submit" value="ADD">
				</div>
			</form>
		</div>
	</div>
</body>