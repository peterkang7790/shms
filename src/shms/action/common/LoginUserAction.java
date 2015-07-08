/*
 * LoginUserAction.java
 * @author 강평희
 * @version 1.0 
 * @Date 2010. 01. 28.
 * Copyright (c) 2008 BY LSWARE INC. All rights reserved.
 */

package shms.action.common;

import java.security.MessageDigest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import com.lsware.utils.StringUtils;

import shms.common.ParamMap;
import shms.dao.common.CommonDao;
import shms.dao.common.quickMenuDao;
import shms.dao.instManage.rptRtStatDao;
import shms.dao.sensorManage.sensorListDao;


public class LoginUserAction extends ParamMap {

	private CommonDao commonDao;
	private rptRtStatDao rptRtStatDao;
	private sensorListDao sensorListDao;
	private quickMenuDao quickMenuDao;
	
	public quickMenuDao getQuickMenuDao() {
		return quickMenuDao;
	}


	public void setQuickMenuDao(quickMenuDao quickMenuDao) {
		this.quickMenuDao = quickMenuDao;
	}


	public void setSensorListDao(sensorListDao sensorListDao) {
		this.sensorListDao = sensorListDao;
	}


	public void setRptRtStatDao(rptRtStatDao rptRtStatDao) {
		this.rptRtStatDao = rptRtStatDao;
	}

	Map map;
	Map loginUserMap;
	int strCount = 0;
	
	public void setCommonDao(CommonDao commonDao) {
		this.commonDao = commonDao;
	}


	/**
	 * 유저 추가상세조회
	 * @return
	 * @throws Exception
	 */
	public String loginViewUser() throws Exception{
		return "loginViewUser";
	}
	
	public String loginViewUserPda() throws Exception{
		return "loginViewUserPda";
	}
	
	public String logout() throws Exception{
		ServletActionContext.getRequest().getSession().invalidate();
		return "logout_success";
	}
	
	public String logoutPda() throws Exception{
		ServletActionContext.getRequest().getSession().invalidate();
		return "logoutpda_success";
	}
	
	/**
	 * 관리자 로그인
	 * @return
	 * @throws Exception
	 */
	public String loginUser() throws Exception{
		
		map = getReqMap();
		
		// 신규 사용자 등록을 했을경우 최초 접속 구조물 아이디를  관리자가 등록해주어야 한다. 테이블을 직접 핸들링해서
		String startSrtchk = commonDao.getStructStart(map);
		
		if( commonDao.getStructStart(map) == null )
		{
			putDataMap("errorMsg", "최고 관리자에게 최초 접속할 구조물을 등록 요청 하세요");
			return "loginUser_fail";
		}
			
		
		loginUserMap = (HashMap)commonDao.loginUser(getReqMap());	
		
		strCount = commonDao.getStructCount(map);
		
		if( loginUserMap.get("super_admin_yn").equals("2") && strCount == 0 )
		{
			putDataMap("errorMsg", "등록된 구조물이 존재 하지 않습니다. 관리자에게 문의 하시기 바랍니다.");
			return "loginUser_fail";
		}
		
		if(loginUserMap == null){
			putDataMap("errorMsg", "입력하신 아이디 혹은 비밀번호가 일치하지 않습니다.");
			return "loginUser_fail";
		}
		else{
			
			ServletActionContext.getRequest().getSession().setAttribute("USER_ID", loginUserMap.get("USER_ID"));
			ServletActionContext.getRequest().getSession().setAttribute("USER_NM", loginUserMap.get("USER_NM"));
			ServletActionContext.getRequest().getSession().setAttribute("USED_CLASS_CD", loginUserMap.get("USED_CLASS_CD"));
			ServletActionContext.getRequest().getSession().setAttribute("STRUCT_ID", loginUserMap.get("STRUCT_ID"));
			ServletActionContext.getRequest().getSession().setAttribute("STRUCT_NM", loginUserMap.get("STRUCT_NM"));
			ServletActionContext.getRequest().getSession().setAttribute("INTRO", loginUserMap.get("INTRO"));
			ServletActionContext.getRequest().getSession().setAttribute("STRUCT_TYPE_NM", loginUserMap.get("STRUCT_TYPE_NM"));
			ServletActionContext.getRequest().getSession().setAttribute("LOC_NM", loginUserMap.get("LOC_NM"));
			ServletActionContext.getRequest().getSession().setAttribute("DEF_CHECK", "false");
			ServletActionContext.getRequest().getSession().setAttribute("SUPER_ADMIN_YN", loginUserMap.get("SUPER_ADMIN_YN"));
			
			
			//LAST_ACCESS_DT = sysdate로 업데이트  처리한다.
			commonDao.updateLoginuser(getReqMap());
			
//			ServletActionContext.getRequest().getSession().setMaxInactiveInterval(Integer.parseInt(ShmsProperties.get("shms.session.MaxInactiveInterval.admin")));
			return "loginUser_success";
		}
	}
	
