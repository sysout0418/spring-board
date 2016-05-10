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

	private static final Logger logger = LoggerFactory.getLogger(DateCalculator.class);
	private static final String dateFormat = "MM/dd/yyyy";
	private static DateCalculator dateCalculator;
	private SimpleDateFormat format;
	private Date today;
	private Date regDate;
	private long today2;
	private long regDate2;
	private long timeDifference;
	private List<Issue> issueList;
	private List<Milestone> milestoneList;
	private List<Project> projectList;

	private DateCalculator() {

	}

	public static DateCalculator getInstance() {
		if (dateCalculator == null) {
			dateCalculator = new DateCalculator();
		}
		return dateCalculator;
	}

	private long getToday() throws ParseException {
		format = new SimpleDateFormat(dateFormat);
		today = new Date();
		String date = format.format(today);
		today = format.parse(date);
		return today.getTime();
	}

	private long getRegDate(String date) throws ParseException {
		format = new SimpleDateFormat(dateFormat);
		regDate = format.parse(date);
		return regDate.getTime();
	}

	private long getTimeDifference(long regDate, long today) {
		long difference = regDate - today;
		return difference / (24 * 60 * 60 * 1000);
	}

	@SuppressWarnings("unchecked")
	public <T> void setExpired(Map<String, Object> param) {
		try {
			today2 = getToday();
			regDate2 = (Long) getRegDate(param.get("regdateToString").toString());
			timeDifference = getTimeDifference(regDate2, today2);
			List<T> list = (List<T>) param.get("targetList");
			for (int i = 0; i < list.size(); i++) {
				if (list.get(i) instanceof Issue) {
					issueList = (List<Issue>) list;
					if (timeDifference >= 0) {
						issueList.get(i).setIsExpired(false);
					} else {
						issueList.get(i).setIsExpired(true);
					}
					logger.info("timeDifference : " + timeDifference);
					logger.info("issue isExpired : " + issueList.get(i).getIsExpired());
				} else if (list.get(i) instanceof Milestone) {
					milestoneList = (List<Milestone>) list;
					if (timeDifference >= 0) {
						milestoneList.get(i).setIsExpired(false);
					} else {
						milestoneList.get(i).setIsExpired(true);
					}
					logger.info("timeDifference : " + timeDifference);
					logger.info("milestone isExpired : " + milestoneList.get(i).getIsExpired());
				} else {
					projectList = (List<Project>) list;
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

	@SuppressWarnings("unchecked")
	public Map<String, Object> checkDateForUpdate(Map<String, Object> param) {
		Map<String, Object> param2 = new HashMap<String, Object>();
		try {
			today2 = getToday();
			regDate2 = (Long) getRegDate(param.get("regdateToString").toString());
			timeDifference = getTimeDifference(regDate2, today2);
			
			List<Issue> issueList = (List<Issue>) param.get("issueList");
			for (int i = 0; i < issueList.size(); i++) {
				if (timeDifference < 0) {
					param2.put("istatement", "001");
					param2.put("ino", issueList.get(i).getIno());
					param2.put("lno", 5);
				} else {
					param2.put("istatement", "001");
					param2.put("ino", issueList.get(i).getIno());
					param2.put("lno", 4);
				}
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return param2;
	}
}
