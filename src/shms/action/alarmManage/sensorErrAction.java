/*
 * sensorErrAction.java
 * @author 김종범
 * @version 1.0 
 * @Date 2010. 03. 05.
 * Copyright (c) 2010 BY LSWARE INC. All rights reserved.
 */

package shms.action.alarmManage;

import java.util.Map;

import org.apache.struts2.ServletActionContext;

import shms.common.ParamMap;
import shms.dao.alarmManage.sensorErrDao;
import shms.dao.baseInfo.SensorManageDao;
import shms.dao.common.CommonDao;

public class sensorErrAction extends ParamMap {

	private sensorErrDao sensorErrDao;
	private SensorManageDao sensorManageDao;

	public SensorManageDao getSensorManageDao() {
		return sensorManageDao;
	}

	public void setSensorManageDao(SensorManageDao sensorManageDao) {
		this.sensorManageDao = sensorManageDao;
	}

	private CommonDao commonDao;

	public CommonDao getCommonDao() {
		return commonDao;
	}

	public void setCommonDao(CommonDao commonDao) {
		this.commonDao = commonDao;
	}

	public sensorErrDao getSensorErrDao() {
		return sensorErrDao;
	}

	public void setSensorErrDao(sensorErrDao sensorErrDao) {
		this.sensorErrDao = sensorErrDao;
	}

	Map map = null;

	/**
	 * 장애 리스트
	 * 
	 * @return
	 * @throws Exception
	 */
	public String listSensorErr() throws Exception {
		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
		map = getReqMap();

		if (map.get("p_sensor") != null) {
			map.put("sensor_id", map.get("p_sensor").toString());
			putDataMap("p_sensor", map.get("p_sensor"));
		}
		if (map.get("p_errtype") != null) {
			map.put("err_type_cd", map.get("p_errtype").toString());
			putDataMap("p_errtype", map.get("p_errtype"));
		}
		if (map.get("p_markingyn") != null) {
			map.put("marking_yn", map.get("p_markingyn").toString());
			putDataMap("p_markingyn", map.get("p_markingyn"));
		}

		int resultCount = sensorErrDao.countListSensorErr(map);

		// 센서 셀렉터
		putDataMap("sensor_list", commonDao.getSensor(map));
		// 장애종류 셀렉터
		putDataMap("errtype_list", commonDao.getErrType(map));
		// 조치여부 셀렉터
		putDataMap("markingyn_list", commonDao.getYN(map));

		putDataMap("resultCount", resultCount);
		putDataMap("rsListSensorErr", sensorErrDao.listSensorErr(getPaging(resultCount)));

		return "listSensorErr_success";
	}
	
	/**
	 * 장애 PDA 리스트
	 * 
	 * @return
	 * @throws Exception
	 */
	public String listSensorErrPda() throws Exception {
		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
		map = getReqMap();

		if (map.get("p_sensor") != null) {
			map.put("sensor_id", map.get("p_sensor").toString());
		}
		if (map.get("p_errtype") != null) {
			map.put("err_type_cd", map.get("p_errtype").toString());
		}
		if (map.get("p_markingyn") != null) {
			map.put("marking_yn", map.get("p_markingyn").toString());
		}

		int resultCount = sensorErrDao.countListSensorErr(map);

		// 센서 셀렉터
		putDataMap("sensor_list", commonDao.getSensor(map));
		// 장애종류 셀렉터
		putDataMap("errtype_list", commonDao.getErrType(map));
		// 조치여부 셀렉터
		putDataMap("markingyn_list", commonDao.getYN(map));

		putDataMap("resultCount", resultCount);
		putDataMap("rsListSensorErr", sensorErrDao.listSensorErr(getPaging(resultCount)));

		return "listSensorErrPda_success";
	}

	/**
	 * 장애 수정
	 * 
	 * @return
	 * @throws Exception
	 */
	public String editViewSensorErr() throws Exception {
		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
		getReqMap().put("user_id", ServletActionContext.getRequest().getSession().getAttribute("USER_ID"));	
		map = getReqMap();

		putDataMap("rsDetailSensorErr", sensorErrDao.detailSensorErr(map));
		
		return "editViewSensorErr_success";
	}
	
	/**
	 * 장애 수정
	 * 
	 * @return
	 * @throws Exception
	 */
	public String editSensorErr() throws Exception {
		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
		getReqMap().put("user_id", ServletActionContext.getRequest().getSession().getAttribute("USER_ID"));	
		map = getReqMap();

		sensorErrDao.editSensorErr(map);
		
		putDataMap("okMsg", "장애 조치 완료");
		if(map.get("nowpage")!=null) putDataMap("nowPage", map.get("nowpage"));
		if(map.get("sensor_id")!=null) putDataMap("sensor_id", map.get("sensor_id"));
		if(map.get("err_type_cd")!=null) putDataMap("err_type_cd", map.get("err_type_cd"));
		if(map.get("marking_yn")!=null) putDataMap("marking_yn", map.get("marking_yn"));
		
		
		
		return "editSensorErr_success";
	}
	
	public String editSensorErrPda() throws Exception {
		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
		getReqMap().put("user_id", ServletActionContext.getRequest().getSession().getAttribute("USER_ID"));	
		map = getReqMap();

		sensorErrDao.editSensorErr(map);
		
		putDataMap("okMsg", "장애 조치 완료");
		if(map.get("nowpage")!=null) putDataMap("nowPage", map.get("nowpage"));
		if(map.get("sensor_id")!=null) putDataMap("sensor_id", map.get("sensor_id"));
		if(map.get("err_type_cd")!=null) putDataMap("err_type_cd", map.get("err_type_cd"));
		if(map.get("marking_yn")!=null) putDataMap("marking_yn", map.get("marking_yn"));
		
		
		  
		return "editSensorErrPda_success";
	}
	
	/**
	 * 장애 초기화 
	 * 
	 * @return
	 * @throws Exception
	 */
	public String initSensorErr() throws Exception {
		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
		map = getReqMap();

		String sensorId = "3^"+map.get("struct_id").toString();
		String rsltVal = this.realMeasureInfodata(sensorId);
		
		if( "ok_network".equals(rsltVal) )
		{
			putDataMap("okMsg", "장애 초기화  성공");
		}
		else
		{
			putDataMap("errorMsg", "장애 초기화  실패");
			return "initSensorErr_fail";
		}
		
		return "initSensorErr_success";
	}
	
	public String realMeasureInfodata(String senId) throws Exception{
		
		String callManagerVal = sensorManageDao.callManage(senId);
		String rtnMsg;
			if( callManagerVal == null || ! "Y".equals(callManagerVal) || "".equals(callManagerVal)  )
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
