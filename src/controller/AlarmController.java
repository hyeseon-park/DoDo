package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import model.Alarm;
import service.AlarmService;

@Controller
@RequestMapping("/alarm")
public class AlarmController {

	@Autowired
	private AlarmService alarmService;

	@ResponseBody
	@RequestMapping(value = "/showAlarmList")
	public List<Alarm> showAlarmList(@RequestParam(value = "mNum") int mNum) {
		return alarmService.getAlarmList(mNum);
	}

	@ResponseBody
	@RequestMapping(value = "/acceptInvite")
	public boolean acceptInvite(@RequestParam(value = "aNum") int aNum, @RequestParam(value = "pNum") int pNum, @RequestParam(value = "mNum") int mNum) {
		return alarmService.acceptInviteAlarm(aNum, pNum, mNum);
	}

	@ResponseBody
	@RequestMapping(value = "/rejectInvite")
	public boolean rejectInvite(@RequestParam(value = "aNum") int aNum) {
		return alarmService.rejectInviteAlarm(aNum);
	}

}
