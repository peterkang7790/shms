/*
 * staccsDao.java
 * @author 김종범
 * @version 1.0 
 * @Date 2010. 02. 08.
 * Copyright (c) 2010 BY LSWARE INC. All rights reserved.
 */

package shms.dao.admin;

import java.util.List;
import java.util.Map;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

public class staccsDao {

	private SqlMapClientTemplate sqlMapClientTemplate;

	public void setSqlMapClientTemplate(SqlMapClientTemplate sqlMapClientTemplate) {
		this.sqlMapClientTemplate = sqlMapClientTemplate;
	}

	// 구조물별 접근권한 리스트
	public List listStaccsUser(Map map) {
		return sqlMapClientTemplate.queryForList("listStaccsUserSql", map);
	}

	// 구조물별 접근권한  리스트
	public List listStaccsStruct(Map map) {
		return sqlMapClientTemplate.queryForList("listStaccsStructSql", map);
	}

	// 구조물별 접근권한 등록
	public void addStaccs(Map map) {
		sqlMapClientTemplate.insert("addStaccsSql", map);
	}

	// 구조물별 접근권한 삭제
	public void delStaccs(Map map) {
		sqlMapClientTemplate.delete("delStaccsSql", map);
	}

}
