<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="${contextPath }/css/header.css" />
<script>

var sock;
var stompClient;
var msgInfo;

$(function(){
	socketConnect();
	getAlarmList(); 
	alarmContainerDisplay(); 
});

function socketConnect(){
	sock = new SockJS("/alarm");
	stompClient = Stomp.over(sock);
	stompClient.connect({},function(){
		stompClient.subscribe("/category/invite/"+${member.mNum}, function(){ 
			getAlarmList(); 
		});
	});
}

function getAlarmList(){
	var memberNum = ${member.mNum};
	$.ajax({
		url : "${contextPath}/project/showAlarmList",
		data : {"mNum":memberNum},
		dataType : "json",
		success : function(alarmList){
			$(".alarm_info_container *").remove();
			$(".numberOfAlarm *").remove();
			if(alarmList!=""){
				$(".numberOfAlarm").append("<p>"+alarmList.length+"</p>");
				$(".numberOfAlarm").show();
				$.each(alarmList,function(idx,alarm){drawAlarmList(alarm);});				
			}else{
				$(".numberOfAlarm").hide();
				var alarmInfoContainer = $(".alarm_info_container");
				var noAlarmMsg = $("<div class='no_alarm_info'><i class='fas fa-bell'></i><p>새로운 알람이 없습니다.</p></div>");
				alarmInfoContainer.append(noAlarmMsg);
			}
		}
	});
}

function drawAlarmList(alarm){
	var alarmInfoContainer = $(".alarm_info_container");
	var alarmInfo = $("<div class='alarm_info'>");
	var btnContainer = $("<div class='btn_container'></div>")
	var acceptBtn = $("<button class='alarm_accept_btn' onclick='location.href=\"${contextPath}/project/acceptInvite?aNum="+alarm.aNum+"&pNum="+alarm.pNum+"&mNum="+alarm.aMemberTo+"\"'>accept</button>");
	var rejectBtn = $("<button class='alarm_reject_btn' onclick='location.href=\"${contextPath}/project/rejectInvite?aNum="+alarm.aNum+"\"'>reject</button>");
	var alarmMsg = $("<div class='alarm_msg'>");
	alarmMsg.text(alarm.mId + "님이 " + alarm.pTitle + "에 초대하셨습니다.");
	btnContainer.append(acceptBtn);
	btnContainer.append(rejectBtn);
	alarmInfo.append(alarmMsg);
	alarmInfo.append(btnContainer);	
	alarmInfoContainer.append(alarmInfo);
}

function alarmContainerDisplay(){
	$(".alarm_btn_container").on("click", function(){
		if($(".alarm_info_container").css("display") == 'none') $(".alarm_info_container").show();
		else $(".alarm_info_container").hide();
	});
}

</script>


<div class="header_container">
	<a href="${contextPath}/project/main">
		<img alt="도도 로고 이미지" src="${contextPath}/img/logo.png" height="40px">
	</a>
	<div class="alarm_btn_container">
		<i class="fas fa-bell"></i>	
		<div class="numberOfAlarm"></div>	
	</div>
	<div>
		<form action="${contextPath}/member/logout" method="post">
			<input type="hidden" value="${_csrf.token}" name="${_csrf.parameterName}">
			<button class="sign_out_btn">Sign out</button>
		</form>
	</div>
</div>
