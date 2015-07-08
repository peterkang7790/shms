/*
 * leftMenuAction.java
 * @author ±èÁ¾¹ü
 * @version 1.0 
 * @Date 2010. 02. 18.
 * Copyright (c) 2010 BY LSWARE INC. All rights reserved.
 */

package shms.action.common;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import com.lsware.utils.StringUtils;

import shms.common.ParamMap;
import shms.dao.common.quickMenuDao;

public class quickMenuAction extends ParamMap {

	private quickMenuDao quickMenuDao;

	public quickMenuDao getQuickMenuDao() {
		return quickMenuDao;
	}

	public void setQuickMenuDao(quickMenuDao quickMenuDao) {
		this.quickMenuDao = quickMenuDao;
	}

	Map map;
	
	public String quickmenu() throws Exception {
		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
		map = getReqMap();

		String structStatic = "";
		
		if( quickMenuDao.getQuickMenuSeq(map) != null )
		{
			structStatic = quickMenuDao.getQuickMenuSeq(map);
			putDataMap("structStatic", structStatic);
			
		}
		else
		{
			structStatic = "3";
			putDataMap("structStatic", structStatic);
		}
		
		return "quickMenu_success";
	}
	
	public String otherStruct() throws Exception {
		map = getReqMap();
		
		String trC = "";
		String stId = "";
		String stNm = "";
		
		if( map.get("trclass") != null )
		{
			trC = map.get("trclass").toString();
			
			putDataMap("trclass", trC);
		}
		
		if( map.get("struct_id") != null )
		{
			stId = map.get("struct_id").toString();
			
			putDataMap("struct_id", stId);
		}
		
		if( map.get("struct_nm") != null )
		{
			stNm = map.get("struct_nm").toString();
			
			putDataMap("struct_nm", stNm);
		}
		
		return "otherStruct";
	}
	
	public String otherStructPop() throws Exception {
		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
		getReqMap().put("user_id", ServletActionContext.getRequest().getSession().getAttribute("USER_ID"));
		map = getReqMap();
		
		/*
		List callLineCahart = (List)quickMenuDao.getOtherStructSeq(map);
		String timeArray="";
		String dataArray="";
		Map almMap = null;
		if (callLineCahart.size() > 0)
		{
			timeArray = "[";
			for(int i=0;i<callLineCahart.size();i++){
			    almMap = (Map)callLineCahart.get(i);
			    timeArray += "{'tr':['" + almMap.get("trclass") + "',";
				timeArray += "'id':'" + almMap.get("struct_id") + "',";
			    timeArray += "'nm':'" + almMap.get("struct_nm") + "'},";
			}
			timeArray = timeArray.substring(0, timeArray.lastIndexOf(",")) + "]";
		} else {
			timeArray = "''";
		}
		dataArray += "list:" + timeArray;
		dataArray += "}";
		
		

		List callLineCahart = (List)quickMenuDao.getOtherStructSeq(map);
		Map almMap = null;
		List trclass = new ArrayList();
		List struct_id = new ArrayList();
		List struct_nm = new ArrayList();
		for(int i=0;i<callLineCahart.size();i++){
			almMap = (Map)callLineCahart.get(i);
		    trclass.add(almMap.get("trclass"));
		    struct_id.add(almMap.get("struct_id"));
		    struct_nm.add(almMap.get("struct_nm"));
		}
		
		String item = "({list:[{'tr':"+trclass+" , 'id':"+struct_id+", 'nm':"+struct_nm+"}]})";
		*/
		putDataMap("otherStruct", quickMenuDao.getOtherStructSeq(map));
		
		return "otherStructRslt";
	}
	
	public String quickmenuHotLine() throws Exception {
		
		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
		getReqMap().put("user_id", ServletActionContext.getRequest().getSession().getAttribute("USER_ID"));
		map = getReqMap();
		
		List hotL = quickMenuDao.getQuickMenuHotLineSeq(map);
		Map alMap = null;
		Map<String,String> duMap = new HashMap<String,String>();
		String[][] aaa = {{"",""},{"",""}};
		for( int i=0; i<hotL.size() && i<2; i++ )
		{
			alMap = (Map)hotL.get(i);
			
			aaa[i][0] = alMap.get("user_nm")==null?"":alMap.get("user_nm").toString();
			aaa[i][1] = alMap.get("tel_no")==null?"":alMap.get("tel_no").toString();
			
			
			if( i==0 )
			{
				duMap.put("user_nm", aaa[0][0]);
				duMap.put("tel_no", StringUtils.strTelNo(aaa[0][1]));
			}
			else if( i==1)
			{
				duMap.put("user_nm_1", aaa[1][0]);
				duMap.put("tel_no_1", StringUtils.strTelNo(aaa[1][1]));
			}
			
			
		}
		
		
		
		putDataMap("hotline", duMap);
		
		return "quickmenuHotLine";
	}
}
