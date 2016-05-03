package com.nbreds.projectPlanning.common.util;

/**
 * JSP에서 데이터를 page navigation 형식으로 구성하기 위해 사용되는 클래스이다.
 */
public class PageUtility {
	int firstpagecount = 0; 	// 목록에서 보여줄 첫페이지 링크 번호 1 2 3 4 5 (1)
	int lastpagecount = 0; 		// 목록에서 보여줄 마지막 페이지 링크+1 1 2 3 4 5 (6)

	int nextpagecount = 0; 		// 다음 페이지
	int beforepagecount = 0; 	// 이전 페이지
	int currentpagecount = 0; 	// 현재 페이지

	int pagePercount = 20; 		// 목록에서 보여줄 페이지 개수 1 2 3 4 5
	int beforetenpage = 0; 		// 이전 pagePercount 페이지
	int nexttenpage = 0; 		// 다음 pagePercount 페이지

	int totalrowcount = 0; 		// 총 row 개수
	int totalpagecount = 0; 	// 총 페이지 수
	int displayrowcount = 0; 	// 한 페이지당 보여줄 개수
//	String imagepath = "common/img/btn/";
	String search;
	
	public PageUtility(int displayrowcount, int totalrowcount, int currentpagecount)
			throws Exception {
		super();
		this.displayrowcount = displayrowcount;
		this.totalrowcount = totalrowcount;
		this.currentpagecount = currentpagecount;
		if (totalrowcount % displayrowcount == 0)
			this.totalpagecount = totalrowcount / displayrowcount;
		else
			this.totalpagecount = totalrowcount / displayrowcount + 1;
	}

	public String getCurrentPageCount() {
		return String.valueOf(currentpagecount);
	}

	public String getTotalPageCount() {
		return String.valueOf(totalpagecount);
	}
	
	public String getPageBar() {
		// ex) pagePercount: 5 이고 7인 경우의 계산
		StringBuffer sb = new StringBuffer();
		// currentpagecount: 3인 경우 1 2 3 4 5 등에서 표시할 첫 페이지 (1)
		// currentpagecount: 7인 경우 6 7 8 9 10 등에서 표시할 첫 페이지 (6)
		firstpagecount = ((currentpagecount - 1) / pagePercount * pagePercount) + 1;
		// currentpagecount: 3인 경우 1 2 3 4 5 등에서 표시할 다음 페이지 (6)
		// currentpagecount: 7인 경우 6 7 8 9 10 등에서 표시할 첫 페이지 (11)
		lastpagecount = firstpagecount + pagePercount;

		// currentpagecount: 3인 경우 -4
		// currentpagecount: 7인 경우 1
		beforetenpage = firstpagecount - pagePercount;
		beforetenpage = beforetenpage < 1 ? 1 : beforetenpage;

		nexttenpage = lastpagecount;
		if (nexttenpage > totalpagecount)
			nexttenpage = (((totalpagecount - 1) / pagePercount) + 1) * pagePercount;

		if (lastpagecount > totalpagecount)
			lastpagecount = totalpagecount + 1;

		// 맨 첫페이지 link 처리
		if (currentpagecount > pagePercount) // 현재 표시하는 페이지가 pagePercount보다 크면
												// 첫페이지로 갈수 있으므로 첫페이지로 링크
//			sb.append(" <a href='javascript:pagelist(" + 1 + ")'><img src=\"" + imagepath
//					+ "btn_paging_first.gif\" border='0'  hspace='3' align='absmiddle'></a>&nbsp;&nbsp;");
//			sb.append("<ul class='pagination'><li><a href='javascript:pagelist(" + 1 + ")'>처음</a></li>&nbsp;&nbsp;");
			sb.append("<ul class='pagination'><li><a href='javascript:pagelist(" + 1 + ")'><i class='fa fa-angle-double-left'></i></a></li>&nbsp;&nbsp;");
		else // 총 페이지가 pagePercoun보다 작거나 현재 표시 페이지가 pagePercoun 내에 있으므로 첫페이지로 갈
				// 필요 없으므로 이미지만 표시
//			sb.append("<img src=\"" + imagepath + "btn_paging_first.gif\" border='0'  align=absmiddle>&nbsp;&nbsp;");
//			sb.append("<ul class='pagination'><li><a href='javascript:pagelist(" + 1 + ")'>처음</a></li>&nbsp;&nbsp;");
			sb.append("<ul class='pagination'><li><a href='javascript:pagelist(" + 1 + ")'><i class='fa fa-angle-double-left'></i></a></li>&nbsp;&nbsp;");
			

//		// 이전 pagePercount 페이지
//		if (((currentpagecount - 1) / pagePercount * pagePercount) + 1 > beforetenpage)
//			// 현재 표시 페이지가 beforetenpage 보다 크면 이전 페이지로 링크
//			sb.append("<a href='javascript:pagelist(" + beforetenpage + ")'><img src=\"" + imagepath
//					+ "btn_paging_prev.gif\" border='0' hspace='3' align=absmiddle></a>&nbsp;&nbsp;");
//		else// 현재 표시 페이지가 beforetenpage 보다 작으면 이미지만 표시
//			sb.append("<img src=\"" + imagepath + "btn_paging_prev.gif\" border='0'   align=absmiddle>&nbsp;&nbsp;");
//
//		// pagePercount 만큼 link
		for (int i = firstpagecount; i < lastpagecount; i++) {
			if (i <= totalpagecount) {
				if (i == currentpagecount)
					sb.append("<li class='active'><a href='javascript:pagelist(" + i + ")'>" + i + "</a></li>");
				else
					sb.append("<li><a href='javascript:pagelist(" + i + ")'>" + i + "</a></li>");
//				if (i != lastpagecount - 1)
//					sb.append(" . ");
			}
		}

//		// 다음 pagePercount 페이지 link
//		if (nexttenpage < ((totalpagecount - 1) / pagePercount + 1) * pagePercount)
//			sb.append("&nbsp;&nbsp;<a href='javascript:pagelist(" + (nexttenpage) + ")'><img src=\"" + imagepath
//					+ "btn_paging_next.gif\" border='0' hspace='3' align=absmiddle></a>");
//		else
//			sb.append("&nbsp;&nbsp;<img src=\"" + imagepath
//					+ "btn_paging_next.gif\" border='0' hspace='3' align=absmiddle>");

		// 맨 끝 페이지 link
		if (currentpagecount < totalpagecount)
//			sb.append("&nbsp;&nbsp;<a href='javascript:pagelist(" + (totalpagecount) + ")'><img src=\"" + imagepath
//					+ "btn_paging_end.gif\" border='0' align=absmiddle></a>");
			sb.append("<li><a href='javascript:pagelist(" + (totalpagecount) + ")'><i class='fa fa-angle-double-right'></i></a></li></ul>");
		else
//			sb.append("&nbsp;&nbsp;<img src=\"" + imagepath + "btn_paging_end.gif\" border='0' align=absmiddle>");
			sb.append("<li><a href='javascript:pagelist(" + (totalpagecount) + ")'><i class='fa fa-angle-double-right'></i></a></li></ul>");

		return sb.toString();
	}

}