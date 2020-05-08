<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/inc/head.jsp" %>
<title>todoMain</title>
<link rel="stylesheet" type="text/css" href="${contextPath}/css/todo.css"/>
<body>
	<%@ include file="/WEB-INF/jsp/inc/header.jsp"%>
	<div class="container">
		<div class="todo_container">
			<input class="todo_project_btn" type="button" value="프로젝트 메인" onclick="location.href='../project/main'">
			
			<div class="todo_progress">
				<span>Progress</span>
				<progress class="todo_progress_bar" value="${progress}" max="100"></progress>
			</div>
			
			<c:forEach items="${todoMap}" var="todoMap" varStatus="status">
				<div class="todo_inner_container">
					<span class="todo_id">${todoMap.key}</span>
					<input class="todo_add_btn" type="button" value="+" onclick="location.href='todoAddForm'">			
					
					<c:forEach items="${todoMap.value}" var="todoValue">
						<div class="todo_inner_inner_container">
							<div class="todo_main_btn">
								<div class="todo_modify_btn" onclick="location.href='todoModifyForm?tNum=${todoValue.tNum}'">
									<i class="fas fa-pencil-alt"></i>
								</div>
								<div class="todo_remove_btn"onclick="location.href='removeTodo?tNum=${todoValue.tNum}'">
									<i class="far fa-times-circle"></i>
								</div>
							</div>
							
							<p class="todo_main_title">${todoValue.tTitle}</p>
							<p class="todo_main_desc">${todoValue.tDesc}</p>
							
							<div class="todo_complete" data-tNum="${todoValue.tNum}" data-tIsComplete="${todoValue.tIsComplete}" onclick="checkComplete(${todoValue.tNum})">
								<p>Complete</p>
							</div>
							<input type="hidden" value="${todoValue.tIsComplete}">
								
							<script>
								$(function() {
									$(".todo_complete[data-tIsComplete=1]").css({
										color: "#25C87C",
										borderColor: "#25C87C"
									});
									$(".todo_complete[data-tIsComplete=0]").css({
										color: "#D1FCE9",
										borderColor: "#D1FCE9"
									});
								})
								function checkComplete(tNum) {
									var tIsCompleteDiv = $(".todo_complete[data-tNum="+tNum+"]");
									$.ajax({
										url : "${contextPath}/todo/getCompleteProgress",
										data : {"tNum" : tNum},
										dataType : "json",
										success : function(progressMap) {
											var tIsComplete = progressMap.tIsComplete;
											var progress = progressMap.progress;
											if(tIsComplete==1) {
												tIsCompleteDiv.css({color:"green"});
											} else {
												tIsCompleteDiv.css({color:"red"});
											}
											$(".todo_progress_bar").val(progress);
										}
									})
								}
							</script>
							
						</div>
					</c:forEach>
				</div>
			</c:forEach>
		</div>
	</div>
</body>