package shms.service;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import shms.common.ParamMap;

import com.lsware.utils.DateUtils;
import java.util.*;
import java.io.*;

/*
 * FileService.java 1.0, 2009. 12. 3.
 * 
 * Copyright (c) 2009 by LSware Inc. All rights reserved.
 */

public class FileService extends ParamMap {
	
	
	
	public void makeBasePath(String path){
		File dir = new File(path);
		if(!dir.exists())
		{
			dir.mkdirs();
		}
	}
	
	public String saveFile(File file, String fileName) throws IOException{
		if(null == file || file.getName().equals("") || file.length() <= 0){
			return null;
		}
		
		String fullPath ="";
		
		
		int pos = fileName.lastIndexOf(".");
		
		String ext = fileName.substring(pos + 1); 
		
		fileName = UUID() +"."+ ext;
		
		String basePath = super.getServletContext().getRealPath("/upload") + "\\" + DateUtils.getCurrentDateByType("yyyy-MM") + "\\" ;
		
		fullPath = DateUtils.getCurrentDateByType("yyyy-MM") + "/" + fileName;
		
		// ���̽� ���� ����
		makeBasePath(basePath);
		
		// ������ ��ü ��� ����
		String serverFullPath = basePath + "\\" + fileName;
		
		// ��������
		FileInputStream inputStream = new FileInputStream(file);
		FileOutputStream outputStream = new FileOutputStream(serverFullPath);
		
		int bytesRead = 0;
		byte[] buffer = new byte[1024];
		while((bytesRead = inputStream.read(buffer, 0, 1024)) != -1){
			outputStream.write(buffer, 0, bytesRead);
		}
		
		outputStream.close();
		inputStream.close();
		
		return fullPath;
	}
	
	/**
	 * ���ϻ���
	 * @param filePath
	 * @throws IOException
	 */
	public void deltetFile(String filePath) throws IOException{
		File f = new File(filePath);
		File d = new File(f.getPath().substring(0, f.getPath().lastIndexOf("\\")));
		f.delete(); // ���ϻ���
		d.delete(); // ���丮����
	}
	
	/**
	 * java���� �����ϴ� ���� UUID
	 * @return
	 */
	public String UUID(){
		return UUID.randomUUID().toString();	
	}
	
}

