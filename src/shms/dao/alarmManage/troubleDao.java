/*
 * troubleDao.java
 * @author ������
 * @version 1.0 
 * @Date 2010. 02. 12.
 * Copyright (c) 2010 BY LSWARE INC. All rights reserved.
 */

package shms.dao.alarmManage;

import java.util.List;
import java.util.Map;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

public class troubleDao {

	private SqlMapClientTemplate sqlMapClientTemplate;

	public void setSqlMapClientTemplate(SqlMapClientTemplate sqlMapClientTemplate) {
		this.sqlMapClientTemplate = sqlMapClientTemplate;
	}

	// ��� ����Ʈ
	public List listTrouble(Map map) {
		return sqlMapClientTemplate.queryForList("listTroubleSql", map);
	}

	// ��� ����Ʈ �Ǽ�
	public int countListTrouble(Map map) {
		return (Integer) sqlMapClientTemplate.queryForObject("countListTroubleSql", map);
	}

	// ��� ����ȸ
	public Object detailTrouble(Map map) {
		return sqlMapClientTemplate.queryForObject("detailTroubleSql", map);
	}

	// ��� ����
	public void editTrouble(Map map) {
		sqlMapClientTemplate.update("editTroubleSql", map);
	}
	
	/**
	 * PPP ��ġ�� �����͸� ����Ѵ�.
	 * @param 
	 * @return
	 */
	public List getUserSelector(){
		return sqlMapClientTemplate.queryForList("user_id_list");
	}
}
