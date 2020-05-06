<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/inc/head.jsp" %>
<title>project modify</title>
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
	<form action="modifyProject" method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		<input type="hidden"name="pNum" value="${project.pNum}">	
		프로젝트명<input type="text" name="pTitle" value="${project.pTitle}">
		프로젝트 설명<input type="text" name="pDesc" value="${project.pTitle}">
		시작일<input type="text" name="pStartDate" value="<fmt:formatDate value="${project.pStartDate}" pattern="yyyy.MM.dd" />" class="datepicker pStartDate">
		종료일<input type="text" name="pEndDate" value="<fmt:formatDate value="${project.pEndDate}" pattern="yyyy.MM.dd" />" class="datepicker pEndDate">
		<input type="submit" value="수정">
	</form>


</body>
</html>