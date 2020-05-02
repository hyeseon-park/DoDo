package model;

import java.util.Date;
import java.util.List;

public class Project {
	
	private int pNum;
	private String pTitle;
	private String pDesc;
	private Date pStartDate;
	private Date pEndDate;
	private List<Member> pMemberList;
	
	public int getpNum() {
		return pNum;
	}
	public void setpNum(int pNum) {
		this.pNum = pNum;
	}
	public String getpTitle() {
		return pTitle;
	}
	public void setpTitle(String pTitle) {
		this.pTitle = pTitle;
	}
	public String getpDesc() {
		return pDesc;
	}
	public void setpDesc(String pDesc) {
		this.pDesc = pDesc;
	}
	public Date getpStartDate() {
		return pStartDate;
	}
	public void setpStartDate(Date pStartDate) {
		this.pStartDate = pStartDate;
	}
	public Date getpEndDate() {
		return pEndDate;
	}
	public void setpEndDate(Date pEndDate) {
		this.pEndDate = pEndDate;
	}
	public List<Member> getpMemberList() {
		return pMemberList;
	}
	public void setpMemberList(List<Member> pMemberList) {
		this.pMemberList = pMemberList;
	}
	
	@Override
	public String toString() {
		return "Proeject [pNum=" + pNum + ", pTitle=" + pTitle + ", pDesc=" + pDesc + ", pStartDate=" + pStartDate
				+ ", pEndDate=" + pEndDate + ", pMemberList=" + pMemberList + "]";
	}

}
