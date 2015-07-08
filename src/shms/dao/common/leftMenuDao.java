/*
 * leftMenuDao.java
 * @author ������
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
	 * ������� ���Ѻ� Left Menu ����
	 * 
	 * @param
	 * @return
	 */
	public List getLeftMenu(Map map) {
		return sqlMapClientTemplate.queryForList("listLeftMenuSql", map);
	}

	/**
	 * �������� Banner ����
	 * 
	 * @param
	 * @return
	 */
	public List getBannerMenu(Map map) {
		return sqlMapClientTemplate.queryForList("listBannerMenuSql", map);
	}
	
	/**
	 * �������� thumbnail ����
	 * 
	 * @param
	 * @return
	 */
	public List getThumbnailMenu(Map map) {
		return sqlMapClientTemplate.queryForList("listThubmnailMenuSql", map);
	}
	
	/**
	 * ������������� ����
	 * 
	 * @param
	 * @return
	 */
	public Object getStrsummMenu(Map map) {
		
		return sqlMapClientTemplate.queryForObject("listStrsummSql", map);
	}
	
	/**
	 * ������������� ����( �Ǹ������� ��ġ�� ������ )
	 * 
	 * @param
	 * @return
	 */
	public Object getStrsummMenu_1(Map map) {
		
		return sqlMapClientTemplate.queryForObject("listStrsummSql_1", map);
	}
	
	/**
	 * �������� ���� ���� �� ����
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
