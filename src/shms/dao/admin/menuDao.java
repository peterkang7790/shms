/*
 * menuDao.java
 * @author ������
 * @version 1.0 
 * @Date 2010. 02. 06.
 * Copyright (c) 2010 BY LSWARE INC. All rights reserved.
 */

package shms.dao.admin;

import java.util.List;
import java.util.Map;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

public class menuDao {

	private SqlMapClientTemplate sqlMapClientTemplate;

	public void setSqlMapClientTemplate(SqlMapClientTemplate sqlMapClientTemplate) {
		this.sqlMapClientTemplate = sqlMapClientTemplate;
	}

	// �޴� ����Ʈ
	public List listMenu(Map map) {
		return sqlMapClientTemplate.queryForList("listMenuSql", map);
	}

	// �޴� ����Ʈ �Ǽ�
	public int countListMenu(Map map) {
		return (Integer) sqlMapClientTemplate.queryForObject("countListMenuSql", map);
	}

	// �޴� ����ȸ
	public Object detailMenu(Map map) {
		return sqlMapClientTemplate.queryForObject("detailMenuSql", map);
	}

	// �޴� ���
	public void addMenu(Map map) {
		sqlMapClientTemplate.insert("addMenuSql", map);
	}

	// �޴� ���� (��ȸ)
	public Object viewEditMenu(Map map) {
		return sqlMapClientTemplate.queryForObject("viewMenuSql", map);
	}

	// �޴� ����
	public void editMenu(Map map) {
		sqlMapClientTemplate.update("editMenuSql", map);
	}

	// �޴� ����
	public void delMenu(Map map) {
		sqlMapClientTemplate.delete("delMenuSql", map);
	}

	// �޴� ID Check
	public int menuIdChk(Map map){
		return (Integer)sqlMapClientTemplate.queryForObject("menuIdChk", map);
	}

}
