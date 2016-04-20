package com.nbreds.projectPlanning.Project.VO;

import java.util.List;

public class Project {
	private int pno;
	private String pname="";
	private String pdetail="";
	private String pdata="";
	private String pduedate="";
	private String pregdate;
	private int uno;
	
	private List<String> pdevelopment;
	private List<String> pdesign;
	private List<String> pplanning;
	private String pprogress;

	private String uname;
	private String pskill="";
	
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
	
	public List<String> getPdevelopment() {
		return pdevelopment;
	}
	public void setPdevelopment(List<String> pdevelopment) {
		for (String tmp : pdevelopment)	this.pdata+="004"+tmp+",";	
		this.pdevelopment = pdevelopment;
	}
	public List<String> getPdesign() {
		return pdesign;
	}
	public void setPdesign(List<String> pdesign) {
		for (String tmp : pdesign)		this.pdata+="005"+tmp+",";	
		this.pdesign = pdesign;
	}
	public List<String> getPplanning() {
		return pplanning;
	}
	public void setPplanning(List<String> pplanning) {
		for (String tmp : pplanning)		this.pdata+="006"+tmp+",";	
		this.pplanning = pplanning;
	}
	public String getPprogress() {
		return pprogress;
	}
	public void setPprogress(String pprogress) {
		this.pprogress = pprogress;
		this.pdata += pprogress+",";
	}
	
	public String getUname() {
		return uname;
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
	
}