	public String login_pda() throws Exception{
		
		return "login_pda";
	}
	
	/**
	 * 관리자 PDA 로그인
	 * @return
	 * @throws Exception
	 */
	public String loginUserPda() throws Exception{
		
		map = getReqMap();
		
		loginUserMap = (HashMap)commonDao.loginUser(getReqMap());	
		
		if(loginUserMap == null){
			putDataMap("errorMsg", "입력하신 아이디 혹은 비밀번호가 일치하지 않습니다.");
			return "loginUser_fail";
		}
		else{
			
//			if( loginUserMap.get("SENSOR_ID") != null || loginUserMap.get("SENSOR_ID") != "" )
//			{
//				ServletActionContext.getRequest().getSession().setAttribute("sensor_id", map.get("sensor_id"));
//				ServletActionContext.getRequest().getSession().setAttribute("password", map.get("password"));
//			}
			
			ServletActionContext.getRequest().getSession().setAttribute("USER_ID", loginUserMap.get("USER_ID"));
			ServletActionContext.getRequest().getSession().setAttribute("USER_NM", loginUserMap.get("USER_NM"));
			ServletActionContext.getRequest().getSession().setAttribute("STRUCT_ID", loginUserMap.get("STRUCT_ID"));
			ServletActionContext.getRequest().getSession().setAttribute("STRUCT_NM", loginUserMap.get("STRUCT_NM"));
			
//			if( map.get("pdaTyp") != null )
//			{
//				
//			}
//			ServletActionContext.getRequest().getSession().setAttribute("USED_CLASS_CD", loginUserMap.get("USED_CLASS_CD"));
//			ServletActionContext.getRequest().getSession().setAttribute("INTRO", loginUserMap.get("INTRO"));
//			ServletActionContext.getRequest().getSession().setAttribute("STRUCT_TYPE_NM", loginUserMap.get("STRUCT_TYPE_NM"));
//			ServletActionContext.getRequest().getSession().setAttribute("LOC_NM", loginUserMap.get("LOC_NM"));
//			ServletActionContext.getRequest().getSession().setAttribute("DEF_CHECK", "false");
			
//			putDataMap("pdatyp", map.get("pdatyp"));
//			
//			ServletActionContext.getRequest().setAttribute("pdatyp", map.get("pdatyp"));
			
			//LAST_ACCESS_DT = sysdate로 업데이트  처리한다.
			commonDao.updateLoginuser(getReqMap());
			
//			ServletActionContext.getRequest().getSession().setMaxInactiveInterval(Integer.parseInt(ShmsProperties.get("shms.session.MaxInactiveInterval.admin")));
			return "loginUserPda_success";
		}
	} 
	
	/**
	 * 관리자 PDA 로그인(로그인인증없이 바로 현황 리스트 화면으로 보냄:: 향후 인증처리를 해야 함)
	 * @return
	 * @throws Exception
	 */
	public String inter_Pda() throws Exception{
		
		map = getReqMap();
		loginUserMap = (HashMap)commonDao.loginUserpda(getReqMap());
		if(  map.get("user_id") != null  )
		{
			ServletActionContext.getRequest().getSession().setAttribute("USER_ID", loginUserMap.get("user_id"));
			ServletActionContext.getRequest().getSession().setAttribute("USER_NM", loginUserMap.get("user_nm"));
			ServletActionContext.getRequest().getSession().setAttribute("STRUCT_ID", loginUserMap.get("struct_id"));
			ServletActionContext.getRequest().getSession().setAttribute("STRUCT_NM", loginUserMap.get("struct_nm"));
			ServletActionContext.getRequest().getSession().setAttribute("TROUBLE_ID", map.get("trouble_id"));
		}
		
		

    	return "inter_Pda_success";
	}
	
	public String dashborad() throws Exception
	{
		getReqMap().put("user_id", ServletActionContext.getRequest().getSession().getAttribute("USER_ID"));
		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
		map = getReqMap();
		
		putDataMap("listDashboard", commonDao.getDashboard(map));
//		putDataMap("troubleCountLst", sensorListDao.dashboardList_Detail(map));
		return "dashboard_success";
	}
	
