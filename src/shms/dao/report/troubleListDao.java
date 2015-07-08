/*
 * troubleListDao.java
 * @author 김종범
 * @version 1.0 
 * @Date 2010. 02. 25.
 * Copyright (c) 2010 BY LSWARE INC. All rights reserved.
 */

package shms.dao.report;

import java.util.List;
import java.util.Map;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

public class troubleListDao {

	private SqlMapClientTemplate sqlMapClientTemplate;

	public void setSqlMapClientTemplate(SqlMapClientTemplate sqlMapClientTemplate) {
		this.sqlMapClientTemplate = sqlMapClientTemplate;
	}

	// 경보 리스트
	public List rptTroubleList(Map map) {
		return sqlMapClientTemplate.queryForList("rptTroubleListSql", map);
	}

	// 경보 리스트 건수
	public int countRptTroubleList(Map map) {
		return (Integer) sqlMapClientTemplate.queryForObject("countRptTroubleListSql", map);
	}

	// 조치 상세보기
	public Object rptTroubleList_Detail(Map map) {
		return sqlMapClientTemplate.queryForObject("rptTroubleList_DetailSql", map);
	}

}
