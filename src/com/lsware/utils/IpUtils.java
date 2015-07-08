/*
 * IpUtils.java 1.0, 2009. 8. 10.
 * 
 * Copyright (c) 2009 by LSware Inc. All rights reserved.
 */
package com.lsware.utils; 

import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class IpUtils {
	
	/***
	 * targetIp�� cidrIp�� ���ԵǴ°� Ȯ���Ѵ�. 
	 * @param sCidrIp
	 * @param sTargetIp
	 * @return targetIp�� CidrIp�� ���ԵǸ� true, ���Ե��� ������ false, cidr������ �ƴϰų� ��Ÿ �����߻��� ��� false 
	 */
	private static boolean containsIpRange(String sCidrIp, String sTargetIp) {
		
		boolean bResult = false;
		
		/* cidrIp�� cidr�����̰ų� ip�����̰� targetIp�� ip������ ��츸 IpRange���θ� �Ǵ��Ѵ�.
		 * ipRanget�� �Ǵ����� ������ return���� false�̴�.
		 */
		if(!(((isIpFormat(sCidrIp)) || isCidrIpFormat(sCidrIp)) && isIpFormat(sTargetIp))){
			return bResult;
		}
		
		try{
		
			long startIp = getCidrStartIp(sCidrIp);		
			long endIp = getCidrEndIp(sCidrIp);
			long targetIp = getIpConvertToLong(sTargetIp);
			
			if((targetIp >= startIp) && (targetIp <= endIp)){
				bResult = true;
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
		return bResult;
	}

	static boolean isCidrIpFormat(String ip){		
		/* 
		 * RegExp�� CIDR�����̸� True
		 */
		if(!isIpFormat(ip)){
			/* Regular Express�� �������ϸ� isIPFormat()�� �ʿ���� �� ���� */
			String regexp = "\\b(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)(\\/[0-9]|\\/[1-2][0-9]|\\/3[0-2])*\\b";
			Pattern paramRegexp = Pattern.compile(regexp);
			Matcher paramFit = paramRegexp.matcher(ip);
			if(!paramFit.matches()){
				return false;
			}
		}
		else{
			return false;
		}
		return true;
	}
	
	/***
	 * 
	 * @param ip
	 * @return
	 */
	static boolean isIpFormat(String ip){
		/* 
		 * RegExp�� IP�����̸� True
		 */		
		String regexp = "\\b(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\b";
		Pattern paramRegexp = Pattern.compile(regexp);
		Matcher paramFit = paramRegexp.matcher(ip);
		if(!paramFit.matches()){
			return false;
		}
		return true;
	}
	
	static long getCidrStartIp(String cidrIp){
		
		String [] IPRangeArray = cidrIp.split("/");
		
		String ip = IPRangeArray[0];
		String cidrDomain = "32";
		if(IPRangeArray.length > 1){ 
			cidrDomain = IPRangeArray[1];
		}
		
		long baseLongIp = getIpConvertToLong(ip);
		
		return (long) ((baseLongIp >> (32 - Integer.parseInt(cidrDomain))) * Math.pow(2, 32-Integer.parseInt(cidrDomain)));
	}
	
	static long getCidrEndIp(String cidrIp){
		
		String [] IPRangeArray = cidrIp.split("/");
		
		String ip = IPRangeArray[0];
		String cidrDomain = "32";
		if(IPRangeArray.length > 1){ 
			cidrDomain = IPRangeArray[1];
		}
		
		long baseLongIp = getIpConvertToLong(ip);		
		long startLongIp = (long) ((baseLongIp >> (32 - Integer.parseInt(cidrDomain))) * Math.pow(2, 32-Integer.parseInt(cidrDomain)));;
					
		return (long) (startLongIp + Math.pow(2, 32-Integer.parseInt(cidrDomain))-1);
		
	}
	
	
	static void cidrIp2Ip(String cidrIp){
		
		String [] IPRangeArray = cidrIp.split("/");
		
		String ip = IPRangeArray[0];
		String cidrDomain = IPRangeArray[1];
		
		
//		String [] IPRangeArray = sIPRange.split("/");
//		if(IPRangeArray.length == 1){
//			sIPAddress = IPRangeArray[0];
//			sIPCIDRBitCount = "32";
//		}
//		else if(IPRangeArray.length == 2){
//			sIPAddress = IPRangeArray[0];
//			sIPCIDRBitCount = IPRangeArray[1];
//		}
		
		
		//192.168.100.1 -> int
		
		long baseLongIp = -1;

		baseLongIp = getIpConvertToLong(ip);
		
		long ipCount = (long) Math.pow(2, 32-Integer.parseInt(cidrDomain));
		
		long extentedLongIp = -1;
		long startLongIp = (long) ((baseLongIp >> (32 - Integer.parseInt(cidrDomain))) * Math.pow(2, 32-Integer.parseInt(cidrDomain)));
		long endLongIp = (long) (startLongIp + Math.pow(2, 32-Integer.parseInt(cidrDomain))-1);;
		
		
		for(int i = 0; i < endLongIp - startLongIp ; i++){			
			//System.out.println("Count : [" + i + "/" + ipCount + "]");
			extentedLongIp = startLongIp + i;
			
			String resultIp = getIpConvertToString(extentedLongIp);
			//System.out.println("[RESULT] : " + resultIp);
			System.out.println(resultIp);
			
		}
	}

	public static long getIpConvertToLong( String sIpAddress ) {
		String sIpNo = sIpAddress;
		
		// "."���� �߶� ����Ʈ�� ��´�.
		StringTokenizer st = new StringTokenizer( sIpNo, "." );
		List lIp = new ArrayList();
		
		while( st.hasMoreElements() ){
			lIp.add( st.nextElement() );
		}
	
		int iNo = 0;		//����Ʈ�� ���� ���� ����
		final int iref = lIp.size()-1;	//
		int iNcount = 0;			//256�� ��������
		long lResult = 0;			//����Ʈ�� ���� 256�� �������� ���� ��� ����
		
		for( int i = 0; i < lIp.size(); i++ ){
			iNcount = iref - i;		//������ ��
			iNo = Integer.parseInt( lIp.get(i).toString() );	//����Ʈ�� ���� ��´�.
			lResult += iNo*((long)(Math.pow(256, iNcount)));	//
		}
		
		//System.out.println( "Result Long Type : " +lResult);
		
		return lResult;
	}


	public static String getIpConvertToString( long lIpAddress){
		
		long lIpNo = lIpAddress;
		StringBuffer sbIp = new StringBuffer();
		
		if( lIpNo > lIpAddress ){
			System.out.println("�߸��� �ڵ��Դϴ�.");
		}else{
			List lIpResult = new ArrayList();
			int iN1;
			int iN2;
			int iN3;
			int iN4;
			int iResult;
			
			iN1 = (int) (lIpNo/256);		// 000.000.000.XXX : XXX�� ����
			iResult = (int) (lIpNo%256);
			lIpResult.add(iResult);
			
			iN2 = iN1/256;					// 000.000.XXX.000 : XXX�� ����
			iResult = iN1%256;
			lIpResult.add(iResult);
			
			iN3 = iN2/256;					// 000.XXX.000.000 : XXX�� ����
			iResult = iN2%256;
			lIpResult.add(iResult);
			
			iN4 = iN3/256;					// XXX.000.000.000 : XXX�� ����
			iResult = iN3%256;
			lIpResult.add(iResult);
			
			
			for( int k = lIpResult.size()-1; k >= 0; k-- ){
				sbIp.append( lIpResult.get(k) );
				if( k == 0 ){
					//
				}else{
					sbIp.append( "." );
				}
			}
			//System.out.println( "IP : "+ sbIp.toString() ); 
		}
		
		return sbIp.toString();
	}

	public static boolean containsMultipleIpRanges(String multipleIpRanges, String targetIp) {
		String [] monResultInfoMailAllowIpArray = multipleIpRanges.split(";");
		boolean bResult = false;
		
		for(int i=0; i < monResultInfoMailAllowIpArray.length ; i++){
			if(IpUtils.containsIpRange(monResultInfoMailAllowIpArray[i],targetIp)){
				bResult = true;
			}
		}
		
		return bResult;
	}
}

