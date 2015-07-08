/*
 * detectorAction.java
 * @author 강평희
 * @version 1.0 
 * @Date 2010. 01. 28.
 * Copyright (c) 2008 BY LSWARE INC. All rights reserved.
 */

package shms.action.baseInfo;

import java.io.PrintWriter;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import shms.common.Log4j;
import shms.common.ParamMap;
import shms.dao.baseInfo.detectorDao;
import shms.dao.common.CommonDao;

/**
 * 
 * @author 강평희
 * @version 1.0, 2010. 01. 28.
 */
public class detectorAction extends ParamMap {

	private detectorDao detectorDao;

	private CommonDao commonDao;

	public void setCommonDao(CommonDao commonDao) {
		this.commonDao = commonDao;
	}

	public detectorDao getDetectorDao() {
		return detectorDao;
	}

	public void setDetectorDao(detectorDao detectorDao) {
		this.detectorDao = detectorDao;
	}

	Map map = null;
	
	public String listDetector() throws Exception {
		
		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
		map = getReqMap();
		
		int resultCount = 0;
		
//		String detector_id = "";
//		
//		if((getReqMap().get("x") != null && getReqMap().get("y") != null )){
//			
//			map.put("detector_id", map.get("detector_id_search").toString());
//			map.put("detector_nm", map.get("detector_nm_search").toString());
//		}
//		
		if( "verCh".equals(map.get("lisType")) && ( map.get("vX") == null || map.get("vY") == null )  )
		{
			resultCount = detectorDao.countDetectorA(map);

			putDataMap("resultCount", resultCount);
			putDataMap("listDetector", detectorDao.listDetectorA(getPaging(resultCount)));
		}
		else
		{
			resultCount = detectorDao.countDetector(map);

			putDataMap("resultCount", resultCount);
			putDataMap("listDetector", detectorDao
					.listDetector(getPaging(resultCount)));

		}
//				
//		int resultCountp = 0;
//		
//		if( (!"".equals(getReqMap().get("detector_nm_search")) && getReqMap().get("detector_nm_search") != null ) || (!"".equals(getReqMap().get("detector_id_search")) && getReqMap().get("detector_id_search") != null ) )
//		{
//			resultCountp = 0;
//			putDataMap("resultCountp", resultCountp);
////			putDataMap("listChannel", detectorDao.searchChannel(map));
//		}
//		else
//		{
//			resultCountp = detectorDao.countChannelDoing(map);
//			putDataMap("resultCountp", resultCountp);
//			putDataMap("listChannel", detectorDao.listChannel(map));
//		}

		

		return "listDetector_success";
	}
	
	public String addViewDetector() throws Exception{
		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
		map = getReqMap();
		
		return "addViewDetector";
	}
	
	public String addDetector() throws Exception{
		
		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
		
		map = getReqMap();
		
		if(detectorDao.detectorIdChk(getReqMap()) > 0){
			putDataMap("errorMsg", "이미사용중인 ID입니다");
			return "addDetector_error";
		}
		
		detectorDao.addDetector(map);
		
		putDataMap("detector_id", getReqMap().get("detector_id"));
		
		return "addDetector";
	}
	
	public String delDetector() throws Exception{
		
		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
		
		map = getReqMap();
		
		detectorDao.delDetector(map);
		
		return "delDetector_success";
	}
	
	public void detectorIdChk() throws Exception
	{
		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
		PrintWriter printWriter = null;
		try {
			ServletActionContext.getResponse().setContentType("text/html;charset=utf-8");			
			printWriter = ServletActionContext.getResponse().getWriter();
			
			String detId = getReqMap().get("detector_id").toString();
			
			if( !"".equals(detId) )
			{
				if(detectorDao.detectorIdChk(getReqMap()) == 0){
					printWriter.print("<font color=blue> 사용할수 있는 DETECTOR ID 값입니다.</font>");
				}
				else{
					printWriter.print("<font color=red> 이미 존재하는 DETECTOR ID 값입니다.</font>");
				}
			}
			else
			{
				printWriter.print("<font color=red> DETECTOR ID를 입력해 주세요.</font>");
			}
			
				
		} catch (Exception e) {
			Log4j.log.error("detectorIdChkGatherData:", e);
		} finally{
			printWriter.close();
		}
	}
	
	//------- channel ---------//
	
	public String addViewChannel() throws Exception{
		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
		map = getReqMap();
		
		//detector 셀렉터
		putDataMap("detector_list", commonDao.getP_DetectorId(map) );
		
		return "addViewChannel";
	}
	
	public String addChannel() throws Exception{
		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
		map = getReqMap();
		
		if(detectorDao.channelIdChk(getReqMap()) > 0){
			putDataMap("errorMsg", "이미사용중인 ID입니다");
			return "addChannel_error";
		}
		
		detectorDao.addChannel(map);
		
		putDataMap("channel_id", getReqMap().get("channel_id"));
		putDataMap("detector_id", getReqMap().get("detector_id"));
		
		return "addChannel";
	}

	public String listChannel() throws Exception {
		
		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
		map = getReqMap();
		
		int resultCount = detectorDao.countChannelDoing(map);

		putDataMap("resultCountP", resultCount);
		putDataMap("listChannel", detectorDao.listChannel(getPaging(resultCount)));
		return "listChannel_success";
	}
	
	public String delChannel() throws Exception{
		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
		map = getReqMap();
		
		detectorDao.delChannel(map);
		
		return "delChannel_success";
	}

	public void channelIdChk() throws Exception
	{
		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
		PrintWriter printWriter = null;
		try {
			ServletActionContext.getResponse().setContentType("text/html;charset=utf-8");			
			printWriter = ServletActionContext.getResponse().getWriter();
			
			String detId = getReqMap().get("channel_id").toString();
			
			if( !"".equals(detId) )
			{
			
				if(detectorDao.channelIdChk(getReqMap()) == 0){
					printWriter.print("<font color=blue> 사용할수 있는 CHANNEL ID 값입니다.</font>");
				}
				else{
					printWriter.print("<font color=red> 이미 존재하는 CHANNEL ID 값입니다.</font>");
				}
					
			}
			else
			{
				printWriter.print("<font color=red> CHANNEL ID 값을 입력해주세요.</font>");
			}
		} catch (Exception e) {
			Log4j.log.error("channelIdChkGatherData:", e);
		} finally{
			printWriter.close();
		}
	}
}
