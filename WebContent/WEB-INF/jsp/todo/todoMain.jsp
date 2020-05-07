<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/inc/head.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>todoMain</title>
<style type="text/css">

div {border: 1px solid black; margin: 10px}

</style>
</head>
<body>
	<input type="button" value="project 이동" onclick="location.href='../project/main'">
	<input type="button" value="todo 추가" onclick="location.href='todoAddForm'">
	
	<div>
		<progress id="progressBar" value="${progress}" max="100"></progress>
	</div>
	
	<c:forEach items="${todoMap}" var="todoMap" varStatus="status">
		<div>
			<div>${todoMap.key}</div>
			<c:forEach items="${todoMap.value}" var="todoValue">
				<div>
					<p>${todoValue.tTitle}</p>
					<p>${todoValue.tDesc}</p>
					
					<div>
						<div class="tIsComplete" data-tNum="${todoValue.tNum}" data-tIsComplete="${todoValue.tNum}" onclick="checkComplete(${todoValue.tNum})">
							Complete
						</div>
						<input type="hidden" value="${todoValue.tIsComplete}">
						
					</div>
					
					<script>
						function checkComplete(tNum) {
							var tIsCompleteDiv = $(".tIsComplete[data-tNum="+tNum+"]");
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
									$("#progressBar").val(progress);
								}
							})
						}
					</script>
					
					<input type="button" value="this todo 수정" onclick="location.href='todoModifyForm?tNum=${todoValue.tNum}'">
					<input type="button" value="this todo 삭제" onclick="location.href='removeTodo?tNum=${todoValue.tNum}'">
				</div>
			</c:forEach>
		</div>
	</c:forEach>
	
</body>
</html>