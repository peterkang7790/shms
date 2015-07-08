/*
 * userAction.java
 * @author 김종범
 * @version 1.0 
 * @Date 2010. 02. 05.
 * Copyright (c) 2010 BY LSWARE INC. All rights reserved.
 */

package shms.action.admin;

import java.io.PrintWriter;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import shms.common.Log4j;
import shms.common.ParamMap;
import shms.dao.admin.userDao;
import shms.dao.common.CommonDao;

import com.lsware.utils.StringUtils;

public class userAction extends ParamMap {

	private userDao userDao;
	private CommonDao commonDao;

	public CommonDao getCommonDao() {
		return commonDao;
	}

	public void setCommonDao(CommonDao commonDao) {
		this.commonDao = commonDao;
	}

	public userDao getUserDao() {
		return userDao;
	}

	public void setUserDao(userDao userDao) {
		this.userDao = userDao;
	}

	Map map = null;

	/**
	 * 사용자 리스트
	 * 
	 * @return
	 * @throws Exception
	 */
	public String listUser() throws Exception {
		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
		map = getReqMap();

//		String user_id = "";
//		String user_nm = "";
//		String group_id = "";
//		String used_class_cd = "";

//		if (map.get("p_user_id") != null) {
//			map.put("user_id", map.get("p_user_id").toString());
//		}
//		if (map.get("p_user_nm") != null) {
//			map.put("user_nm", map.get("p_user_nm").toString());
//		}
//		if (map.get("p_group_id") != null) {
//			map.put("group_id", map.get("p_group_id").toString());
//		}
//		if (map.get("p_used_class_cd") != null) {
//			map.put("used_class_cd", map.get("p_used_class_cd").toString());
//		}

		System.out.println("p_user_id = " + map.get("p_user_id"));
		System.out.println("user_id = " + map.get("user_id"));
		
		int resultCount = userDao.countListUser(map);

		// 그룹 셀렉터
		putDataMap("group_list", commonDao.getGroupID(map));
		// 사용등급 셀렉터
		putDataMap("usedclass_list", commonDao.getUsedClassCd(map));

		putDataMap("resultCount", resultCount);
		putDataMap("rsListUser", userDao.listUser(getPaging(resultCount)));

		
		
		return "listUser_success";
	}
	
	

	/**
	 * 사용자 상세보기
	 * 
	 * @return
	 * @throws Exception
	 */
	public String detailUser() throws Exception {
		map = getReqMap();
		
		putDataMap("rsOneUser", userDao.detailUser(map));
		
		String passw_v = "";
		
		if( map.get("passw_v") != null )  passw_v = map.get("passw_v").toString();
		
		putDataMap("passw_v", passw_v);
		
		return "detailUser_success";
	}

	/**
	 * 사용자 등록 (조회)
	 * 
	 * @return
	 * @throws Exception
	 */
	public String viewAddUser() throws Exception {
		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
		map = getReqMap();

		// 그룹 셀렉터
		putDataMap("group_list", commonDao.getGroupID(map));
		// 사용등급 셀렉터
		putDataMap("usedclass_list", commonDao.getUsedClassCd(map));
		// SMS수신여부 셀렉터
		putDataMap("sms_recv_yn_list", commonDao.getYN(map));
		
		// Y/N 셀렉터
		putDataMap("yn_list", commonDao.getYN(map));
		
		int hotLineCnt = userDao.hotLineUserChk(map);
		
		putDataMap("hotcnt", String.valueOf( hotLineCnt ) );

		return "viewAddUser_success";
	}

