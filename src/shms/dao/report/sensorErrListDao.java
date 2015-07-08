/*
 * sensorErrListDao.java
 * @author 김종범
 * @version 1.0 
 * @Date 2010. 02. 26.
 * Copyright (c) 2010 BY LSWARE INC. All rights reserved.
 */

package shms.dao.report;

import java.util.List;
import java.util.Map;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

public class sensorErrListDao {

	private SqlMapClientTemplate sqlMapClientTemplate;

	public void setSqlMapClientTemplate(SqlMapClientTemplate sqlMapClientTemplate) {
		this.sqlMapClientTemplate = sqlMapClientTemplate;
	}

	// 장애 리스트
	public List rptSensorErrList(Map map) {
		return sqlMapClientTemplate.queryForList("rptSensorErrListSql", map);
	}

	// 장애 리스트 건수
	public int countRptSensorErrList(Map map) {
		return (Integer) sqlMapClientTemplate.queryForObject("countRptSensorErrListSql", map);
	}

	// 장애 상세보기
	public Object rptSensorErrList_Detail(Map map) {
		return sqlMapClientTemplate.queryForObject("rptErrList_DetailSql", map);
	}
}