	public String new_dashborad() throws Exception
	{
		getReqMap().put("user_id", ServletActionContext.getRequest().getSession().getAttribute("USER_ID"));
		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
		
		map = getReqMap();
		
		putDataMap("struct_id", map.get("struct_id"));
		putDataMap("listDashboard", commonDao.getDashboard(map));
		
		return "new_dashborad";
	}
	
	
	public String goToStruct() throws Exception
	{
		map = getReqMap();
		
		ServletActionContext.getRequest().getSession().setAttribute("STRUCT_ID", map.get("struct_id"));
		ServletActionContext.getRequest().getSession().setAttribute("STRUCT_TYPE_NM", map.get("struct_type_nm"));
		ServletActionContext.getRequest().getSession().setAttribute("STRUCT_NM", map.get("struct_nm"));
		ServletActionContext.getRequest().getSession().setAttribute("LOC_NM", map.get("loc_nm"));
		ServletActionContext.getRequest().getSession().setAttribute("IMAGE_PATH", map.get("image_path"));
		
		
		getReqMap().put("user_id", ServletActionContext.getRequest().getSession().getAttribute("USER_ID"));
		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
		getReqMap().put("loc_nm", ServletActionContext.getRequest().getSession().getAttribute("LOC_NM"));
		getReqMap().put("struct_type_nm", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_TYPE_NM"));
		getReqMap().put("image_path", ServletActionContext.getRequest().getSession().getAttribute("IMAGE_PATH"));
		
		map = getReqMap();
		
		commonDao.updateStruct(map);
		
		return "goToStruct_success";
	}
	
	public String mainView() throws Exception
	{
		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
		getReqMap().put("user_id", ServletActionContext.getRequest().getSession().getAttribute("USER_ID"));
		map = getReqMap();
		
		putDataMap("rsSensorImage", rptRtStatDao.sensorImage(map));
		putDataMap("rsSensorPos", rptRtStatDao.sensorPos(map));
		putDataMap("rsSensor", rptRtStatDao.sensor(map));
		
		return "mainView";
	}
	
	public String mainViewPda() throws Exception
	{
		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
		getReqMap().put("user_id", ServletActionContext.getRequest().getSession().getAttribute("USER_ID"));
		getReqMap().put("sensor_id", ServletActionContext.getRequest().getSession().getAttribute("sensor_id"));
		getReqMap().put("password", ServletActionContext.getRequest().getSession().getAttribute("password"));
		map = getReqMap();
		
		putDataMap("rsSensorImage", rptRtStatDao.sensorImage(map));
		putDataMap("rsSensorPos", rptRtStatDao.sensorPos(map));
		putDataMap("rsSensor", rptRtStatDao.sensor(map));
		
		return "mainViewPda";
	}
	
	
	public String subMain() throws Exception
	{
		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
		map = getReqMap();
		
		if (map.get("sensor_id") != null) {
			map.put("sel_sensor_id", map.get("sensor_id").toString());
		} else {
			map.put("sel_sensor_id", "");
		}

		// PARAMETER : p_sensor_id, p_sensor_type_cd

		putDataMap("rsSenSensorList_Sensor", sensorListDao.senSensorList_SubMain(map));
		putDataMap("rsSensorPos", rptRtStatDao.sensorPos(map));
		
		
		return "subMain";
	}
	
	/**
	 * 센서정보
	 * @return
	 * @throws Exception
	 */
	public String sensor() throws Exception {
		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
		map = getReqMap();

		putDataMap("rsSensor", rptRtStatDao.sensor(map));
		
		return "sensor_success";
	}
	
	public String subMainlst() throws Exception{
		
		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
		map = getReqMap();
		
		if (map.get("sensor_id") != null) {
			map.put("sel_sensor_id", map.get("sensor_id").toString());
		} else {
			map.put("sel_sensor_id", "");
		}

		// PARAMETER : p_sensor_id, p_sensor_type_cd

		putDataMap("rsSenSensorList_Sensor", sensorListDao.senSensorList_SubMain(map));
		
//		putDataMap("rsSensorPos", rptRtStatDao.sensorPos(map));
		
		return "subMainlst";
	}
	
	public String subMainlst_def() throws Exception{
		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
		getReqMap().put("sensor_id", ServletActionContext.getRequest().getSession().getAttribute("sensor_id"));
		map = getReqMap();
		
		String structStatic = "";
		
		int resultCount = sensorListDao.countsenSensorList_SubMain(map);
		
		List defV = sensorListDao.senSensorList_SubMain(getPaging(resultCount));
		Map df = null;
		for( int i=0; i<defV.size(); i++ )
		{
			df = (Map)defV.get(i);
			
			String aaa = df.get("rnum").toString();
			
			if( "1".equals( aaa ) )
			{
				structStatic = df.get("sensor_id").toString();
				df.put("sensor_id", structStatic);
				putDataMap("structStatic", df);
			}
		}
		
		
		return "subMainlst_def";
	}
	
	public String troubleCancel() throws Exception
	{
		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
		map = getReqMap();
		
		int resultCount = sensorListDao.counttroubleCancel_Sensor(map);
		
		putDataMap("cancelTrouble", sensorListDao.troubleCancel_SubMain(getPaging(resultCount)));
		
		return "troubleCancel";
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
	
	public String helpPdf() throws Exception{
		
		
		return "helpPdf";
	}
}

