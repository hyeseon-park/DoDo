<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/inc/head.jsp"%>
<link rel="stylesheet" type="text/css" href="${contextPath }/css/header.css" />
<link rel="stylesheet" type="text/css" href="${contextPath }/css/projectAddForm.css" />
<title>Add Project</title>
</head>
<script>
$(function(){
    $( ".datepicker" ).datepicker({
    	dateFormat: 'yy-mm-dd',
        changeMonth: true,
        changeYear: true
    });
});


</script>
<body>
	<%@ include file="/WEB-INF/jsp/inc/header.jsp"%>
	<div class="container">
		<form class="project_add_container" action="addProject" method="post">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			
			<p class="title">Project</p>
			<input class="project_title" type="text" name="pTitle" autocomplete="off">
			
			<p class="title">Description</p>
			<textarea class="project_description" rows="1" cols="1" name="pDesc" autocomplete="off"></textarea>
			
			<p class="title">Period</p>
			<input type="text" name="pStartDate" class="project_start_date datepicker" autocomplete="off"> ~ <input type="text" name="pEndDate" class="project_end_date datepicker" autocomplete="off">
		
			<input class="project_add_btn" type="submit" value="create">
	</form>
	</div>
	
</body>
</html>