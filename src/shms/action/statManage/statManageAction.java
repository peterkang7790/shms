/*
 * rptRtStatAction.java
 * @author ������
 * @version 1.0 
 * @Date 2010. 02. 11.
 * Copyright (c) 2010 BY LSWARE INC. All rights reserved.
 */

package shms.action.statManage;

import java.text.NumberFormat;
import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import shms.common.ParamMap;
import shms.dao.baseInfo.SensorManageDao;
import shms.dao.common.CommonDao;
import shms.dao.sensorManage.sensorListDao;
import shms.dao.statManage.statDao;

import com.lsware.utils.DateUtils;

public class statManageAction extends ParamMap {

	private CommonDao commonDao;
	private statDao statDao;
	private SensorManageDao sensorManageDao;
	private sensorListDao sensorListDao;

	public sensorListDao getSensorListDao() {
		return sensorListDao;
	}

	public void setSensorListDao(sensorListDao sensorListDao) {
		this.sensorListDao = sensorListDao;
	}

	public void setSensorManageDao(SensorManageDao sensorManageDao) {
		this.sensorManageDao = sensorManageDao;
	}

	public void setStatDao(statDao statDao) {
		this.statDao = statDao;
	}

	public void setCommonDao(CommonDao commonDao) {
		this.commonDao = commonDao;
	}

	Map map = null;
	
	public String statDaily() throws Exception
	{
		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
		map = getReqMap();
		
		//����ID������
		putDataMap("sensor_id_list", commonDao.getP_SensorId(map) );
		
		return "statDail_success";
	}
	
	public String statMonthly() throws Exception
	{
		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
		map = getReqMap();
		
		//����ID������
		putDataMap("sensor_id_list", commonDao.getP_SensorId(map) );
		
		//year selector
		putDataMap("year_list", commonDao.getYearSelector() );
		
		//month selector
		putDataMap("month_list", commonDao.getMonthSelector() );
		
		return "statMonth_success";
	}
	
	public String statTrouble() throws Exception
	{
		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
		map = getReqMap();
		
		// �ʱ⿡ �˻����� ���翡�� �Ѵ������� ���ڸ� ������ ����Ÿ�� �ѷ� �ش�.

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
		
		
		
		
		int resultCount = statDao.sensorTroubleCount(map);
		
		putDataMap("resultCount", resultCount);

		List statTot = statDao.statTroubleSen(map);
		Map totMap = null;
		
		int cri = 0;
		int maj = 0;
		int vY = 0 ;
		int vN = 0 ;
		//��ġ��
		int totCri_maj = 0;
		int totYN = 0;
		
		for( int i=0; i<statTot.size(); i++ )
		{
			totMap = (Map)statTot.get(i);
			
			if( Integer.parseInt( totMap.get("trouble_cri_count").toString() ) >= 0 )
			{
				cri += Integer.parseInt( totMap.get("trouble_cri_count").toString() ) ;
			}
			
			if( Integer.parseInt( totMap.get("trouble_maj_count").toString() ) >= 0 )
			{
				maj += Integer.parseInt( totMap.get("trouble_maj_count").toString() );
			}
			
			if( Integer.parseInt( totMap.get("trouble_y_count").toString() ) >= 0 )
			{
				vY += Integer.parseInt( totMap.get("trouble_y_count").toString() );
			}
			
			if( Integer.parseInt( totMap.get("trouble_n_count").toString() ) >= 0 )
			{
				vN += Integer.parseInt( totMap.get("trouble_n_count").toString() );
			}
			
			
		}
		
		totCri_maj = cri + maj;
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
		putDataMap("cri", cri);
		putDataMap("maj", maj);
	    putDataMap("listSensor", statDao.statTroubleSen(getPaging(resultCount)));
		
		
		return "statTrouble";
	}
	
	public String statTroubleErr() throws Exception
	{
		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
		map = getReqMap();
		
		// �ʱ⿡ �˻����� ���翡�� �Ѵ������� ���ڸ� ������ ����Ÿ�� �ѷ� �ش�.

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
		
		int resultCount = statDao.sensorErrCount(map);
		putDataMap("resultCount", resultCount);
	
		List statTot = statDao.statErrSen(map);
		Map totMap = null;
		
		int sen = 0;
		int net = 0;
		int vY = 0 ;
		int vN = 0 ;
		//��ġ��
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
		putDataMap("listSensor", statDao.statErrSen(getPaging(resultCount)));
		
		
		return "statTroubleErr";
	}
	
