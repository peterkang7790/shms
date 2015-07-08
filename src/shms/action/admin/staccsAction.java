/*
 * staccsAction.java
 * @author 김종범
 * @version 1.0 
 * @Date 2010. 02. 08.
 * Copyright (c) 2010 BY LSWARE INC. All rights reserved.
 */

package shms.action.admin;

import java.util.Map;

import shms.common.ParamMap;
import shms.dao.admin.staccsDao;

public class staccsAction extends ParamMap {

	private staccsDao staccsDao;

	public staccsDao getStaccsDao() {
		return staccsDao;
	}

	public void setStaccsDao(staccsDao staccsDao) {
		this.staccsDao = staccsDao;
	}

	Map map = null;

	public String listStaccs() throws Exception {
		map = getReqMap();

		if (map.get("user_id") != null) {
			map.put("sel_user_id", map.get("user_id").toString());
		} else {
			map.put("sel_user_id", "");
		}

		putDataMap("rsListStaccsUser", staccsDao.listStaccsUser(map));
		putDataMap("rsListStaccsStruct", staccsDao.listStaccsStruct(map));

		return "listStaccs_success";
	}


	/**
	 * 구조물별 접근권한 (사용자) 리스트
	 * 
	 * @return
	 * @throws Exception
	 */
	public String listStaccsUser() throws Exception {
		map = getReqMap();

		putDataMap("rsListStaccsUser", staccsDao.listStaccsUser(map));

		return "listStaccsUser_success";
	}

	/**
	 * 구조물별 접근권한 (접근권한) 리스트
	 * 
	 * @return
	 * @throws Exception
	 */
	public String listStaccsStruct() throws Exception {
		map = getReqMap();

		putDataMap("rsListStaccsStruct", staccsDao.listStaccsStruct(map));

		return "listStaccsStruct_success";
	}

	/**
	 * 접근권한 저장
	 * 
	 * @return
	 * @throws Exception
	 */
	public String saveStaccs() throws Exception {
		map = getReqMap();
		
		staccsDao.delStaccs(map);
		

		Object obj = map.get("access_yn");
		String[] s_value;
		if (obj instanceof String) {
			String access_yn = map.get("access_yn").toString();

			s_value = access_yn.split(",");

			map.put("access_yn", s_value[0]);
			map.put("struct_id", s_value[1]);

			staccsDao.addStaccs(map);
		} else {
			String[] access_yn = (String[]) map.get("access_yn");

			if (access_yn != null) {
				for (int i = 0; i < access_yn.length; i++) {
					s_value = access_yn[i].split(",");

					map.put("access_yn", s_value[0]);
					map.put("struct_id", s_value[1]);

					staccsDao.addStaccs(map);
				}
			}
		}
		
		return "saveStaccs_success";
	}


}
