/*
 * senSensorTroubleAction.java
 * @author 김종범
 * @version 1.0 
 * @Date 2010. 02. 25.
 * Copyright (c) 2010 BY LSWARE INC. All rights reserved.
 */

package shms.action.sensorManage;

import java.util.Map;

import org.apache.struts2.ServletActionContext;

import shms.common.ParamMap;
import shms.dao.common.CommonDao;
import shms.dao.sensorManage.sensorTroubleDao;

public class senSensorTroubleAction extends ParamMap {

	private sensorTroubleDao sensorTroubleDao;
	private CommonDao commonDao;

	public CommonDao getCommonDao() {
		return commonDao;
	}

	public void setCommonDao(CommonDao commonDao) {
		this.commonDao = commonDao;
	}

	public sensorTroubleDao getSensorTroubleDao() {
		return sensorTroubleDao;
	}

	public void setSensorTroubleDao(sensorTroubleDao sensorTroubleDao) {
		this.sensorTroubleDao = sensorTroubleDao;
	}

	Map map = null;

	/**
	 * 리스트
	 * 
	 * @return
	 * @throws Exception
	 */
	public String senSensorTrouble() throws Exception {
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

		int resultCount = sensorTroubleDao.countSenSensorTrouble_Sensor(map);
		putDataMap("resultCount", resultCount);
		putDataMap("rsSenSensorTrouble_Sensor", sensorTroubleDao.senSensorTrouble_Sensor(getPaging(resultCount)));

		putDataMap("rsSenSensorTrouble_Trouble", sensorTroubleDao.senSensorTrouble_Trouble(map));

		return "senSensorTrouble_success";
	}

}
