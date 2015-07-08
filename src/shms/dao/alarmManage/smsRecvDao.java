/*
 * smsRecvDao.java
 * @author 김종범
 * @version 1.0 
 * @Date 2010. 02. 11.
 * Copyright (c) 2010 BY LSWARE INC. All rights reserved.
 */

package shms.dao.alarmManage;

import java.util.List;
import java.util.Map;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

public class smsRecvDao {

	private SqlMapClientTemplate sqlMapClientTemplate;

	public void setSqlMapClientTemplate(SqlMapClientTemplate sqlMapClientTemplate) {
		this.sqlMapClientTemplate = sqlMapClientTemplate;
	}

	// SMS통보자 (센서) 리스트
	public List listSMSRecvSensor(Map map) {
		return sqlMapClientTemplate.queryForList("listSMSRecvSensorSql", map);
	}

	// SMS통보자 (사용자) 리스트
//	public List listSMSRecvUser(Map map) {
//		return sqlMapClientTemplate.queryForList("listSMSRecvUserSql", map);
//	}

	// SMS통보자 등록
	public void addSMSRecv(Map map) {
		sqlMapClientTemplate.insert("addSMSRecvSql", map);
	}

	// SMS통보자 삭제
	public void delSMSRecv(Map map) {
		sqlMapClientTemplate.delete("delSMSRecvSql", map);
	}

}
