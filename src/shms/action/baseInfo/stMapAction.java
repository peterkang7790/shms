/*
 * stMapAction.java
 * @author ±èÁ¾¹ü
 * @version 1.0 
 * @Date 2010. 02. 23.
 * Copyright (c) 2010 BY LSWARE INC. All rights reserved.
 */

package shms.action.baseInfo;

import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import shms.common.Log4j;
import shms.common.ParamMap;
import shms.dao.baseInfo.stMapDao;
import shms.dao.common.CommonDao;

/**
 * 
 * @author ±èÁ¾¹ü
 * @version 1.0, 2010. 02. 23.
 */
public class stMapAction extends ParamMap {

	private stMapDao stMapDao;
	private CommonDao commonDao;

	Map map;

	public void setStMapDao(stMapDao stMapDao) {
		this.stMapDao = stMapDao;
	}

	public void setCommonDao(CommonDao commonDao) {
		this.commonDao = commonDao;
	}

	public String listStMap() throws Exception {
		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
		map = getReqMap();

		putDataMap("basecall", null);
		putDataMap("formType", null);

		putDataMap("rsListStMap", stMapDao.getListStMap(map));

		String key_type = "";
		if (map.get("key_type") != null) key_type = map.get("key_type").toString();
			
		System.out.println("key_type = " + key_type);
		
		if (key_type.equals("D")) { // Detector
			putDataMap("rsDetailStMapDetector", stMapDao.getDetailStMapDetector(map));
		}
		if (key_type.equals("C")) { // Channel
			putDataMap("rsDetailStMapChannel", stMapDao.getDetailStMapChannel(map));
		}
		if (key_type.equals("S")) { // Sensor
			putDataMap("rsDetailStMapSensor", stMapDao.getDetailStMapSensor(map));
		}

		return "listStMap_success";
	}

}