	public String statErr() throws Exception
	{
		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
		map = getReqMap();
		
		// �ʱ⿡ �˻����� ���翡�� �Ѵ������� ���ڸ� ������ ����Ÿ�� �ѷ� �ش�.

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
		
		int resultCount = statDao.countStatTotal_err(map);
		
		putDataMap("resultCount", resultCount);
		putDataMap("listSensor", statDao.statTotal_err(getPaging(resultCount)));
		
		
		return "statErr";
	}
	
	
	/*
	 * ������ ��ġ����Ʈ����
	 */
	public String troubleYlist() throws Exception
	{
		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
		map = getReqMap();
		
		int resultCount = statDao.counttroubleY(map);
		putDataMap("troubleYlist", statDao.troubleY_SubMain(getPaging(resultCount)));
		
		return "troubleYlist";
	}
	
	/*
	 * ������ ����ġ����Ʈ����
	 */
	public String troubleNlist() throws Exception
	{
		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
		map = getReqMap();
		
		int resultCount = statDao.counttroubleN(map);
		putDataMap("troubleNlist", statDao.troubleN_SubMain(getPaging(resultCount)));
		
		return "troubleNlist";
	}
	/**
	 * �溸 �׷��� ǥ��
	 * @return
	 * @throws Exception
	 */
	public String chartAlarmPie3D() throws Exception
	{
		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
		map = getReqMap();
		
		
		putDataMap("chartAlarmPie3D", statDao.chartAlarmPie3D(map));
		
		return "chartAlarmPie3D" ;
	}
	
	
	/**
	 * ��� �׷��� ǥ��
	 * @return
	 * @throws Exception
	 */
	public String chartErrPie3D() throws Exception
	{
		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
		map = getReqMap();
		
		//�������� ���� �� ����
		int totSen = statDao.sensorTot(map);
		
		//�������� ��� �� ����
		int errSen = statDao.errorTot(map);
		
		putDataMap("totSen", totSen);
		putDataMap("errSen", errSen);
		
		putDataMap("chartErrPie3D", statDao.chartErrPie3D(map));
		return "chartErrPie3D";
	}
	
	/**
	 * ��ġ �溸 �׷��� ǥ��
	 * @return
	 * @throws Exception
	 */
	public String chartTroubleLst() throws Exception
	{
		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
		map = getReqMap();
		
		
		StringBuffer strBT = new StringBuffer();
		
		//��ġ.����ġ ����
//		putDataMap("chartTroubleLst", statDao.markinYnTot(map));
		
		
		List dataSet = statDao.statTroubleSen(map);
		Map dataMap = null;
		
		//�׷��� �׸������� ���������� 10�� �̻��̸� ���� 5�� ���� �׷�����  �׸���� ��
		
		int a = 0;
		
		if( dataSet.size() > 10 ) a = 5;
		else                      a = dataSet.size();
		
		strBT.append("<categories>");
        for(int _i=0;_i<a;_i++){
        	
        	dataMap = (Map)dataSet.get(_i);
            String vValue = dataMap.get("sensor_id").toString();
            
//            String mm = vValue.substring(4, 6);
//            String dd = vValue.substring(6, 8);
//            
//            String mmDD = mm+"/"+dd;
//            
            strBT.append("<category name='");
            strBT.append(vValue);
            strBT.append("'/>" );
        }
        strBT.append("</categories>\n" );
		
        String[] colorV = {"FFCC00","FB380F"};
        String[] colornm = {"���","����"};
        
        String cri = "";
    	String maj = "";
    	String yyyy = "";
    	
    	strBT.append("<dataset seriesName='"+ colornm[0] +"' color='"+ colorV[0] +"'> " );
        for(int i=0;i<a;i++){
        	
        	dataMap = (Map)dataSet.get(i);
        	cri = dataMap.get("trouble_cri_count").toString();	
			
			
			strBT.append("<set value='" );
			strBT.append(cri);
			strBT.append("'/>\n" );
	 	}
        strBT.append("</dataset>\n" );  
        
        strBT.append("<dataset seriesName='"+ colornm[1] +"' color='"+ colorV[1] +"'> " );
        for(int i=0;i<a;i++){
        	
        	dataMap = (Map)dataSet.get(i);
    		maj = dataMap.get("trouble_maj_count").toString();	
			
			
			strBT.append("<set value='" );
			strBT.append(maj);
			strBT.append("'/>\n" );
	 	}
        strBT.append("</dataset>\n" );  
        putDataMap("sCnt", a);
	 	putDataMap("rsGraph", strBT.toString());
        
		return "chartTroubleLst";
	}
	
