/*
 * UserDao.java 1.0, 2009. 5. 27.
 * 
 * Copyright (c) 2008 BY LSWARE INC. All rights reserved.
 */

package shms.dao.baseInfo;

import java.util.List;
import java.util.Map;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import shms.common.ShmsCommon;

public class imageManageDao {

    private SqlMapClientTemplate sqlMapClientTemplate;
	
   
    
    public void setSqlMapClientTemplate(SqlMapClientTemplate sqlMapClientTemplate) {
		this.sqlMapClientTemplate = sqlMapClientTemplate;
	}
    
   /**
	 * Ä«¿îÆ®
	 * @param map
	 * @return
	 */
	public int countImageDoing(Map map){
		
		return (Integer)sqlMapClientTemplate.queryForObject("countImageDoing_1", map);
	}
	
    public List listImage(Map map){
    	
	     	return sqlMapClientTemplate.queryForList("listImage_1", map);
	}
    public int imageIdChk(Map map){
		
		return (Integer)sqlMapClientTemplate.queryForObject("imageIdChk", map);
	}
	
    public Object detailImageFile(String image_id){
    	return sqlMapClientTemplate.queryForObject("detailImageFile", image_id);
	}
    
    public Object detailImage(Map map){
    	return sqlMapClientTemplate.queryForObject("detailImage", map);
	}
    
    public void addImage(Map map){
		sqlMapClientTemplate.insert("addImage", map);
	}
    
    public void editImage(Map map)
	{
		sqlMapClientTemplate.update("upImage", map);
	}
  
    public void fileUpload(Map map)
	{
		sqlMapClientTemplate.insert("fileInsertImage", map);
	}
    
    public void delImage(Map map){
		
		sqlMapClientTemplate.delete("delImage", map);
	}
    
    public String delImageFile(Map map){
		
		return (String)sqlMapClientTemplate.queryForObject("deleteImageFile", map);
	}
}

