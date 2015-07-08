/*
 * troubleAction.java
 * @author 김종범
 * @version 1.0 
 * @Date 2010. 02. 05.
 * Copyright (c) 2010 BY LSWARE INC. All rights reserved.
 */

package shms.action.alarmManage;

import java.io.PrintWriter;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import shms.common.Log4j;
import shms.common.ParamMap;
import shms.dao.alarmManage.troubleDao;
import shms.dao.common.CommonDao;

public class troubleAction extends ParamMap {

	private troubleDao troubleDao;
	private CommonDao commonDao;

	public CommonDao getCommonDao() {
		return commonDao;
	}

	public void setCommonDao(CommonDao commonDao) {
		this.commonDao = commonDao;
	}

	public troubleDao getTroubleDao() {
		return troubleDao;
	}

	public void setTroubleDao(troubleDao troubleDao) {
		this.troubleDao = troubleDao;
	}

	Map map = null;

	/**
	 * 장애 리스트
	 * 
	 * @return
	 * @throws Exception
	 */
	public String listTrouble() throws Exception {
		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
		map = getReqMap();

		String user_id = "";
		String user_nm = "";
		String group_id = "";
		String used_class_cd = "";

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

		int resultCount = troubleDao.countListTrouble(map);

		// 센서 셀렉터
		putDataMap("sensor_list", commonDao.getSensor(map));
		// 장애등급 셀렉터
		putDataMap("troubleclass_list", commonDao.getTroubleClass(map));
		// SMS통보여부 셀렉터
		putDataMap("smssendyn_list", commonDao.getYN(map));
		// 조치여부 셀렉터
		putDataMap("markingyn_list", commonDao.getYN(map));

		putDataMap("resultCount", resultCount);
		putDataMap("rsListTrouble", troubleDao.listTrouble(getPaging(resultCount)));

		return "listTrouble_success";
	}
	/**
	 * 장애 PDA에서 접속 리스트
	 * 
	 * @return
	 * @throws Exception
	 */
	public String listTroublePda() throws Exception {
		
		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
		map = getReqMap();
		if( map.get("pdatyp") == null )
		{
			getReqMap().put("sensor_id", ServletActionContext.getRequest().getSession().getAttribute("SENSOR_ID"));
			getReqMap().put("trouble_id", ServletActionContext.getRequest().getSession().getAttribute("TROUBLE_ID"));
			getReqMap().put("trouble_class_cd", ServletActionContext.getRequest().getSession().getAttribute("TROUBLE_CLASS_CD"));
		}
		
		map = getReqMap();

		String user_id = "";
		String user_nm = "";
		String group_id = "";
		String used_class_cd = "";

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
		
		int resultCount = troubleDao.countListTrouble(map);

		// 센서 셀렉터
		putDataMap("sensor_list", commonDao.getSensor(map));
		// 장애등급 셀렉터
		putDataMap("troubleclass_list", commonDao.getTroubleClass(map));
		// SMS통보여부 셀렉터
		putDataMap("smssendyn_list", commonDao.getYN(map));
		// 조치여부 셀렉터
		putDataMap("markingyn_list", commonDao.getYN(map));

		putDataMap("resultCount", resultCount);
		putDataMap("rsListTrouble", troubleDao.listTrouble(getPaging(resultCount)));

		return "listTroublePda_success";
	}

	/**
	 * 장애 상세보기
	 * 
	 * @return
	 * @throws Exception
	 */
	public String detailTrouble() throws Exception {
		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
		map = getReqMap();

		if( map.get("pda") != null ) putDataMap("pda", map.get("pda"));
		
		putDataMap("rsDetailTrouble", troubleDao.detailTrouble(map));
		return "detailTrouble_success";
	}

	/**
	 * 장애 수정
	 * 
	 * @return
	 * @throws Exception
	 */
	public String editViewTrouble() throws Exception {
		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
		getReqMap().put("user_id", ServletActionContext.getRequest().getSession().getAttribute("USER_ID"));	
		map = getReqMap();

		putDataMap("rsDetailTrouble", troubleDao.detailTrouble(map));
		
		
		return "editViewTrouble_success";
	}
	
	/**
	 * 장애 수정
	 * 
	 * @return
	 * @throws Exception
	 */
	public String editTrouble() throws Exception {
		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
		getReqMap().put("user_id", ServletActionContext.getRequest().getSession().getAttribute("USER_ID"));	
		map = getReqMap();

		troubleDao.editTrouble(map);
		
		return "editTrouble_success";
	}

}
