/*
 * troubleDao.java
 * @author 김종범
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

	// 장애 리스트
	public List listTrouble(Map map) {
		return sqlMapClientTemplate.queryForList("listTroubleSql", map);
	}

	// 장애 리스트 건수
	public int countListTrouble(Map map) {
		return (Integer) sqlMapClientTemplate.queryForObject("countListTroubleSql", map);
	}

	// 장애 상세조회
	public Object detailTrouble(Map map) {
		return sqlMapClientTemplate.queryForObject("detailTroubleSql", map);
	}

	// 장애 수정
	public void editTrouble(Map map) {
		sqlMapClientTemplate.update("editTroubleSql", map);
	}
	
	/**
	 * PPP 조치자 셀렉터를 출력한다.
	 * @param 
	 * @return
	 */
	public List getUserSelector(){
		return sqlMapClientTemplate.queryForList("user_id_list");
	}
}
