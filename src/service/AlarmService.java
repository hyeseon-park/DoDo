package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import dao.AlarmDao;
import dao.ProjectDao;
import model.Alarm;

@Service
public class AlarmService {

	@Autowired
	AlarmDao alarmDao;
	@Autowired
	ProjectDao projectDao;

	public int addAlarm(Alarm alarm) {
		return alarmDao.insertAlarm(alarm);
	}

	public boolean rejectInviteAlarm(int aNum) {
		return alarmDao.deleteAlarm(aNum) > 0 ? true : false;
	}

	public List<Alarm> getAlarmList(int aMemberTo) {
		return alarmDao.selectAlarmList(aMemberTo);
	}

	@Transactional
	public boolean acceptInviteAlarm(int aNum, int pNum, int mNum) {
		if (projectDao.insertProjectMember(pNum, mNum) > 0) {
			if (alarmDao.deleteAlarm(aNum) > 0) {
				return true;
			}
		}
		return false;
	}

	public List<Alarm> getAlarmListByPNum(int pNum) {
		return alarmDao.selectAlarmByPNum(pNum);
	}

}
