<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/inc/head.jsp"%>
<link rel="stylesheet" type="text/css" href="${contextPath }/css/header.css" />
<link rel="stylesheet" type="text/css" href="${contextPath }/css/projectForm.css" />
<title>Add Project</title>
<script type="text/javascript" src="${contextPath}/js/projectForm.js"></script>
</head>

<body>
	<%@ include file="/WEB-INF/jsp/inc/header.jsp"%>
	<div class="container">
		<div class="form_container project_add_container">
			<form class="project_form" action="addProject" method="post">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			
				<p class="title">Project</p>
				<input class="project_title" type="text" name="pTitle" autocomplete="off">
				<p class="check_sentence pTitle_check_sentence">Project can't be blank!</p>
				
				<p class="title">Description</p>
				<textarea class="project_description" rows="1" cols="1" name="pDesc" autocomplete="off"></textarea>
			
				<p class="title">Period</p>
				<input type="text" name="pStartDate" class="project_start_date datepicker" autocomplete="off"> ~ 
				<input type="text" name="pEndDate" class="project_end_date datepicker" autocomplete="off">
				<p class="check_sentence pPeriod_check_sentence">The end date can't be earlier than the start date.</p>
				
				<input class="project_add_btn" type="submit" value="CREATE">
			</form>
		</div>
	</div>
	
</body>
</html>