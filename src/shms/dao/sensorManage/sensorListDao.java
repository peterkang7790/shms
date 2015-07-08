/*
 * sensorListDao.java
 * @author ������
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

	// ���� ����Ʈ
	public List senSensorList_Sensor(Map map) {
		return sqlMapClientTemplate.queryForList("senSensorList_SensorSql", map);
	}

	// ���� ����Ʈ �Ǽ�
	public int countSenSensorList_Sensor(Map map) {
		return (Integer) sqlMapClientTemplate.queryForObject("countSenSensorList_SensorSql", map);
	}

	// ���� �󼼺���
	public Object senSensorList_Detail(Map map) {
		return sqlMapClientTemplate.queryForObject("senSensorList_DetailSql", map);
	}

	// ����(�������)����Ʈ
	public List senSensorList_SubMain(Map map) {
		return sqlMapClientTemplate.queryForList("senSensorTrouble_SubMainSql", map);
	}
	
	// ����(�������)  ����Ʈ �Ǽ�
	public int countsenSensorList_SubMain(Map map) {
		return (Integer) sqlMapClientTemplate.queryForObject("countSenSensorTrouble_SubMainSql", map);
	}
	
	// ��ġ���� ����Ʈ
	public List troubleCancel_SubMain(Map map) {
		return sqlMapClientTemplate.queryForList("troubleCancel_SubMainSql", map);
	}
	
	// ��ġ����  ����Ʈ �Ǽ�
	public int counttroubleCancel_Sensor(Map map) {
		return (Integer) sqlMapClientTemplate.queryForObject("countTroubleCancel_SensorSql", map);
	}
	
	//  DTREE
	public List getSensorTree(Map map){
		return sqlMapClientTemplate.queryForList("listSensorTree",map);
	}
	
	// ��ú��� ����/���/��ġ/����ġ �����ֱ�
	public Object dashboardList_Detail(Map map) {
		return sqlMapClientTemplate.queryForObject("countDASHBORDTroubleSql", map);
	}
}
