<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/inc/head.jsp" %>
<title>projectMain</title>
</head>
<body>
	<%@ include file="/WEB-INF/jsp/inc/headerProject.jsp"%>
	
	<c:forEach items="${projectList}" var="project">
		<div class="project">
			<p>${project.pNum }</p>
			<p>${project.pTitle }</p>
			<p>${project.pDesc }</p>
			<p>${project.pStartDate }</p>
			<p>${project.pEndDate }</p>
		</div>
	</c:forEach>
</body>
</html>