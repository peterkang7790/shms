/*
 * sensorManageAction.java
 * @author 강평희
 * @version 1.0 
 * @Date 2010. 01. 28.
 * Copyright (c) 2008 BY LSWARE INC. All rights reserved.
 */

package shms.action.baseInfo;

import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import shms.common.Log4j;
import shms.common.ParamMap;
import shms.dao.baseInfo.SensorManageDao;
import shms.dao.common.CommonDao;
import shms.dao.instManage.rptRtStatDao;


/**
 * 
 * @author 강평희
 * @version 1.0,  2009. 10. 22.
 */
public class SensorManageAction extends ParamMap {

	private SensorManageDao sensorManageDao;
	private String checkedmsr;
	private String checkedSsensor;
	private String checkgubun;
	private CommonDao commonDao;
	private rptRtStatDao rptRtStatDao;
	
	public rptRtStatDao getRptRtStatDao() {
		return rptRtStatDao;
	}

	public void setRptRtStatDao(rptRtStatDao rptRtStatDao) {
		this.rptRtStatDao = rptRtStatDao;
	}

	public void setCommonDao(CommonDao commonDao) {
		this.commonDao = commonDao;
	}

	public String getCheckgubun() {
		return checkgubun;
	}

	public void setCheckgubun(String checkgubun) {
		this.checkgubun = checkgubun;
	}

	public String getCheckedmsr() {
		return checkedmsr;
	}

	public void setCheckedmsr(String checkedmsr) {
		this.checkedmsr = checkedmsr;
	}

	public String getCheckedSsensor() {
		return checkedSsensor;
	}

	public void setCheckedSsensor(String checkedSsensor) {
		this.checkedSsensor = checkedSsensor;
	}

	Map map = null;
	
	public SensorManageDao getSensorManageDao() {
		return sensorManageDao;
	}

	public void setSensorManageDao(SensorManageDao sensorManageDao) {
		this.sensorManageDao = sensorManageDao;
	}
	
	/*
	 * PPP 리스트
	 */
	public String listSensor() throws Exception
	{
		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
		map = getReqMap();
		
		String sensor_id = "";
		if( map.get("sensor_id_nm") != null )
		{
			map.put("sensor_id", map.get("sensor_id_nm").toString());
		}
		
		
		int resultCount = sensorManageDao.p_countSensorDoing(map);
		
		//센서ID셀렉터
		putDataMap("sensor_list", commonDao.getP_SensorId(map) );
		//센서종류셀렉터
		putDataMap("sensor_type_list", commonDao.getP_SensorTypId(map) );
		//detector 셀렉터
		putDataMap("detector_list", commonDao.getP_DetectorId(map) );
		//Channel 셀렉터
		putDataMap("channel_list", commonDao.getP_ChannelId(map) );
		
		
		putDataMap("resultCount", resultCount );
//		putDataMap("senTypeidMap", ShmsCommon.getSenTypeMap() );
		putDataMap("listSensor", sensorManageDao.p_listSensor(getPaging(resultCount)));
		return "listSensor_success";
	}
	/*
	 * PPP 디테일
	 */
	public String detailSensor() throws Exception
	{
		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
		map = getReqMap();
		putDataMap("detailSensor", sensorManageDao.p_detailSensor(map));
		putDataMap("rsSensorPosObj", rptRtStatDao.sensorPosObj(map));
		return "detailSensor_success";
	}
	
	//PPP 수정
	public String editViewSensor() throws Exception
	{
		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
		map = getReqMap();
		
		String verTyp = "";
		
		putDataMap(verTyp, "editView" );
		
		//센서ID셀렉터
		putDataMap("ref_sensor_list", commonDao.getP_AllSensorId(map) );
		//센서종류셀렉터
		putDataMap("sensor_type_list", commonDao.getP_SensorTypId(map) );
		//detector 셀렉터
		putDataMap("detector_list", commonDao.getP_DetectorId(map) );
		//Channel 셀렉터
		putDataMap("channel_list", commonDao.getP_ChannelId(map) );
		//계측항목셀렉터
		putDataMap("inst_item_list", commonDao.getP_InstItem(map) );
		//구조물구성셀렉터
		putDataMap("struct_comp_list", commonDao.getP_StructComp(map) );
		
		
		putDataMap("detailSensor", sensorManageDao.modViewSensor(map));
		putDataMap("rsSensorPosObj", rptRtStatDao.sensorPosObj(map));
		return "editViewSensor_success";
	}
	
	public String delSensor() throws Exception{
		
		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
		map = getReqMap();
		
		sensorManageDao.delSensor(getReqMap());
		
		String sensorId = "1^";
		String rsltVal = this.realMeasureInfodata(sensorId);
		if( "error_network".equals(rsltVal) )
		{
			putDataMap("errorMsg", "센서 삭제시 시그널 알림 실패");
			return "addSensor_fail";
		}
		else
		{
			putDataMap("okMsg", "센서 삭제시 시그널 알림  성공");
		}
		
		return "delSensor_success";
	}
	
	//PPP수정
	public String editSensor() throws Exception
	{
		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
		map = getReqMap();
		
		sensorManageDao.editSensor(map);
		putDataMap("detailSensor", sensorManageDao.modViewSensor(map));
		String interFaceYn = commonDao.getInterfaceYN(map);
		String sensorId = "";
		if("Y".equals(interFaceYn))
		{
			sensorId = "1^";
			String rsltVal = this.realMeasureInfodata(sensorId);
			
			if( "error_network".equals(rsltVal) )
			{
				putDataMap("errorMsg", "센서 수정시 시그널 알림 실패");
				return "addSensor_fail";
			}
			else
			{
				putDataMap("okMsg", "센서 수정시 시그널 알림  성공");
			}
		}
		
		return "editSensor_success";
	}
	