	/**
	 * 사용자 등록
	 * 
	 * @return
	 * @throws Exception
	 */
	public String addUser() throws Exception {
		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
		map = getReqMap();

		map.put("last_struct_id", map.get("struct_id"));
		
		
		
		
		if(userDao.userIdChk(map) > 0){
			putDataMap("errorMsg", "이미 사용중인 사용자ID입니다.");
			return "addUser_error";
		}
		
		if( map.get("user_id") == null || map.get("user_id") == ""  )
		{
			putDataMap("errorMsg", "아이디를 선택하셔야 합니다.");
			return "addUser_error";
		}
		
		if( map.get("password") == null || map.get("password") == ""  )
		{
			putDataMap("errorMsg", "패스워드를 입력하셔야 합니다.");
			return "addUser_error";
		}

		int hotLineCnt = userDao.hotLineUserChk(map);
		
		if( hotLineCnt > 2 )
		{
			putDataMap("errorMsg", "Hot Line은 2명 까지 선택 가능합니다. 현재(2명 완료)");
//			return "addUser_error";
		}
		
		if( map.get("hot_line_woker_yn") != null )
		{
			String hotL = map.get("hot_line_woker_yn").toString();
			String hotTel = map.get("tel_no").toString();
			if( "Y".equals(hotL) )
			{
				if( hotTel == null || hotTel == "" ) 
				{
					putDataMap("errorMsg", "HotLine을 Y선택 하시면 연락처가 반드시 입력되어야 합니다.");
					return "addUser_error";
				}
			}
		}
		
		String chaPsw = StringUtils.cha1Security(map.get("password").toString());
		
		map.put("password", chaPsw);
		
		if( map.get("tel_no") != null && map.get("tel_no") != ""  ) 
		{
			String tno = map.get("tel_no").toString().replace("-", "");
			map.put("tel_no", StringUtils.strTelNo( tno ));
		}
		
		if( map.get("mobile_no") != null && map.get("mobile_no") != "" ) 
		{
			String mno = map.get("mobile_no").toString().replace("-", "");
			map.put("mobile_no", StringUtils.strMobileNo( mno ) );
		}
		
		userDao.addUser(map);
//		userDao.addUser(map);

		return "addUser_success";
	}

	/**
	 * 사용자 수정 (조회)
	 * 
	 * @return
	 * @throws Exception
	 */
	public String viewEditUser() throws Exception {
		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
		map = getReqMap();
		
		// 그룹 셀렉터
		putDataMap("group_list", commonDao.getGroupID(map));
		// 사용등급 셀렉터
		putDataMap("usedclass_list", commonDao.getUsedClassCd(map));

		putDataMap("rsOneUser", userDao.viewEditUser(map));
		
		
		// SMS수신여부 셀렉터
		putDataMap("sms_recv_yn_list", commonDao.getYN(map));
		
		// Y/N 셀렉터
		putDataMap("yn_list", commonDao.getYN(map));
		
		int hotLineCnt = userDao.hotLineUserChk(map);
		
		putDataMap("hotcnt", String.valueOf( hotLineCnt ) );

		return "viewEditUser_success";
	}

	/**
	 * 사용자 수정
	 * 
	 * @return
	 * @throws Exception
	 */
	public String editUser() throws Exception {
		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
		map = getReqMap();

		String pw = userDao.getUserPasswOrd(map);
		
		map.put("password", pw);
		
		int hotLineCnt = userDao.hotLineUserChk(map);
		
		if( hotLineCnt > 2 )
		{
			putDataMap("errorMsg", "Hot Line은 2명 까지 선택 가능합니다. 현재(2명 완료)");
//			return "addUser_error";
		}
		
		if( map.get("tel_no") != null && map.get("tel_no") != ""  ) 
		{
			String tno = map.get("tel_no").toString().replace("-", "");
			map.put("tel_no", tno );
			putDataMap("tel_no", tno);
//			map.put("tel_no", StringUtils.strTelNo( tno ));
		}
		
		if( map.get("mobile_no") != null && map.get("mobile_no") != "" ) 
		{
			String mno = map.get("mobile_no").toString().replace("-", "");
			map.put("mobile_no", mno );
			putDataMap("mobile_no", mno);
		}
		
		userDao.editUser(map);

		return "editUser_success";
	}

