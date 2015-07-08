/*
 * rptSensorErrListAction.java
 * @author 김종범
 * @version 1.0 
 * @Date 2010. 02. 26.
 * Copyright (c) 2010 BY LSWARE INC. All rights reserved.
 */

package shms.action.report;

import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import shms.common.ParamMap;
import shms.dao.common.CommonDao;
import shms.dao.report.sensorErrListDao;
import shms.dao.statManage.statDao;

import com.lsware.utils.DateUtils;

public class rptSensorErrListAction extends ParamMap {

	private sensorErrListDao sensorErrListDao;
	private CommonDao commonDao;
	private statDao statDao;

	public statDao getStatDao() {
		return statDao;
	}

	public void setStatDao(statDao statDao) {
		this.statDao = statDao;
	}

	public sensorErrListDao getSensorErrListDao() {
		return sensorErrListDao;
	}

	public void setSensorErrListDao(sensorErrListDao sensorErrListDao) {
		this.sensorErrListDao = sensorErrListDao;
	}

	public CommonDao getCommonDao() {
		return commonDao;
	}

	public void setCommonDao(CommonDao commonDao) {
		this.commonDao = commonDao;
	}

	Map map = null;

	/**
	 * 리스트
	 * 
	 * @return
	 * @throws Exception
	 */
	public String rptSensorErrList() throws Exception {
		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
		map = getReqMap();

		// 초기에 검색월에 현재에서 한달전까지 일자를 가져와 데이타를 뿌려 준다.

		if (map.get("fr_prod_dt") == null) {
			putDataMap("fr_prod_dt", String.valueOf(DateUtils.makeDateType(DateUtils.getDateWithSpan(-31))));
			map.put("fr_prod_dt", String.valueOf(DateUtils.getDateWithSpan(-31)));
		} else {
			putDataMap("fr_prod_dt", map.get("fr_prod_dt").toString().replace("-",""));
			map.put("fr_prod_dt", map.get("fr_prod_dt").toString().replace("-",""));
		}

		if (map.get("to_prod_dt") == null) {
			putDataMap("to_prod_dt", String.valueOf(DateUtils.makeDateType(DateUtils.getDateWithSpan(0))));
			map.put("to_prod_dt", String.valueOf(DateUtils.getDateWithSpan(0)));
		} else {
			putDataMap("to_prod_dt", map.get("to_prod_dt").toString().replace("-",""));
			map.put("to_prod_dt", map.get("to_prod_dt").toString().replace("-",""));
		}
		
		if (map.get("trouble_id") != null) {
			map.put("sel_trouble_id", map.get("trouble_id").toString());
		} else {
			map.put("sel_trouble_id", "");
		}

		// 센서 셀렉터
		putDataMap("sensor_list", commonDao.getSensor(map));
		// 센서종류 셀렉터
		putDataMap("sensor_type_list", commonDao.getP_SensorTypId(map));

		int resultCount = sensorErrListDao.countRptSensorErrList(map);
		putDataMap("resultCount", resultCount);
		putDataMap("rsRptSensorErrList", sensorErrListDao.rptSensorErrList(getPaging(resultCount)));

		return "rptSensorErrList_success";
	}

	public String rptSensorErrListPopup() throws Exception {
		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
		map = getReqMap();

		putDataMap("rsRptSensorErrList", sensorErrListDao.rptSensorErrList_Detail(map));

		return "rptSensorErrListPopup";
	}
	
	public void rptErrorPdf_sublast(Map map)throws Exception {
		
		List statTot = statDao.statTotal_err(map);
		Map totMap = null;
		
		int sen = 0;
		int net = 0;
		int vY = 0 ;
		int vN = 0 ;
		//조치율
		int totCri_maj = 0;
		int totYN = 0;
		
		for( int i=0; i<statTot.size(); i++ )
		{
			totMap = (Map)statTot.get(i);
			
			if( Integer.parseInt( totMap.get("err_sen_count").toString() ) >= 0 )
			{
				sen += Integer.parseInt( totMap.get("err_sen_count").toString() ) ;
			}
			
			if( Integer.parseInt( totMap.get("err_net_count").toString() ) >= 0 )
			{
				net += Integer.parseInt( totMap.get("err_net_count").toString() );
			}
			
			if( Integer.parseInt( totMap.get("err_y_count").toString() ) >= 0 )
			{
				vY += Integer.parseInt( totMap.get("err_y_count").toString() );
			}
			
			if( Integer.parseInt( totMap.get("err_n_count").toString() ) >= 0 )
			{
				vN += Integer.parseInt( totMap.get("err_n_count").toString() );
			}
			
		}
		
		totCri_maj = sen + net;
		totYN = vY ;
		
		NumberFormat nf = NumberFormat.getPercentInstance();
		double markYper = 0D;
		
		
		if( totCri_maj == 0 )
		{
			markYper = 0;
		}
		else
		{
			markYper =((double)totYN/(double)totCri_maj);
		}
		
		String mYper = nf.format(markYper);
		
		putDataMap("mYper", mYper);
		
		putDataMap("vY", vY);
		putDataMap("vN", vN);
		putDataMap("sen", sen);
		putDataMap("net", net);
		
		List cutLst = statDao.statTotal_err(map);
		List detLst = new ArrayList();
		int a=1;
		for( int i=1;i<cutLst.size(); i++  )
		{
			if(( i % 15) == 0 )
			{
				detLst.add(cutLst.get(i));
				
				a++;
			}
			else
			{
				detLst.add(cutLst.get(i));
			}
		}
		
		putDataMap("rsStatTotal", cutLst);
	}
	
