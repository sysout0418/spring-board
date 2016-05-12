package com.nbreds.projectPlanning.common.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.nbreds.projectPlanning.Project.VO.Project;
import com.nbreds.projectPlanning.issues.VO.Issue;
import com.nbreds.projectPlanning.milestones.VO.Milestone;

public class DateCalculator {

	private static final Logger logger = LoggerFactory.getLogger(DateCalculator.class); // 로그
	private static final String dateFormat = "MM/dd/yyyy"; // 날짜 포멧
	private static DateCalculator dateCalculator;
	private SimpleDateFormat format; // 날짜 포맷 변경을 위한 변수
	private Date today; // 오늘 날짜
	private Date dueDate; // 만료 날짜
	private long today2; // 오늘 날짜를 long 타입으로
	private long dueDate2; // 만료 날짜를 long 타입으로
	private long timeDifference; // (만료날짜 - 오늘날짜) 차이
	private List<Issue> issueList; // 이슈 리스트
	private List<Milestone> milestoneList; // 마일스톤 리스트
	private List<Project> projectList; // 프로젝트 리스트

	// 기본생성자
	private DateCalculator() {

	}

	// 싱글톤 패턴 적용
	public static DateCalculator getInstance() {
		if (dateCalculator == null) {
			dateCalculator = new DateCalculator();
		}
		return dateCalculator;
	}

	// 오늘 날짜를 날짜 포멧에 맞게 계산하여 long 타입으로 리턴
	private long getToday() throws ParseException {
		format = new SimpleDateFormat(dateFormat);
		today = new Date();
		String date = format.format(today);
		today = format.parse(date);
		return today.getTime();
	}

	// 만료 날짜를 날짜 포멧에 맞게 계산하여 long 타입으로 리턴
	private long getDueDate(String date) throws ParseException {
		format = new SimpleDateFormat(dateFormat);
		dueDate = format.parse(date);
		return dueDate.getTime();
	}

	// (만료 날짜 - 오늘 날짜)의 차이를 long 타입으로 리턴
	private long getTimeDifference(long regDate, long today) {
		long difference = regDate - today;
		return difference / (24 * 60 * 60 * 1000);
	}

	// 만료일이 지난 경우 expired 표시하는 메소드
	@SuppressWarnings("unchecked")
	public <T> void setExpired(Map<String, Object> param) {
		// 리스트를 모든 타입으로 받는다
		List<T> list = (List<T>) param.get("targetList");
		// 만료일을 String 으로 담는 변수
		String dueDateToString = "";
		try {
			// 오늘 날짜를 구한다
			today2 = getToday();

			// list가 Issue 타입인 경우
			if (list.get(0) instanceof Issue) {
				issueList = (List<Issue>) list;
				for (int i = 0; i < issueList.size(); i++) {
					dueDateToString = issueList.get(i).getIduedate();
					dueDate2 = getDueDate(dueDateToString);
					timeDifference = getTimeDifference(dueDate2, today2);

					if (timeDifference >= 0) {
						issueList.get(i).setIsExpired(false);
					} else {
						issueList.get(i).setIsExpired(true);
					}
					logger.info("timeDifference : " + timeDifference);
					logger.info("issue isExpired : " + issueList.get(i).getIsExpired());
				}
			} 
			// list가 Milestone 타입인 경우
			else if (list.get(0) instanceof Milestone) {
				milestoneList = (List<Milestone>) list;
				logger.info("milestoneSize : " + milestoneList.size());
				for (int i = 0; i < milestoneList.size(); i++) {
					dueDateToString = milestoneList.get(i).getMduedate();
					dueDate2 = getDueDate(dueDateToString);
					timeDifference = getTimeDifference(dueDate2, today2);

					if (timeDifference >= 0) {
						milestoneList.get(i).setIsExpired(false);
					} else {
						milestoneList.get(i).setIsExpired(true);
					}
					logger.info("timeDifference : " + timeDifference);
					logger.info("milestone isExpired : " + milestoneList.get(i).getIsExpired());
				}
			} 
			// list가 Project 타입인 경우
			else {
				projectList = (List<Project>) list;
				for (int i = 0; i < projectList.size(); i++) {
					dueDateToString = projectList.get(i).getPduedate();
					dueDate2 = getDueDate(dueDateToString);
					timeDifference = getTimeDifference(dueDate2, today2);

					if (timeDifference >= 0) {
						projectList.get(i).setIsExpired(false);
					} else {
						projectList.get(i).setIsExpired(true);
					}
					logger.info("timeDifference : " + timeDifference);
					logger.info("project isExpired : " + projectList.get(i).getIsExpired());
				}
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}

	// Issue 업데이트 할 때 만료기한이 지난 Issue면 label을 '종료'로 그게 아니면 '중지'로 바꾸는 메소드
	@SuppressWarnings("unchecked")
	public Map<String, Object> checkDateForUpdate(Map<String, Object> param) {
		Map<String, Object> param2 = new HashMap<String, Object>();
		List<Issue> issueList = (List<Issue>) param.get("issueList");
		String dueDateToString = "";
		try {
			today2 = getToday();

			for (int i = 0; i < issueList.size(); i++) {
				dueDateToString = issueList.get(i).getIduedate();
				dueDate2 = getDueDate(dueDateToString);
				timeDifference = getTimeDifference(dueDate2, today2);

				if (timeDifference < 0) {
					param2.put("istatement", "001");
					param2.put("ino", issueList.get(i).getIno());
					param2.put("lno", 5);
				} else {
					param2.put("istatement", "001");
					param2.put("ino", issueList.get(i).getIno());
					param2.put("lno", 4);
				}
				return param2;
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return null;
	}
}
