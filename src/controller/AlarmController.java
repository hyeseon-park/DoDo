package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import model.Alarm;
import service.AlarmService;

@Controller
@RequestMapping("/alarm")
public class AlarmController {
	
	@Autowired
	private AlarmService alarmService;
	@Autowired
	private SimpMessagingTemplate smt;
	
	
	@RequestMapping(value = "/inviteMember", method = RequestMethod.POST)
	public String inviteMember(Alarm alarm) {
		int aNum = alarmService.addAlarm(alarm);
		smt.convertAndSend("/category/invite/"+alarm.getaMemberTo(),alarmService.getAlarm(aNum));
		return "redirect:/project/main";
		
	}
	
	@ResponseBody
	@RequestMapping(value = "/showAlarmList")
	public List<Alarm> showAlarmList(int mNum){
		return alarmService.getAlarmList(mNum);
	}
	
	@ResponseBody
	@RequestMapping(value = "/acceptInvite")
	public boolean acceptInvite(int aNum, int pNum, int mNum) {
		return alarmService.acceptInviteAlarm(aNum, pNum, mNum);
	}
	
	@ResponseBody
	@RequestMapping(value = "/rejectInvite")
	public boolean rejectInvite(int aNum) {
		return alarmService.rejectInviteAlarm(aNum);	
	}


}
