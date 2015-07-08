/*
 * UserDao.java 1.0, 2009. 5. 27.
 * 
 * Copyright (c) 2008 BY LSWARE INC. All rights reserved.
 */

package shms.dao.pda.alarmstatus;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import shms.common.ShmsCommon;

import com.lsware.utils.DateUtils;
import com.lsware.utils.StringUtils;

public class PdaAlarmStatusDao {

    private SqlMapClientTemplate sqlMapClientTemplate;
	
    public void setSqlMapClientTemplate(SqlMapClientTemplate sqlMapClientTemplate) {
		this.sqlMapClientTemplate = sqlMapClientTemplate;
	}
    
   
    /**
     * 상세 조회
     * @param map
     * @return
     */
	public List cntalmstat(Map map){
    	return sqlMapClientTemplate.queryForList("cntalmstat", map); 
	}
	
	public int cntTotal(Map map){
		
		return (Integer)sqlMapClientTemplate.queryForObject("countalmhisDoing", map); 
	}
	
	/**
     * 상세 조회
     * @param map
     * @return
     */
	public List detailalmstat(Map<String,String> map){
		
		List alrLstA = sqlMapClientTemplate.queryForList("detailAlarmStatus", map);
//		Map<String,String> almMap = null;
//		for(int i=0;i<alrLstA.size(); i++)
//		{
//			almMap = (Map)alrLstA.get(i);
//			
//			almMap.put("sensor_id", ShmsCommon.getSenTypeMap(almMap.get("sensor_id")) );
//			almMap.put("msr_item_id", ShmsCommon.getMsrItemMap(almMap.get("msr_item_id")));
//			
//		}
		
    	return alrLstA;
	}

	/**
    * 리스트 조회
    * @param map
    * @return
    */
	public List listAlarmstatus(Map map){

		List alrLstA = sqlMapClientTemplate.queryForList("listalarmstat", map);
		Map<String,String> almMap = null;
		for(int i=0;i<alrLstA.size(); i++)
		{
			almMap = (Map)alrLstA.get(i);
			
			almMap.put("trouble_prod_dt", DateUtils.getStrDateVer(almMap.get("trouble_prod_dt")));
		}
     	return alrLstA;
	}

}

