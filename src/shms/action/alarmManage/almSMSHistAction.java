/*
 * almSMSHistAction.java
 * @author 김종범
 * @version 1.0 
 * @Date 2010. 02. 24.
 * Copyright (c) 2010 BY LSWARE INC. All rights reserved.
 */

package shms.action.alarmManage;

import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import shms.common.ParamMap;
import shms.dao.alarmManage.smsHistDao;
import shms.dao.common.CommonDao;

public class almSMSHistAction extends ParamMap {

	private smsHistDao smsHistDao;
	private CommonDao commonDao;

	public CommonDao getCommonDao() {
		return commonDao;
	}

	public void setCommonDao(CommonDao commonDao) {
		this.commonDao = commonDao;
	}

	public smsHistDao getSMSHistDao() {
		return smsHistDao;
	}

	public void setSMSHistDao(smsHistDao smsHistDao) {
		this.smsHistDao = smsHistDao;
	}

	Map map = null;

	/**
	 * SMS발송이력 리스트
	 * 
	 * @return
	 * @throws Exception
	 */
	public String almSMSHist() throws Exception {
		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
		map = getReqMap();

		String sendDT = "";
		if( map.get("send_dt") != null )
		{
			sendDT = map.get("send_dt").toString().replace("-", "");
			map.put("send_dt", sendDT);
		}
		
		if (map.get("trouble_id") != null) {
			map.put("sel_trouble_id", map.get("trouble_id").toString());
		} else {
			map.put("sel_trouble_id", "");
		}

		// 센서 셀렉터
		putDataMap("sensor_list", commonDao.getSensor(map));
		// 장애등급 셀렉터
		putDataMap("troubleclass_list", commonDao.getTroubleClass(map));
		// SMS통보여부 셀렉터
//		putDataMap("smssendyn_list", commonDao.getYN(map));
		// 조치여부 셀렉터
//		putDataMap("markingyn_list", commonDao.getYN(map));

		if (map.get("p_sensor") != null) {
			map.put("sensor_id", map.get("p_sensor").toString());
		}
		if (map.get("p_troubleclass") != null) {
			map.put("trouble_class_cd", map.get("p_troubleclass").toString());
		}
		if (map.get("p_smssendyn") != null) {
			map.put("sms_send_yn", map.get("p_smssendyn").toString());
		}
		if (map.get("p_markingyn") != null) {
			map.put("marking_yn", map.get("p_markingyn").toString());
		}

		int resultCount = smsHistDao.countAlmSMSHistTrouble(map);
		putDataMap("resultCount", resultCount);
		
		putDataMap("rsAlmSMSHistTrouble", smsHistDao.almSMSHistTrouble(getPaging(resultCount)));

//		putDataMap("rsAlmSMSHistAction", smsHistDao.almSMSHistAction(map));

		return "almSMSHist_success";
	}

}
