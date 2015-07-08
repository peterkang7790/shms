/*
 * userAction.java
 * @author ������
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
	 * ����� ����Ʈ
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

		// �׷� ������
		putDataMap("group_list", commonDao.getGroupID(map));
		// ����� ������
		putDataMap("usedclass_list", commonDao.getUsedClassCd(map));

		putDataMap("resultCount", resultCount);
		putDataMap("rsListUser", userDao.listUser(getPaging(resultCount)));

		
		
		return "listUser_success";
	}
	
	

	/**
	 * ����� �󼼺���
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
	 * ����� ��� (��ȸ)
	 * 
	 * @return
	 * @throws Exception
	 */
	public String viewAddUser() throws Exception {
		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
		map = getReqMap();

		// �׷� ������
		putDataMap("group_list", commonDao.getGroupID(map));
		// ����� ������
		putDataMap("usedclass_list", commonDao.getUsedClassCd(map));
		// SMS���ſ��� ������
		putDataMap("sms_recv_yn_list", commonDao.getYN(map));
		
		// Y/N ������
		putDataMap("yn_list", commonDao.getYN(map));
		
		int hotLineCnt = userDao.hotLineUserChk(map);
		
		putDataMap("hotcnt", String.valueOf( hotLineCnt ) );

		return "viewAddUser_success";
	}

	/**
	 * ����� ���
	 * 
	 * @return
	 * @throws Exception
	 */
	public String addUser() throws Exception {
		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
		map = getReqMap();

		map.put("last_struct_id", map.get("struct_id"));
		
		
		
		
		if(userDao.userIdChk(map) > 0){
			putDataMap("errorMsg", "�̹� ������� �����ID�Դϴ�.");
			return "addUser_error";
		}
		
		if( map.get("user_id") == null || map.get("user_id") == ""  )
		{
			putDataMap("errorMsg", "���̵� �����ϼž� �մϴ�.");
			return "addUser_error";
		}
		
		if( map.get("password") == null || map.get("password") == ""  )
		{
			putDataMap("errorMsg", "�н����带 �Է��ϼž� �մϴ�.");
			return "addUser_error";
		}

		int hotLineCnt = userDao.hotLineUserChk(map);
		
		if( hotLineCnt > 2 )
		{
			putDataMap("errorMsg", "Hot Line�� 2�� ���� ���� �����մϴ�. ����(2�� �Ϸ�)");
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
					putDataMap("errorMsg", "HotLine�� Y���� �Ͻø� ����ó�� �ݵ�� �ԷµǾ�� �մϴ�.");
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
	 * ����� ���� (��ȸ)
	 * 
	 * @return
	 * @throws Exception
	 */
	public String viewEditUser() throws Exception {
		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
		map = getReqMap();
		
		// �׷� ������
		putDataMap("group_list", commonDao.getGroupID(map));
		// ����� ������
		putDataMap("usedclass_list", commonDao.getUsedClassCd(map));

		putDataMap("rsOneUser", userDao.viewEditUser(map));
		
		
		// SMS���ſ��� ������
		putDataMap("sms_recv_yn_list", commonDao.getYN(map));
		
		// Y/N ������
		putDataMap("yn_list", commonDao.getYN(map));
		
		int hotLineCnt = userDao.hotLineUserChk(map);
		
		putDataMap("hotcnt", String.valueOf( hotLineCnt ) );

		return "viewEditUser_success";
	}

	/**
	 * ����� ����
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
			putDataMap("errorMsg", "Hot Line�� 2�� ���� ���� �����մϴ�. ����(2�� �Ϸ�)");
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
	 * ����� ����
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
				printWriter.print("<font color='blue'>����� �� �ִ� �����ID �� �Դϴ�.</font>");
			} else {
				printWriter.print("<font color='red'>�̹� �����ϴ� �����ID �� �Դϴ�.</font>");
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
	 * ����� �׷� ����Ʈ
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
		
		// �׷� ������
		putDataMap("group_list", commonDao.getGroupID(map));
		// ����� ������
		putDataMap("usedclass_list", commonDao.getUsedClassCd(map));
		
		
		putDataMap("resultCount", resultCount);
		putDataMap("listUserGroup", userDao.listUserGroup(getPaging(resultCount)));
		
		return "listUserGroup";
	}
	
	/**
	 * ����� �׷� �ű����� �˾� ȭ��
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
	 * ����� �׷� �ű�����
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
	    		putDataMap("errorMsg", "���̵� 10�� �̻� ������  �����ϴ�.");
				return "addUserGroup_error";
	    	}
	    }
		
		if(userDao.groupIdChk(map) > 0){
			putDataMap("errorMsg", "�̹� ������� �����ID�Դϴ�.");
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
				printWriter.print("<font size='1' color='blue'>����� �� �ִ� ����� GROUP ID �� �Դϴ�.</font>");
			} else {
				printWriter.print("<font size='1' color='red'>�̹� �����ϴ� ����� GROUP ID �� �Դϴ�.</font>");
			}
		} catch (Exception e) {
			Log4j.log.error("userIdChkGatherData:", e);
		} finally {
			printWriter.close();
		}
	}
	
	/**
	 * ����� �׷� ����
	 * 
	 * @return
	 * @throws Exception
	 */
	public String delUserGroup() throws Exception{
		
		map = getReqMap();
		
		/*
		 * ����ϰ� ������ �ִ��� �˾ƺ���.
		 */
		
		if( userDao.groupIdChildChk(map) > 1 )
		{
			putDataMap("errorMsg", "������� USER�� ���� �մϴ�.\n�����Ҽ� �����ϴ�.");
			return "addUserGroup_error";
		}
		
		userDao.delUserGroup(map);
		
		return "delUserGroup_success";
	}
	
	/**
	 * ����� �׷� �󼼺��� �˾�
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
	 * ����� �׷� ����  �˾�
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
	 * ����� �׷� ���� ���� �˾�
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
	 * ����� password ���� �˾�
	 * 
	 * @return
	 * @throws Exception
	 */
	public String editPassWordView() throws Exception{
		
		map = getReqMap();
		
//		String viewPassW =  userDao.userPasswOrd(map);//����password(��ȣȭ�Ȱ�)
		
//		putDataMap("viewPassW", viewPassW);
		
		return "editPassWordView";
	}
	
	public String editPassWord() throws Exception{
		
		getReqMap().put("user_id", ServletActionContext.getRequest().getSession().getAttribute("USER_ID"));
		map = getReqMap();
		
		if( map.get("pass_old") == null || map.get("pass_old") == "" )
		{
			putDataMap("errorMsg", "���� Password�� ���� ���� �ʽ��ϴ�.");
			return "passold_error";
		}
		
		if( map.get("pass_new") == null || map.get("pass_new") == "" )
		{
			putDataMap("errorMsg", "�����Ϸ��� Password���� �����ϴ�.");
			return "passnew_error";
		}
		else if( map.get("pass_cfm") == null || map.get("pass_cfm") == "" )
		{
			putDataMap("errorMsg", "Ȯ�� PASSWORD�� �����ϴ�.");
			return "passcfm_error";
		}
		else
		{
			if( ! map.get("pass_cfm").toString().equals(map.get("pass_new").toString()) )
			{
				putDataMap("errorMsg", "PASSWORD�� �����մϴ�.");
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
				printWriter.print("<font size='1' color='blue'>Password Ȯ�� �Ϸ�</font>");
			} else {
				printWriter.print("<font size='1' color='red'>Password�� Ʋ���ϴ�.</font>");
			}
		} catch (Exception e) {
			Log4j.log.error("userIdChkGatherData:", e);
		} finally {
			printWriter.close();
		}
	}
}
