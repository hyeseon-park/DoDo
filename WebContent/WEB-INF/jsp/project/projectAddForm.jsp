<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/inc/head.jsp" %>
<title>project create</title>
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
	<%@ include file="/WEB-INF/jsp/inc/headerProject.jsp"%>
	<form action="addProject" method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">	
		프로젝트명<input type="text" name="pTitle">
		프로젝트 설명 <input type="text" name="pDesc">
		시작일<input type="text" name="pStartDate" class="datepicker">
		종료일<input type="text" name="pEndDate" class="datepicker">
		<input type="submit" value="생성">
	</form>
</body>
</html>