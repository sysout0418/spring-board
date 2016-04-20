package com.nbreds.projectPlanning.issues.VO;

import java.util.ArrayList;
import java.util.List;

public class Issue {
	private int ino;
	private String ititle;
	private String idescription;
	private String istatement;
	private int mno;
	private int pno;
	private int uno;
	private String iduedate;
	
	/** 03.27 table JOIN을 위한 필드 추가 **/
	private String uname;
	private String mtitle;
	private int lno;
	private String ltitle;
	private String ldescription;
	private String lbgcolor;
	
	public int getIno() {
		return ino;
	}
	public void setIno(int ino) {
		this.ino = ino;
	}
	public String getItitle() {
		return ititle;
	}
	public void setItitle(String ititle) {
		this.ititle = ititle;
	}
	public String getIdescription() {
		return idescription;
	}
	public void setIdescription(String idescription) {
		this.idescription = idescription;
	}
	public String getIstatement() {
		return istatement;
	}
	public void setIstatement(String istatement) {
		this.istatement = istatement;
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
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
	
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getMtitle() {
		return mtitle;
	}
	public void setMtitle(String mtitle) {
		this.mtitle = mtitle;
	}
	public int getLno() {
		return lno;
	}
	public void setLno(int lno) {
		this.lno = lno;
	}
	public String getLtitle() {
		return ltitle;
	}
	public void setLtitle(String ltitlel) {
		this.ltitle = ltitlel;
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
	public String getIduedate() {
		return iduedate;
	}
	public void setIduedate(String iduedate) {
		this.iduedate = iduedate;
	}
	
}