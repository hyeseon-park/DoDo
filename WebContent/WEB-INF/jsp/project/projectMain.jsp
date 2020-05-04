<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/inc/head.jsp" %>
<title>projectMain</title>
</head>
<body>
	<%@ include file="/WEB-INF/jsp/inc/headerProject.jsp"%>
	<button onclick="location.href='projectForm'">프로젝트 생성</button>
	
	<c:forEach items="${projectList}" var="project">
		<div class="project">
			<button onclick="location.href='projectForm'">수정</button>
			<button onclick="location.href='projectForm'">삭제</button>
			<button onclick="location.href='projectForm'">초대</button>
			<p>${project.pNum }</p>
			<p>${project.pTitle }</p>
			<p>${project.pDesc }</p>
			<p>${project.pStartDate }</p>
			<p>${project.pEndDate }</p>
		</div>
	</c:forEach>
</body>
</html>