	// ppp 신규등록 화면
	public String addViewSensor() throws Exception
	{
		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
		map = getReqMap();
		
		//구조물 대표 이미지 가져온다
		
		String[] imageP = String.valueOf( commonDao.getImageStr(map) ).split("=");
		
		putDataMap("strImage", imageP[1].replace("}", "") );
		
		//센서ID셀렉터
		putDataMap("ref_sensor_list", commonDao.getP_AllSensorId(map) );
		//센서종류셀렉터
		putDataMap("sensor_type_list", commonDao.getP_SensorTypId(map) );
		//detector 셀렉터
		putDataMap("detector_list", commonDao.getP_DetectorId(map) );
		//Channel 셀렉터
		putDataMap("channel_list", commonDao.getP_ChannelId(map) );
		//계측항목셀렉터
		putDataMap("inst_item_list", commonDao.getP_InstItem(map) );
		//구조물구성셀렉터
		putDataMap("struct_comp_list", commonDao.getP_StructComp(map) );
		

		
		return "addSensor";
	}
	
	public void selectField() throws Exception
	{
		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
		map = getReqMap();
		
		PrintWriter printWriter = null;
		String selectF = "";
		String rtnVal = "";
		Map<String,String> selMap = null;
		map = getReqMap();
    	List fieldSelect = commonDao.getdetectorChannelField(map);
    	try
		{
    		ServletActionContext.getResponse().setContentType("text/html;charset=utf-8");			
			printWriter = ServletActionContext.getResponse().getWriter();
			
			String id = "channel_id";
			
			selectF = "<select name=" + id + " id='" + id + "'>";
			
			for( int i=0; i<fieldSelect.size(); i++ )
			{
				selMap = (Map)fieldSelect.get(i);
				
				String selVal = "";
				String selName = "";
				
				if( selMap.get("channel_id") != null ) selVal = selMap.get("channel_id").toString();
				if( selMap.get("channel_nm") != null ) selName = selMap.get("channel_nm").toString();
				
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
	public String reActionSensor() throws Exception
	{
		map = getReqMap();
		
		String sensorId = "2^"+ map.get("sensor_id").toString();
		
		String rsltVal = this.realMeasureInfodata(sensorId);
		
		if( "error_network".equals(rsltVal) )
		{
			putDataMap("errorMsg", "센서 재설정 실패");
			return "addSensor_fail";
		}
		else
		{
			putDataMap("sensor_id", map.get("sensor_id").toString());
			putDataMap("okMsg", "센서 재설정 성공");
		}
		
		return "re_action";
	}
	// ppp 신규등록 
	public String addSensor() throws Exception
	{
		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
		map = getReqMap();
	
		if(sensorManageDao.sensorIdChk(map) > 0){
			putDataMap("errorMsg", "이미사용중인 ID입니다");
			return "addSensor_error";
		}
		
		sensorManageDao.addSensor(map);
		
		String sensorId = map.get("sensor_id").toString();
		
		//센서ID셀렉터
		putDataMap("ref_sensor_list", commonDao.getP_AllSensorId(map) );
		//센서종류셀렉터
		putDataMap("sensor_type_list", commonDao.getP_SensorTypId(map) );
		//detector 셀렉터
		putDataMap("detector_list", commonDao.getP_DetectorId(map) );
		//Channel 셀렉터
		putDataMap("channel_list", commonDao.getP_ChannelId(map) );
		//계측항목셀렉터
		putDataMap("inst_item_list", commonDao.getP_InstItem(map) );
		//구조물구성셀렉터
		putDataMap("struct_comp_list", commonDao.getP_StructComp(map) );
		
		putDataMap("sensor_id",sensorId);
		
		String interFaceYn = String.valueOf(commonDao.getInterfaceYN(map));

		
		/*
		 * 인터페이스 여부가 'Y'인경우에만 매니져에게 시그널을 보낸다.
		 */
		if("Y".equals(interFaceYn))
		{
			sensorId = "1^";
			String rsltVal = this.realMeasureInfodata(sensorId);
			
			if( "error_network".equals(rsltVal) )
			{
				putDataMap("errorMsg", "센서 신규 추가시그널알림 실패");
				return "addSensor_fail";
			}
			else
			{
				putDataMap("okMsg", "센서 신규 추가시그널알림 성공");
			}
		}
		
		
		return "addSensor_success";
	}
	//
	
	public void sensorIdChk() throws Exception
	{
		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
		PrintWriter printWriter = null;
		try {
			ServletActionContext.getResponse().setContentType("text/html;charset=utf-8");			
			printWriter = ServletActionContext.getResponse().getWriter();
			
			String senId = getReqMap().get("sensor_id").toString();
			
			if( !"".equals(senId) )
			{
				if(sensorManageDao.sensorIdChk(getReqMap()) == 0){
					printWriter.print("<font color=blue> 사용할수 있는 센서ID 값입니다.</font>");
				}
				else{
					printWriter.print("<font color=red> 이미 존재하는 ID 값입니다.</font>");
				}
			}
			else
			{
				printWriter.print("<font color=red> 센서 ID를 입력해 주세요.</font>");
			}
			
			
				
		} catch (Exception e) {
			Log4j.log.error("sensorIdChkGatherData:", e);
		} finally{
			printWriter.close();
		}
	}
	
	public String realMeasureInfodata(String senId) throws Exception{
		
		String callManagerVal = sensorManageDao.callManage(senId);
		String rtnMsg;
			if( callManagerVal == null || ! "Y".equals(callManagerVal) || "".equals(callManagerVal) )
			{
				rtnMsg = "error_network";
			}
			else
			{
				rtnMsg = "ok_network";
			}
			
		return rtnMsg;
	}
}