	/**
	 * 사용자 삭제
	 * 
	 * @return
	 * @throws Exception
	 */
	public String delUser() throws Exception {
		map = getReqMap();

		userDao.delUser(map);

		return "delUser_success";
	}

	public void userIdChk() throws Exception {
		PrintWriter printWriter = null;
		
		try {
			ServletActionContext.getResponse().setContentType("text/html;charset=utf-8");
			printWriter = ServletActionContext.getResponse().getWriter();

			if (userDao.userIdChk(getReqMap()) == 0) {
				printWriter.print("<font color='blue'>사용할 수 있는 사용자ID 값 입니다.</font>");
			} else {
				printWriter.print("<font color='red'>이미 존재하는 사용자ID 값 입니다.</font>");
			}
		} catch (Exception e) {
			Log4j.log.error("userIdChkGatherData:", e);
		} finally {
			printWriter.close();
		}
	}

	public String userHotLineChk() throws Exception
	{
		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
		map = getReqMap();
		
        int hotLineCnt = userDao.hotLineUserChk(map);
		
		
        putDataMap("hotLineCnt", hotLineCnt);
        
		return "userHotLineChk";
	}
	
	/**
	 * 사용자 그룹 리스트
	 * 
	 * @return
	 * @throws Exception
	 */
	public String listUserGroup() throws Exception
	{
		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
		map = getReqMap();
		
		if( map.get("p_reg_dt") != null )
		{
			putDataMap("p_reg_dt", "");
		}
		
		int resultCount = userDao.userGroupCount(map);
		
		// 그룹 셀렉터
		putDataMap("group_list", commonDao.getGroupID(map));
		// 사용등급 셀렉터
		putDataMap("usedclass_list", commonDao.getUsedClassCd(map));
		
		
		putDataMap("resultCount", resultCount);
		putDataMap("listUserGroup", userDao.listUserGroup(getPaging(resultCount)));
		
		return "listUserGroup";
	}
	
	/**
	 * 사용자 그룹 신규저장 팝업 화면
	 * 
	 * @return
	 * @throws Exception
	 */
	public String viewAddUserGroup() throws Exception
	{
		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
		map = getReqMap();
		
		return "viewAddUserGroup";
	}
	
	/**
	 * 사용자 그룹 신규저장
	 * 
	 * @return
	 * @throws Exception
	 */
	public String addUserGroup() throws Exception
	{
		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
		map = getReqMap();
		
	    if ( map.get("group_id") != null )
	    {
	    	int lenVal = map.get("group_id").toString().length();
	    	if( lenVal > 11 )
	    	{
	    		putDataMap("errorMsg", "아이디가 10자 이상 넘을수  없습니다.");
				return "addUserGroup_error";
	    	}
	    }
		
		if(userDao.groupIdChk(map) > 0){
			putDataMap("errorMsg", "이미 사용중인 사용자ID입니다.");
			return "addUserGroup_error";
		}
		
		userDao.addUserGroup(map);
		
		return "addUserGroup";
	}
	
	
	public void groupIdChk() throws Exception {
		PrintWriter printWriter = null;
		
		try {
			ServletActionContext.getResponse().setContentType("text/html;charset=utf-8");
			printWriter = ServletActionContext.getResponse().getWriter();

			if (userDao.groupIdChk(getReqMap()) == 0) {
				printWriter.print("<font size='1' color='blue'>사용할 수 있는 사용자 GROUP ID 값 입니다.</font>");
			} else {
				printWriter.print("<font size='1' color='red'>이미 존재하는 사용자 GROUP ID 값 입니다.</font>");
			}
		} catch (Exception e) {
			Log4j.log.error("userIdChkGatherData:", e);
		} finally {
			printWriter.close();
		}
	}
	
