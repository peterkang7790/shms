package com.lsware.utils;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.nio.ByteBuffer;
import java.nio.CharBuffer;
import java.nio.charset.CharacterCodingException;
import java.nio.charset.Charset;
import java.nio.charset.CharsetDecoder;
import java.security.MessageDigest;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;


/**
 * Title:        문자열 관련 함수 모음   
 * Description:
 * Copyright:    Copyright (c) 2007 
 * @author Kim Bo Won
 * @version 1.0
 */
public class StringUtils {	
	
	/**
	 * // 문자코드 변환 (EUC-KR --> 8859_1) 
	 * @param str 변환할 문자열
	 * @return 변환된 문자열
	 */
	public static String eucToLatin1(String sData) {
		if(sData == null) return null;
		try {
			return new String(sData.getBytes("euc-kr"), "8859_1");
		} catch(UnsupportedEncodingException e) {
			return sData;
		}		
	}	
	
	/**
	 * 문자코드 변환 ( 8859_1 --> KSC5601 ) 
	 * @param str 변환할 문자열
	 * @return 변환된 문자열
	*/
	public static String asciiToKsc(String sData) {
		if(sData == null) return null;
		try {
			return new String(sData.getBytes("8859_1"), "KSC5601");
		} catch (UnsupportedEncodingException e) {
			return sData;
		}
	}

	/**
	 * 문자코드 변환 ( 8859_1 --> KSC5601 )
	 * @param str 변환할 문자열
	 * @return 변환된 문자열
	*/
	public static String kscToAscii(String sData) {
		if(sData == null) return null;
		try {
			return new String (sData.getBytes("KSC5601"),"8859_1");
		} catch (UnsupportedEncodingException e) {
			return sData;
		}
	}
	
	/**
	 * 문자코드 변환 ( From --> to )
	 * @param str 변환할 문자열
	 * @return 변환된 문자열
	*/
	public static String encodeString(String sData, String fromCharterSet, String toCharterSet) {		
		if(sData == null) return null;
		try {
			return new String (sData.getBytes(fromCharterSet),toCharterSet);
		} catch (UnsupportedEncodingException e) {
			return sData;
		}
	}

	
	 public static String LocalString( String val)
	 {
	  if (val == null)
	   return null;
	  else {
	   byte[] b;

	   try {
	    b = val.getBytes("8859_1");
	    CharsetDecoder decoder = Charset.forName("UTF-8").newDecoder();
	    try {
	     CharBuffer r = decoder.decode( ByteBuffer.wrap( b));
	     return r.toString();
	    } catch (CharacterCodingException e) {
	     return new String( b, "EUC-KR");
	    }
	   } catch (UnsupportedEncodingException e1) {
	    e1.printStackTrace();
	   }
	  } return null;
	 }

	
	
	/*
	 * 문자열 치환 
	*/
	public static String replace(String strSource, String strOrg, String strConv) {
		if(strSource == null) return null;

		StringBuffer strBuffer = new StringBuffer();

		int idx = 0;
		int idx2 =0;
		while ( (idx2 = strSource.indexOf(strOrg, idx)) >=0 ) {
			strBuffer.append(strSource.substring(idx, idx2));
			strBuffer.append(strConv);

			idx = idx2 + strOrg.length();
		}

		if(idx == 0) {	// Replace할 문자열이 존재하지 않을때,
			strBuffer.append(strSource);
		} else {
			strBuffer.append(strSource.substring(idx));
		}

		return strBuffer.toString();
	}

	public static String replaceHtml(String sSource) {
		String sConv;
		sConv = StringUtils.replace(sSource, "  ", "&nbsp;&nbsp;");
		sConv = StringUtils.replace(sConv, "\t", "&nbsp;&nbsp;&nbsp;&nbsp;");
		sConv = StringUtils.replace(sConv, "<", "&lt;");
		sConv = StringUtils.replace(sConv, ">", "&gt;");
		sConv = StringUtils.replace(sConv, "\r\n", "<br>\n");
		return sConv;
	}

