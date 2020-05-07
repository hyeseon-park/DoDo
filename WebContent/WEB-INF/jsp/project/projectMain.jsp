<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/inc/head.jsp"%>
<link rel="stylesheet" type="text/css"
	href="${contextPath }/css/header.css" />
<link rel="stylesheet" type="text/css"
	href="${contextPath }/css/projectMain.css" />
<title>projectMain</title>

</head>
<body>
	<%@ include file="/WEB-INF/jsp/inc/header.jsp"%>
	<div class="container">
		<div class="project_list_continer">
			<div class="project_add_btn" onclick="location.href='projectAddForm'">
				<p>
					<i class="fas fa-plus"></i><br>프로젝트를 추가세요!
				</p>
			</div>
			
			<c:forEach items="${projectInfo}" var="projectInfo">

				<div class="project_container">
				
					<div class="project_info">
						<p class="project_title">${projectInfo.projectList.pTitle }</p>
						
						<div class="project_progress">
							<p>
								<span class="title">Project Completed </span><span class="value">${projectInfo.projectList.pProgress } %</span>
							</p>
							<progress value="${projectInfo.projectList.pProgress }" max="100"></progress>
						</div>

						<p class="project_period">
							<span class="title">DeadLine</span> <span class="value"><fmt:formatDate value="${projectInfo.projectList.pEndDate}" pattern="yyyy-MM-dd" /></span>
						</p>

						<div class="project_member_container">
							<p class="title">Project Member</p>
							<div class="project_member_add_btn" onclick="event.cancelBubble=true;location.href='inviteMemberForm?pNum=${projectInfo.projectList.pNum }'">+</div>
							<c:forEach items="${projectInfo.projectMemberList}" var="member" varStatus="status">
								<c:set var="memberId" value="${member.mId }" />
								<div class="project_member">${fn:substring(memberId,0,2) }</div>
							</c:forEach>
						</div>

					</div> <!-- end projectInfo -->

					<div class="project_remove_btn" onclick="event.cancelBubble=true;location.href='exitProject?pNum=${projectInfo.projectList.pNum }'">
						<i class="far fa-times-circle"></i>
					</div>

					<div>
						<div class="project_view_btn" onclick="location.href='../todo/main?pNum=${projectInfo.projectList.pNum }'">View Project</div>
						<div class="project_modify_btn" onclick="location.href='projectModifyForm?pNum=${projectInfo.projectList.pNum }'">Edit Project</div>
					</div>

				</div> <!-- end project_container -->
			</c:forEach>
		</div> 


	</div>


	<c:if test="${empty projectInfo}">
		<p>프로젝트를 추가해주세요!</p>
	</c:if>

</body>
</html>