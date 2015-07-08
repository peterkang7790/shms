/*
 * rptRtStatAction.java
 * @author 김종범
 * @version 1.0 
 * @Date 2010. 02. 11.
 * Copyright (c) 2010 BY LSWARE INC. All rights reserved.
 */

package shms.action.instManage;

import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import com.lsware.utils.StringUtils;

import shms.common.ParamMap;
import shms.dao.common.CommonDao;
import shms.dao.instManage.rptRtStatDao;

public class rptRtStatAction extends ParamMap {

	private rptRtStatDao rptRtStatDao;
	private CommonDao commonDao;

	public void setCommonDao(CommonDao commonDao) {
		this.commonDao = commonDao;
	}

	public rptRtStatDao getUserDao() {
		return rptRtStatDao;
	}

	public void setUserDao(rptRtStatDao rptRtStatDao) {
		this.rptRtStatDao = rptRtStatDao;
	}

	Map map = null;

	public String rptRtStat() throws Exception {
		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
		map = getReqMap();

		putDataMap("rsSensorImage", rptRtStatDao.sensorImage(map));
		putDataMap("rsSensorPos", rptRtStatDao.sensorPos(map));
		putDataMap("rsSensor", rptRtStatDao.sensor(map));

		return "rptRtStat_success";
	}
	
	public String rptRtStat_pda() throws Exception {
		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
		map = getReqMap();

		putDataMap("rsSensorImage", rptRtStatDao.sensorImage(map));
		putDataMap("rsSensorPos", rptRtStatDao.sensorPos(map));
		putDataMap("rsSensor", rptRtStatDao.sensor(map));

		return "rptRtStatPda_success";
	}
	
	public String rptPeriodStat() throws Exception {
		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
		map = getReqMap();

		//센서셀렉터
		putDataMap( "sensor_id_list", commonDao.getSensorSelector(map));
		
		return "rptPeriodStat_success";
	}
	
	/*
	 * 다중그래프  : 구조물의 센서 목록
	 */
	public String rptRtStatsensors() throws Exception {
		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
		map = getReqMap();

		// 센서 목록
		putDataMap("sensors_list", rptRtStatDao.sensorsList(map));
		
		return "rptRtStatsensors_success";
	}

	/*
	 * 다중그래프 : 센서 그래프 값 조회
	 */
	public String rptRtStatSensorsGraph() throws Exception {
		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
		map = getReqMap();

		map.put("sensors_id", map.get("sensors_id").toString().split(","));

		// 센서 값
		putDataMap( "sensors_graph", rptRtStatDao.sensorsGraph(map));

		return "rptRtStatSensorsGraph_success";
	}

	/**
	 * 센서위치 표시
	 * @return
	 * @throws Exception
	 */
	public String sensorPos() throws Exception {
		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
		map = getReqMap();

		putDataMap("rsSensorPos", rptRtStatDao.sensorPos(map));
		return "sensorPos_success";
	}

	/**
	 * 센서정보
	 * @return
	 * @throws Exception
	 */
	public String sensor() throws Exception {
		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
		map = getReqMap();

		putDataMap("rsSensor", rptRtStatDao.sensor(map));
		
		return "sensor_success";
	}
	
	/**
	 * 그래프 표시
	 * @return
	 * @throws Exception
	 */
	public String graph1() throws Exception {
		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
		map = getReqMap();

		putDataMap("rsGraph", rptRtStatDao.graph(map));
        return "graph1_success";
	}
	
	/**
	 * 주기별 그래프 데이터
	 * @author lsware
	 * @return
	 * @throws Exception
	 */
	public String periodGraph() throws Exception {
		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
		map = getReqMap();

        if( map.get("period_cd") != null )
        {
        	if( "B".equals(map.get("period_cd")) )
        	{
        		putDataMap("rsPeriodGraph", rptRtStatDao.get5minSql(map));
        	}
        	else
        	{
        		System.out.println(map);
        		putDataMap("rsPeriodGraph", rptRtStatDao.gethdmSql(map));
        	}
        }
        else
        {
   			return "period_fail";
        }
		return "period_success";
	}
	
	public String rptPeriodPop() throws Exception {
		map = getReqMap();

		
		
		String valStr = "";
		String scVal = "";
		String hlVal = "";
		
		String sVal = "";
		String cVal = "";
		String hVal = "";
		String lVal = "";
			
		if( map.get("open") != null )
		{
			sVal = map.get("open").toString();
		}
		
		if( map.get("close") != null )
		{
			cVal = map.get("close").toString();
		}
		
		if( map.get("high") != null )
		{
			hVal = map.get("high").toString();
		}
		
		if( map.get("low") != null )
		{
			lVal = map.get("low").toString();
		}
		
		scVal = "시작값 :" + sVal + " ~ " + "마지막값  :" + cVal;
		hlVal = "최고값 :" + hVal + " ~ " + "최저값  :" + lVal;
		
		putDataMap("scVal", scVal);
		putDataMap("hlVal", hlVal);
		
		String sh = "";
		String toM = "";
		String frM = "";
		String frsh = "";
		String yy = "";
		String mm = "";
		String fm = "";
		String dd = "";
		String fd = "";
		
		
		if( map.get("itemDt") != null )
		{
			String dt = map.get("itemDt").toString();
		    
			yy = dt.substring(0,4);
			mm = dt.substring(4,6);
			dd = dt.substring(6,8);
			sh = dt.substring(8,10);
			fd = String.valueOf((Integer.parseInt(dd))-1);
			fm = String.valueOf((Integer.parseInt(mm))-1);
			if( map.get("period_cd") != null )
			{
				String peroidVal = "";
				
				if( map.get("period_cd").toString().equals("B")  )
				{
					peroidVal = "5분통계";
					
					toM = String.valueOf((Integer.parseInt(dt.substring(10,12))-5));
					frM = dt.substring(10,12);
					
					
					valStr = "[" + yy + "년" + mm + "월" + dd + "일 ]  " + "\n" + sh + "시 " + toM + "분  - " + frM +"분 사이통계치입니다.";
				}
	
				if( map.get("period_cd").toString().equals("H")  )
				{
					frsh = String.valueOf((Integer.parseInt(sh)-1));
					peroidVal = "시간통계";
					valStr = "[" + yy + "년" + mm + "월" + dd + "일 ]  " + frsh + "시   - " + sh +"시 사이통계치입니다.";
				}
				
				if( map.get("period_cd").toString().equals("D")  )
				{
					peroidVal = "일통계";
					valStr = yy + "년" + mm + "월" + fd + "일 에서" + dd +"일사이의 통계치입니다.";
				}
				if( map.get("period_cd").toString().equals("M")  )
				{
					valStr = yy + "년" + mm + "월 초에서   " + mm +"월 말 사이의 통계치입니다.";
					peroidVal = "월통계";
				}
				
				
				putDataMap("period_cd", peroidVal);
				putDataMap("itemDt", valStr);
			}
			
			
			
			
		}
		
		
			
			
		
		
				
		return "rptPeriodPop";
	}
}