	/**
	 * ��ġ ��� �׷��� ǥ��
	 * @return
	 * @throws Exception
	 */
	public String chartTroubleLstErr() throws Exception
	{
		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
		map = getReqMap();
		
		
		StringBuffer strBT = new StringBuffer();
		
		//��ġ.����ġ ����
//		putDataMap("chartTroubleLst", statDao.markinYnTot(map));
		
		List dataSet = statDao.statErrSen(map);
		Map dataMap = null;
		
		//�׷��� �׸������� ���������� 10�� �̻��̸� ���� 5�� ���� �׷�����  �׸���� ��
		
		int a = 0;
		
		if( dataSet.size() > 10 ) a = 5;
		else                      a = dataSet.size();
		
		strBT.append("<categories>");
        for(int _i=0;_i<a;_i++){
        	
        	dataMap = (Map)dataSet.get(_i);
            String vValue = dataMap.get("sensor_id").toString();
            
            strBT.append("<category name='");
            strBT.append(vValue);
            strBT.append("'/>\n" );
        }
        strBT.append("</categories>\n" );
		
        String[] colorV = {"FF99FF","33FF99"};
        String[] colornm = {"��������","��Ʈ��ũ���"};
        
    	String sen = "";
    	String net = "";
    	String yyyy = "";
    	
       strBT.append("<dataset seriesName='"+ colornm[0] +"' color='"+ colorV[0] +"'> " );
        for(int i=0;i<a;i++){
        	
        	dataMap = (Map)dataSet.get(i);
    		sen = dataMap.get("err_sen_count").toString();	
			
			
			strBT.append("<set value='" );
			strBT.append(sen);
			strBT.append("'/>\n" );
	 	}
        strBT.append("</dataset>\n" );  
        
        strBT.append("<dataset seriesName='"+ colornm[1] +"' color='"+ colorV[1] +"'> " );
        for(int i=0;i<a;i++){
        	
        	dataMap = (Map)dataSet.get(i);
    		net = dataMap.get("err_net_count").toString();	
			
			
			strBT.append("<set value='" );
			strBT.append(net);
			strBT.append("'/>\n" );
	 	}
        strBT.append("</dataset>\n" );  
        putDataMap("sCnt", a);
	 	putDataMap("rsGraph", strBT.toString());
        
		return "chartTroubleLstErr";
	}
	
	
	/**
	 * �׷��� ǥ��
	 * @return
	 * @throws Exception
	 */
	public String graphDay() throws Exception {
		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
		map = getReqMap();

		String dateProd = "";
		String[] prodDT = map.get("prod_dt").toString().split("-");
		
		for( int __i=0; __i<prodDT.length; __i++ )
		{
			dateProd += prodDT[__i]; 
		}
		
		map.put("prod_dt", dateProd);
		
        StringBuffer strBT = new StringBuffer();
        
        Map senMap = null;
        Map<String, String> almMap = null;
        List callLineCahart = null;
        String senH = "";
        String senF = "";
        int modVal = 0;
        
        if( statDao.sensor(map) != null )
        {
        	senMap = (Map)statDao.sensor(map);
        	
        	//��Ʈ��� ����� �޼ҵ� ȣ��
        	senH = this.setChartHeaderDay(senMap);
        	
        	//��Ʈ TREND LINE & footer ����� �޼ҵ� ȣ��
        	senF = this.setChartTrendLineDay(senMap);
        }
        else
        {
        	 return "graph_fail";
        }
        
    	if( "day".equals(map.get("graphTyp")) )
    	{
    		modVal = 60;
    		callLineCahart = statDao.graph(map);
     		if( callLineCahart.size() == 0 || callLineCahart == null )
        	{
     			return "graph_fail";
        	}
    	}
    	else
    	{
    		modVal = 144;
    		callLineCahart = statDao.graph(map);
    		if( callLineCahart.size() == 0 || callLineCahart == null )
        	{
     			return "graph_fail";
        	}
    	}
        
        /*
         * category ����
         * x ��  ī�װ� ����
         */
        strBT.append("<categories>");
        for(int _i=0;_i<callLineCahart.size();_i++){
        	
        	almMap = (Map)callLineCahart.get(_i);
            String vValue = almMap.get("x_value").toString();
            
            strBT.append("<category name='");
            if ( _i > 0 && _i%modVal==0 )
            	strBT.append(vValue);
            strBT.append("'/>\n" );
        }
        strBT.append("</categories>\n" );
        
        
        
        String[] colorV = {"1D8BD1","080808","2AD62A"};
        String[] colornm = {"High","Average","Low"};
        String senVal = "";
    	String lowVal = "";
    	String highVal = "";
    	String averVal = "";
    	
		
		
		strBT.append("<dataset seriesName='"+ colornm[0] +"' color='"+ colorV[0] +"'> " );
		for(int i=0;i<callLineCahart.size();i++){
			
			almMap = (Map)callLineCahart.get(i);
			
			lowVal = String.valueOf( almMap.get("low_value") );
			highVal = String.valueOf( almMap.get("high_value") );
			averVal = String.valueOf( almMap.get("average_value") );
			
			strBT.append("<set value='" );
		    strBT.append(highVal);
		    strBT.append("'/>" );
		    strBT.append("\n" );
		}
		strBT.append("</dataset>\n" );
		 
		strBT.append("<dataset seriesName='"+ colornm[1] +"' color='"+ colorV[1] +"'> " );
		for(int i=0;i<callLineCahart.size();i++){
			
			almMap = (Map)callLineCahart.get(i);
			
			lowVal = String.valueOf( almMap.get("low_value") );
			highVal = String.valueOf( almMap.get("high_value") );
			averVal = String.valueOf( almMap.get("average_value") );
			
			strBT.append("<set value='" );
		    strBT.append(averVal);
		    strBT.append("'/>" );
		    strBT.append("\n" );
		}
		strBT.append("</dataset>\n" );
		 
		strBT.append("<dataset seriesName='"+ colornm[2] +"' color='"+ colorV[2] +"'> " );
		for(int i=0;i<callLineCahart.size();i++){
			
			almMap = (Map)callLineCahart.get(i);
			
			lowVal = String.valueOf( almMap.get("low_value") );
			highVal = String.valueOf( almMap.get("high_value") );
			averVal = String.valueOf( almMap.get("average_value") );
			
			strBT.append("<set value='" );
		    strBT.append(lowVal);
		    strBT.append("'/>" );
		    strBT.append("\n" );
		}
		strBT.append("</dataset>\n" );
         	 
        
               
        putDataMap("rsGraph", senH+strBT.toString()+senF);
            
        return "graph_success";
		
		
	}

