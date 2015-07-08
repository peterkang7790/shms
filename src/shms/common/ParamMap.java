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
 * @author 이호현(hoya@lsware.co.kr)
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
		    
		    /* parameter 명이 중복되지 않는 경우 */
		    if(paramValues.length == 1){
		    	
		    	/* parameter 명이 중복되지 않고 parameter name이 배열형태인 경우  */
			    if(paramName.indexOf("__") != -1 || paramName.lastIndexOf("__") != -1){
			    	dataListName = paramName.substring(0, paramName.indexOf("__")).trim();
			    	dataListIndex =  Integer.parseInt(paramName.substring(paramName.indexOf("__")+2, paramName.lastIndexOf("__")).trim());
			    	dataListItemPropertyName =  paramName.substring(paramName.lastIndexOf("__")+2).trim();
		    		dataListItemPropertyValue =  paramValues[0];
			    	
			    	HashMap dataList = null;
			    	
			    	// reqMap에 dataListName값이 없으면
			    	// reqMap에 key값으로 dataListName를 넣고 value값으로 dataList의 빈값을 셋팅한다.
			    	if((dataList = (HashMap)reqMap.get(dataListName)) == null){
			    		dataList = new HashMap();
			    		reqMap.put(dataListName, dataList);
			    	}
			    	
			    	HashMap hm = new HashMap();
		    		HashMap dataItemMap = null;
		    		
		    		// dataListIndex의 값이 dataList사이즈보다 크거나 같고, 또는
		    		// dataList에 dataListIndex에 해당하는 index값이 null이면
		    		// 해쉬맵에 key값으로 dataListItemPropertyName(입력이름)을 넣고 value값으로 dataListItemPropertyValue(입력값)을 셋팅한다.
		    		// key, value를 셋팅한 해쉬값을 arrayList에 dataListIndex순서로 넣어준다.
		    		if((dataItemMap = (HashMap)dataList.get(dataListIndex)) == null){
			    		hm.put(dataListItemPropertyName, dataListItemPropertyValue);
		    			dataList.put(dataListIndex,hm);
		    		}
		    		// dataListIndex의 값이 dataList사이즈보다 작으면, 또는
		    		// dataList에 dataListIndex에 해당하는 값이 존재하면 
		    		// dataList에 dataListIndex에 해당하는 값을 dataItemMap의 해쉬맵에 셋팅한후
		    		// dataItemMap해쉬맵에 key값으로 dataListItemPropertyName(입력이름)을 넣고 value값으로 dataListItemPropertyValue(입력값)을 셋팅한다.
		    		else{
			    		dataItemMap.put(dataListItemPropertyName, dataListItemPropertyValue);
		    		}
			    }
			    /* parameter 명이 중복되지 않고 parameter name이 배열형태가 아닌 경우 */
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
			    // parameter name이 jsessionid인 경우는 무시한다.
		    }
		    /* parameter 명이 중복되는 경우 */
		    else{
		    	reqMap.put(paramName, paramValues);
		    }
		}
		
		return reqMap;
	}
	
	/**
	 * 페이징
	 * @param resultCount
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	public CaseIgnoreHashMap getPaging(int resultCount) throws UnsupportedEncodingException{
		
		String clazz = this.getClass().getCanonicalName();
		
		String[] clazzArr = clazz.split(",");
		
		int blockList = 0; // 한 페이지당 표현될 게시물의 수
		int blockPage = 0; // 표현될 페이지 수
		if( clazzArr[0].contains("pda") ){
			
			/*
			 * pda 페이징 표현 파라미터
			 */
			blockList = 5; // 한 페이지당 표현될 게시물의 수
			blockPage = 5; // 표현될 페이지 수
		}
		else
		{
			blockList = 10; // 한 페이지당 표현될 게시물의 수
			blockPage = 5; // 표현될 페이지 수
		}
		
//	    int blockList = Integer.parseInt(ShmsProperties.get("shms.pda.paging.blockList")); // 한 페이지당 표현될 게시물의 수
//	    int blockPage = Integer.parseInt(ShmsProperties.get("shms.pda.paging.blockPage")); // 표현될 페이지 수
		
		
	    
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
	 * 데이터를 hashMap에 저장
	 * @param name 이름
	 * @param obj 값
	 */
	public void putDataMap(String name, Object obj){
		this.getDataMap().put(name, obj);
/**
 * ognl에서 name key가 2단계일때는 값이 출력이 되지만 3단계이상일때는 값이 출력되지 않았다. 
 * for Example) key1.key2=[value]일때는 값이 출력이 되지만
 *              key1.key2.key3=[value]일때는 값이 출력이 되지 않음
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

