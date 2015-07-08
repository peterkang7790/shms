package com.lsware.utils;

import java.io.*;
import java.security.MessageDigest;
import java.util.*;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;

import com.teesoft.stringEncode;


/**
 * Title:        파일관련 함수 모음   
 * Description:
 * Copyright:    Copyright (c) 2009
 * @author anubis
 * @version 1.0
 */
public class FileUtils {	
	
	public static String getStringFromFile(String filePath) throws IOException{	
		return getStringFromFile(filePath, null);
	}

	public static void stringToFile(String filePath, String contents) {
		FileWriter fileWriter = null;
		try {
			fileWriter = new FileWriter(filePath);
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		try {
			fileWriter.append(contents);
			fileWriter.flush();
			fileWriter.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static String getStringFromFile(String filePath, String encoding) 
		throws java.io.IOException {		
		StringBuffer fileData = new StringBuffer(1000);
		BufferedReader reader = null;
		
		if(encoding == null){
			reader = new BufferedReader(new FileReader(filePath));
		}
		else{
			reader = new BufferedReader(new InputStreamReader(new FileInputStream(filePath), encoding));
		}
		char[] buf = new char[1024];
		int numRead = 0;
		while ((numRead = reader.read(buf)) != -1) {
			String readData = String.valueOf(buf, 0, numRead);
			fileData.append(readData);
			buf = new char[1024];
		}
		reader.close();
		return fileData.toString();		
	}

	public static byte[] getBytesFromFile(String filePath) throws IOException {
		
		File f = new File(filePath);
		byte[] resultByteArray = null;
		int fileLength = (int)f.length();
		byte[] byteBuffer = new byte[fileLength];
		int len; // 실제로 읽어온 길이 (바이트 개수)
		int counter = 0;

		DataInputStream in = new DataInputStream(new FileInputStream(filePath));

		int readCount=0;		
		while ((len = in.read(byteBuffer, readCount, fileLength-readCount)) > 0) {
			readCount += len;
		}  
		
		resultByteArray = byteBuffer;
		
		return resultByteArray;
	}
	
	public static void bytesToFile(String filePath, byte [] bytes) throws IOException {
		DataOutputStream out = null;
		try {
			out = new DataOutputStream(new FileOutputStream(filePath));
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		out.write(bytes);
	}

	public static InputStream getInputStreamFromFileByNative2Ascii(String filePath) {
		InputStream in = null;
	
		if((filePath != null) && (new File(filePath).exists())){
			try {
				in = StringUtils.getInputStreamFromString(stringEncode.native2ascii(FileUtils.getStringFromFile(filePath)));
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			};
		}
		return in; 
	}
}
  

