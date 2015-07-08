/*
 * senSensorTroubleAction.java
 * @author 김종범
 * @version 1.0 
 * @Date 2010. 02. 25.
 * Copyright (c) 2010 BY LSWARE INC. All rights reserved.
 */

package shms.action.sensorManage;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import shms.common.ParamMap;
import shms.dao.common.CommonDao;
import shms.dao.instManage.rptRtStatDao;
import shms.dao.sensorManage.sensorListDao;
import shms.dao.sensorManage.sensorTroubleDao;

public class senSensorListAction extends ParamMap {

	private sensorListDao sensorListDao;
	private sensorTroubleDao sensorTroubleDao;
	public sensorTroubleDao getSensorTroubleDao() {
		return sensorTroubleDao;
	}

	public void setSensorTroubleDao(sensorTroubleDao sensorTroubleDao) {
		this.sensorTroubleDao = sensorTroubleDao;
	}

	private CommonDao commonDao;
	private rptRtStatDao rptRtStatDao;

	public rptRtStatDao getRptRtStatDao() {
		return rptRtStatDao;
	}

	public void setRptRtStatDao(rptRtStatDao rptRtStatDao) {
		this.rptRtStatDao = rptRtStatDao;
	}

	public CommonDao getCommonDao() {
		return commonDao;
	}

	public void setCommonDao(CommonDao commonDao) {
		this.commonDao = commonDao;
	}

	public sensorListDao getSensorListDao() {
		return sensorListDao;
	}

	public void setSensorListDao(sensorListDao sensorListDao) {
		this.sensorListDao = sensorListDao;
	}

	Map map = null;

	/**
	 * 리스트
	 * 
	 * @return
	 * @throws Exception
	 */
	public String senSensorList() throws Exception {
		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
		map = getReqMap();
		
		System.out.println("map = " + map);

		if (map.get("sensor_id") != null) {
			map.put("sel_sensor_id", map.get("sensor_id").toString());
		} else {
			map.put("sel_sensor_id", "");
		}

		// 센서종류셀렉터
		putDataMap("sensor_type_list", commonDao.getP_SensorTypId(map));

		// PARAMETER : p_sensor_id, p_sensor_type_cd

		int resultCount = sensorListDao.countSenSensorList_Sensor(map);
		putDataMap("resultCount", resultCount);
		putDataMap("rsSenSensorList_Sensor", sensorListDao.senSensorList_Sensor(getPaging(resultCount)));

		putDataMap("rsSenSensorList_Detail", sensorListDao.senSensorList_Detail(map));

		return "senSensorList_success";
	}
	
	public String senSensorList_pda() throws Exception {
		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
		map = getReqMap();
		
		System.out.println("map = " + map);

		if (map.get("sensor_id") != null) {
			map.put("sel_sensor_id", map.get("sensor_id").toString());
		} else {
			map.put("sel_sensor_id", "");
		}

		// 센서종류셀렉터
		putDataMap("sensor_type_list", commonDao.getP_SensorTypId(map));

		// PARAMETER : p_sensor_id, p_sensor_type_cd

		int resultCount = sensorListDao.countSenSensorList_Sensor(map);
		putDataMap("resultCount", resultCount);
		putDataMap("rsSenSensorList_Sensor", sensorListDao.senSensorList_Sensor(getPaging(resultCount)));

		putDataMap("rsSenSensorList_Detail", sensorListDao.senSensorList_Detail(map));

		return "senSensorListPda_success";
	}
	
	public String imagePoint() throws Exception{
		
		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
		map = getReqMap();
		
		if( map.get("pda") != null ) putDataMap("pda", map.get("pda"));
		
		putDataMap("rsSensorImage", rptRtStatDao.sensorImage(map));
		
	    putDataMap("rsSensorPosObj", rptRtStatDao.sensorPosObj(map));
		
		return "imagePoint";
	}
	
	public String graphPoint() throws Exception{
		
		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
		map = getReqMap();
		
		if (map.get("sensor_id") != null) {
			map.put("sel_sensor_id", map.get("sensor_id").toString());
		} else {
			map.put("sel_sensor_id", "");
		}

		putDataMap("rsSensorPos", rptRtStatDao.sensorPos(map));
		
		return "graphPoint";
	}
	
	public String troubleAlm() throws Exception{
		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
		map = getReqMap();
		
		String trPd = "";
		
		if( map.get("trouble_prod_dt") != null )
		{
			trPd = map.get("trouble_prod_dt").toString().replace("-", "");
			
			map.put("trouble_prod_dt", trPd);
		}
				
//		if( map.get("sensor_id") == null || map.get("sensor_id") == ""  )
//		{
//			putDataMap("errorMsg", "센서를 선택해 주세요");
//			return "troubleAlm_fail";
//		}
		
		int resultCount = sensorTroubleDao.countSenSensorTrouble_Trouble(map);
		putDataMap("resultCount", resultCount);
		putDataMap("rsSenSensorTrouble_Trouble", sensorTroubleDao.senSensorTrouble_Trouble(getPaging(resultCount)));
		
		return "troubleAlm";
	}
	
	public String sensorTree() throws Exception{
		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
		map = getReqMap();
		
		putDataMap("listSensorTree", sensorListDao.getSensorTree(map));
		
		putDataMap("rsSenSensorList_Detail", sensorListDao.senSensorList_Detail(map));
		
		if( map.get("sensor_id") != null )
		{
			putDataMap("rsSensorPosObj", rptRtStatDao.sensorPosObj(map));
		}
		
		return "sensorTree";
	}

}
