package com.nbreds.projectPlanning.Project.VO;

public class CodeTable {
	private String CODE_TYPE;
	private String CODE;
	private String CODE_NAME;
	
	public CodeTable(String CODE_TYPE, String CODE, String  CODE_NAME) {
		this.CODE_NAME = CODE_NAME;
		this.CODE_TYPE = CODE_TYPE;
		this.CODE = CODE;
	}

	public String getCODE_NAME() {
		return CODE_NAME;
	}

	public void setCODE_NAME(String CODE_NAME) {
		this.CODE_NAME = CODE_NAME;
	}

	public String getCODE_TYPE() {
		return CODE_TYPE;
	}

	public void setCODE_TYPE(String CODE_TYPE) {
		this.CODE_TYPE = CODE_TYPE;
	}

	public String getCODE() {
		return CODE;
	}

	public void setCODE(String CODE) {
		this.CODE = CODE;
	}
}
