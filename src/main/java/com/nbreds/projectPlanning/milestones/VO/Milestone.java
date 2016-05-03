package com.nbreds.projectPlanning.milestones.VO;

public class Milestone {
	private int mno;
	private String mtitle;
	private String mdescription;
	private String mduedate;
	private String mregdate;
	private String mstatement;
	private int pno;
	private int uno;
	
	private int countIssues;
	private int completeIssuePercent;
	
	private String uname;
	private String pname;
	
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public String getMtitle() {
		return mtitle;
	}
	public void setMtitle(String mtitle) {
		this.mtitle = mtitle;
	}
	public String getMdescription() {
		return mdescription;
	}
	public void setMdescription(String mdescription) {
		this.mdescription = mdescription;
	}
	public String getMduedate() {
		return mduedate;
	}
	public void setMduedate(String mduedate) {
		this.mduedate = mduedate;
	}
	public String getMregdate() {
		return mregdate;
	}
	public void setMregdate(String mregdate) {
		this.mregdate = mregdate;
	}
	public String getMstatement() {
		return mstatement;
	}
	public void setMstatement(String mstatement) {
		this.mstatement = mstatement;
	}
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public int getUno() {
		return uno;
	}
	public void setUno(int uno) {
		this.uno = uno;
	}
	
	public int getCountIssues() {
		return countIssues;
	}
	public void setCountIssues(int countIssues) {
		this.countIssues = countIssues;
	}
	public long getCompleteIssuePercent() {
		return completeIssuePercent;
	}
	public void setCompleteIssuePercent(int completeIssuePercent) {
		this.completeIssuePercent = completeIssuePercent;
	}
	
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
}