    public static String join(String[] arr, String sDelim) { return join(arr, sDelim, null); }
	public static String join(String[] arr, String sDelim, String s) {
        StringBuffer sb = new StringBuffer();
        if (arr == null) return "";
        for (int i=0 ; i<arr.length ; i++) {
        	if (s != null) sb.append(s);
            sb.append(arr[i]);
            if (s != null) sb.append(s);
            
            if (arr.length-1 != i) sb.append(sDelim);
        }

        return sb.toString();
    }
    
	/**
	* 문자열에서 특정한 구분자로 분리하여 문자열 배열을 만들어 반환한다.
	*/
	public static String[] getArray(String sSource, String sDelm) {
		if(sSource == null){
			return null;
		}
		StringTokenizer st = new StringTokenizer(sSource, sDelm);
		String[] rev = new String[st.countTokens()];
		int i = 0;
		while (st.hasMoreElements()) {
			rev[i++] = st.nextToken().trim();
		}
		return rev;
	}

	/**
	* 문자열을 Field로 구분해서, 지정한 Field의 문자열을 가져온다.<br>
	* 기본 필드 구분자는 ':'
	* @param sSource 원문 문자열
	* @param iNo 가져올 Field의 위치
	*/
	public static String getField(String sSource, int iNo) {
		return getField(sSource, iNo, ":");
	}

	/**
	 * 문자열을 Field로 구분해서, 지정한 Field의 문자열을 가져온다.<br>
	 * @param sSource 원문 문자열
	 * @param iNo 가져올 Field의 위치
	 * @param sDelim 필드 구분자
	 */
	public static String getField(String sSource, int iNo, String sDelim) {
		StringTokenizer st = new StringTokenizer(sSource, sDelim);

		int i = 0;
		String sTmp;
		while (st.hasMoreTokens()) {
			sTmp = st.nextToken().trim();
			if (i == iNo) return sTmp;

			i++;
		}
		return null;
	}

	/**
	 * 긴 문자열을 지정한 길이 만큼 잘라 반환한다.
	 * @param sSource
	 * @param nLength
	 * @return
	 */
	public static String getCutString(String sSource, int nLength) {
		return getCutString(sSource, nLength, "...");
	}

	public static String getCutString(String sSource, int nLength, String sAppend) {
		if(sSource.length() < nLength) {
			nLength = sSource.length();
			return sSource.substring(0, nLength);
		} else return sSource.substring(0, nLength) + sAppend;
	}

	/*
	 * 문자열을 지정한 길이 만큼 잘라 반환한다. (바이트 단위)
	 * 한글이 깨지지 않게 하기 위해, 맨 마지막 한글이 깨지는 경우에는 그 글자를 삭제한 후 반환함
	 * ex) 소스가 "가 나 다" 일 경우 : 3 -> "가 ", 4 -> "가 ", 5 -> "가 나"
	*/
	public static String getByteCut(String sSource, int nLength) {
		return getByteCut(sSource, nLength, "...");
	}

	public static String getByteCut(String sSource, int nLength, String sAppend) {
		/*
		    // 맨 마지막 글자의 부호비트 체크하는 방법 -> 정확하지 않는 경우가 있음. (2바이트를 1바이트로 인식하는 경우 있음)
		    byte[] b = sSource.getBytes();
		    if (b.length <= nLength) return sSource;

		    if ((b[nLength-1] & 0x80) == 0) { // 부호비트의 값이 0 이 아닌 경우는 2바이트 문자로 간주.
		        return new String(b, 0, nLength) + sAppend;
			} else {
				// return new String(b, 0, nLength+1) + (nLength+1 < b.length ? sAppend : ""); // nLength+1은 잘려진 한글을 완전하게 반환
				return new String(b, 0, nLength-1) + sAppend; // nLength-1은 잘려진 한글을 삭제하여 반환
		    }
		*/

		// 캐릭터 단위로 체크하여 반환하는 방법
		if (sSource.getBytes().length <= nLength) return sSource;

		StringBuffer sb = new StringBuffer();
		char c;
		int nCount = 0;
		for(int i=0; i < sSource.length(); i++) {
			c = sSource.charAt(i);
			// if (c < 256) nCount++; // 한글이 아닌경우
			if (c < 0xac00 || 0xd7a3 < c) nCount++; // 한글이 아닌경우
			else nCount += 2; // 한글인 경우

			if (nCount > nLength) break;
			else sb.append(c);
		}
		return sb.append(sAppend).toString();
	}