	/**
	 * 사용자 그룹 삭제
	 * 
	 * @return
	 * @throws Exception
	 */
	public String delUserGroup() throws Exception{
		
		map = getReqMap();
		
		/*
		 * 사용하고 유저가 있는지 알아본다.
		 */
		
		if( userDao.groupIdChildChk(map) > 1 )
		{
			putDataMap("errorMsg", "사용중인 USER가 존재 합니다.\n삭제할수 없습니다.");
			return "addUserGroup_error";
		}
		
		userDao.delUserGroup(map);
		
		return "delUserGroup_success";
	}
	
	/**
	 * 사용자 그룹 상세보기 팝업
	 * 
	 * @return
	 * @throws Exception
	 */
	public String detailUserGroup() throws Exception{
		
		map = getReqMap();
		
		putDataMap("detUserGroup", userDao.detailUserGroup(map));
		
		return "detailUserGroup";
	}
	
	/**
	 * 사용자 그룹 수정  팝업
	 * 
	 * @return
	 * @throws Exception
	 */
	public String editViewUserGroup() throws Exception{
		
		map = getReqMap();
		putDataMap("editUserGroup", userDao.detailUserGroup(map));
		return "editViewUserGroup";
	}
	
	/**
	 * 사용자 그룹 수정 저장 팝업
	 * 
	 * @return
	 * @throws Exception
	 */
	public String editUserGroup() throws Exception{
		
		map = getReqMap();
		
		userDao.editUserGroup(map);
		
		return "editUserGroup";
	}
	
	/**
	 * 사용자 password 수정 팝업
	 * 
	 * @return
	 * @throws Exception
	 */
	public String editPassWordView() throws Exception{
		
		map = getReqMap();
		
//		String viewPassW =  userDao.userPasswOrd(map);//기존password(암호화된거)
		
//		putDataMap("viewPassW", viewPassW);
		
		return "editPassWordView";
	}
	
	public String editPassWord() throws Exception{
		
		getReqMap().put("user_id", ServletActionContext.getRequest().getSession().getAttribute("USER_ID"));
		map = getReqMap();
		
		if( map.get("pass_old") == null || map.get("pass_old") == "" )
		{
			putDataMap("errorMsg", "기존 Password가 존재 하지 않습니다.");
			return "passold_error";
		}
		
		if( map.get("pass_new") == null || map.get("pass_new") == "" )
		{
			putDataMap("errorMsg", "수정하려는 Password가가 없습니다.");
			return "passnew_error";
		}
		else if( map.get("pass_cfm") == null || map.get("pass_cfm") == "" )
		{
			putDataMap("errorMsg", "확인 PASSWORD가 없습니다.");
			return "passcfm_error";
		}
		else
		{
			if( ! map.get("pass_cfm").toString().equals(map.get("pass_new").toString()) )
			{
				putDataMap("errorMsg", "PASSWORD가 상이합니다.");
				return "pass_error";
			}
		}
		
		
		
		String passW = "";
		if( map.get("pass_cfm") != null )
		{
			passW = StringUtils.cha1Security(map.get("pass_cfm").toString());
			map.put("password", passW);
		}
		
		userDao.updatePassword(map);
		
		return "editPassWord";
	}
	
	public void passwordCdChk() throws Exception {
		PrintWriter printWriter = null;
		
		try {
			ServletActionContext.getResponse().setContentType("text/html;charset=utf-8");
			printWriter = ServletActionContext.getResponse().getWriter();
			
			getReqMap().put("user_id", ServletActionContext.getRequest().getSession().getAttribute("USER_ID"));
			map = getReqMap();
			
			String chkSecu = StringUtils.cha1Security(map.get("password").toString());
			map.put("password", chkSecu);
			
			if (userDao.userPasswOrd(map) == 1) {
				printWriter.print("<font size='1' color='blue'>Password 확인 완료</font>");
			} else {
				printWriter.print("<font size='1' color='red'>Password가 틀립니다.</font>");
			}
		} catch (Exception e) {
			Log4j.log.error("userIdChkGatherData:", e);
		} finally {
			printWriter.close();
		}
	}
}
