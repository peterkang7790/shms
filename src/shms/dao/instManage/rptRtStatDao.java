/*
 * rptRtStatDao.java
 * @author ������
 * @version 1.0 
 * @Date 2010. 02. 11.
 * Copyright (c) 2010 BY LSWARE INC. All rights reserved.
 */

package shms.dao.instManage;

import java.util.List;
import java.util.Map;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

public class rptRtStatDao {

	private SqlMapClientTemplate sqlMapClientTemplate;

	public void setSqlMapClientTemplate(SqlMapClientTemplate sqlMapClientTemplate) {
		this.sqlMapClientTemplate = sqlMapClientTemplate;
	}

	// �����̹��� ǥ��
	public List sensorImage(Map map) {
		return sqlMapClientTemplate.queryForList("sensorImageSql", map);
	}

	// ������ġ ǥ��
	public List sensorPos(Map map) {
		return sqlMapClientTemplate.queryForList("sensorPosSql", map);
	}
	
	// ������ġ ǥ��
	public Object sensorPosObj(Map map) {
		return sqlMapClientTemplate.queryForObject("sensorPosSql", map);
	}
	
	// ��������
	public Object sensor(Map map) {
		return sqlMapClientTemplate.queryForObject("sensorSql", map);
	}

	// �׷��� ǥ��
	public List graph(Map map) {
		return sqlMapClientTemplate.queryForList("graphSql", map);
	}

	/*
	 * ���߱׷���  : �������� ���� ���
	 */
	public Object sensorsList(Map map) {
		return sqlMapClientTemplate.queryForList("sensorsListSql", map);
	}

	/*
	 * ���߱׷��� : ���� �׷��� �� ��ȸ
	 */
	public Object sensorsGraph(Map map) {
		return sqlMapClientTemplate.queryForList("sensorsGraphSql", map);
	}
	
	//5�� ����
	public List get5minSql(Map map) {
		return sqlMapClientTemplate.queryForList("5minSql", map);
	}
	
	//��.��.�� ����
	public List gethdmSql(Map map) {
		return sqlMapClientTemplate.queryForList("hdmSql", map);
	}
	
}
