package com.lsware.utils;

import java.util.*;
import java.text.*;

/**
 * Title: 날짜관련 유틸리티 함수 모음
 * Description:
 * Copyright: Copyright (c) 2007 
 * @author Kim Bo Won
 * @version 1.0
 */

public class DateUtils {

	public final static int DATE = 1;
	public final static int MONTH = 2;
	public final static int YEAR = 3;
	public final static int HOUR = 4;
	public final static int MINUTE = 5;
	public final static int SECOND = 6;
	public final static int DAY_OF_WEEK = 7;

	public static String getTimeStamp() {
		return getTimeStamp("yyyyMMddHHmmss");
		//return getTimeStamp("20080101000400");
	}

	/*
	  "E MMM dd HH:mm:ss z yyyy";   // Wed Feb 03 15:26:32 GMT+09:00 1999
	  "MMMM dd, yyyy HH:mm:ss z";   // Jun 03, 2001 15:26:32 GMT+09:00
	  "MM/dd/yyyy";// 02/15/1999
	  "yyyyMMdd";// 19990215
	  "HHmmss";// 121241
	  "dd MMM yyyy";// 15 Jan 1999
	  "yyyyMMddHHmm"; //200101011010
	  "yyyyMMddHHmmss"; //20010101101052
	  "HHmmss";
	  "E MMM dd HH:mm:ss z yyyy";// Wed Feb 03 15:26:32 GMT+09:00 1999
	*/
	public static String getTimeStamp(String sFormat) { return getTimeStamp(sFormat, new Date()); }
	public static String getTimeStamp(String sFormat, int nRoll) { return getTimeStamp(sFormat, new Date(getTimeInMillis(nRoll))); }
	public static String getTimeStamp(String sFormat, Date date) {
		SimpleDateFormat formatter = new SimpleDateFormat(sFormat);
		return formatter.format(date);
	}

	public static long getTimeInMillis(int nRoll) {
		return getTimeInMillis(DATE, System.currentTimeMillis(), nRoll);
	}

	public static long getTimeInMillis(long lDate, int nRoll) {
		return getTimeInMillis(DATE, lDate, nRoll);
	}

	public static long getTimeInMillis(int nType, long lDate, int nRoll) {
		Calendar cal = Calendar.getInstance();
		cal.setTimeInMillis(lDate);

		if (nType == MONTH) cal.add(Calendar.MONTH, nRoll);	 // 월 단위
		else if (nType == YEAR) cal.add(Calendar.YEAR, nRoll); // 년 단위
		else if (nType == HOUR) cal.add(Calendar.HOUR, nRoll); // 시 단위
		else cal.add(Calendar.DATE, nRoll); // 일 단위

		return cal.getTimeInMillis();
	}
	
	// 현재날짜
	public static String getCurrentDate(){
		Calendar now = Calendar.getInstance();
		long lCurDate = now.getTimeInMillis();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String sCurrentDate = sdf.format(lCurDate);
		
		return sCurrentDate;
	}

	/**
	 * 현재날짜를 dateType형식으로 보여준다.
	 * ForExample : 
	 * yyyy
	 * yyyy-MM
	 * yyyy-MM-dd
	 * yyyyMMdd
	 * @param dateType
	 * @return
	 */
	public static String getCurrentDateByType(String dateType){
		Calendar now = Calendar.getInstance();
		long lCurDate = now.getTimeInMillis();
		
		SimpleDateFormat sdf = new SimpleDateFormat(dateType);
		String sCurrentDate = sdf.format(lCurDate);
		
		return sCurrentDate;
	}		
	
	public static String getDateFormat(long lDate, String format) {
		String result = null;
		if(format != null){
			SimpleDateFormat sdf = new SimpleDateFormat(format);
			result = sdf.format(lDate);
		}
		return result;
	}

	public static long getCurrentTimeInMillis() {
		Calendar now = Calendar.getInstance();
		return now.getTimeInMillis();
	}
	
