package dao;

import java.util.List;

import model.Alarm;

public interface AlarmDao {
	
	public int insertAlarm(Alarm alarm);
	
	public int deleteAlarm(int aNum);
	
	public int deleteAlarmByPNum(int pNum);
	
	public int deleteProjectAlarmByMemeberTo(int pNum, int aMemberTo);
	
	public List<Alarm> selectAlarmByPNum(int pNum);
	
	public List<Alarm> selectAlarmList(int aMemberTo);

}
