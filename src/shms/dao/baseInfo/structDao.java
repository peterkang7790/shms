/*
 * structDao.java
 * @author 강평희
 * @version 1.0 
 * @Date 2010. 01. 28.
 * Copyright (c) 2008 BY LSWARE INC. All rights reserved.
 */

package shms.dao.baseInfo;

import java.util.List;
import java.util.Map;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import shms.common.ShmsCommon;

public class structDao {

    private SqlMapClientTemplate sqlMapClientTemplate;
	
    public void setSqlMapClientTemplate(SqlMapClientTemplate sqlMapClientTemplate) {
		this.sqlMapClientTemplate = sqlMapClientTemplate;
	}
    
    public List listStruct(Map map){
	 	return sqlMapClientTemplate.queryForList("listStruct", map);
	}
	
    public List listImage(Map map){
	 	return sqlMapClientTemplate.queryForList("listImage", map);
	}
    
    public int countStruct(Map map){
		
    	return (Integer)sqlMapClientTemplate.queryForObject("countStructDoing", map);
	}
    
    public int countImage(Map map){
		
    	return (Integer)sqlMapClientTemplate.queryForObject("countImageDoing", map);
	}
    
    public Object detailStruct(Map map){

    	return sqlMapClientTemplate.queryForObject("detailStruct", map);
	}
    
    public Object detailImage(Map map){

    	return sqlMapClientTemplate.queryForObject("listImage", map);
	}
    
    public void editStruct(Map map)
	{
		sqlMapClientTemplate.update("upDateStruct", map);
	}
    
    public int structIdChk(Map map){
		
		return (Integer)sqlMapClientTemplate.queryForObject("structIdChk", map);
	}
    
    public void delStruct(Map map){
		
		sqlMapClientTemplate.delete("delStruct", map);
	}
    
    public void delAccStruct(Map map){
		
		sqlMapClientTemplate.delete("delAccStruct", map);
	}
    
    public void addStruct(Map map){
		sqlMapClientTemplate.insert("addStruct", map);
	}
    
    public void accStruct(Map map){
		sqlMapClientTemplate.insert("accStruct", map);
	}
    
  //***************** 기준정보의 구조물 구성 관련 sql END********************//
	public List getStructTree(Map map){
		return sqlMapClientTemplate.queryForList("listStructTree",map);
	}
	
	public void addStructComp(Map map){
		sqlMapClientTemplate.insert("addStructComp",map);
	}
	
	public int structCompIdChk(Map map){
		
		return (Integer)sqlMapClientTemplate.queryForObject("structCompIdChk", map);
	}
	
	 public void delStructComp(Map map){
			
			sqlMapClientTemplate.delete("delStructComp", map);
	}
	 
	 public Object editStructComp(Map map){

	    	return sqlMapClientTemplate.queryForObject("listStructCompPop", map);
	} 
	 
	 public void upStructComp(Map map)
	{
			sqlMapClientTemplate.update("upDateStructComp", map);
	}
	
	//이미지가져오기 
	public String imageView(Map map){
			
		return (String)sqlMapClientTemplate.queryForObject("imageViewSql", map);
	}
}

