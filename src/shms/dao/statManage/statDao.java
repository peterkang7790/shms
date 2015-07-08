/*
 * rptRtStatDao.java
 * @author 김종범
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

	// 센서정보
	public Object sensor(Map map) {
		return sqlMapClientTemplate.queryForObject("sensorStatDailySql", map);
	}
	
	// 그래프 표시
	public List graph(Map map) {
		return sqlMapClientTemplate.queryForList("graphStatDailySql", map);
	}
	
	// 경보 그래프 표시
	public List chartAlarmPie3D(Map map) {
		return sqlMapClientTemplate.queryForList("chartAlarmPie3DSql", map);
	}
	
	// 장애 그래프 표시
	public List chartErrPie3D(Map map) {
		return sqlMapClientTemplate.queryForList("chartErrPie3DSql", map);
	}
	
	// 총센서 수량 표시
	public int sensorTot(Map map) {
		return (Integer)sqlMapClientTemplate.queryForObject("totSenSql", map);
	}
	
	// 장애 수량
	public int errorTot(Map map) {
		return (Integer)sqlMapClientTemplate.queryForObject("totErrSql", map);
	}
	
	// 경보 수량
	public int  alarmTot(Map map) {
		return (Integer)sqlMapClientTemplate.queryForObject("totAlarmSql", map);
	}
	
	// 일자/센서별그래프
	public List  markinYnTot(Map map) {
		return sqlMapClientTemplate.queryForList("totMarkingSql", map);
	}
	
	// 센서현황
	public List  totMarkingSql(Map map) {
		
		return sqlMapClientTemplate.queryForList("listSensorTotSql", map);
	}
	
	// 센서현황 수량
	public int  totMarkingTotCnt(Map map) {
		return (Integer)sqlMapClientTemplate.queryForObject("countSensorTotDoing", map);
	}

	// 전체통계 리스트 카운터
	public int  countStatTotal(Map map) {
		return (Integer)sqlMapClientTemplate.queryForObject("countStatTotalSql", map);
	}

	// 전체통계 리스트 
	public List  statTotal(Map map) {
		return sqlMapClientTemplate.queryForList("statTotalSql", map);
	}
	
	// 경보전체통계 리스트 카운터
	public int  countStatTotal_tro(Map map) {
		return (Integer)sqlMapClientTemplate.queryForObject("countStatTotal_troSql", map);
	}

	// 경보전체통계 리스트 
	public List  statTotal_tro(Map map) {
		return sqlMapClientTemplate.queryForList("statTotal_troSql", map);
	}
	
	// 경보전체통계 리스트 페이징 처리 없이 
	public List  statTotal_trosub(Map map) {
		return sqlMapClientTemplate.queryForList("statTotal_troSqlsub", map);
	}
	
	// 장애전체통계 리스트 카운터
	public int  countStatTotal_err(Map map) {
		return (Integer)sqlMapClientTemplate.queryForObject("countStatTotal_errSql", map);
	}

	// 장애전체통계 리스트 
	public List  statTotal_err(Map map) {
		return sqlMapClientTemplate.queryForList("statTotal_errSql", map);
	}
	
	// 조치사유 리스트
	public List troubleY_SubMain(Map map) {
		return sqlMapClientTemplate.queryForList("troubleY_SubMainSql", map);
	}
	
	public int  counttroubleY(Map map) {
		return (Integer)sqlMapClientTemplate.queryForObject("counttroubleY", map);
	}
	
	// 미조치사유 리스트
	public List troubleN_SubMain(Map map) {
		return sqlMapClientTemplate.queryForList("troubleN_SubMainSql", map);
	}
	
	public int  counttroubleN(Map map) {
		return (Integer)sqlMapClientTemplate.queryForObject("counttroubleN", map);
	}
	
	//센서별경보카운트
	public int  sensorTroubleCount(Map map) {
		return (Integer)sqlMapClientTemplate.queryForObject("countStatTotal_senSql", map);
	}
	
	// 미조치사유 리스트
	public List statTroubleSen(Map map) {
		return sqlMapClientTemplate.queryForList("statTotal_senSql", map);
	}
	
	//센서별장애카운트
	public int  sensorErrCount(Map map) {
		return (Integer)sqlMapClientTemplate.queryForObject("countStatTotal_sen_errSql", map);
	}
	
	// 미조치장애 리스트
	public List statErrSen(Map map) {
		return sqlMapClientTemplate.queryForList("statTotal_sen_errSql", map);
	}
	
	
	//경보별 조치 카운트
	public List  sensorTrCount_Y(Map map) {
		return sqlMapClientTemplate.queryForList("statTRY_senSql", map);
	}
	
	//경보별 미조치 카운트
	public List  sensorTrCount_N(Map map) {
		return sqlMapClientTemplate.queryForList("statTRN_senSql", map);
	}
	
	//장애별 조치 카운트
	public List  sensorErCount_Y(Map map) {
		return sqlMapClientTemplate.queryForList("statERY_senSql", map);
	}
	
	//장애별 미조치 카운트
	public List  sensorErCount_N(Map map) {
		return sqlMapClientTemplate.queryForList("statERN_senSql", map);
	}
}