	/**
	 * 지정한 자리수 만큼 0을 앞부분에 채운다.
	 * @param nData
	 * @param nLength
	 * @return
	 */
	public static String insertZero(int nData, int nLength) {
		String sData = Integer.toString(nData);
		int nDataLength = sData.getBytes().length;
		if (nLength > nDataLength) {
			StringBuffer sb = new StringBuffer(sData);
			for(int i = nDataLength; i < nLength; i++) sb.insert(0, '0');
			return sb.toString();
		} else return sData;
	}

	/**
	 * * 지정한 자리수 만큼 공백을 앞부분에 채운다.
	 * @param sData
	 * @param nLength
	 * @return
	 */
	public static String insertSpace(String sData, int nLength) {
		int nDataLength = sData.getBytes().length;
		if (nLength > nDataLength) {
			StringBuffer sb = new StringBuffer(sData);
			for(int i = nDataLength; i < nLength; i++) sb.insert(0, ' ');
			return sb.toString();
		} else return sData;
	}

	/**
	 * 숫자 문자열에 3자리마다 콤마를 넣는다.
	 * @param sSource
	 * @return
	 */
	public static String money(int n) { return insertCommaToNumber(""+n); }
	public static String money(String s) { return insertCommaToNumber(s); }
	public static String insertCommaToNumber(int nNumber) { return insertCommaToNumber(""+nNumber); }
	public static String insertCommaToNumber(String sSource) {
		boolean bNegative = false;
		String s1 = "";
		String new_s1 = "";
		int i=0;
		int j=0;

		String reStr = sSource.trim();

		for(i=0; i < reStr.length(); i++) {
			if(reStr.charAt(i) != '-') {
				s1 += reStr.charAt(i);
			} else bNegative = true;
		}

		int nam = s1.length() % 3;

		for(i=0, j=0; i<s1.length(); i++ , j++) {
			if(i%3 == nam && i != 0) {
				new_s1 += ",";
				j++;
			}
			new_s1 += s1.charAt(i);
		}

		if(bNegative) new_s1 = "-" + new_s1;
		return new_s1;
	}


	/**
	 * 문자열의 포맷을 잡아줌
	 * 포맷은 숫자 한 자리씩만 가능함.
	 * 20051023, "4/2/2" --> 2005/10/23
	 * 20051023, "4년2월2일" --> 2005년10월23일
	 * 200510, "4년2월2일" --> 2005년10월  일
	*/
	public static String format(String sData, String sFormat) {
		if (sData == null) return sData;

		StringBuffer sb = new StringBuffer();
		int nLength = sData.length();
		int nIdx = 0;  
		int nCount;
		char c;
		for (int i=0; i<sFormat.length(); i++) {
			c = sFormat.charAt(i);
			if (c >= '0' && c <= '9') {
				nCount = Integer.parseInt(c+"");
				if (nLength >= (nIdx + nCount)) {
					sb.append(sData.substring(nIdx, nIdx + nCount));
					nIdx += nCount;
				} else {
					for (int k=0; k<nCount; k++) sb.append(' ');
				}
			} else {
				sb.append(c);
			}
		}
		return sb.toString();
	}

   public static String getExt(String s)
  {
		return getExt(s, "");
  }

  public static String getExt(String s, String s1)
  {
		int i = s.lastIndexOf(".");
		if(i >= 0)
			return s.substring(i + 1);
		else
			return s1;
  }
  
  public static String decode(String src, String format)
  {
	String org = src;
	
	if((org != null) && (format != null)){
		String[] decodeArray = format.split(",");
		if(decodeArray != null){
			if((decodeArray.length > 0) && (decodeArray.length % 2 == 0)){
				for(int decodeIndex=0; decodeIndex < (decodeArray.length -1) ; decodeIndex++){
					if(org.equals(decodeArray[decodeIndex])){
							org = decodeArray[decodeIndex+1];
							decodeIndex++;
					}
				}
			}
			else{
				System.out.println("Command Definition Error : Invalid Decode");
			}
		}
	}
	  
	return org;
  }
  
