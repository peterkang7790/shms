/*
 * UserAction.java 1.0, 2009. 5. 27.
 * 
 * Copyright (c) 2008 BY LSWARE INC. All rights reserved.
 */

package shms.action.pda.alarmstatus;

import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import com.lsware.utils.DateUtils;

import shms.common.ParamMap;
import shms.common.ShmsCommon;
import shms.dao.pda.alarmstatus.PdaAlarmStatusDao;






/**
 * 
 * @author ∞≠∆Ú»Ò
 * @version 1.0,  2009. 10. 22.
 */
public class PdaAlarmStatusAction extends ParamMap {
	private PdaAlarmStatusDao pdaAlarmStatusDao;
	public PdaAlarmStatusDao getPdaAlarmStatusDao() {
		return pdaAlarmStatusDao;
	}
	public void setPdaAlarmStatusDao(PdaAlarmStatusDao pdaAlarmStatusDao) {
		this.pdaAlarmStatusDao = pdaAlarmStatusDao;
	}
	private Map<String,String> map = null;
	
	public String listAlarmStatus() throws Exception
	{
//		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
		map = getReqMap();
		
		List cntLst = pdaAlarmStatusDao.cntalmstat(map);
		
		int totalCount = pdaAlarmStatusDao.cntTotal(map);
		
		int cri = 1;
		int maj = 1;
		int saf = 1;
		
		Map<String,String> almMap = null;
		for(int i=0;i<cntLst.size(); i++)
		{
			almMap = (Map)cntLst.get(i);
			
			if( almMap.get("trouble_class_cd").toString().equals("1") )
			{
				putDataMap("cri_almstate",cri++);
			}
			else if( almMap.get("trouble_class_cd").toString().equals("2") )
			{
				putDataMap("maj_almstate",maj++);
			}
			else																
			{
				putDataMap("saf_almstate",saf++);
			}
		}
		
		String toDay = DateUtils.getCurrentDate();
		
		String toDateVal = DateUtils.getStrDateVer(toDay);
		
		putDataMap("toDateVal", toDateVal);
		
		if( map.get("struct_id") != null ) putDataMap("struct_id",  map.get("struct_id"));
		
		putDataMap("totalCount",totalCount);
		putDataMap("listalarmstat",pdaAlarmStatusDao.listAlarmstatus(getPaging(totalCount)));
		
		
		return "listStatus_success";
	}

	public String detailAlarmStatus() throws Exception
	{
		map = getReqMap();
	
		putDataMap("trouble_class_nm", map.get("trouble_class_nm"));
		putDataMap("detailAlarmStatus",pdaAlarmStatusDao.detailalmstat(map).get(0));
		return "detailStatus_success";
	}
}


