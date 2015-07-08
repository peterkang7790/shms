/*
 * userAction.java
 * @author 김종범
 * @version 1.0 
 * @Date 2010. 02. 05.
 * Copyright (c) 2010 BY LSWARE INC. All rights reserved.
 */

package shms.action.admin;

import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import shms.common.Log4j;
import shms.common.ParamMap;
import shms.dao.admin.commonCodeDao;
import shms.dao.common.CommonDao;

public class commonCodeAction extends ParamMap {

	private commonCodeDao commonCodeDao;
	private CommonDao commonDao;
	
	public void setCommonDao(CommonDao commonDao) {
		this.commonDao = commonDao;
	}

	public void setCommonCodeDao(commonCodeDao commonCodeDao) {
		this.commonCodeDao = commonCodeDao;
	}

	Map map = null;

	/**
	 * 사용자 리스트
	 * 
	 * @return
	 * @throws Exception
	 */
	public String listCommonCode() throws Exception {
		map = getReqMap();
		int resultCount = commonCodeDao.countCommonCode(map);
		
		putDataMap("resultCount", resultCount);
		putDataMap("listCommonCode", commonCodeDao.listCommonCode(getPaging(resultCount)));
		
		return "listCommonCode_success";
	}
	
	public String listCommonCodeDet() throws Exception
	{
		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
		map = getReqMap();
		
		int resultCountP = 0;
		
		
		
		if( map.get("code_type") != null )
		{
			String cTyp = map.get("code_type").toString();
			
			if( "테이블".equals(cTyp) )
			{
				if( "CHANNEL".equals(map.get("common_cd").toString()))
				{
					resultCountP = commonCodeDao.countChannel(map);
					putDataMap("listCommonCodeDet", commonCodeDao.listCommonCodeChannel(getPaging(resultCountP)));
				}
				else if( "DETECTOR".equals(map.get("common_cd").toString()) )
				{
					resultCountP = commonCodeDao.countDtector(map);
					putDataMap("listCommonCodeDet", commonCodeDao.listCommonCodeDtector(getPaging(resultCountP)));
				}
				else
				{
					resultCountP = commonCodeDao.countSensor(map);
					putDataMap("listCommonCodeDet", commonCodeDao.listCommonCodeSensor(getPaging(resultCountP)));
				}
			}
			else
			{
				resultCountP = commonCodeDao.countCommonCodeDet(map);
				putDataMap("listCommonCodeDet", commonCodeDao.detCommonCodeDet(getPaging(resultCountP)));
			}
		}
		
		putDataMap("resultCountP", resultCountP);
		return "listCommonCodeDet_success";
	}
	
	public void selectField() throws Exception
	{
		PrintWriter printWriter = null;
		String selectF = "";
		String rtnVal = "";
		Map<String,String> selMap = null;
		map = getReqMap();
    	List fieldSelect = commonDao.getCommonCodeField(map);
    	try
		{
    		ServletActionContext.getResponse().setContentType("text/html;charset=utf-8");			
			printWriter = ServletActionContext.getResponse().getWriter();
			
//			<s:select name="table_id" id="table_id" list="table_nm_list" listKey="table_id" listValue="table_name" headerKey="" headerValue="--테이블명선택--" cssStyle="width:130px"></s:select>
			
			String id = "column_id";
			
			selectF = "<select name=" + id + " id='" + id + "'>";
			
			for( int i=0; i<fieldSelect.size(); i++ )
			{
				selMap = (Map)fieldSelect.get(i);
				
				String selVal = "";
				String selName = "";
				
				if( selMap.get("column_id") != null ) selVal = selMap.get("column_id").toString();
				if( selMap.get("field_name") != null ) selName = selMap.get("field_name").toString();
				
				selectF += "<option  value='";
				selectF += selVal;
				selectF += "'>";
				selectF += selName;
				selectF += "</option>";
				
			}
			selectF += "</select>\n";
			printWriter.print(selectF);
		}
		catch (Exception e) 
		{
			Log4j.log.error("commonCdChkGatherData:", e);
		}
		finally
		{
			printWriter.close();
		}
		
			
			
  }
	
	public String detailCommonCodePop() throws Exception
	{
		map = getReqMap();
		putDataMap("detailCommonCodePop", commonCodeDao.detCommonCodePop(map));
		return "detailCommonCodePop_success";
	}
	
	public String delCommonCode() throws Exception{
		
		map = getReqMap();
		
		commonCodeDao.delCommonCode(map);
		
		return "delCommonCode_success";
	}
	
	public String delCommonDet() throws Exception{
		
		map = getReqMap();
		
		commonCodeDao.delCommonDet(map);
		
		return "delCommonDet_success";
	}
	
	public String addViewCommonCode() throws Exception
	{
		map = getReqMap();
		
		if( map.get("table_id") != null )
		{
			map.put("table_id",  map.get("table_id"));
		}
		
		// 공통코드 유형 셀렉터
		putDataMap("common_det_cd_list", commonDao.getCommonCodeType(map) );
		
		// 공통코드 TABLE 셀렉터
		putDataMap("table_nm_list", commonDao.getCommonCodeTable(map) );
		
		// 공통코드 FIELD 셀렉터
	    putDataMap("field_nm_list", commonDao.getCommonCodeField(map) );
		
		// 공통코드 LEN 셀렉터
		putDataMap("nm_list", commonDao.getCommonLenField(map) );
		
		if( map.get("table_id") != null )
		{
			commonCodeDao.addCommonCode(map);
		}
		
		return "addViewCommonCode_success";
	}
	
	public String addViewCommonCodeDet() throws Exception
	{
		map = getReqMap();
		
		return "addViewCommonCodeDet_success";
	}
	
	public void commonCdChk() throws Exception
	{
		PrintWriter printWriter = null;
		try {
			ServletActionContext.getResponse().setContentType("text/html;charset=utf-8");			
			printWriter = ServletActionContext.getResponse().getWriter();
			
			String detId = getReqMap().get("common_cd").toString();
			
			if( !"".equals(detId) )
			{
				if(commonCodeDao.commonCdChk(getReqMap()) == 0){
					printWriter.print("<font color=blue> 사용할수 있는 COMMON CODE 입니다.</font>");
				}
				else{
					printWriter.print("<font color=red> 이미 존재하는 COMMON CODE 입니다.</font>");
				}
			}
			else
			{
				printWriter.print("<font color=red> COMMON CODE 를 입력해 주세요.</font>");
			}
			
				
		} catch (Exception e) {
			Log4j.log.error("commonCdChkGatherData:", e);
		} finally{
			printWriter.close();
		}
	}
}
