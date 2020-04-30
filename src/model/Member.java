package model;


public class Member {
	
	private int mNum;
	private String mId;
	private String mPw;
	
	public int getmNum() {
		return mNum;
	}
	public void setmNum(int mNum) {
		this.mNum = mNum;
	}
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	public String getmPw() {
		return mPw;
	}
	public void setmPw(String mPw) {
		this.mPw = mPw;
	}
	
	@Override
	public String toString() {
		return "Member [mNum=" + mNum + ", mId=" + mId + ", mPw=" + mPw + "]";
	}

}
