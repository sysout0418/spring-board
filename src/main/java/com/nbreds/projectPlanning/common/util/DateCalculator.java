package com.nbreds.projectPlanning.common.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateCalculator {

	private static DateCalculator dateCalculator;
	private SimpleDateFormat format;
	private Date today;
	private Date regDate;
	private static final String dateFormat = "MM/dd/yyyy";
	
	private DateCalculator() {
		
	}
	
	public static DateCalculator getInstance() {
		if (dateCalculator == null) {
			dateCalculator = new DateCalculator();
		}
		return dateCalculator;
	}
	
	public long getToday() throws ParseException {
		format = new SimpleDateFormat(dateFormat);
		today = new Date();
		String date = format.format(today);
		today = format.parse(date);
		return today.getTime();
	}
	
	public long getRegDate(String date) throws ParseException {
		format = new SimpleDateFormat(dateFormat);
		regDate = format.parse(date);
		return regDate.getTime();
	}
	
	public long getTimeDifference(long regDate, long today) {
		long difference = regDate - today;
		return difference / (24 * 60 * 60 * 1000);
	}
}
