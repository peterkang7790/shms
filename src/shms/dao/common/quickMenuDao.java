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

public class quickMenuDao {

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
	public String getQuickMenuSeq(Map map){
		return (String)sqlMapClientTemplate.queryForObject("quickmenuSql",map);
	}

	public List getQuickMenuHotLineSeq(Map map){
		return sqlMapClientTemplate.queryForList("hotlineSql",map);
	}
	
	/*
	 * ���� ���� ������ ������ �̿��� ������ ����Ʈ
	 */
	public Object getOtherStructSeq(Map map){
		return sqlMapClientTemplate.queryForList("otherStructPopSql",map);
	}
	
	
}
