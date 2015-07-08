/*
 * userDao.java
 * @author 김종범
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

	// 사용자 리스트
	public List listUser(Map map) {
		return sqlMapClientTemplate.queryForList("listUserSql", map);
	}

	// 사용자 리스트 건수
	public int countListUser(Map map) {
		return (Integer) sqlMapClientTemplate.queryForObject("countListUserSql", map);
	}

	// 사용자 리스트_1
	public List listUser_1(Map map) {
		return sqlMapClientTemplate.queryForList("listUserSql_1", map);
	}

	// 사용자 리스트 건수_1
	public int countListUser_1(Map map) {
		return (Integer) sqlMapClientTemplate.queryForObject("countListUserSql_1", map);
	}
	
	// 사용자 상세조회
	public Object detailUser(Map map) {
		
     	 
		Map deUs = (Map)sqlMapClientTemplate.queryForObject("detailUserSql", map);
		
		String viosde = deUs.get("password").toString();
		String password = "";
		
		int vios = viosde.length();
		
		for( int i=0; i<vios && i< 4; i++ )
		{
			password += "●";
		}
		
		deUs.put("password", password);
		
		return deUs;
	}

	// 사용자 등록
	public void addUser(Map map) {
		sqlMapClientTemplate.insert("addUserSql", map);
	}
	
	// 사용자 등록 ACCESS등록
	public void addUserForAccess(Map map) {
		sqlMapClientTemplate.insert("addUserforStructAccessSql", map);
	}

	// 사용자 수정 (조회)
	public Object viewEditUser(Map map) {
		
		Map deUs = (Map)sqlMapClientTemplate.queryForObject("viewUserSql", map);
		
		String viosde = deUs.get("password").toString();
		String password = "";
		
		int vios = viosde.length();
		
		for( int i=0; i<vios && i< 4; i++ )
		{
			password += "●";
		}
		
		deUs.put("password", password);
		
		return deUs;
	}

	// 사용자 수정
	public void editUser(Map map) {
		sqlMapClientTemplate.update("editUserSql", map);
	}

	// 사용자 삭제
	public void delUser(Map map) {
		sqlMapClientTemplate.delete("delUserSql", map);
	}

	// 사용자 ID Check
	public int userIdChk(Map map){
		return (Integer)sqlMapClientTemplate.queryForObject("userIdChk", map);
	}

	// 사용자 ID Check
	public int hotLineUserChk(Map map){
		return (Integer)sqlMapClientTemplate.queryForObject("hotLineUserSql", map);
	}
	
	// 사용자 그룹 카운트
	public int userGroupCount(Map map){
		return (Integer)sqlMapClientTemplate.queryForObject("countListUserGroup", map);
	}
	
	// 사용자 그룹 리스트
	public List listUserGroup(Map map) {
		return sqlMapClientTemplate.queryForList("listUserGroupSql", map);
	}
	
	// 사용자 ID Check
	public int groupIdChk(Map map){
		return (Integer)sqlMapClientTemplate.queryForObject("groupIdChk", map);
	}
	
	// 사용자 GROUP INSERT
	public void addUserGroup(Map map) {
		sqlMapClientTemplate.insert("addUserGroupSql", map);
	}
	
	// 사용자 GROUP ID CHILD Check
	public int groupIdChildChk(Map map){
		return (Integer)sqlMapClientTemplate.queryForObject("groupIdChildChk", map);
	}
	
	// 사용자  GROUP삭제
	public void delUserGroup(Map map) {
		sqlMapClientTemplate.delete("delUserGroup", map);
	}
	
	// 사용자  GROUP 상세보기
	public Object detailUserGroup(Map map) {
		return sqlMapClientTemplate.queryForObject("detailUserGroupSql", map);
	}
	
	// 사용자 그룹 수정
	public void editUserGroup(Map map) {
		sqlMapClientTemplate.update("editUserGroupSql", map);
	}
	
	
	// 사용자  password 
	public int userPasswOrd(Map map) {
		return (Integer)sqlMapClientTemplate.queryForObject("listUserpassWSql", map);
	}
	
	// 사용자 수정
	public void updatePassword(Map map) {
		sqlMapClientTemplate.update("passWordUpSql", map);
	}
	
	// 사용자  password 가져오기 
	public String getUserPasswOrd(Map map) {
		return (String)sqlMapClientTemplate.queryForObject("getUserpassWSql", map);
	}
	
	//최초 로그인 구조물등록
	public List getUserSartStr(Map map){
		return sqlMapClientTemplate.queryForList("startUserStruct",map);
	}
    
}
