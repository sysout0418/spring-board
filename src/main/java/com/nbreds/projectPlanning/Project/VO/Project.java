package com.nbreds.projectPlanning.Project.VO;

import java.util.List;

public class Project {
	private int rowNum;
	private int pno;
	private String pname="";
	private String pdetail="";
	private String pdata="";
	private String pduedate="";
	private String pregdate;
	private int uno;
	private int lno;
	
	private List<String> pdevelopment;
	private List<String> pdesign;
	private List<String> pplanning;
	private int pprogress;
	private String ltitle;
	private String lbgcolor;

	private String uname;
	private String pskill="";
	private boolean isExpired;
	
	private String pamount;
	
	public void setPno(int pno) {
		this.pno = pno;
	}
	public int getPno() {
		return pno;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getPdetail() {
		return pdetail;
	}
	public void setPdetail(String pdetail) {
		this.pdetail = pdetail;
	}
	public String getPdata(){
		return pdata;
	}
	public void setPdata(String pdata){
		this.pdata = pdata;
	}
	public String getPduedate() {
		return pduedate;
	}
	public void setPduedate(String pduedate) {
		this.pduedate = pduedate;
	}
	public int getUno() {
		return uno;
	}
	public void setUno(int uno) {
		this.uno = uno;
	}	
	public int getLno() {
		return lno;
	}
	public void setLno(int lno) {
		this.lno = lno;
	}
	public List<String> getPdevelopment() {
		return pdevelopment;
	}
	public void setPdevelopment(List<String> pdevelopment) {
		this.pdevelopment = pdevelopment;
	}
	public List<String> getPdesign() {
		return pdesign;
	}
	public void setPdesign(List<String> pdesign) {
		this.pdesign = pdesign;
	}
	public List<String> getPplanning() {
		return pplanning;
	}
	public void setPplanning(List<String> pplanning) {
		this.pplanning = pplanning;
	}
	public String getUname() {
		return uname;
	}
	public String getLtitle() {
		return ltitle;
	}
	public void setLtitle(String ltitle) {
		this.ltitle = ltitle;
	}
	public String getLbgcolor() {
		return lbgcolor;
	}
	public void setLbgcolor(String lbgcolor) {
		this.lbgcolor = lbgcolor;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getPskill() {
		return pskill;
	}
	public void setPskill(String pskill) {
		this.pskill = pskill;
	}
	public String getPregdate() {
		return pregdate;
	}
	public void setPregdate(String pregdate) {
		this.pregdate = pregdate;
	}
	public int getRowNum() {
		return rowNum;
	}
	public void setRowNum(int rowNum) {
		this.rowNum = rowNum;
	}
	public int getPprogress() {
		return pprogress;
	}
	public void setPprogress(int pprogress) {
		this.pprogress = pprogress;
	}
	public boolean getIsExpired() {
		return isExpired;
	}
	public void setIsExpired(boolean isExpired) {
		this.isExpired = isExpired;
	}
	public String getPamount() {
		return pamount;
	}
	public void setPamount(String pamount) {
		this.pamount = pamount;
	}
}