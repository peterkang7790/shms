/*
 * smsHistDao.java
 * @author 김종범
 * @version 1.0 
 * @Date 2010. 02. 24.
 * Copyright (c) 2010 BY LSWARE INC. All rights reserved.
 */

package shms.dao.alarmManage;

import java.util.List;
import java.util.Map;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

public class smsHistDao {

	private SqlMapClientTemplate sqlMapClientTemplate;

	public void setSqlMapClientTemplate(SqlMapClientTemplate sqlMapClientTemplate) {
		this.sqlMapClientTemplate = sqlMapClientTemplate;
	}

	// 경보 리스트
	public List almSMSHistTrouble(Map map) {
		return sqlMapClientTemplate.queryForList("almSMSHistTroubleSql", map);
	}

	// 경보 리스트 건수
	public int countAlmSMSHistTrouble(Map map) {
		return (Integer) sqlMapClientTemplate.queryForObject("countAlmSMSHistTroubleSql", map);
	}

	// SMS발송이력 리스트
	public List almSMSHistAction(Map map) {
		return sqlMapClientTemplate.queryForList("almSMSHistActionSql", map);
	}

	// SMS발송이력 리스트 건수
	public int countAlmSMSHistAction(Map map) {
		return (Integer) sqlMapClientTemplate.queryForObject("countAlmSMSHistActionSql", map);
	}

	
}
