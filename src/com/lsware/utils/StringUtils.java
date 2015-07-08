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
 * Title:        ���ڿ� ���� �Լ� ����   
 * Description:
 * Copyright:    Copyright (c) 2007 
 * @author Kim Bo Won
 * @version 1.0
 */
public class StringUtils {	
	
	/**
	 * // �����ڵ� ��ȯ (EUC-KR --> 8859_1) 
	 * @param str ��ȯ�� ���ڿ�
	 * @return ��ȯ�� ���ڿ�
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
	 * �����ڵ� ��ȯ ( 8859_1 --> KSC5601 ) 
	 * @param str ��ȯ�� ���ڿ�
	 * @return ��ȯ�� ���ڿ�
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
	 * �����ڵ� ��ȯ ( 8859_1 --> KSC5601 )
	 * @param str ��ȯ�� ���ڿ�
	 * @return ��ȯ�� ���ڿ�
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
	 * �����ڵ� ��ȯ ( From --> to )
	 * @param str ��ȯ�� ���ڿ�
	 * @return ��ȯ�� ���ڿ�
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
	 * ���ڿ� ġȯ 
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

		if(idx == 0) {	// Replace�� ���ڿ��� �������� ������,
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
	* ���ڿ����� Ư���� �����ڷ� �и��Ͽ� ���ڿ� �迭�� ����� ��ȯ�Ѵ�.
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
	* ���ڿ��� Field�� �����ؼ�, ������ Field�� ���ڿ��� �����´�.<br>
	* �⺻ �ʵ� �����ڴ� ':'
	* @param sSource ���� ���ڿ�
	* @param iNo ������ Field�� ��ġ
	*/
	public static String getField(String sSource, int iNo) {
		return getField(sSource, iNo, ":");
	}

	/**
	 * ���ڿ��� Field�� �����ؼ�, ������ Field�� ���ڿ��� �����´�.<br>
	 * @param sSource ���� ���ڿ�
	 * @param iNo ������ Field�� ��ġ
	 * @param sDelim �ʵ� ������
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
	 * �� ���ڿ��� ������ ���� ��ŭ �߶� ��ȯ�Ѵ�.
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
	 * ���ڿ��� ������ ���� ��ŭ �߶� ��ȯ�Ѵ�. (����Ʈ ����)
	 * �ѱ��� ������ �ʰ� �ϱ� ����, �� ������ �ѱ��� ������ ��쿡�� �� ���ڸ� ������ �� ��ȯ��
	 * ex) �ҽ��� "�� �� ��" �� ��� : 3 -> "�� ", 4 -> "�� ", 5 -> "�� ��"
	*/
	public static String getByteCut(String sSource, int nLength) {
		return getByteCut(sSource, nLength, "...");
	}

	public static String getByteCut(String sSource, int nLength, String sAppend) {
		/*
		    // �� ������ ������ ��ȣ��Ʈ üũ�ϴ� ��� -> ��Ȯ���� �ʴ� ��찡 ����. (2����Ʈ�� 1����Ʈ�� �ν��ϴ� ��� ����)
		    byte[] b = sSource.getBytes();
		    if (b.length <= nLength) return sSource;

		    if ((b[nLength-1] & 0x80) == 0) { // ��ȣ��Ʈ�� ���� 0 �� �ƴ� ���� 2����Ʈ ���ڷ� ����.
		        return new String(b, 0, nLength) + sAppend;
			} else {
				// return new String(b, 0, nLength+1) + (nLength+1 < b.length ? sAppend : ""); // nLength+1�� �߷��� �ѱ��� �����ϰ� ��ȯ
				return new String(b, 0, nLength-1) + sAppend; // nLength-1�� �߷��� �ѱ��� �����Ͽ� ��ȯ
		    }
		*/

		// ĳ���� ������ üũ�Ͽ� ��ȯ�ϴ� ���
		if (sSource.getBytes().length <= nLength) return sSource;

		StringBuffer sb = new StringBuffer();
		char c;
		int nCount = 0;
		for(int i=0; i < sSource.length(); i++) {
			c = sSource.charAt(i);
			// if (c < 256) nCount++; // �ѱ��� �ƴѰ��
			if (c < 0xac00 || 0xd7a3 < c) nCount++; // �ѱ��� �ƴѰ��
			else nCount += 2; // �ѱ��� ���

			if (nCount > nLength) break;
			else sb.append(c);
		}
		return sb.append(sAppend).toString();
	}

	/**
	 * ������ �ڸ��� ��ŭ 0�� �պκп� ä���.
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
	 * * ������ �ڸ��� ��ŭ ������ �պκп� ä���.
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
	 * ���� ���ڿ��� 3�ڸ����� �޸��� �ִ´�.
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
	 * ���ڿ��� ������ �����
	 * ������ ���� �� �ڸ����� ������.
	 * 20051023, "4/2/2" --> 2005/10/23
	 * 20051023, "4��2��2��" --> 2005��10��23��
	 * 200510, "4��2��2��" --> 2005��10��  ��
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
   * 160bit �� Ȯ��
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
	 * 2010.03.18 ������
	 * �ڵ�����ȣ�� "-" �����ؼ� �������ִ� ��Ʈ�� ���� �Լ�
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
	 * 2010.03.29 ������
	 * ��ȭ��ȣ�� "-" �����ؼ� �������ִ� ��Ʈ�� ���� �Լ�
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
	* ���� ��: �ڹ�Ŭ��(javaclue) 
	* ���� ��: 2003/05/15
	* �ű� ��: ������
	* �ű� ��: 2010/04/23   
	* 
	* ������ ������ ���� ��ŭ ��ĭ(" ")�� ��Ʈ���� ���Ѵ�. 
	* 
	* @param int ���� ���� 
	* @return String ������ ���� ��ŭ�� ��ĭ��� ����� String 
	*/ 
	public static String spaces(int count) { 
	StringBuffer sb = new StringBuffer(); 
	for (int i = 0; i < count; i++) { 
	sb.append(' '); 
	} 
	return sb.toString(); 
	} 

	/** 
	* ���� ��: �ڹ�Ŭ��(javaclue) 
	* ���� ��: 2003/06/26
	* �ű� ��: ������
	* �ű� ��: 2010/04/23    
	* 
	* ������ ������ ���� ��ŭ ��ĭ(" ")�� ��Ʈ���� ���Ѵ�. 
	* ���ܵ� String�� ����Ʈ ���� �ڸ� ����Ʈ �������� ���ڶ��� �ʵ��� �Ѵ�. 
	* 
	* @param str ���� String 
	* @param int �ڸ� ����Ʈ ���� 
	* @return String ���ܵ� String 
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
	* ���� ��: �ڹ�Ŭ��(javaclue) 
	* ���� ��: 2003/06/26 
	* �ű� ��: ������
	* �ű� ��: 2010/04/23   
	* 
	* ������ ������ ���� ��ŭ ��ĭ(" ")�� ��Ʈ���� ���Ѵ�. 
	* ���ܵ� String�� ����Ʈ ���� �ڸ� ����Ʈ ������ ���� �ʵ��� �Ѵ�. 
	* 
	* @param str ���� String 
	* @param int �ڸ� ����Ʈ ���� 
	* @return String ���ܵ� String 
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
     * 3�ڸ� ���� �޸� �߰�
     *
     * @param str   ����ڿ�
     * @param limit �ڸ� �ڸ���   
     * @return      �߶��� ���ڿ�
     */

    //String type�� ��� 
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
    
    //int type�� ���
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
