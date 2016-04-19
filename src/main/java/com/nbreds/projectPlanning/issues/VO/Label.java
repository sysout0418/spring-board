package com.nbreds.projectPlanning.issues.VO;

public class Label {
	private int Lno;
	private String ltitle;
	private String lbgcolor;
	
	public int getLno() {
		return Lno;
	}
	public void setLno(int lno) {
		Lno = lno;
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
}