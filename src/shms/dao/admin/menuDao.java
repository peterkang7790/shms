/*
 * menuDao.java
 * @author 김종범
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

	// 메뉴 리스트
	public List listMenu(Map map) {
		return sqlMapClientTemplate.queryForList("listMenuSql", map);
	}

	// 메뉴 리스트 건수
	public int countListMenu(Map map) {
		return (Integer) sqlMapClientTemplate.queryForObject("countListMenuSql", map);
	}

	// 메뉴 상세조회
	public Object detailMenu(Map map) {
		return sqlMapClientTemplate.queryForObject("detailMenuSql", map);
	}

	// 메뉴 등록
	public void addMenu(Map map) {
		sqlMapClientTemplate.insert("addMenuSql", map);
	}

	// 메뉴 수정 (조회)
	public Object viewEditMenu(Map map) {
		return sqlMapClientTemplate.queryForObject("viewMenuSql", map);
	}

	// 메뉴 수정
	public void editMenu(Map map) {
		sqlMapClientTemplate.update("editMenuSql", map);
	}

	// 메뉴 삭제
	public void delMenu(Map map) {
		sqlMapClientTemplate.delete("delMenuSql", map);
	}

	// 메뉴 ID Check
	public int menuIdChk(Map map){
		return (Integer)sqlMapClientTemplate.queryForObject("menuIdChk", map);
	}

}
