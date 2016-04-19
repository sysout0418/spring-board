package com.nbreds.projectPlanning.common.VO;

public class User {
	private static final long serialVersionUID = 1L;
	
	private int uno;
	private String uname;
	private String uphoneno;
	private String udepartment;
	private String udepartmentName;
	private String uemail;
	private String upassword;
	private String uregdate;
	
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getUphoneno() {
		return uphoneno;
	}
	public void setUphoneno(String uphoneno) {
		this.uphoneno = uphoneno;
	}
	public String getUdepartment() {
		return udepartment;
	}
	public void setUdepartment(String udepartment) {
		this.udepartment = udepartment;
	}
	public String getUemail() {
		return uemail;
	}
	public void setUemail(String uemail) {
		this.uemail = uemail;
	}
	public int getUno() {
		return uno;
	}
	public void setUno(int uno) {
		this.uno = uno;
	}
	public String getUpassword() {
		return upassword;
	}
	public void setUpassword(String upassword) {
		this.upassword = upassword;
	}
	public String getUregdate() {
		return uregdate;
	}
	public void setUregdate(String uregdate) {
		this.uregdate = uregdate;
	}
	public String getUdepartmentName() {
		return udepartmentName;
	}
	public void setUdepartmentName(String udepartmentName) {
		this.udepartmentName = udepartmentName;
	}
	@Override
	public String toString() {
		return super.toString() + "\n uemail: " + this.uemail + ", upassword: " + this.upassword;
	}
}