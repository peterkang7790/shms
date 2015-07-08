/*
 * userDao.java
 * @author ������
 * @version 1.0 
 * @Date 2010. 02. 05.
 * Copyright (c) 2010 BY LSWARE INC. All rights reserved.
 */

package shms.dao.admin;

import java.util.List;
import java.util.Map;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import com.lsware.utils.StringUtils;

public class userDao {

	private SqlMapClientTemplate sqlMapClientTemplate;

	public void setSqlMapClientTemplate(SqlMapClientTemplate sqlMapClientTemplate) {
		this.sqlMapClientTemplate = sqlMapClientTemplate;
	}

	// ����� ����Ʈ
	public List listUser(Map map) {
		return sqlMapClientTemplate.queryForList("listUserSql", map);
	}

	// ����� ����Ʈ �Ǽ�
	public int countListUser(Map map) {
		return (Integer) sqlMapClientTemplate.queryForObject("countListUserSql", map);
	}

	// ����� ����Ʈ_1
	public List listUser_1(Map map) {
		return sqlMapClientTemplate.queryForList("listUserSql_1", map);
	}

	// ����� ����Ʈ �Ǽ�_1
	public int countListUser_1(Map map) {
		return (Integer) sqlMapClientTemplate.queryForObject("countListUserSql_1", map);
	}
	
	// ����� ����ȸ
	public Object detailUser(Map map) {
		
     	 
		Map deUs = (Map)sqlMapClientTemplate.queryForObject("detailUserSql", map);
		
		String viosde = deUs.get("password").toString();
		String password = "";
		
		int vios = viosde.length();
		
		for( int i=0; i<vios && i< 4; i++ )
		{
			password += "��";
		}
		
		deUs.put("password", password);
		
		return deUs;
	}

	// ����� ���
	public void addUser(Map map) {
		sqlMapClientTemplate.insert("addUserSql", map);
	}
	
	// ����� ��� ACCESS���
	public void addUserForAccess(Map map) {
		sqlMapClientTemplate.insert("addUserforStructAccessSql", map);
	}

	// ����� ���� (��ȸ)
	public Object viewEditUser(Map map) {
		
		Map deUs = (Map)sqlMapClientTemplate.queryForObject("viewUserSql", map);
		
		String viosde = deUs.get("password").toString();
		String password = "";
		
		int vios = viosde.length();
		
		for( int i=0; i<vios && i< 4; i++ )
		{
			password += "��";
		}
		
		deUs.put("password", password);
		
		return deUs;
	}

	// ����� ����
	public void editUser(Map map) {
		sqlMapClientTemplate.update("editUserSql", map);
	}

	// ����� ����
	public void delUser(Map map) {
		sqlMapClientTemplate.delete("delUserSql", map);
	}

	// ����� ID Check
	public int userIdChk(Map map){
		return (Integer)sqlMapClientTemplate.queryForObject("userIdChk", map);
	}

	// ����� ID Check
	public int hotLineUserChk(Map map){
		return (Integer)sqlMapClientTemplate.queryForObject("hotLineUserSql", map);
	}
	
	// ����� �׷� ī��Ʈ
	public int userGroupCount(Map map){
		return (Integer)sqlMapClientTemplate.queryForObject("countListUserGroup", map);
	}
	
	// ����� �׷� ����Ʈ
	public List listUserGroup(Map map) {
		return sqlMapClientTemplate.queryForList("listUserGroupSql", map);
	}
	
	// ����� ID Check
	public int groupIdChk(Map map){
		return (Integer)sqlMapClientTemplate.queryForObject("groupIdChk", map);
	}
	
	// ����� GROUP INSERT
	public void addUserGroup(Map map) {
		sqlMapClientTemplate.insert("addUserGroupSql", map);
	}
	
	// ����� GROUP ID CHILD Check
	public int groupIdChildChk(Map map){
		return (Integer)sqlMapClientTemplate.queryForObject("groupIdChildChk", map);
	}
	
	// �����  GROUP����
	public void delUserGroup(Map map) {
		sqlMapClientTemplate.delete("delUserGroup", map);
	}
	
	// �����  GROUP �󼼺���
	public Object detailUserGroup(Map map) {
		return sqlMapClientTemplate.queryForObject("detailUserGroupSql", map);
	}
	
	// ����� �׷� ����
	public void editUserGroup(Map map) {
		sqlMapClientTemplate.update("editUserGroupSql", map);
	}
	
	
	// �����  password 
	public int userPasswOrd(Map map) {
		return (Integer)sqlMapClientTemplate.queryForObject("listUserpassWSql", map);
	}
	
	// ����� ����
	public void updatePassword(Map map) {
		sqlMapClientTemplate.update("passWordUpSql", map);
	}
	
	// �����  password �������� 
	public String getUserPasswOrd(Map map) {
		return (String)sqlMapClientTemplate.queryForObject("getUserpassWSql", map);
	}
	
	//���� �α��� ���������
	public List getUserSartStr(Map map){
		return sqlMapClientTemplate.queryForList("startUserStruct",map);
	}
    
}