	//��Ʈ��� ����� �޼ҵ�
	public String setChartHeaderDay(Map mapV)
	{
		String xAxisnm = "";
		String sneTypnm = mapV.get("SENSOR_TYPE_NM").toString();
    	
    	String sneLocnm = mapV.get("LOC_NM").toString();
    	String xloc = mapV.get("X_LOC").toString();
    	String yloc = mapV.get("Y_LOC").toString();
    	String zloc = mapV.get("Z_LOC").toString();
    	
    	//���� ���� ����
//    	String senUnit = mapV.get("unit").toString();
    	
    	Double h_Range = Double.valueOf( mapV.get("h_inst_range_lmt_1").toString() );
    	Double l_Range = Double.valueOf( mapV.get("l_inst_range_lmt_1").toString() );
    	
    	String subCap ="x��ġ:" + xloc + ",  y��ġ:" + yloc + ",  z��ġ:" + zloc;
    	String senUnit = mapV.get("sensor_type_cd").toString();
    	String unitVal = "";
    	if( "1".equals(senUnit) )
    	{
    		unitVal = "Nano Meter(nm)";	
    	}
    	else if( "2".equals(senUnit) )
    	{
    		unitVal = "Angle(��)";	
    	}
    	else
    	{
    		unitVal = "Temperature(��)";
    	}
    	
    	if( map.get("graphTyp") != null )
    	{
    		if("mon".equals(map.get("graphTyp"))) xAxisnm = "����";
    		if("day".equals(map.get("graphTyp"))) xAxisnm = "�Ϻ�";
    	}
    	
    	
		String headerVal =   "<graph caption='"+ sneTypnm +"' subcaption='["+ subCap +"]' baseFont='����' baseFontSize = '11' thickness='1'" 
							+ "lineColor='0000FF' xAxisName='"+ xAxisnm +"' yAxisName='"+unitVal+"' yAxisMinValue='"+ l_Range +"' yAxisMaxValue='"+ h_Range +"' " 
							+ "rotateNames='0' numdivlines='5'  showNames='1' decimalPrecision='2' formatNumberScale='1'  showValues='0' animation='1'	showAnchors='1' anchorRadius='1' >";
		
		return headerVal;
	}
	
	
	//��Ʈ TREND LINE ����� �޼ҵ�
	public String setChartTrendLineDay(Map mapV)
	{
		String hCri = mapV.get("h_cri_lmt").toString();
    	String hMaj = mapV.get("h_maj_lmt").toString();
    	String lCri = mapV.get("l_cri_lmt").toString();
    	String lMaj = mapV.get("l_maj_lmt").toString();
    	
    	//������
    	String baseVal = mapV.get("base_value").toString();
    	String trndLine = "";
    	if( ! "0".equals(baseVal) ) trndLine = " <line startValue='"+ baseVal +"' thickness='1' color='#757575' displayValue='������' showOnTop='0'/>" ;
    	else                        trndLine = "";
    	
		String trendLine = " <trendlines> "
//						 + " <line startValue='"+ hCri +"' thickness='1' color='#D9001C' displayValue='����' showOnTop='1'/>"
//						 + " <line startValue='"+ hMaj +"' thickness='1' color='#FF9900' displayValue='���' showOnTop='1'/>"
//						 + " <line startValue='"+ lCri +"' thickness='1' color='#D9001C' displayValue='����' showOnTop='1'/>"
//						 + " <line startValue='"+ lMaj +"' thickness='1' color='#FF9900' displayValue='���' showOnTop='1'/>"
						 + trndLine
						 + " </trendlines></graph>";
		
		return trendLine;
	}

