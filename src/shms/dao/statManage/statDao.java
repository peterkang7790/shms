/*
 * rptRtStatDao.java
 * @author ������
 * @version 1.0 
 * @Date 2010. 02. 11.
 * Copyright (c) 2010 BY LSWARE INC. All rights reserved.
 */

package shms.dao.statManage;

import java.util.List;
import java.util.Map;

import org.apache.poi.util.SystemOutLogger;
import org.springframework.orm.ibatis.SqlMapClientTemplate;

public class statDao {

	private SqlMapClientTemplate sqlMapClientTemplate;

	public void setSqlMapClientTemplate(SqlMapClientTemplate sqlMapClientTemplate) {
		this.sqlMapClientTemplate = sqlMapClientTemplate;
	}

	// ��������
	public Object sensor(Map map) {
		return sqlMapClientTemplate.queryForObject("sensorStatDailySql", map);
	}
	
	// �׷��� ǥ��
	public List graph(Map map) {
		return sqlMapClientTemplate.queryForList("graphStatDailySql", map);
	}
	
	// �溸 �׷��� ǥ��
	public List chartAlarmPie3D(Map map) {
		return sqlMapClientTemplate.queryForList("chartAlarmPie3DSql", map);
	}
	
	// ��� �׷��� ǥ��
	public List chartErrPie3D(Map map) {
		return sqlMapClientTemplate.queryForList("chartErrPie3DSql", map);
	}
	
	// �Ѽ��� ���� ǥ��
	public int sensorTot(Map map) {
		return (Integer)sqlMapClientTemplate.queryForObject("totSenSql", map);
	}
	
	// ��� ����
	public int errorTot(Map map) {
		return (Integer)sqlMapClientTemplate.queryForObject("totErrSql", map);
	}
	
	// �溸 ����
	public int  alarmTot(Map map) {
		return (Integer)sqlMapClientTemplate.queryForObject("totAlarmSql", map);
	}
	
	// ����/�������׷���
	public List  markinYnTot(Map map) {
		return sqlMapClientTemplate.queryForList("totMarkingSql", map);
	}
	
	// ������Ȳ
	public List  totMarkingSql(Map map) {
		
		return sqlMapClientTemplate.queryForList("listSensorTotSql", map);
	}
	
	// ������Ȳ ����
	public int  totMarkingTotCnt(Map map) {
		return (Integer)sqlMapClientTemplate.queryForObject("countSensorTotDoing", map);
	}

	// ��ü��� ����Ʈ ī����
	public int  countStatTotal(Map map) {
		return (Integer)sqlMapClientTemplate.queryForObject("countStatTotalSql", map);
	}

	// ��ü��� ����Ʈ 
	public List  statTotal(Map map) {
		return sqlMapClientTemplate.queryForList("statTotalSql", map);
	}
	
	// �溸��ü��� ����Ʈ ī����
	public int  countStatTotal_tro(Map map) {
		return (Integer)sqlMapClientTemplate.queryForObject("countStatTotal_troSql", map);
	}

	// �溸��ü��� ����Ʈ 
	public List  statTotal_tro(Map map) {
		return sqlMapClientTemplate.queryForList("statTotal_troSql", map);
	}
	
	// �溸��ü��� ����Ʈ ����¡ ó�� ���� 
	public List  statTotal_trosub(Map map) {
		return sqlMapClientTemplate.queryForList("statTotal_troSqlsub", map);
	}
	
	// �����ü��� ����Ʈ ī����
	public int  countStatTotal_err(Map map) {
		return (Integer)sqlMapClientTemplate.queryForObject("countStatTotal_errSql", map);
	}

	// �����ü��� ����Ʈ 
	public List  statTotal_err(Map map) {
		return sqlMapClientTemplate.queryForList("statTotal_errSql", map);
	}
	
	// ��ġ���� ����Ʈ
	public List troubleY_SubMain(Map map) {
		return sqlMapClientTemplate.queryForList("troubleY_SubMainSql", map);
	}
	
	public int  counttroubleY(Map map) {
		return (Integer)sqlMapClientTemplate.queryForObject("counttroubleY", map);
	}
	
	// ����ġ���� ����Ʈ
	public List troubleN_SubMain(Map map) {
		return sqlMapClientTemplate.queryForList("troubleN_SubMainSql", map);
	}
	
	public int  counttroubleN(Map map) {
		return (Integer)sqlMapClientTemplate.queryForObject("counttroubleN", map);
	}
	
	//�������溸ī��Ʈ
	public int  sensorTroubleCount(Map map) {
		return (Integer)sqlMapClientTemplate.queryForObject("countStatTotal_senSql", map);
	}
	
	// ����ġ���� ����Ʈ
	public List statTroubleSen(Map map) {
		return sqlMapClientTemplate.queryForList("statTotal_senSql", map);
	}
	
	//���������ī��Ʈ
	public int  sensorErrCount(Map map) {
		return (Integer)sqlMapClientTemplate.queryForObject("countStatTotal_sen_errSql", map);
	}
	
	// ����ġ��� ����Ʈ
	public List statErrSen(Map map) {
		return sqlMapClientTemplate.queryForList("statTotal_sen_errSql", map);
	}
	
	
	//�溸�� ��ġ ī��Ʈ
	public List  sensorTrCount_Y(Map map) {
		return sqlMapClientTemplate.queryForList("statTRY_senSql", map);
	}
	
	//�溸�� ����ġ ī��Ʈ
	public List  sensorTrCount_N(Map map) {
		return sqlMapClientTemplate.queryForList("statTRN_senSql", map);
	}
	
	//��ֺ� ��ġ ī��Ʈ
	public List  sensorErCount_Y(Map map) {
		return sqlMapClientTemplate.queryForList("statERY_senSql", map);
	}
	
	//��ֺ� ����ġ ī��Ʈ
	public List  sensorErCount_N(Map map) {
		return sqlMapClientTemplate.queryForList("statERN_senSql", map);
	}
}
