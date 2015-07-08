/*
 * accessDao.java
 * @author ������
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

	// ���ٱ��� (�����) ����Ʈ
	public List listAccessUser(Map map) {
		return sqlMapClientTemplate.queryForList("listAccessUserSql", map);
	}

	// ���ٱ��� (�޴��� ���ٱ���) ����Ʈ
	public List listAccessMenu(Map map) {
		return sqlMapClientTemplate.queryForList("listAccessMenuSql", map);
	}

	// ���ٱ��� ���
	public void addAccess(Map map) {
		sqlMapClientTemplate.insert("addAccessSql", map);
	}

	// ���ٱ��� ����
	public void delAccess(Map map) {
		sqlMapClientTemplate.delete("delAccessSql", map);
	}

}
