/*
 * smsRecvDao.java
 * @author ������
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

	// SMS�뺸�� (����) ����Ʈ
	public List listSMSRecvSensor(Map map) {
		return sqlMapClientTemplate.queryForList("listSMSRecvSensorSql", map);
	}

	// SMS�뺸�� (�����) ����Ʈ
//	public List listSMSRecvUser(Map map) {
//		return sqlMapClientTemplate.queryForList("listSMSRecvUserSql", map);
//	}

	// SMS�뺸�� ���
	public void addSMSRecv(Map map) {
		sqlMapClientTemplate.insert("addSMSRecvSql", map);
	}

	// SMS�뺸�� ����
	public void delSMSRecv(Map map) {
		sqlMapClientTemplate.delete("delSMSRecvSql", map);
	}

}
