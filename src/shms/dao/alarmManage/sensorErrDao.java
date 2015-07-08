/*
 * sensorErrDao.java
 * @author ������
 * @version 1.0 
 * @Date 2010. 03. 05.
 * Copyright (c) 2010 BY LSWARE INC. All rights reserved.
 */

package shms.dao.alarmManage;

import java.util.List;
import java.util.Map;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

public class sensorErrDao {

	private SqlMapClientTemplate sqlMapClientTemplate;

	public void setSqlMapClientTemplate(SqlMapClientTemplate sqlMapClientTemplate) {
		this.sqlMapClientTemplate = sqlMapClientTemplate;
	}

	// ��� ����Ʈ
	public List listSensorErr(Map map) {
		return sqlMapClientTemplate.queryForList("listSensorErrSql", map);
	}

	// ��� ����Ʈ �Ǽ�
	public int countListSensorErr(Map map) {
		return (Integer) sqlMapClientTemplate.queryForObject("countListSensorErrSql", map);
	}

	// ��� ����ȸ
	public Object detailSensorErr(Map map) {
		return sqlMapClientTemplate.queryForObject("detailSensorErrSql", map);
	}

	// ��� ����
	public void editSensorErr(Map map) {
		sqlMapClientTemplate.update("editSensorErrSql", map);
	}
	
}