	/**
	 * ��ü���
	 * 
	 * @return
	 * @throws Exception
	 */
	public String statTotal() throws Exception {
		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
		map = getReqMap();

		// �ʱ⿡ �˻����� ���翡�� �Ѵ������� ���ڸ� ������ ����Ÿ�� �ѷ� �ش�.
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

		// �������� ������
		putDataMap("sensor_type_list", commonDao.getP_SensorTypId(map) );
		// �溸��� ������
		putDataMap("troubleclass_list", commonDao.getTroubleClass(map));
		// �溸��ġ���� ������
		putDataMap("markingyn_list1", commonDao.getYN(map));
		// ������� ������
		putDataMap("errtpye_list", commonDao.getErrType(map));
		// �����ġ���� ������
		putDataMap("markingyn_list2", commonDao.getYN(map));
		//����������������
		putDataMap("struct_comp_list", commonDao.getP_StructComp(map) );

		
		int resultCount = statDao.countStatTotal_err(map);
		putDataMap("resultCount", resultCount);
		
		List statTot = statDao.statTotal_err(map);
		Map totMap = null;
		
		int sen = 0;
		int net = 0;
		int vY = 0 ;
		int vN = 0 ;
		//��ġ��
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
		putDataMap("rsStatTotal", statDao.statTotal_err(getPaging(resultCount)));
		
		return "statTotal_success";
	}
	
