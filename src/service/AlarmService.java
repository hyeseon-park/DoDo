package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import dao.AlarmDao;
import dao.ProjectMemberDao;
import model.Alarm;

@Service
public class AlarmService {
	
	@Autowired
	AlarmDao alarmDao;
	@Autowired
	ProjectMemberDao projectMemberDao;
	
	public int addAlarm(Alarm alarm) {
		return alarmDao.insertAlarm(alarm);
	}
	
	public Alarm getAlarm(int aNum) {
		return alarmDao.selectAlarm(aNum);
	}
	
	public List<Alarm> getAlarmList(int aMemberTo){
		return alarmDao.selectAlarmList(aMemberTo);
		
	}
	
	public boolean rejectInviteAlarm(int aNum) {
		return alarmDao.deleteAlarm(aNum) > 0 ? true : false;
	}
	
	@Transactional
	public boolean acceptInviteAlarm(int aNum, int pNum, int mNum) {
		if(projectMemberDao.insertProjectMember(pNum, mNum)>0) {
			if(alarmDao.deleteAlarm(aNum)>0) {
				return true;
			}
		}
		return false;
	}

}
