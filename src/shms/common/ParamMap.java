/*
 * getParamMap.java 1.0, 2009. 5. 27.
 * 
 * Copyright (c) 2008 BY LSWARE INC. All rights reserved.
 */

package shms.common;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.util.ServletContextAware;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

/**
 * 
 * @author ��ȣ��(hoya@lsware.co.kr)
 * @version 1.0,  2009. 5. 29.
 */
public class ParamMap extends ActionSupport implements Preparable, ModelDriven, ServletContextAware {
	
	private ServletContext context; 
	
	public ParamMap() {

	}
	
	private Map<String, Object> dataMap;
	private CaseIgnoreHashMap reqMap = null;
	
	public Map<String, Object> initReqMap(){
		

		if(reqMap != null){
			reqMap.clear();
			reqMap = null;
		}
		
		ArrayList arraylist = new ArrayList();
		setReqMap(new CaseIgnoreHashMap());
		Enumeration<String> enumeration = ServletActionContext.getRequest().getParameterNames();
		
		String dataListName = ""; // data list na
		int dataListIndex = -1; // input index
		String dataListItemPropertyName = ""; // input name
		String dataListItemPropertyValue = ""; // input value
		List dataListItemPropertyValues = null; // input values
		
		while (enumeration.hasMoreElements()) {
		    String paramName = enumeration.nextElement();
		    
		    String[] paramValues = ServletActionContext.getRequest().getParameterValues(paramName);
		    
		    /* parameter ���� �ߺ����� �ʴ� ��� */
		    if(paramValues.length == 1){
		    	
		    	/* parameter ���� �ߺ����� �ʰ� parameter name�� �迭������ ���  */
			    if(paramName.indexOf("__") != -1 || paramName.lastIndexOf("__") != -1){
			    	dataListName = paramName.substring(0, paramName.indexOf("__")).trim();
			    	dataListIndex =  Integer.parseInt(paramName.substring(paramName.indexOf("__")+2, paramName.lastIndexOf("__")).trim());
			    	dataListItemPropertyName =  paramName.substring(paramName.lastIndexOf("__")+2).trim();
		    		dataListItemPropertyValue =  paramValues[0];
			    	
			    	HashMap dataList = null;
			    	
			    	// reqMap�� dataListName���� ������
			    	// reqMap�� key������ dataListName�� �ְ� value������ dataList�� ���� �����Ѵ�.
			    	if((dataList = (HashMap)reqMap.get(dataListName)) == null){
			    		dataList = new HashMap();
			    		reqMap.put(dataListName, dataList);
			    	}
			    	
			    	HashMap hm = new HashMap();
		    		HashMap dataItemMap = null;
		    		
		    		// dataListIndex�� ���� dataList������� ũ�ų� ����, �Ǵ�
		    		// dataList�� dataListIndex�� �ش��ϴ� index���� null�̸�
		    		// �ؽ��ʿ� key������ dataListItemPropertyName(�Է��̸�)�� �ְ� value������ dataListItemPropertyValue(�Է°�)�� �����Ѵ�.
		    		// key, value�� ������ �ؽ����� arrayList�� dataListIndex������ �־��ش�.
		    		if((dataItemMap = (HashMap)dataList.get(dataListIndex)) == null){
			    		hm.put(dataListItemPropertyName, dataListItemPropertyValue);
		    			dataList.put(dataListIndex,hm);
		    		}
		    		// dataListIndex�� ���� dataList������� ������, �Ǵ�
		    		// dataList�� dataListIndex�� �ش��ϴ� ���� �����ϸ� 
		    		// dataList�� dataListIndex�� �ش��ϴ� ���� dataItemMap�� �ؽ��ʿ� ��������
		    		// dataItemMap�ؽ��ʿ� key������ dataListItemPropertyName(�Է��̸�)�� �ְ� value������ dataListItemPropertyValue(�Է°�)�� �����Ѵ�.
		    		else{
			    		dataItemMap.put(dataListItemPropertyName, dataListItemPropertyValue);
		    		}
			    }
			    /* parameter ���� �ߺ����� �ʰ� parameter name�� �迭���°� �ƴ� ��� */
			    else if(!"jsessionid".equals(paramName)){
			    	
			    	String almStr = "";
			    	
			    	if( paramName.startsWith("alm_level") )
			    	{
			    	//	almStr = paramName.substring(0, 9);
			    		reqMap.put(paramName, paramValues);
			    	}
			    	else
			    	{
			    		reqMap.put(paramName, paramValues[0]);
			    	}
			    	
			    }
			    // parameter name�� jsessionid�� ���� �����Ѵ�.
		    }
		    /* parameter ���� �ߺ��Ǵ� ��� */
		    else{
		    	reqMap.put(paramName, paramValues);
		    }
		}
		
		return reqMap;
	}
	
