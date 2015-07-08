/*
 * smsHistDao.java
 * @author ������
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

	// �溸 ����Ʈ
	public List almSMSHistTrouble(Map map) {
		return sqlMapClientTemplate.queryForList("almSMSHistTroubleSql", map);
	}

	// �溸 ����Ʈ �Ǽ�
	public int countAlmSMSHistTrouble(Map map) {
		return (Integer) sqlMapClientTemplate.queryForObject("countAlmSMSHistTroubleSql", map);
	}

	// SMS�߼��̷� ����Ʈ
	public List almSMSHistAction(Map map) {
		return sqlMapClientTemplate.queryForList("almSMSHistActionSql", map);
	}

	// SMS�߼��̷� ����Ʈ �Ǽ�
	public int countAlmSMSHistAction(Map map) {
		return (Integer) sqlMapClientTemplate.queryForObject("countAlmSMSHistActionSql", map);
	}

	
}
