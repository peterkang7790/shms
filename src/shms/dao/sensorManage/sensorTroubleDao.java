/*
 * sensorTroubleDao.java
 * @author 김종범
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

	// 센서 리스트
	public List senSensorTrouble_Sensor(Map map) {
		return sqlMapClientTemplate.queryForList("senSensorTrouble_SensorSql", map);
	}

	// 센서 리스트 건수
	public int countSenSensorTrouble_Sensor(Map map) {
		return (Integer) sqlMapClientTemplate.queryForObject("countSenSensorTrouble_SensorSql", map);
	}

	// 경보 리스트
	public List senSensorTrouble_Trouble(Map map) {
		return sqlMapClientTemplate.queryForList("senSensorTrouble_TroubleSql", map);
	}
	
	// 경보 리스트 건수
	public int countSenSensorTrouble_Trouble(Map map) {
		return (Integer) sqlMapClientTemplate.queryForObject("countSensorTrouble_TroubleSql", map);
	}

}
