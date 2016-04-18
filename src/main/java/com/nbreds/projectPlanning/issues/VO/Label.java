package com.nbreds.projectPlanning.issues.VO;

import java.util.ArrayList;
import java.util.List;

public class Label {
	private int Lno;
	private String ltitle;
	private String lbgcolor;
	private List<Issue> inos = new ArrayList<Issue>(); // 다대다 관계이므로 ino가 n개일 때 담아 놓는 List
	
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
	public List<Issue> getInos() {
		return inos;
	}
	public void setInos(List<Issue> inos) {
		this.inos = inos;
	}
}