  public static String md5Base64(String passwd_string){
      try{
          MessageDigest md5Digest;
          String retMd5= new String();
          String tmpChar = new String();
          md5Digest = MessageDigest.getInstance ("MD5");
          md5Digest.update (passwd_string.getBytes ());

          byte[] md5Hash = md5Digest.digest();

          for (int i = 0 ; i < 16; i++)
          {
              if (md5Hash[i] >=0){
                  if( Integer.toHexString (  md5Hash[i]  ).length () ==1)
                      retMd5 = retMd5 + "0" + Integer.toHexString (  md5Hash[i]  );
                  else
                      retMd5 = retMd5 +  Integer.toHexString (  md5Hash[i]  );

              }else{
                  if( Integer.toHexString (  256 - Math.abs(md5Hash[i])).length () == 1)
                      retMd5 = retMd5 + "0" + Integer.toHexString (   256 - Math.abs(md5Hash[i]) ) ;
                  else
                      retMd5 = retMd5 + Integer.toHexString (   256 - Math.abs(md5Hash[i])  ) ;
              }
          }
          return retMd5 ;
      }catch(Exception e){
          return new String("error");
      }
  }
  
  /*
   * 2010.03.24 peterkang
   * 160bit 로 확장
   */
  public static String cha1Security(String passwd_string){
      try{
          MessageDigest chaDigest;
          String retMd5= new String();
          String tmpChar = new String();
          chaDigest = MessageDigest.getInstance ("SHA1");
          chaDigest.update (passwd_string.getBytes ());

          byte[] chaHash = chaDigest.digest();

          for (int i = 0 ; i < 16; i++)
          {
              if (chaHash[i] >=0){
                  if( Integer.toHexString (  chaHash[i]  ).length () ==1)
                      retMd5 = retMd5 + "0" + Integer.toHexString (  chaHash[i]  );
                  else
                      retMd5 = retMd5 +  Integer.toHexString (  chaHash[i]  );

              }else{
                  if( Integer.toHexString (  256 - Math.abs(chaHash[i])).length () == 1)
                      retMd5 = retMd5 + "0" + Integer.toHexString (   256 - Math.abs(chaHash[i]) ) ;
                  else
                      retMd5 = retMd5 + Integer.toHexString (   256 - Math.abs(chaHash[i])  ) ;
              }
          }
          return retMd5 ;
      }catch(Exception e){
          return new String("error");
      }
  }
  
  public static String getDecimalFormat(String format, int number){
	  String result = null;
	  if(format != null){
		  DecimalFormat decimalformat = new DecimalFormat(format);
		  result = decimalformat.format(number);
	  }
	  
	  return result;		
  }

	public static InputStream getInputStreamFromString(String string) {
		InputStream in = null;
		
		if(string == null){
			return in;
		}
		
		in = new ByteArrayInputStream(string.getBytes());
		
		return in; 
	}

