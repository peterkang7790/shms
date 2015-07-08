/*
 * UserDao.java 1.0, 2009. 5. 27.
 * 
 * Copyright (c) 2008 BY LSWARE INC. All rights reserved.
 */

package shms.dao.pda.alarmhistory;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import shms.common.ShmsCommon;

import com.lsware.utils.DateUtils;
import com.lsware.utils.StringUtils;

public class PdaAlarmHistoryDao {

    private SqlMapClientTemplate sqlMapClientTemplate;
	
    public void setSqlMapClientTemplate(SqlMapClientTemplate sqlMapClientTemplate) {
		this.sqlMapClientTemplate = sqlMapClientTemplate;
	}
    
   
    /**
     * 상세 조회
     * @param map
     * @return
     */
	public List cntalmhis(Map map){
    	return sqlMapClientTemplate.queryForList("cntalmshis", map); 
	}
	
	public int cntTothis(Map map){
    	return (Integer)sqlMapClientTemplate.queryForObject("countalmhisTotDoing", map); 
	}
	
	public List cntalmhisSub(Map map){
    	return sqlMapClientTemplate.queryForList("cntalmshis_sub", map); 
	}
	
	/**
     * 상세 조회
     * @param map
     * @return
     */
	public List detailAlmHis(Map map){

    	return sqlMapClientTemplate.queryForList("detailAlarmHis", map);
	}

	/**
    * 리스트 조회
    * @param map
    * @return
    */
	public List listAlarmhistory(Map map){

		List alrLstA = sqlMapClientTemplate.queryForList("listalarmhis", map);
		Map<String,String> almMap = null;
		for(int i=0;i<alrLstA.size(); i++)
		{
			almMap = (Map)alrLstA.get(i);
			
			almMap.put("t_prod_dt", DateUtils.getStrDateVer(almMap.get("trouble_prod_dt")));
		}
     	return alrLstA;
	}
	
	
	
	/**
     * 상세 조회
     * @param map
     * @return
     */
	public List listAlarmhis(Map map){
		
		List alrLstA = sqlMapClientTemplate.queryForList("cntalmshis", map);
		Map<String,String> almMap = null;
		for(int i=0;i<alrLstA.size(); i++)
		{
			almMap = (Map)alrLstA.get(i);
			
			almMap.put("t_prod_dt", DateUtils.getStrDateVer(almMap.get("trouble_prod_dt")));
			almMap.put("mark_dt", DateUtils.getStrDateVer(almMap.get("mark_dt")));
		}
		
     	return alrLstA;
	}
	
	

}

