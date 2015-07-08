/*
 * rptRtStatDao.java
 * @author 김종범
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

	// 센서이미지 표시
	public List sensorImage(Map map) {
		return sqlMapClientTemplate.queryForList("sensorImageSql", map);
	}

	// 센서위치 표시
	public List sensorPos(Map map) {
		return sqlMapClientTemplate.queryForList("sensorPosSql", map);
	}
	
	// 센서위치 표시
	public Object sensorPosObj(Map map) {
		return sqlMapClientTemplate.queryForObject("sensorPosSql", map);
	}
	
	// 센서정보
	public Object sensor(Map map) {
		return sqlMapClientTemplate.queryForObject("sensorSql", map);
	}

	// 그래프 표시
	public List graph(Map map) {
		return sqlMapClientTemplate.queryForList("graphSql", map);
	}

	/*
	 * 다중그래프  : 구조물의 센서 목록
	 */
	public Object sensorsList(Map map) {
		return sqlMapClientTemplate.queryForList("sensorsListSql", map);
	}

	/*
	 * 다중그래프 : 센서 그래프 값 조회
	 */
	public Object sensorsGraph(Map map) {
		return sqlMapClientTemplate.queryForList("sensorsGraphSql", map);
	}
	
	//5분 쿼리
	public List get5minSql(Map map) {
		return sqlMapClientTemplate.queryForList("5minSql", map);
	}
	
	//시.일.월 쿼리
	public List gethdmSql(Map map) {
		return sqlMapClientTemplate.queryForList("hdmSql", map);
	}
	
}
