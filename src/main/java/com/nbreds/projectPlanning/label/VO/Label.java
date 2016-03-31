package com.nbreds.projectPlanning.label.VO;

import java.util.ArrayList;
import java.util.List;

import com.nbreds.projectPlanning.issues.VO.Issue;

public class Label {
	private int Lno;
	private String ltitle;
	private String ldescription;
	private String lbgcolor;
	private int pno;
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
	public String getLdescription() {
		return ldescription;
	}
	public void setLdescription(String ldescription) {
		this.ldescription = ldescription;
	}
	public String getLbgcolor() {
		return lbgcolor;
	}
	public void setLbgcolor(String lbgcolor) {
		this.lbgcolor = lbgcolor;
	}
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public List<Issue> getInos() {
		return inos;
	}
	public void setInos(List<Issue> inos) {
		this.inos = inos;
	}
}