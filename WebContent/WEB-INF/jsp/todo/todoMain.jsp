<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/inc/head.jsp" %>
<title>DoDo</title>
<link rel="stylesheet" type="text/css" href="${contextPath}/css/todoMain.css"/>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<body>
	<%@ include file="/WEB-INF/jsp/inc/header.jsp"%>
	<div class="container">
		<input type="hidden" value="${pNum}" class="pNum">
		<div class="todo_container">
			
			<div class="todo_progress">
				<span>Progress : </span>
				<span class="todo_progress_span">${progress}</span>
				<span>%</span>
				<progress class="todo_progress_bar" value="${progress}" max="100"></progress>
			</div>
			
			<c:forEach items="${todoMap}" var="todoMap" varStatus="status">
			
				<div class="todo_inner_container" data-mId="${todoMap.key}">
					<p class="todo_id">${todoMap.key}</p>
					
					<input class="todo_add_btn" type="button" value="+" onclick="location.href='todoAddForm?mId=${todoMap.key}'">			
					
					<ul class="todo_one_member">
					
						<c:forEach items="${todoMap.value}" var="todoValue">
							<li id="${todoValue.tNum}">
								<div class="todo_inner_inner_container">
									<div class="todo_main_btn">
										<div class="todo_modify_btn" onclick="location.href='todoModifyForm?tNum=${todoValue.tNum}'">
											<i class="fas fa-pencil-alt"></i>
										</div>
										<div class="todo_remove_btn" onclick="removeTodo(${todoValue.tNum})">
											<i class="far fa-times-circle"></i>
										</div>
										<script>
											function removeTodo(tNum) {
												if(confirm("Are you sure you want to delete it?") == true) {
													location.href = "removeTodo?tNum=" + tNum;
												}
											}
										</script>
									</div>
									
									<p class="todo_main_title">${todoValue.tTitle}</p>
									<p class="todo_main_desc">${todoValue.tDesc}</p>
									
									<div class="todo_complete" data-tNum="${todoValue.tNum}" data-tIsComplete="${todoValue.tIsComplete}" onclick="checkComplete(${todoValue.tNum})">
										<p><i class="fas fa-check"></i> COMPLETE</p>
									</div>
									<input type="hidden" value="${todoValue.tIsComplete}">
									
									<script>
										$(function() {
											$(".todo_complete[data-tIsComplete=1]").css({
												color: "#25C87C",
												borderColor: "#25C87C"
											});
											$(".todo_complete[data-tIsComplete=0]").css({
												color: "#C0CCC6",
												borderColor: "#C0CCC6"
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
													if(tIsComplete == 1) {
														tIsCompleteDiv.css({color : "#25C87C"});
													} else {
														tIsCompleteDiv.css({color : "#C0CCC6"});
													}
													$(".todo_progress_bar").val(progress);
													$(".todo_progress_span").empty();
													$(".todo_progress_span").append(progress);
												}
											})
										}
									</script>
								</div>
							</li>
						</c:forEach>
					</ul>
					
					<script>
						$(".todo_one_member").sortable({
							update : function(event, ui) {
								var priorityArray = $(this).sortable('toArray');
								var pNum = $(".pNum").val();
								var mId = $(this).parent().attr("data-mId");
								$.ajax({
									url : "${contextPath}/todo/resortTodo",
									data : {"priorityArray" : priorityArray, "pNum" : pNum, "mId" : mId},
								});
							}
						});
					</script>
				</div>
			</c:forEach>
		</div>
	</div>
</body>