/*
 * leftMenuDao.java
 * @author 김종범
 * @version 1.0 
 * @Date 2010. 02. 18.
 * Copyright (c) 2010 BY LSWARE INC. All rights reserved.
 */

package shms.dao.common;

import java.util.List;
import java.util.Map;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import com.lsware.utils.DateUtils;

public class leftMenuDao {

	private SqlMapClientTemplate sqlMapClientTemplate;

	public void setSqlMapClientTemplate(SqlMapClientTemplate sqlMapClientTemplate) {
		this.sqlMapClientTemplate = sqlMapClientTemplate;
	}

	/**
	 * 사용자의 권한별 Left Menu 추출
	 * 
	 * @param
	 * @return
	 */
	public List getLeftMenu(Map map) {
		return sqlMapClientTemplate.queryForList("listLeftMenuSql", map);
	}

	/**
	 * 구조물별 Banner 추출
	 * 
	 * @param
	 * @return
	 */
	public List getBannerMenu(Map map) {
		return sqlMapClientTemplate.queryForList("listBannerMenuSql", map);
	}
	
	/**
	 * 구조물별 thumbnail 추출
	 * 
	 * @param
	 * @return
	 */
	public List getThumbnailMenu(Map map) {
		return sqlMapClientTemplate.queryForList("listThubmnailMenuSql", map);
	}
	
	/**
	 * 구조물요약정보 추출
	 * 
	 * @param
	 * @return
	 */
	public Object getStrsummMenu(Map map) {
		
		return sqlMapClientTemplate.queryForObject("listStrsummSql", map);
	}
	
	/**
	 * 구조물요약정보 추출( 건립연월과 위치만 가져옴 )
	 * 
	 * @param
	 * @return
	 */
	public Object getStrsummMenu_1(Map map) {
		
		return sqlMapClientTemplate.queryForObject("listStrsummSql_1", map);
	}
	
	/**
	 * 구조물별 센서 종류 수 추출
	 * 
	 * @param
	 * @return
	 */
	public List getStrsensorTypMenu(Map map) {
		
		return sqlMapClientTemplate.queryForList("liststrSensorTypeSql", map);
	}
	
	public int countstrSensorType(Map map) {
		return (Integer) sqlMapClientTemplate.queryForObject("countstrSensorTypeSql", map);
	}
}
