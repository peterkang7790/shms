/*
 * accessDao.java
 * @author 김종범
 * @version 1.0 
 * @Date 2010. 02. 06.
 * Copyright (c) 2010 BY LSWARE INC. All rights reserved.
 */

package shms.dao.admin;

import java.util.List;
import java.util.Map;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

public class accessDao {

	private SqlMapClientTemplate sqlMapClientTemplate;

	public void setSqlMapClientTemplate(SqlMapClientTemplate sqlMapClientTemplate) {
		this.sqlMapClientTemplate = sqlMapClientTemplate;
	}

	// 접근권한 (사용자) 리스트
	public List listAccessUser(Map map) {
		return sqlMapClientTemplate.queryForList("listAccessUserSql", map);
	}

	// 접근권한 (메뉴별 접근권한) 리스트
	public List listAccessMenu(Map map) {
		return sqlMapClientTemplate.queryForList("listAccessMenuSql", map);
	}

	// 접근권한 등록
	public void addAccess(Map map) {
		sqlMapClientTemplate.insert("addAccessSql", map);
	}

	// 접근권한 삭제
	public void delAccess(Map map) {
		sqlMapClientTemplate.delete("delAccessSql", map);
	}

}
