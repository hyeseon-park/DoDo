package model;

public class Todo {
	
	private int tNum;
	private String tTitle;
	private String tDesc;
	private int tIsComplete;
	private int mNum;
	private int pNum;
	
	public int gettNum() {
		return tNum;
	}
	public void settNum(int tNum) {
		this.tNum = tNum;
	}
	public String gettTitle() {
		return tTitle;
	}
	public void settTitle(String tTitle) {
		this.tTitle = tTitle;
	}
	public String gettDesc() {
		return tDesc;
	}
	public void settDesc(String tDesc) {
		this.tDesc = tDesc;
	}
	public int gettIsComplete() {
		return tIsComplete;
	}
	public void settIsComplete(int tIsComplete) {
		this.tIsComplete = tIsComplete;
	}
	public int getmNum() {
		return mNum;
	}
	public void setmNum(int mNum) {
		this.mNum = mNum;
	}
	public int getpNum() {
		return pNum;
	}
	public void setpNum(int pNum) {
		this.pNum = pNum;
	}
	
	@Override
	public String toString() {
		return "Todo [tNum=" + tNum + ", tTitle=" + tTitle + ", tDesc=" + tDesc + ", tIsComplete=" + tIsComplete
				+ ", mNum=" + mNum + ", pNum=" + pNum + "]";
	}
	
}
