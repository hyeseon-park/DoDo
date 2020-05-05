<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="member" value="<%=request.getSession().getAttribute(\"member\")%>" />

<script>

var sock;
var stompClient;
var msgInfo;

$(function(){
	
	socketConnect();
	getAlarmList();
	
});




function socketConnect(){
	sock = new SockJS("/alarm");
	stompClient = Stomp.over(sock);
	stompClient.connect({},function(){
		stompClient.subscribe("/category/invite/"+${member.mNum}, function(alarm){
			$(".alarmArea *").remove();
			getAlarmList();
		})
	});
}




function getAlarmList(){
	$.ajax({
		url : "${contextPath}/project/showAlarmList",
		data : {"mNum":${member.mNum}},
		dataType : "json",
		success : function(alarmList){
			$(".alarmArea *").remove();
			if(alarmList!=""){
				$.each(alarmList,function(idx,alarm){
					drawAlarmList(alarm);
				});				
			}else{
				
			}
		}
	});
}




function drawAlarmList(alarm){
	var alarmArea = $(".alarmArea");
	var alarmInfo = $("<div>");
	var acceptBtn = $("<button onclick='location.href=\"${contextPath}/project/acceptInvite?aNum="+alarm.aNum+"&pNum="+alarm.pNum+"&mNum="+alarm.aMemberTo+"\"'>수락</button>");
	var rejectBtn = $("<button onclick='location.href=\"${contextPath}/project/rejectInvite?aNum="+alarm.aNum+"\"'>거절</button>");
	var alarmMsg = $("<p>");
	alarmMsg.text(alarm.mId + "님이 " + alarm.pTitle + "에 초대하셨습니다.");

	alarmInfo.append(acceptBtn);
	alarmInfo.append(rejectBtn);
	alarmInfo.append(alarmMsg);

	alarmArea.append(alarmInfo);
}



</script>

<div class="projectHeader">
	<div class="alarmArea">
	
	
	</div>
</div>
