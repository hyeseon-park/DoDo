package dao;

public interface AlarmDao {
	
	public int insertAlarm(int memberTo, int memberFrom, int pNum);
	public int deleteAlarm(int aNum);
	public int deleteAlarmByPNum(int pNum);

}
