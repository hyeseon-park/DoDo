<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script>

var sock;
var stompClient;
var msgInfo;

$(function(){
	
	socketConnect(); // websocket 연결
	getAlarmList(); // alarm list 조회 및 그리
	alarmContainerDisplay(); // alarm_btn 클릭시 alarmlist show(), hide()
	
});




function socketConnect(){
	sock = new SockJS("/alarm");
	stompClient = Stomp.over(sock);
	stompClient.connect({},function(){
		stompClient.subscribe("/category/invite/"+${member.mNum}, function(alarm){
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
			if(alarmList!=""){
				
				$(".numberOfAlarm").append(alarmList.length);
				$(".numberOfAlarm").show();
				$.each(alarmList,function(idx,alarm){
					drawAlarmList(alarm);
				});				
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
	var acceptBtn = $("<button class='alarm_accept_btn' onclick='location.href=\"${contextPath}/project/acceptInvite?aNum="+alarm.aNum+"&pNum="+alarm.pNum+"&mNum="+alarm.aMemberTo+"\"'>수락</button>");
	var rejectBtn = $("<button class='alarm_reject_btn' onclick='location.href=\"${contextPath}/project/rejectInvite?aNum="+alarm.aNum+"\"'>거절</button>");
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
	
	<div class="alarm_info_container">
	</div>
	
</div>
