package com.nbreds.projectPlanning.Project.VO;

public class ProjectMemberStat {
	private int uno;
	private int pno;
	private String stat;
	private String uname; // 2016. 04. 19. User 테이블과 join 위해서 추가
	
	public ProjectMemberStat() {}
	
	public int getUno() {
		return uno;
	}
	public void setUno(int uno) {
		this.uno = uno;
	}
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public String getStat() {
		return stat;
	}
	public void setStat(String stat) {
		this.stat = stat;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
}