	 /**
     * 현재날짜(System TimeZone 및 Locale 기준)에서 몇일 전,후의 날짜를 구한다.
     *
     * @param	day		변경할 일수
     * @return	현재날짜에서 입력한 일수를 계산한 날짜(yyyyMMdd)
     */
    public static String getDateWithSpan(long day)
    {
        SimpleDateFormat fmt = new SimpleDateFormat("yyyyMMdd");

        java.util.Date date = new java.util.Date();
        java.util.Date spanDate = new java.util.Date(date.getTime() +
            (day * 1000 * 60 * 60 * 24));

        return fmt.format(spanDate);
    }
    
    /**
     * <pre>
     * 날짜문자열을 날짜표시타입으로 변환한다.
     * (예) 20010110 --> 2001-01-10   delimeter(-)
     * </pre>
     * @param    strDate  숫자로만 구성된 날짜문자열 (yyyyMMdd)
     * @return   변경된 날짜 문자열(구분자가 첨가된 날짜 형태) (yyyy-MM-dd)
     * 
     */
    public static String makeDateType(String strDate)
    {
        if (strDate == null || (strDate = strDate.trim()).length() == 0)
        {
            return "          ";
        }
        if (strDate.length() != 8)
        {
            return "Invalid length";
        }

        return (strDate.substring(0, 4) + "-" + strDate.substring(4, 6) + "-" +
                strDate.substring(6, 8));
    }
    
    /***
     * 날짜문자열을 분기문장열로 변환한다.(YYYY + 분기(01/02/03/04)) ex) 2009년 3분기 : 200903
     * @param strDate YYYYMM
     * @return
     */
	public static String get3MonthDate(String strDate) {
		int month = ((Integer.valueOf(strDate.substring(4, 6))-1)/3) + 1;
		String sSTAT_3MDT = strDate.substring(0, 4) + "0" + month; 
		
		return sSTAT_3MDT;
	}
	
	/***
     * 날짜문자열 변환.(YYYY-MM-DD|ssmmhh|) 
     * @param strDate YYYYMMDDSSMMHH
     * @return
     */
	public static String getStrDateVer(String strDate) {
		
		String newAlmTime = "";
		
		String newArmTime = "";
		String yy = "";
		String mm = "";
		String dd = "";
		String sh = "";
		String ss = "";
		String hh = "";
		String mi = "";
		if( strDate.length() == 14 ) 
		{
			yy = strDate.substring(0, 4);
			mm = strDate.substring(4, 6);
			dd = strDate.substring(6, 8);
			sh = strDate.substring(8, 14);
			
			ss = sh.substring(0, 2);
			hh = sh.substring(2, 4);
			mi = sh.substring(4, 6);
			
			newAlmTime = yy +"-"+ mm +"-"+ dd +"|"+ ss+ ":" +hh+ ":" + mi + "|";
			
		}
		else if( strDate.length() == 8 )
		{
			yy = strDate.substring(0, 4);
			mm = strDate.substring(4, 6);
			dd = strDate.substring(6, 8);
			
			newAlmTime = yy +"-"+ mm +"-"+ dd;
		}
		else
		{
			newAlmTime = "null";
		}
		
		
		return newAlmTime;
	}
	
	/***
     * 날짜문자열 변환.(YYYYMMDD|ssmmhh|) 
     * @param strDate YYYYMMDDSSMMHH
     * @return
     */
	public static String getStrDateVerDes(String strDate) {
		
		String newAlmTime = "";
		
		int lll = strDate.length();
		
		String newArmTime = "";
		String yy = "";
		String mm = "";
		String dd = "";
		String sh = "";
		
		if( strDate.length() == 10 ) 
		{
			yy = strDate.substring(0, 4);
			mm = strDate.substring(5, 7);
			dd = strDate.substring(8, 10);
			
			newAlmTime = yy + mm + dd ;
			
		}
		else if( strDate.length() == 20 )
		{
			yy = strDate.substring(0, 4);
			mm = strDate.substring(5, 7);
			dd = strDate.substring(8, 10);
			
			sh = strDate.substring(11, 19);
			
			newAlmTime = yy + mm + dd + sh.replace(":", "") ;
		}
		else if( strDate.length() == 8 )
		{
			newAlmTime = strDate;
		}
		else if( strDate.length() == 14 )
		{
			newAlmTime = strDate;
		}
		else
		{
			newAlmTime = "null";
		}
		
		
		return newAlmTime;
	}
	
	
}