	public String statTotalTrouble() throws Exception {
		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
		map = getReqMap();

		// �ʱ⿡ �˻����� ���翡�� �Ѵ������� ���ڸ� ������ ����Ÿ�� �ѷ� �ش�.
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

		// �������� ������
		putDataMap("sensor_type_list", commonDao.getP_SensorTypId(map) );
		// �溸��� ������
		putDataMap("troubleclass_list", commonDao.getTroubleClass(map));
		// �溸��ġ���� ������
		putDataMap("markingyn_list1", commonDao.getYN(map));
		//����������������
		putDataMap("struct_comp_list", commonDao.getP_StructComp(map) );

		
		int resultCount = statDao.countStatTotal_tro(map);
		putDataMap("resultCount", resultCount);
		
		List statTot = statDao.statTotal_tro(map);
		Map totMap = null;
		
		int cri = 0;
		int maj = 0;
		int vY = 0 ;
		int vN = 0 ;
		//��ġ��
		int totCri_maj = 0;
		int totYN = 0;
		
		for( int i=0; i<statTot.size(); i++ )
		{
			totMap = (Map)statTot.get(i);
			
			if( Integer.parseInt( totMap.get("trouble_cri_count").toString() ) >= 0 )
			{
				cri += Integer.parseInt( totMap.get("trouble_cri_count").toString() ) ;
			}
			
			if( Integer.parseInt( totMap.get("trouble_maj_count").toString() ) >= 0 )
			{
				maj += Integer.parseInt( totMap.get("trouble_maj_count").toString() );
			}
			
			if( Integer.parseInt( totMap.get("trouble_y_count").toString() ) >= 0 )
			{
				vY += Integer.parseInt( totMap.get("trouble_y_count").toString() );
			}
			
			if( Integer.parseInt( totMap.get("trouble_n_count").toString() ) >= 0 )
			{
				vN += Integer.parseInt( totMap.get("trouble_n_count").toString() );
			}
			
			
		}
		
		totCri_maj = cri + maj;
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
		putDataMap("cri", cri);
		putDataMap("maj", maj);
		putDataMap("rsStatTotal_tro", statDao.statTotal_tro(getPaging(resultCount)));
		
		return "statTotalTro_success";
	}
	
	public String chartTroubleLst_tr() throws Exception
	{
		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
		map = getReqMap();
		
		StringBuffer strBT = new StringBuffer();
		
		//��ġ.����ġ ����
//		putDataMap("chartTroubleLst", statDao.markinYnTot(map));
		
		List dataSet = statDao.statTotal_tro(map);
		Map dataMap = null;
		
		strBT.append("<categories>");
        for(int _i=0;_i<dataSet.size();_i++){
        	
        	dataMap = (Map)dataSet.get(_i);
            String vValue = dataMap.get("stat_dt").toString();
            
            String mm = vValue.substring(4, 6);
            String dd = vValue.substring(6, 8);
            
            String mmDD = mm+"/"+dd;
            
            strBT.append("<category name='");
            if( _i%3 == 0 ) strBT.append(mmDD);
            strBT.append("'/>\n" );
        }
        strBT.append("</categories>\n" );
		
        String[] colorV = {"FFCC00","FB380F"};
        String[] colornm = {"���","����"};
        
        String cri = "";
    	String maj = "";
    	String yyyy = "";
    	
    	if( map.get("p_troubleclass").equals("2") )
    	{
    		strBT.append("<dataset seriesName='"+ colornm[0] +"' color='"+ colorV[0] +"'> " );
            for(int i=0;i<dataSet.size();i++){
            	
            	dataMap = (Map)dataSet.get(i);
            	cri = dataMap.get("trouble_maj_count")==null?"0":dataMap.get("trouble_maj_count").toString();	
    			
    			strBT.append("<set value='" );
    			strBT.append(cri);
    			strBT.append("'/>\n" );
    	 	}
            strBT.append("</dataset>\n" ); 
    	}
    	else if(  map.get("p_troubleclass").equals("1") )
    	{
    		strBT.append("<dataset seriesName='"+ colornm[1] +"' color='"+ colorV[1] +"'> " );
	        for(int i=0;i<dataSet.size();i++){
	        	
	        	dataMap = (Map)dataSet.get(i);
	    		maj = dataMap.get("trouble_cri_count")==null?"0":dataMap.get("trouble_cri_count").toString();	
				
				strBT.append("<set value='" );
				strBT.append(maj);
				strBT.append("'/>\n" );
		 	}
	        strBT.append("</dataset>\n" ); 
    	}
    	else
    	{
    		strBT.append("<dataset seriesName='"+ colornm[0] +"' color='"+ colorV[0] +"'> " );
            for(int i=0;i<dataSet.size();i++){
            	
            	dataMap = (Map)dataSet.get(i);
            	cri = dataMap.get("trouble_maj_count")==null?"0":dataMap.get("trouble_maj_count").toString();	
    			
    			strBT.append("<set value='" );
    			strBT.append(cri);
    			strBT.append("'/>\n" );
    	 	}
            strBT.append("</dataset>\n" );  
            
            strBT.append("<dataset seriesName='"+ colornm[1] +"' color='"+ colorV[1] +"'> " );
            for(int i=0;i<dataSet.size();i++){
            	
            	dataMap = (Map)dataSet.get(i);
        		maj = dataMap.get("trouble_cri_count")==null?"0":dataMap.get("trouble_cri_count").toString();	
    			
    			strBT.append("<set value='" );
    			strBT.append(maj);
    			strBT.append("'/>\n" );
    	 	}
            strBT.append("</dataset>\n" );
    	}
    	
    	  
        
	 	putDataMap("rsGraph", strBT.toString());
        
		return "chartTroubleLst_tr";
	}
	
