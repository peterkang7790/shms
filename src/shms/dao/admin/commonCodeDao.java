/*
 * accessDao.java
 * @author 김종범
 * @version 1.0 
 * @Date 2010. 02. 06.
 * Copyright (c) 2010 BY LSWARE INC. All rights reserved.
 */

package shms.dao.admin;

import java.util.List;
import java.util.Map;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

public class commonCodeDao {

	private SqlMapClientTemplate sqlMapClientTemplate;

	public void setSqlMapClientTemplate(SqlMapClientTemplate sqlMapClientTemplate) {
		this.sqlMapClientTemplate = sqlMapClientTemplate;
	}

	public List listCommonCode(Map map) {
		return sqlMapClientTemplate.queryForList("listCommonCode", map);
	}

	public List detCommonCodeDet(Map map){
		
    	return sqlMapClientTemplate.queryForList("listCommonCodeDet", map);
	}
	/**
	 * 카운트
	 * @param map
	 * @return
	 */
	public int countCommonCode(Map map){
		
    	return (Integer)sqlMapClientTemplate.queryForObject("countListCommonCd", map);
	}
	
	public int countCommonCodeDet(Map map){
		
    	return (Integer)sqlMapClientTemplate.queryForObject("countListCommonDet", map);
	}
	
	public Object detCommonCode(Map map){
		
    	return sqlMapClientTemplate.queryForObject("detCommonCode", map);
	}
	
	public Object detCommonCodePop(Map map){
		
    	return sqlMapClientTemplate.queryForObject("detCommonCodePop", map);
	}
	
	public void delCommonCode(Map map){
		
    	sqlMapClientTemplate.delete("delCommonCode", map);
	}
	
	public void delCommonDet(Map map){
		
    	sqlMapClientTemplate.delete("delCommonDet", map);
	}
	
	public void addCommonCode(Map map){
		
    	sqlMapClientTemplate.insert("addCommonCode", map);
	}
	
	public int commonCdChk(Map map){
		
		return (Integer)sqlMapClientTemplate.queryForObject("commonCdChk", map);
	}
	
	//공통 테이블 에서 코드유형 이 테이블
	
	public List listCommonCodeChannel(Map map) {
		return sqlMapClientTemplate.queryForList("commonChannelSql", map);
	}
	
	public int countChannel(Map map){
		
		return (Integer)sqlMapClientTemplate.queryForObject("countListCommonCdChannel", map);
	}
	
	public List listCommonCodeDtector(Map map) {
		return sqlMapClientTemplate.queryForList("commonDetectorSql", map);
	}
	
	public int countDtector(Map map){
		
		return (Integer)sqlMapClientTemplate.queryForObject("countListCommonCdDetector", map);
	}
	
	public List listCommonCodeSensor(Map map) {
		return sqlMapClientTemplate.queryForList("commonSensorSql", map);
	}
	
	public int countSensor(Map map){
		
		return (Integer)sqlMapClientTemplate.queryForObject("countListCommonCdSensor", map);
	}
}
