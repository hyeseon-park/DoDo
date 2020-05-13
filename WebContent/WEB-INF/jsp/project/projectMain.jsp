<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/inc/head.jsp"%>
<link rel="stylesheet" type="text/css" href="${contextPath }/css/projectMain.css" />
<title>Project Main</title>
</head>
<script>
function removeProject(pNum) {
	if(confirm("Are you sure you want to delete it?") == true) {
		location.href = "${contextPath}/project/removeProject?pNum=" + pNum;
	}
}
</script>
<body>
	<%@ include file="/WEB-INF/jsp/inc/header.jsp"%>
	<div class="container">
		<div class="project_list_continer">
			<div class="project_add_btn" onclick="location.href='${contextPath }/project/projectAddForm'">
				<p><i class="fas fa-plus"></i><br>Please create a project!</p>
			</div>

			<c:forEach items="${projectInfoList}" var="projectInfo">
				<div class="project_container">
					<div class="project_info">
						<p class="project_title">${projectInfo.project.pTitle }</p>
						<div class="project_progress">
							<p><span class="title">Project Completed </span><span class="value">${projectInfo.project.pProgress }%</span></p>
							<progress class="project_progress_bar" value="${projectInfo.project.pProgress }" max="100"></progress>
						</div>
						<p class="project_period">
							<span class="title">Project Period</span> 
							<span class="value">
								<c:choose>
									<c:when test="${empty projectInfo.project.pStartDate}">none ~ </c:when>
									<c:otherwise><fmt:formatDate value="${projectInfo.project.pStartDate}" pattern="yyyy-MM-dd" /> ~ </c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${empty projectInfo.project.pEndDate}">none</c:when>
									<c:otherwise><fmt:formatDate value="${projectInfo.project.pEndDate}" pattern="yyyy-MM-dd" /></c:otherwise>
								</c:choose>
							</span>
						</p>
						<div class="project_member_container">
							<p class="title">Project Member</p>
							<div class="project_member_add_btn" onclick="location.href='${contextPath }/project/inviteProjectMemberForm?pNum=${projectInfo.project.pNum }'">+</div>
							<c:forEach items="${projectInfo.projectMemberList}" var="member" varStatus="status">
								<c:set var="memberId" value="${member.mId }" />
								<c:choose>
									<c:when test="${status.index < 5}">
										<div class="project_member">${fn:substring(memberId,0,2) }</div>
									</c:when>
									<c:when test="${status.index eq 5}">
										<div class="project_member"><i class="fas fa-ellipsis-h"></i></div>
									</c:when>
								</c:choose>
							</c:forEach>
						</div>
					</div>
					<div class="project_remove_btn" onclick="removeProject(${projectInfo.project.pNum })">
						<i class="far fa-times-circle"></i>
					</div>
					<div>
						<div class="project_view_btn" onclick="location.href='${contextPath }/todo/main?pNum=${projectInfo.project.pNum }'">View Project</div>
						<div class="project_modify_btn" onclick="location.href='${contextPath }/project/projectModifyForm?pNum=${projectInfo.project.pNum }'">Edit Project</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</body>
</html>