<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/inc/head.jsp" %>
<link rel="stylesheet" type="text/css" href="${contextPath }/css/header.css"/>
<title>projectMain</title>

</head>
<body>
	<%@ include file="/WEB-INF/jsp/inc/header.jsp"%>
	<button onclick="location.href='projectAddForm'">프로젝트 생성</button>
	
	<c:if test="${empty projectInfo}">
		<p>프로젝트를 추가해주세요!</p>
	</c:if>

	<ul>
		<c:forEach items="${projectInfo}" var="projectInfo">
			<li style="border: 1px solid black;">
				<button onclick="location.href='../todo/main?pNum=${projectInfo.projectList.pNum }'">todo 이동</button>
				<button onclick="location.href='projectModifyForm?pNum=${projectInfo.projectList.pNum }'">수정</button>
				<button onclick="location.href='exitProject?pNum=${projectInfo.projectList.pNum }'">나가기</button>
				<button onclick="location.href='inviteMemberForm?pNum=${projectInfo.projectList.pNum }'">초대</button>
				<p>${projectInfo.projectList.pNum }</p>
				<p>${projectInfo.projectList.pTitle }</p>
				<p>${projectInfo.projectList.pDesc }</p>
				<p><fmt:formatDate value="${projectInfo.projectList.pStartDate}" pattern="yyyy-MM-dd" /></p>
				<p><fmt:formatDate value="${projectInfo.projectList.pEndDate}" pattern="yyyy-MM-dd" /></p>
				<p style="border: 0.5px dotted gray;">
					<c:forEach items="${projectInfo.projectMemberList}" var="member">
						<span>${member.mId}</span>
					</c:forEach>
				</p>
			</li>
		</c:forEach>
	</ul>
</body>
</html>