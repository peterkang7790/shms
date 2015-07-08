/*
 * sensorTroubleDao.java
 * @author ������
 * @version 1.0 
 * @Date 2010. 02. 25.
 * Copyright (c) 2010 BY LSWARE INC. All rights reserved.
 */

package shms.dao.sensorManage;

import java.util.List;
import java.util.Map;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

public class sensorTroubleDao {

	private SqlMapClientTemplate sqlMapClientTemplate;

	public void setSqlMapClientTemplate(SqlMapClientTemplate sqlMapClientTemplate) {
		this.sqlMapClientTemplate = sqlMapClientTemplate;
	}

	// ���� ����Ʈ
	public List senSensorTrouble_Sensor(Map map) {
		return sqlMapClientTemplate.queryForList("senSensorTrouble_SensorSql", map);
	}

	// ���� ����Ʈ �Ǽ�
	public int countSenSensorTrouble_Sensor(Map map) {
		return (Integer) sqlMapClientTemplate.queryForObject("countSenSensorTrouble_SensorSql", map);
	}

	// �溸 ����Ʈ
	public List senSensorTrouble_Trouble(Map map) {
		return sqlMapClientTemplate.queryForList("senSensorTrouble_TroubleSql", map);
	}
	
	// �溸 ����Ʈ �Ǽ�
	public int countSenSensorTrouble_Trouble(Map map) {
		return (Integer) sqlMapClientTemplate.queryForObject("countSensorTrouble_TroubleSql", map);
	}

}
