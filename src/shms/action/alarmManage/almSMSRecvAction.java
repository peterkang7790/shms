/*
 * almSMSRecvAction.java
 * @author 김종범
 * @version 1.0 
 * @Date 2010. 02. 11.
 * Copyright (c) 2010 BY LSWARE INC. All rights reserved.
 */

package shms.action.alarmManage;

import java.util.Map;

import org.apache.struts2.ServletActionContext;

import shms.common.ParamMap;
import shms.dao.admin.userDao;
import shms.dao.alarmManage.smsRecvDao;

public class almSMSRecvAction extends ParamMap {

	private smsRecvDao smsRecvDao;
	private userDao userDao;

	public userDao getUserDao() {
		return userDao;
	}

	public void setUserDao(userDao userDao) {
		this.userDao = userDao;
	}

	public smsRecvDao getSMSRecvDao() {
		return smsRecvDao;
	}

	public void setSMSRecvDao(smsRecvDao smsRecvDao) {
		this.smsRecvDao = smsRecvDao;
	}

	Map map = null;

	public String almSMSRecv() throws Exception {
		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
		map = getReqMap();

		//putDataMap("rsSMSRecvSensor", smsRecvDao.listSMSRecvSensor(map));
//		putDataMap("rsSMSRecvUser", smsRecvDao.listSMSRecvUser(map));
		int resultCount = userDao.countListUser_1(map);
		putDataMap("rsSMSRecvUser", userDao.listUser_1(getPaging(resultCount)));
		
		return "listSMSRecv_success";
	}

//	/**
//	 * SMS통보자 등록
//	 * 
//	 * @return
//	 * @throws Exception
//	 */
//	public String saveSMSRecv() throws Exception {
//		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
//		map = getReqMap();
//
//		smsRecvDao.delSMSRecv(map);
//
//		Object obj = map.get("access_yn");
//		String[] s_value;
//		if (obj instanceof String) {
//			String access_yn = map.get("access_yn").toString();
//
//			s_value = access_yn.split(",");
//
//			map.put("access_yn", s_value[0]);
//			map.put("user_id", s_value[1]);
//
//			smsRecvDao.addSMSRecv(map);
//		} else {
//			String[] access_yn = (String[]) map.get("access_yn");
//
//			if (access_yn != null) {
//				for (int i = 0; i < access_yn.length; i++) {
//					s_value = access_yn[i].split(",");
//
//					map.put("access_yn", s_value[0]);
//					map.put("user_id", s_value[1]);
//
//					smsRecvDao.addSMSRecv(map);
//				}
//			}
//		}		
//		
//		return "saveSMSRecv_success";
//	}

}
