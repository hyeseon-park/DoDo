package model;

public class Alarm {
	
	int aNum;
	int aMemberTo;
	int aMemberFrom;
	int pNum;
	String mId;
	String pTitle;
	
	public int getaNum() {
		return aNum;
	}
	public void setaNum(int aNum) {
		this.aNum = aNum;
	}
	public int getaMemberTo() {
		return aMemberTo;
	}
	public void setaMemberTo(int aMemberTo) {
		this.aMemberTo = aMemberTo;
	}
	public int getaMemberFrom() {
		return aMemberFrom;
	}
	public void setaMemberFrom(int aMemberFrom) {
		this.aMemberFrom = aMemberFrom;
	}
	public int getpNum() {
		return pNum;
	}
	public void setpNum(int pNum) {
		this.pNum = pNum;
	}	
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	public String getpTitle() {
		return pTitle;
	}
	public void setpTitle(String pTitle) {
		this.pTitle = pTitle;
	}
	
	@Override
	public String toString() {
		return "Alarm [aNum=" + aNum + ", aMemberTo=" + aMemberTo + ", aMemberFrom=" + aMemberFrom + ", pNum=" + pNum
				+ ", mId=" + mId + ", pTitle=" + pTitle + "]";
	}
	
}
