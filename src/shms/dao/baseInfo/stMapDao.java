/*
 * stMapDao.java
 * @author ±èÁ¾¹ü
 * @version 1.0 
 * @Date 2010. 02. 23.
 * Copyright (c) 2010 BY LSWARE INC. All rights reserved.
 */

package shms.dao.baseInfo;

import java.util.List;
import java.util.Map;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

public class stMapDao {

	private SqlMapClientTemplate sqlMapClientTemplate;

	public void setSqlMapClientTemplate(SqlMapClientTemplate sqlMapClientTemplate) {
		this.sqlMapClientTemplate = sqlMapClientTemplate;
	}

	public List getListStMap(Map map) {
		return sqlMapClientTemplate.queryForList("listStMapSql", map);
	}

	public Object getDetailStMapDetector(Map map) {
		return sqlMapClientTemplate.queryForObject("detailStMapDetectorSql", map);
	}

	public Object getDetailStMapChannel(Map map) {
		return sqlMapClientTemplate.queryForObject("detailStMapChannelSql", map);
	}

	public Object getDetailStMapSensor(Map map) {
		return sqlMapClientTemplate.queryForObject("detailStMapSensorSql", map);
	}
}
