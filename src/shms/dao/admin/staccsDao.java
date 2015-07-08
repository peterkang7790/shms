/*
 * staccsDao.java
 * @author ������
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

	// �������� ���ٱ��� ����Ʈ
	public List listStaccsUser(Map map) {
		return sqlMapClientTemplate.queryForList("listStaccsUserSql", map);
	}

	// �������� ���ٱ���  ����Ʈ
	public List listStaccsStruct(Map map) {
		return sqlMapClientTemplate.queryForList("listStaccsStructSql", map);
	}

	// �������� ���ٱ��� ���
	public void addStaccs(Map map) {
		sqlMapClientTemplate.insert("addStaccsSql", map);
	}

	// �������� ���ٱ��� ����
	public void delStaccs(Map map) {
		sqlMapClientTemplate.delete("delStaccsSql", map);
	}

}
