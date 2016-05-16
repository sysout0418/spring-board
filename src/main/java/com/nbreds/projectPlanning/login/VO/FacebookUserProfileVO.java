package com.nbreds.projectPlanning.login.VO;

public class FacebookUserProfileVO {
	private String token;
	private String email;
	private String name;
	
	public String getToken() {
		return token;
	}
	public void setToken(String token) {
		this.token = token;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	@Override
	public String toString() {
		return "FacebookUserProfileVO [token=" + token + ", email=" + email + ", name=" + name + "]";
	}
	
}