	/**
	 * ����¡
	 * @param resultCount
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	public CaseIgnoreHashMap getPaging(int resultCount) throws UnsupportedEncodingException{
		
		String clazz = this.getClass().getCanonicalName();
		
		String[] clazzArr = clazz.split(",");
		
		int blockList = 0; // �� �������� ǥ���� �Խù��� ��
		int blockPage = 0; // ǥ���� ������ ��
		if( clazzArr[0].contains("pda") ){
			
			/*
			 * pda ����¡ ǥ�� �Ķ����
			 */
			blockList = 5; // �� �������� ǥ���� �Խù��� ��
			blockPage = 5; // ǥ���� ������ ��
		}
		else
		{
			blockList = 10; // �� �������� ǥ���� �Խù��� ��
			blockPage = 5; // ǥ���� ������ ��
		}
		
//	    int blockList = Integer.parseInt(ShmsProperties.get("shms.pda.paging.blockList")); // �� �������� ǥ���� �Խù��� ��
//	    int blockPage = Integer.parseInt(ShmsProperties.get("shms.pda.paging.blockPage")); // ǥ���� ������ ��
		
		
	    
	    int nowPage = 1;
	    if(reqMap.get("nowPage") != null){
	    	nowPage = Integer.parseInt(reqMap.get("nowPage").toString());
	    }
//	    reqMap.put("pagingUrl", ServletActionContext.getRequest().getRequestURI());
	    
	    reqMap.put("nowPage", nowPage);
	    Paging paging = new Paging(nowPage, resultCount, blockList, blockPage, reqMap, ServletActionContext.getRequest());	    
	    
	    //dataMap.put("resultCount", resultCount);
	    reqMap.put("startRow", paging.getStartRow());
	    reqMap.put("endRow", paging.getEndRow());
	    dataMap.put("pagingString", paging.getPagingString());
	    
		return reqMap;
	}
	
	/**
	 * �����͸� hashMap�� ����
	 * @param name �̸�
	 * @param obj ��
	 */
	public void putDataMap(String name, Object obj){
		this.getDataMap().put(name, obj);
/**
 * ognl���� name key�� 2�ܰ��϶��� ���� ����� ������ 3�ܰ��̻��϶��� ���� ��µ��� �ʾҴ�. 
 * for Example) key1.key2=[value]�϶��� ���� ����� ������
 *              key1.key2.key3=[value]�϶��� ���� ����� ���� ����
 */
//		String[] nameList = name.split("\\.");
//		
//		HashMap curMap = (HashMap)this.getDataMap();
//		for(int i=0; i < nameList.length ; i++){
//			System.out.println(nameList[i]);			
//
//			if(i < (nameList.length -1)){
//				HashMap tempMap = null;
//				if((tempMap = (HashMap)curMap.get(nameList[i])) == null){
//					tempMap = new HashMap();			
//					curMap.put(nameList[i], tempMap);
//				}
//				
//				curMap = tempMap;
//				
//			}
//			else if(i == (nameList.length -1)){
//				curMap.put(nameList[i], obj);
//			}
//			else{
//				System.out.println("nameList Bound Exception Error");
//			}
//		}
		
	}
	
	public Map<String, Object> getDataMap() {
		return dataMap;
	}

	public void setDataMap(HashMap<String, Object> dataMap) {
		this.dataMap = dataMap;
	}
	
	public CaseIgnoreHashMap getReqMap() {
		if(reqMap == null){	
			initReqMap();
		}
		
		return reqMap;
	}

	private void setReqMap(CaseIgnoreHashMap reqMap) {
		this.reqMap = reqMap;
	}
	
	public void prepare() throws Exception {
		dataMap = new HashMap<String, Object>();
	}

	public Object getModel() {
		return dataMap;
	}

	public void setServletContext(ServletContext context) {
		this.context = context; 
		
	}

	public ServletContext getServletContext() {
		return this.context;
	}	
	
}

