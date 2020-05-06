package model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

public class Project {
	
	private int pNum;
	private String pTitle;
	private String pDesc;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date pStartDate;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date pEndDate;
	private double pProgress;
	
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
	public double getpProgress() {
		return pProgress;
	}
	public void setpProgress(double pProgress) {
		this.pProgress = pProgress;
	}
	@Override
	public String toString() {
		return "Project [pNum=" + pNum + ", pTitle=" + pTitle + ", pDesc=" + pDesc + ", pStartDate=" + pStartDate
				+ ", pEndDate=" + pEndDate + ", pProgress=" + pProgress + "]";
	}
}