	public static String getStringFromStream(InputStream inStream) {

		String string = null;
		
		if(inStream != null){
			
			BufferedReader r = new BufferedReader(new InputStreamReader(inStream));
			
			String newline = System.getProperty("line.separator");
			
			String inLine;
					
			try {
				while ((inLine = r.readLine()) != null) {
					string += inLine;
					string += newline;
				}
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return string;
	}

	public static String[] stringToStringArray(Object object) {
		
		String [] resultStringArray = null;
		
		if("java.lang.String".equals(object.getClass().getCanonicalName())){
			resultStringArray = new String[1];
			resultStringArray[0] = (String) object;
		}
		else if("java.lang.String[]".equals(object.getClass().getCanonicalName())){
			resultStringArray = (String [])object;
		}
		
		return resultStringArray;
	}
	
	
	public static Map stringToMap(Object object) {
		
		Map resultMap = null;
		
		if("java.lang.String".equals(object.getClass().getCanonicalName())){
			resultMap = new HashMap();
			resultMap.put("0", object);
		}
		else if("java.lang.String[]".equals(object.getClass().getCanonicalName())){
			String [] tempStringArray = (String []) object;
			if(tempStringArray.length > 0){
				resultMap = new HashMap();
				for(int i=0; i < tempStringArray.length ; i++){
					resultMap.put(String.valueOf(i), tempStringArray[i]);
				}
			}
		}
		
		return resultMap;
	}
	
	public static List stringToArrayList(Object object) {
		
		List resultList = null;
		
		if("java.lang.String".equals(object.getClass().getCanonicalName())){
			resultList = new ArrayList();
			resultList.add(object);
		}
		else if("java.lang.String[]".equals(object.getClass().getCanonicalName())){
			String [] tempStringArray = (String []) object;
			if(tempStringArray.length > 0){
				resultList = new ArrayList();
				for(int i=0; i < tempStringArray.length ; i++){
					resultList.add(tempStringArray[i]);
				}
			}
		}
		
		return resultList;
	}
	
	/*
	 * 2010.03.18 강평희
	 * 핸드폰번호를 "-" 구분해서 변경해주는 스트링 리턴 함수
	 * */
	
   public static String strMobileNo( String recvNo )
   {
		int rno = recvNo.length();
		
		String a1 = "";
		String m1 = "";
		String e1 = "";
		
		String cell_no = "";
		if( rno == 11 )
		{
			a1 = recvNo.substring(0, 3);
			m1 = recvNo.substring(3, 7);
			e1 = recvNo.substring(7, 11);
			cell_no = a1 +"-"+ m1 +"-"+ e1;
		}
		else if( rno == 10 )
		{
			a1 = recvNo.substring(0, 3);
			m1 = recvNo.substring(3, 6);
			e1 = recvNo.substring(6, 10);
			cell_no = a1 +"-"+ m1 +"-"+ e1;
		}
		else
		{
			cell_no = recvNo;
		}
		
		return cell_no;
   }

   /*
	 * 2010.03.29 강평희
	 * 전화번호를 "-" 구분해서 변경해주는 스트링 리턴 함수
	 * */
	
  public static String strTelNo( String recvNo )
  {
		int rno = recvNo.length();
		
		String a1 = "";
		String m1 = "";
		String e1 = "";
		
		String cell_no = "";
		
		String fixval = recvNo.substring(0,2);
		
		if( "02".equals(fixval) )
		{
			if( rno == 10 )
			{
				a1 = recvNo.substring(0, 2);
				m1 = recvNo.substring(2, 6);
				e1 = recvNo.substring(6, 10);
				cell_no = a1 +"-"+ m1 +"-"+ e1;
			}
			else if( rno == 9 )
			{
				a1 = recvNo.substring(0, 2);
				m1 = recvNo.substring(2, 5);
				e1 = recvNo.substring(5, 9);
				cell_no = a1 +"-"+ m1 +"-"+ e1;
			}
			else
			{
				cell_no = recvNo;
			}
		}
		else
		{
			if( rno == 11 )
			{
				a1 = recvNo.substring(0, 3);
				m1 = recvNo.substring(3, 7);
				e1 = recvNo.substring(7, 11);
				cell_no = a1 +"-"+ m1 +"-"+ e1;
			}
			else if( rno == 10 )
			{
				a1 = recvNo.substring(0, 3);
				m1 = recvNo.substring(3, 6);
				e1 = recvNo.substring(6, 10);
				cell_no = a1 +"-"+ m1 +"-"+ e1;
			}
			else
			{
				cell_no = recvNo;
			}
			
		}
		
		
		
		return cell_no;
  }

  /** 
	* 만든 이: 자바클루(javaclue) 
	* 만든 날: 2003/05/15
	* 옮긴 이: 강평희
	* 옮긴 날: 2010/04/23   
	* 
	* 지정한 정수의 개수 만큼 빈칸(" ")을 스트링을 구한다. 
	* 
	* @param int 문자 개수 
	* @return String 지정된 개수 만큼의 빈칸들로 연결된 String 
	*/ 
	public static String spaces(int count) { 
	StringBuffer sb = new StringBuffer(); 
	for (int i = 0; i < count; i++) { 
	sb.append(' '); 
	} 
	return sb.toString(); 
	} 

	/** 
	* 만든 이: 자바클루(javaclue) 
	* 만든 날: 2003/06/26
	* 옮긴 이: 강평희
	* 옮긴 날: 2010/04/23    
	* 
	* 지정한 정수의 개수 만큼 빈칸(" ")을 스트링을 구한다. 
	* 절단된 String의 바이트 수가 자를 바이트 개수보다 모자라지 않도록 한다. 
	* 
	* @param str 원본 String 
	* @param int 자를 바이트 개수 
	* @return String 절단된 String 
	*/ 
	public static String cutStringByBytes(String str, int length) { 
	byte[] bytes = str.getBytes(); 
	int len = bytes.length; 
	int counter = 0; 
	if (length >= len) { 
	return str + spaces(length - len); 
	} 
	for (int i = length - 1; i >= 0; i--) { 
	if (((int)bytes[i] & 0x80) != 0) 
	counter++; 
	} 
	return new String(bytes, 0, length + (counter % 2)); 
	} 
	
	/** 
	* 만든 이: 자바클루(javaclue) 
	* 만든 날: 2003/06/26 
	* 옮긴 이: 강평희
	* 옮긴 날: 2010/04/23   
	* 
	* 지정한 정수의 개수 만큼 빈칸(" ")을 스트링을 구한다. 
	* 절단된 String의 바이트 수가 자를 바이트 개수를 넘지 않도록 한다. 
	* 
	* @param str 원본 String 
	* @param int 자를 바이트 개수 
	* @return String 절단된 String 
	*/ 
	public static String cutInStringByBytes(String str, int length) { 
	byte[] bytes = str.getBytes(); 
	int len = bytes.length; 
	int counter = 0; 
	if (length >= len) { 
	return str + spaces(length - len); 
	} 
	for (int i = length - 1; i >= 0; i--) { 
	if (((int)bytes[i] & 0x80) != 0) 
	counter++; 
	} 
	return new String(bytes, 0, length - (counter % 2)); 
	} 

	/**
     * 3자리 마다 콤마 추가
     *
     * @param str   대상문자열
     * @param limit 자를 자릿수   
     * @return      잘라진 문자열
     */

    //String type인 경우 
    public static String addComma(String str) {

        StringBuffer sb = new StringBuffer(str);
        StringBuffer rsb = new StringBuffer();
        sb = sb.reverse();
        int p = 0;

        for (int i = 0; i < str.length(); i++) {
            p = i % 3;

            if (i > 0)
                if (p == 0)
                    rsb.append(",");

            rsb.append(sb.substring(i, (i + 1)));
        }

        return (rsb.reverse()).toString();
    }
    
    //int type인 경우
    public static String addComma(int num) {

        String str = num + "";
        StringBuffer sb = new StringBuffer(str);
        StringBuffer rsb = new StringBuffer();
        sb = sb.reverse();
        int p = 0;

        for (int i = 0; i < str.length(); i++) {
            p = i % 3;

            if (i > 0)
                if (p == 0)
                    rsb.append(",");

            rsb.append(sb.substring(i, (i + 1)));
        }

        return (rsb.reverse()).toString();
    }


//String asciiString = "";
//BufferedReader r = (encodingString != null) ? new BufferedReader(
//    new InputStreamReader(forwardIn, encodingString))
//    : new BufferedReader(new InputStreamReader(forwardIn));
//
//    String inLine;
//
//    while ((inLine = r.readLine()) != null) {
//    	//inLine = StringUtils.encodeString(inLine, "EUC-KR", "UTF-8");
//    	char [] aa = inLine.toCharArray();
//    	
//    	for(int i=0; i < aa.length ; i++){
//    		System.out.print(aa[i]);
//    	}
//    	
//    	System.out.println("");
//    	//System.out.println();
//    	//asciiString += "\r\n";
//    	
//    }                       	
//
//    //System.out.println(asciiString);
//    
////String ss = "";
////ss.



	 

  
}
