/*
 * menuAction.java
 * @author 김종범
 * @version 1.0 
 * @Date 2010. 02. 06.
 * Copyright (c) 2010 BY LSWARE INC. All rights reserved.
 */

package shms.action.admin;

import java.io.PrintWriter;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import shms.common.Log4j;
import shms.common.ParamMap;
import shms.dao.admin.menuDao;
import shms.dao.common.CommonDao;
import shms.dao.common.leftMenuDao;

public class menuAction extends ParamMap {

	private menuDao menuDao;
	private CommonDao commonDao;
	private leftMenuDao leftMenuDao;

	public leftMenuDao getLeftMenuDao() {
		return leftMenuDao;
	}

	public void setLeftMenuDao(leftMenuDao leftMenuDao) {
		this.leftMenuDao = leftMenuDao;
	}
	
	public CommonDao getCommonDao() {
		return commonDao;
	}

	public void setCommonDao(CommonDao commonDao) {
		this.commonDao = commonDao;
	}

	public menuDao getMenuDao() {
		return menuDao;
	}

	public void setMenuDao(menuDao menuDao) {
		this.menuDao = menuDao;
	}

	Map map = null;

	public String leftMenu() throws Exception {
		getReqMap().put("user_id", ServletActionContext.getRequest().getSession().getAttribute("USER_ID"));
		map = getReqMap();

		String p_menu_id = "";

		if (map.get("num") != null) {
			map.put("p_menu_id", map.get("num").toString());
		}

		System.out.println("map = " + map);

		putDataMap("rsLeftMenu", leftMenuDao.getLeftMenu(map));

		return "leftMenu_success";
	}
	
	/**
	 * 메뉴 리스트
	 * 
	 * @return
	 * @throws Exception
	 */
	public String listMenu() throws Exception {
		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
		map = getReqMap();

		String menu_id = "";
		String menu_nm = "";
		String p_menu_id = "";
		String sel_yn = "";

		if (map.get("p_menu_id") != null) {
			map.put("menu_id", map.get("p_menu_id").toString());
		}
		if (map.get("p_menu_nm") != null) {
			map.put("menu_nm", map.get("p_menu_nm").toString());
		}
		if (map.get("p_p_menu_id") != null) {
			map.put("p_menu_id", map.get("p_p_menu_id").toString());
		}
		if (map.get("p_sel_yn") != null) {
			map.put("sel_yn", map.get("p_sel_yn").toString());
		}

		int resultCount = menuDao.countListMenu(map);

		// 상위메뉴 셀렉터
		putDataMap("parentmenu_list", commonDao.getParentMenu(map));
		// Y/N 셀렉터
		putDataMap("yn_list", commonDao.getYN(map));

		putDataMap("resultCount", resultCount);
		putDataMap("rsListMenu", menuDao.listMenu(getPaging(resultCount)));

		return "listMenu_success";
	}

	/**
	 * 메뉴 상세보기
	 * 
	 * @return
	 * @throws Exception
	 */
	public String detailMenu() throws Exception {
		map = getReqMap();

		putDataMap("rsOneMenu", menuDao.detailMenu(map));
		return "detailMenu_success";
	}

	/**
	 * 메뉴 등록 (조회)
	 * 
	 * @return
	 * @throws Exception
	 */
	public String viewAddMenu() throws Exception {
		map = getReqMap();

		// 상위메뉴 셀렉터
		putDataMap("parentmenu_list", commonDao.getParentMenu(map));
		// Y/N 셀렉터
		putDataMap("yn_list", commonDao.getYN(map));

		return "viewAddMenu_success";
	}

	/**
	 * 메뉴 등록
	 * 
	 * @return
	 * @throws Exception
	 */
	public String addMenu() throws Exception {
		map = getReqMap();

		if(menuDao.menuIdChk(map) > 0){
			putDataMap("errorMsg", "이미 사용중인 메뉴ID입니다.");
			return "addMenu_error";
		}

		menuDao.addMenu(map);

		return "addMenu_success";
	}

	/**
	 * 메뉴 수정 (조회)
	 * 
	 * @return
	 * @throws Exception
	 */
	public String viewEditMenu() throws Exception {
		map = getReqMap();

		// 상위메뉴 셀렉터
		putDataMap("parentmenu_list", commonDao.getParentMenu(map));
		// Y/N 셀렉터
		putDataMap("yn_list", commonDao.getYN(map));

		putDataMap("rsOneMenu", menuDao.viewEditMenu(map));

		return "viewEditMenu_success";
	}

	/**
	 * 메뉴 수정
	 * 
	 * @return
	 * @throws Exception
	 */
	public String editMenu() throws Exception {
		map = getReqMap();

		menuDao.editMenu(map);

		return "editMenu_success";
	}

	/**
	 * 메뉴 삭제
	 * 
	 * @return
	 * @throws Exception
	 */
	public String delMenu() throws Exception {
		map = getReqMap();

		menuDao.delMenu(map);

		return "delMenu_success";
	}

	public void menuIdChk() throws Exception {
		PrintWriter printWriter = null;
		
		try {
			ServletActionContext.getResponse().setContentType("text/html;charset=utf-8");
			printWriter = ServletActionContext.getResponse().getWriter();

			if (menuDao.menuIdChk(getReqMap()) == 0) {
				printWriter.print("<font color='blue'>사용할 수 있는 메뉴ID 값 입니다.</font>");
			} else {
				printWriter.print("<font color='red'>이미 존재하는 메뉴ID 값 입니다.</font>");
			}
		} catch (Exception e) {
			Log4j.log.error("menuIdChkGatherData:", e);
		} finally {
			printWriter.close();
		}
	}

}