	public void rptErrorPdf_sub(Map map)throws Exception {
		List statTot = statDao.statErrSen(map);
		Map totMap = null;
		
		int sen = 0;
		int net = 0;
		int vY = 0 ;
		int vN = 0 ;
		//조치율
		int totCri_maj = 0;
		int totYN = 0;
		
		for( int i=0; i<statTot.size(); i++ )
		{
			totMap = (Map)statTot.get(i);
			
			if( Integer.parseInt( totMap.get("err_sen_count").toString() ) >= 0 )
			{
				sen += Integer.parseInt( totMap.get("err_sen_count").toString() ) ;
			}
			
			if( Integer.parseInt( totMap.get("err_net_count").toString() ) >= 0 )
			{
				net += Integer.parseInt( totMap.get("err_net_count").toString() );
			}
			
			if( Integer.parseInt( totMap.get("err_y_count").toString() ) >= 0 )
			{
				vY += Integer.parseInt( totMap.get("err_y_count").toString() );
			}
			
			if( Integer.parseInt( totMap.get("err_n_count").toString() ) >= 0 )
			{
				vN += Integer.parseInt( totMap.get("err_n_count").toString() );
			}
			
		}
		
		totCri_maj = sen + net;
		totYN = vY ;
		
		NumberFormat nf = NumberFormat.getPercentInstance();
		double markYper = 0D;
		
		
		if( totCri_maj == 0 )
		{
			markYper = 0;
		}
		else
		{
			markYper =((double)totYN/(double)totCri_maj);
		}
		
		String mYper = nf.format(markYper);
		
		putDataMap("mYper", mYper);
		
		putDataMap("vY", vY);
		putDataMap("vN", vN);
		putDataMap("sen", sen);
		putDataMap("net", net);
		putDataMap("listSensor", statDao.statErrSen(map));
	}
	
	
	public String rptErrorPdf() throws Exception {
		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
		map = getReqMap();

		
		NumberFormat nf = NumberFormat.getPercentInstance();
		
		// 초기에 검색월에 현재에서 한달전까지 일자를 가져와 데이타를 뿌려 준다.

		if (map.get("fr_prod_dt") == null) {
			putDataMap("fr_prod_dt", String.valueOf(DateUtils.makeDateType(DateUtils.getDateWithSpan(-31))));
			map.put("fr_prod_dt", String.valueOf(DateUtils.getDateWithSpan(-31)));
		} else {
			putDataMap("fr_prod_dt", map.get("fr_prod_dt").toString().replace("-",""));
			map.put("fr_prod_dt", map.get("fr_prod_dt").toString().replace("-",""));
		}

		if (map.get("to_prod_dt") == null) {
			putDataMap("to_prod_dt", String.valueOf(DateUtils.makeDateType(DateUtils.getDateWithSpan(0))));
			map.put("to_prod_dt", String.valueOf(DateUtils.getDateWithSpan(0)));
		} else {
			putDataMap("to_prod_dt", map.get("to_prod_dt").toString().replace("-",""));
			map.put("to_prod_dt", map.get("to_prod_dt").toString().replace("-",""));
		}
		
		if (map.get("trouble_id") != null) {
			map.put("sel_trouble_id", map.get("trouble_id").toString());
		} else {
			map.put("sel_trouble_id", "");
		}

		
		List statTotErr = statDao.statErrSen(map);
		List Er_Y =  statDao.sensorErCount_Y(map);
		List Er_N =  statDao.sensorErCount_N(map);
		
		Map totMapErr = null;
		
		int sen = 0;
		int net = 0;
		int vYErr = 0 ;
		int vNErr = 0 ;
		//조치율
		int totCri_majErr = 0;
		int totYNErr = 0;
		
		for( int j=0; j<statTotErr.size(); j++ )
		{
			totMapErr = (Map)statTotErr.get(j);
			
			if( Integer.parseInt( totMapErr.get("err_sen_count").toString() ) >= 0 )
			{
				sen += Integer.parseInt( totMapErr.get("err_sen_count").toString() ) ;
			}
			
			if( Integer.parseInt( totMapErr.get("err_net_count").toString() ) >= 0 )
			{
				net += Integer.parseInt( totMapErr.get("err_net_count").toString() );
			}
			
			if( Integer.parseInt( totMapErr.get("err_y_count").toString() ) >= 0 )
			{
				vYErr += Integer.parseInt( totMapErr.get("err_y_count").toString() );
			}
			
			if( Integer.parseInt( totMapErr.get("err_n_count").toString() ) >= 0 )
			{
				vNErr += Integer.parseInt( totMapErr.get("err_n_count").toString() );
			}
			
		}
		
		
		Map totErMap_Y = null;
		Map totErMap_N = null;
		
		String erY_1 = "";
		String erY_2 = "";
		
		String erN_1 = "";
		String erN_2 = "";
		
		int totEr_Y = 0;
		int totEr_N = 0;
		
		//장애 조치
		for( int _i=0;_i<Er_Y.size();_i++ )
		{
			totErMap_Y = (Map)Er_Y.get(_i);
			erY_1 = totErMap_Y.get("Y1")==null?"0":totErMap_Y.get("Y1").toString();
			erY_2 = totErMap_Y.get("Y2")==null?"0":totErMap_Y.get("Y2").toString();
			
			totEr_Y = Integer.parseInt(erY_1) + Integer.parseInt(erY_2);//조치 총갯수 
		}
		
		//장애  미조치
		for( int _i=0;_i<Er_N.size();_i++ )
		{
			totErMap_N = (Map)Er_N.get(_i);
			erN_1 = totErMap_N.get("N1")==null?"0":totErMap_N.get("N1").toString();
			erN_2 = totErMap_N.get("N2")==null?"0":totErMap_N.get("N2").toString();
			totEr_N = Integer.parseInt(erN_1) + Integer.parseInt(erN_2);//미조치 총갯수 
		}
		
		totCri_majErr = sen + net;
		totYNErr = vYErr ;
		
		double markYperErr = 0D;
		double senperErr = 0D;
		double netperErr = 0D;
		double totErPer_Y = 0D;//총조치율
		double totErPer_N = 0D;//총미조치율
		
		
		if( totCri_majErr == 0 )
		{
			markYperErr = 0;
			senperErr = 0;
			netperErr = 0;
			totErPer_Y = 0;
			totErPer_N = 0;
		}
		else
		{
			markYperErr = ((double)totYNErr/(double)totCri_majErr);
			senperErr = ((double)sen/(double)totCri_majErr);
			netperErr = ((double)net/(double)totCri_majErr);
			totErPer_Y = ((double)totEr_Y/(double)totCri_majErr);
			totErPer_N = ((double)totEr_N/(double)totCri_majErr);
		}
		
		String mYperErr = nf.format(markYperErr);
		String senperStr = nf.format(senperErr);
		String netperStr = nf.format(netperErr);
		String erStr_Y = nf.format(totErPer_Y);
		String erStr_N = nf.format(totErPer_N);
		
		
		
		//장애
		putDataMap("totCri_majErr", totCri_majErr);//합계
		putDataMap("sen", sen);//센서장애
		putDataMap("senperStr", senperStr);//센서장애율
		putDataMap("net", net);//네트워크
		putDataMap("netperStr", netperStr);//네트워크율
		
		double totPer_1 = 0D;
		double totPer_2 = 0D;
		double totPer_3 = 0D;
		double totPer_4 = 0D;
		
		if( sen == 0 )
		{
			totPer_1 = 0;
			totPer_2 = 0;
			totPer_3 = 0;
			totPer_4 = 0;
		}
		else
		{
			totPer_1 = ((double)Integer.parseInt(erY_1)/(double)sen);
			totPer_2 = ((double)Integer.parseInt(erY_2)/(double)sen);
			totPer_3 = ((double)Integer.parseInt(erN_1)/(double)sen);
			totPer_4 = ((double)Integer.parseInt(erN_2)/(double)sen);
		}
		
		String totErPer_1Str = nf.format(totPer_1);
		String totErPer_2Str = nf.format(totPer_2);
		String totErPer_3Str = nf.format(totPer_3);
		String totErPer_4Str = nf.format(totPer_4);
		
		
		
		//조치 
		putDataMap("totEr_Y", totEr_Y);//조치합계
		putDataMap("erY_1", erY_1);//센서장애조치
		putDataMap("totErPer_1Str", totErPer_1Str);//센서장애조치
		putDataMap("erY_2", erY_2);//네트워크조치
		putDataMap("totErPer_2Str", totErPer_2Str);//센서장애조치율
		//총조치율
		putDataMap("erStr_Y", erStr_Y);//조치율
		
		//미조치
		putDataMap("totEr_N", totEr_N);//미조치합계
		putDataMap("erN_1", erN_1);//센서장애미조치
		putDataMap("totErPer_3Str", totErPer_3Str);//센서장애미조치율
		putDataMap("erN_2", erN_2);//네트워크미조치
		putDataMap("totErPer_4Str", totErPer_4Str);//네트워크미조치율
		//총조치율
		putDataMap("erStr_N", erStr_N);//미조치율
		
		
		this.rptErrorPdf_sub(map);
		this.rptErrorPdf_sublast(map);
		
//		putDataMap("rsRptTroubleList_Detail", troubleListDao.rptTroubleList_Detail(map));
		
		
		
		

		return "rptErrorPdf";
	}
}
