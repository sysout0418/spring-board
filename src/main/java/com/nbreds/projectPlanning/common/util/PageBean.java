package com.nbreds.projectPlanning.common.util;

import java.io.Serializable;

public class PageBean implements Serializable {
	/** 검색 조건 이름, 아이디... */
	private String key;
	/** 검색 단어 1개 */
	private String word; 
	/** 검색 단어 배열 */
	private String[] datas;
	/** 페이징 처리에 대한 link 정보 */
	private String pagelink;
	/** 현재 페이 번호 */
	private int pageNo;
	/** 한 페이지에 보여줄 데이타 개수 */
	private int interval = 15;
	/** 페이지의 시작 번호 */
	private int start = 0;
	/** 페이지의 끝 번호 */
	private int end = interval;

	public String getKey() {
		return key;
	}

	public String getKey(String k) {
		if (k != null && key.equals(k))
			return "selected='selected'";
		else
			return "";
	}
	
	public void setKey(String key) {
		if (key == null)
			this.key = "all";
		else
			this.key = key;
	}

	public String getWord() {
		return word;
	}

	public void setWord(String word) {
		if (word == null)
			this.word = "";
		else
			this.word = word;
	}

	public String[] getDatas() {
		return datas;
	}
	
	public void setDatas(String[] datas) {
		this.datas = datas;
	}
	
	public String getPagelink() {
		return pagelink;
	}


	public void setPagelink(String pagelink) {
		this.pagelink = pagelink;
	}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		if (pageNo > 0)
			this.pageNo = pageNo;
		else
			this.pageNo = 1;
	}

	public void setPageNo(String pageNo) {
		try {
			this.pageNo = Integer.parseInt(pageNo);
		} catch (Exception e) {
			this.pageNo = 1;
		}
	}

	public PageBean() {
		setKey("all");
		setPagelink("1");
		setPageNo(1);
	}

	// 다중 검색(배열)으로 검색시 사용하는 생성자
	public PageBean(String[] datas, String pagelink, int pageNo) {
		setKey(key);
		setDatas(datas);
		setPagelink(pagelink);
		setPageNo(pageNo);
	}

	public PageBean(String[] datas, String pagelink, String pageNo) {
		setKey(key);
		setDatas(datas);
		setPagelink(pagelink);
		setPageNo(pageNo);
	}
	
	// 단일 검색어로 검색시 사용하는 생성자
	public PageBean(String key, String word, String pagelink, int pageNo) {
		setKey(key);
		setWord(word);
		setPagelink(pagelink);
		setPageNo(pageNo);
	}
	public PageBean(String key, String word, String pagelink, String pageNo) {
		setKey(key);
		setWord(word);
		setPagelink(pagelink);
		setPageNo(pageNo);
	}

	public int getInterval() {
		return interval;
	}

	public void setInterval(int interval) {
		this.interval = interval;
	}

	public int getStart() {
		if (pageNo > 1) {
			return start = (pageNo - 1) * interval;
		} else {
			return 0;
		}
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return start + interval - 1;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("PageBean [key=").append(", datas[0]=").append(datas[0]).append(", pagelink=")
				.append(pagelink).append(", pageNo=").append(pageNo).append(", interval=").append(interval)
				.append(", start=").append(start).append(", end=").append(end).append("]");
		return builder.toString();
	}

}
