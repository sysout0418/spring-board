package com.nbreds.projectPlanning.issues.VO;

public class Comment {
	private int cno;
	private String content;
	private String regDate;
	private int uno;
	private int ino;
	private String uname;
	private String theFirstLetterOfEmail;
	private String profileBgColor;
	
	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public int getUno() {
		return uno;
	}
	public void setUno(int uno) {
		this.uno = uno;
	}
	public int getIno() {
		return ino;
	}
	public void setIno(int ino) {
		this.ino = ino;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getTheFirstLetterOfEmail() {
		return theFirstLetterOfEmail;
	}
	public void setTheFirstLetterOfEmail(String theFirstLetterOfEmail) {
		this.theFirstLetterOfEmail = theFirstLetterOfEmail;
	}
	public String getProfileBgColor() {
		return profileBgColor;
	}
	public void setProfileBgColor(String profileBgColor) {
		this.profileBgColor = profileBgColor;
	}
}
