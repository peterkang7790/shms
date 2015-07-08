/*
 * sensorListDao.java
 * @author 김종범
 * @version 1.0 
 * @Date 2010. 02. 25.
 * Copyright (c) 2010 BY LSWARE INC. All rights reserved.
 */

package shms.dao.sensorManage;

import java.util.List;
import java.util.Map;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

public class sensorListDao {

	private SqlMapClientTemplate sqlMapClientTemplate;

	public void setSqlMapClientTemplate(SqlMapClientTemplate sqlMapClientTemplate) {
		this.sqlMapClientTemplate = sqlMapClientTemplate;
	}

	// 센서 리스트
	public List senSensorList_Sensor(Map map) {
		return sqlMapClientTemplate.queryForList("senSensorList_SensorSql", map);
	}

	// 센서 리스트 건수
	public int countSenSensorList_Sensor(Map map) {
		return (Integer) sqlMapClientTemplate.queryForObject("countSenSensorList_SensorSql", map);
	}

	// 센서 상세보기
	public Object senSensorList_Detail(Map map) {
		return sqlMapClientTemplate.queryForObject("senSensorList_DetailSql", map);
	}

	// 센서(서브메인)리스트
	public List senSensorList_SubMain(Map map) {
		return sqlMapClientTemplate.queryForList("senSensorTrouble_SubMainSql", map);
	}
	
	// 센서(서브메인)  리스트 건수
	public int countsenSensorList_SubMain(Map map) {
		return (Integer) sqlMapClientTemplate.queryForObject("countSenSensorTrouble_SubMainSql", map);
	}
	
	// 조치사유 리스트
	public List troubleCancel_SubMain(Map map) {
		return sqlMapClientTemplate.queryForList("troubleCancel_SubMainSql", map);
	}
	
	// 조치사유  리스트 건수
	public int counttroubleCancel_Sensor(Map map) {
		return (Integer) sqlMapClientTemplate.queryForObject("countTroubleCancel_SensorSql", map);
	}
	
	//  DTREE
	public List getSensorTree(Map map){
		return sqlMapClientTemplate.queryForList("listSensorTree",map);
	}
	
	// 대시보드 위험/경고/조치/미조치 보여주기
	public Object dashboardList_Detail(Map map) {
		return sqlMapClientTemplate.queryForObject("countDASHBORDTroubleSql", map);
	}
}
