package com.nbreds.projectPlanning.login.VO;

public class FacebookUserProfileVO {

	private String userEmail;
	private String userName;
	
	public FacebookUserProfileVO(String userEmail, String userName) {
		super();
		this.userEmail = userEmail;
		this.userName = userName;
	}
	
	public String getUserEmail() {
		return userEmail;
	}
	
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}
	
}
