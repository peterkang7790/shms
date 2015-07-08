/*
 * UserAction.java 1.0, 2009. 5. 27.
 * 
 * Copyright (c) 2008 BY LSWARE INC. All rights reserved.
 */

package shms.action.pda.alarmhistory;

import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import com.lsware.utils.DateUtils;

import shms.action.pda.alarmstatus.PdaAlarmStatusAction;
import shms.common.ParamMap;
import shms.dao.pda.alarmhistory.PdaAlarmHistoryDao;
import shms.dao.pda.alarmstatus.PdaAlarmStatusDao;






/**
 * 
 * @author ∞≠∆Ú»Ò
 * @version 1.0,  2009. 10. 22.
 */
public class PdaAlarmHistoryAction extends ParamMap {
	private PdaAlarmHistoryDao pdaAlarmHistoryDao;
	
	public PdaAlarmHistoryDao getPdaAlarmHistoryDao() {
		return pdaAlarmHistoryDao;
	}

	public void setPdaAlarmHistoryDao(PdaAlarmHistoryDao pdaAlarmHistoryDao) {
		this.pdaAlarmHistoryDao = pdaAlarmHistoryDao;
	}

	private Map<String,String> map = null;
	
	public String listAlmHisTotal() throws Exception
	{
		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
		map = getReqMap();
		
		List cntLst = pdaAlarmHistoryDao.cntalmhis(map);
		
		int totalCount = pdaAlarmHistoryDao.cntTothis(map);
		
		
		putDataMap("totalCount", totalCount);
		putDataMap("listalarmhis",pdaAlarmHistoryDao.listAlarmhistory(getPaging(totalCount)));
		
		
		return "listHistory_success";
	}

	public String listAlmHis() throws Exception
	{
		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
		map = getReqMap();
		
		putDataMap("cnt",map.get("sencnt"));
		putDataMap("cntalmshis_sub",pdaAlarmHistoryDao.listAlarmhis(map));
		
		return "listHis_success";
	}
	
	public String detailAlmHis() throws Exception
	{
		map = getReqMap();
		
		putDataMap("trouble_prod_dt", map.get("trouble_prod_dt"));
		putDataMap("detailAlarmHis", pdaAlarmHistoryDao.detailAlmHis(map).get(0));
		return "detail_success";
	}
}


