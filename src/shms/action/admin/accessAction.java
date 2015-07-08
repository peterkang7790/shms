/*
 * accessAction.java
 * @author 김종범
 * @version 1.0 
 * @Date 2010. 02. 06.
 * Copyright (c) 2010 BY LSWARE INC. All rights reserved.
 */

package shms.action.admin;

import java.util.Map;

import shms.common.ParamMap;
import shms.dao.admin.accessDao;

public class accessAction extends ParamMap {

	private accessDao accessDao;

	public accessDao getAccessDao() {
		return accessDao;
	}

	public void setAccessDao(accessDao accessDao) {
		this.accessDao = accessDao;
	}

	Map map = null;

	public String listAccess() throws Exception {
		map = getReqMap();

		if (map.get("user_id") != null) {
			map.put("sel_user_id", map.get("user_id").toString());
		} else {
			map.put("sel_user_id", "");
		}

		putDataMap("rsListAccessUser", accessDao.listAccessUser(map));
		putDataMap("rsListAccessMenu", accessDao.listAccessMenu(map));

		return "listAccess_success";
	}

	/**
	 * 접근권한 (사용자) 리스트
	 * 
	 * @return
	 * @throws Exception
	 */
	public String listAccessUser() throws Exception {
		map = getReqMap();

		putDataMap("rsListAccessUser", accessDao.listAccessUser(map));

		return "listAccessUser_success";
	}

	/**
	 * 접근권한 (메뉴별 접근권한) 리스트
	 * 
	 * @return
	 * @throws Exception
	 */
	public String listAccessMenu() throws Exception {
		map = getReqMap();

		putDataMap("rsListAccessMenu", accessDao.listAccessMenu(map));

		return "listAccessMenu_success";
	}

	/**
	 * 접근권한 저장
	 * 
	 * @return
	 * @throws Exception
	 */
	public String saveAccess() throws Exception {
		map = getReqMap();

		// System.out.println("map = " + map);
		accessDao.delAccess(map);

		Object obj = map.get("access_yn");
		String[] s_value;
		if (obj instanceof String) {
			String access_yn = map.get("access_yn").toString();

			s_value = access_yn.split(",");

			map.put("access_yn", s_value[0]);
			map.put("menu_id", s_value[1]);

			accessDao.addAccess(map);
		} else {
			String[] access_yn = (String[]) map.get("access_yn");

			if (access_yn != null) {
				for (int i = 0; i < access_yn.length; i++) {
					s_value = access_yn[i].split(",");

					map.put("access_yn", s_value[0]);
					map.put("menu_id", s_value[1]);

					accessDao.addAccess(map);
				}
			}
		}

		return "saveAccess_success";
	}

}