	public String chartError_tr() throws Exception
	{
		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
		map = getReqMap();
		
		StringBuffer strBT = new StringBuffer();
		
		//��ġ.����ġ ����
//		putDataMap("chartTroubleLst", statDao.markinYnTot(map));
		
		List dataSet = statDao.statTotal_err(map);
		Map dataMap = null;
		
		strBT.append("<categories>");
        for(int _i=0;_i<dataSet.size();_i++){
        	
        	dataMap = (Map)dataSet.get(_i);
            String vValue = dataMap.get("stat_dt").toString();
            
            String mm = vValue.substring(4, 6);
            String dd = vValue.substring(6, 8);
            
            String mmDD = mm+"/"+dd;
            
            strBT.append("<category name='");
            if( _i%3 == 0 ) strBT.append(mmDD);
            strBT.append("'/>\n" );
        }
        strBT.append("</categories>\n" );
		
        String[] colorV = { "#0000FF","#006600"};
        String[] colornm = {"��������","��Ʈ��ũ���"};
        
    	String sen = "";
    	String net = "";
    	String yyyy = "";
    	
    	if( map.get("p_errtype").equals("1") )
    	{
    		strBT.append("<dataset seriesName='"+ colornm[0] +"' color='"+ colorV[0] +"'> " );
            for(int i=0;i<dataSet.size();i++){
            	
            	dataMap = (Map)dataSet.get(i);
            	sen = dataMap.get("err_sen_count")==null?"0":dataMap.get("err_sen_count").toString();	
    			
    			strBT.append("<set value='" );
    			strBT.append(sen);
    			strBT.append("'/>\n" );
    	 	}
            strBT.append("</dataset>\n" );  
    	}
    	else if( map.get("p_errtype").equals("2") )
    	{
    		strBT.append("<dataset seriesName='"+ colornm[1] +"' color='"+ colorV[1] +"'> " );
            for(int i=0;i<dataSet.size();i++){
            	
            	dataMap = (Map)dataSet.get(i);
        		net = dataMap.get("err_net_count")==null?"0":dataMap.get("err_net_count").toString();	
    			
    			strBT.append("<set value='" );
    			strBT.append(net);
    			strBT.append("'/>\n" );
    	 	}
            strBT.append("</dataset>\n" );  
    	}
    	else
    	{
    		strBT.append("<dataset seriesName='"+ colornm[0] +"' color='"+ colorV[0] +"'> " );
            for(int i=0;i<dataSet.size();i++){
            	
            	dataMap = (Map)dataSet.get(i);
            	sen = dataMap.get("err_sen_count")==null?"0":dataMap.get("err_sen_count").toString();	
    			
    			strBT.append("<set value='" );
    			strBT.append(sen);
    			strBT.append("'/>\n" );
    	 	}
            strBT.append("</dataset>\n" ); 
            
            strBT.append("<dataset seriesName='"+ colornm[1] +"' color='"+ colorV[1] +"'> " );
            for(int i=0;i<dataSet.size();i++){
            	
            	dataMap = (Map)dataSet.get(i);
        		net = dataMap.get("err_net_count")==null?"0":dataMap.get("err_net_count").toString();	
    			
    			strBT.append("<set value='" );
    			strBT.append(net);
    			strBT.append("'/>\n" );
    	 	}
            strBT.append("</dataset>\n" );  
    	}
        
        
        
	 	putDataMap("rsGraph", strBT.toString());
        
		return "chartError_tr";
	}
	
}
