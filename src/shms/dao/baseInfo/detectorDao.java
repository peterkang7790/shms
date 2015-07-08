/*
 * detectorDao.java
 * @author ∞≠∆Ú»Ò
 * @version 1.0 
 * @Date 2010. 01. 28.
 * Copyright (c) 2008 BY LSWARE INC. All rights reserved.
 */

package shms.dao.baseInfo;

import java.util.List;
import java.util.Map;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import shms.common.ShmsCommon;

public class detectorDao {

    private SqlMapClientTemplate sqlMapClientTemplate;
	
   
    
    public void setSqlMapClientTemplate(SqlMapClientTemplate sqlMapClientTemplate) {
		this.sqlMapClientTemplate = sqlMapClientTemplate;
	}
    
	
	
	public List listDetector(Map map){
	 	return sqlMapClientTemplate.queryForList("listDetector", map);
	}
	
	public List listDetectorA(Map map){
	 	return sqlMapClientTemplate.queryForList("listDetectorA", map);
	}
	
	public int countDetector(Map map){
		
    	return (Integer)sqlMapClientTemplate.queryForObject("countDetectorDoing", map);
	}
	
	
	public int countDetectorA(Map map){
		
    	return (Integer)sqlMapClientTemplate.queryForObject("countDetectorDoing_A", map);
	}
	
	public int detectorIdChk(Map map){
		
		return (Integer)sqlMapClientTemplate.queryForObject("detectorIdChk", map);
	}
	
	public void delDetector(Map map){
		
		sqlMapClientTemplate.delete("delDetector", map);
	}
	
	public List listChannel(Map map){
	 	return sqlMapClientTemplate.queryForList("listChannel", map);
	}
	
	public int countChannelDoing(Map map){
		
    	return (Integer)sqlMapClientTemplate.queryForObject("countChannelDoing", map);
	}
	
	public List searchChannel(Map map){
	 	return sqlMapClientTemplate.queryForList("searchChannel", map);
	}
	
	public int countChannelSearch(Map map){
		
    	return (Integer)sqlMapClientTemplate.queryForObject("countChannelSearch", map);
	}
	
	public int channelIdChk(Map map){
		
		return (Integer)sqlMapClientTemplate.queryForObject("channelIdChk", map);
	}
	
	public void delChannel(Map map){
		
		sqlMapClientTemplate.delete("delChannel", map);
	}
	
	public void addDetector(Map map){
		sqlMapClientTemplate.insert("addDetector", map);
	}
	
	public void addChannel(Map map){
		sqlMapClientTemplate.insert("addChannel", map);
	}
}

