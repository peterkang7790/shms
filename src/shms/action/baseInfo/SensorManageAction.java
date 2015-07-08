/*
 * sensorManageAction.java
 * @author ������
 * @version 1.0 
 * @Date 2010. 01. 28.
 * Copyright (c) 2008 BY LSWARE INC. All rights reserved.
 */

package shms.action.baseInfo;

import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import shms.common.Log4j;
import shms.common.ParamMap;
import shms.dao.baseInfo.SensorManageDao;
import shms.dao.common.CommonDao;
import shms.dao.instManage.rptRtStatDao;


/**
 * 
 * @author ������
 * @version 1.0,  2009. 10. 22.
 */
public class SensorManageAction extends ParamMap {

	private SensorManageDao sensorManageDao;
	private String checkedmsr;
	private String checkedSsensor;
	private String checkgubun;
	private CommonDao commonDao;
	private rptRtStatDao rptRtStatDao;
	
	public rptRtStatDao getRptRtStatDao() {
		return rptRtStatDao;
	}

	public void setRptRtStatDao(rptRtStatDao rptRtStatDao) {
		this.rptRtStatDao = rptRtStatDao;
	}

	public void setCommonDao(CommonDao commonDao) {
		this.commonDao = commonDao;
	}

	public String getCheckgubun() {
		return checkgubun;
	}

	public void setCheckgubun(String checkgubun) {
		this.checkgubun = checkgubun;
	}

	public String getCheckedmsr() {
		return checkedmsr;
	}

	public void setCheckedmsr(String checkedmsr) {
		this.checkedmsr = checkedmsr;
	}

	public String getCheckedSsensor() {
		return checkedSsensor;
	}

	public void setCheckedSsensor(String checkedSsensor) {
		this.checkedSsensor = checkedSsensor;
	}

	Map map = null;
	
	public SensorManageDao getSensorManageDao() {
		return sensorManageDao;
	}

	public void setSensorManageDao(SensorManageDao sensorManageDao) {
		this.sensorManageDao = sensorManageDao;
	}
	
	/*
	 * PPP ����Ʈ
	 */
	public String listSensor() throws Exception
	{
		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
		map = getReqMap();
		
		String sensor_id = "";
		if( map.get("sensor_id_nm") != null )
		{
			map.put("sensor_id", map.get("sensor_id_nm").toString());
		}
		
		
		int resultCount = sensorManageDao.p_countSensorDoing(map);
		
		//����ID������
		putDataMap("sensor_list", commonDao.getP_SensorId(map) );
		//��������������
		putDataMap("sensor_type_list", commonDao.getP_SensorTypId(map) );
		//detector ������
		putDataMap("detector_list", commonDao.getP_DetectorId(map) );
		//Channel ������
		putDataMap("channel_list", commonDao.getP_ChannelId(map) );
		
		
		putDataMap("resultCount", resultCount );
//		putDataMap("senTypeidMap", ShmsCommon.getSenTypeMap() );
		putDataMap("listSensor", sensorManageDao.p_listSensor(getPaging(resultCount)));
		return "listSensor_success";
	}
	/*
	 * PPP ������
	 */
	public String detailSensor() throws Exception
	{
		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
		map = getReqMap();
		putDataMap("detailSensor", sensorManageDao.p_detailSensor(map));
		putDataMap("rsSensorPosObj", rptRtStatDao.sensorPosObj(map));
		return "detailSensor_success";
	}
	
	//PPP ����
	public String editViewSensor() throws Exception
	{
		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
		map = getReqMap();
		
		String verTyp = "";
		
		putDataMap(verTyp, "editView" );
		
		//����ID������
		putDataMap("ref_sensor_list", commonDao.getP_AllSensorId(map) );
		//��������������
		putDataMap("sensor_type_list", commonDao.getP_SensorTypId(map) );
		//detector ������
		putDataMap("detector_list", commonDao.getP_DetectorId(map) );
		//Channel ������
		putDataMap("channel_list", commonDao.getP_ChannelId(map) );
		//�����׸񼿷���
		putDataMap("inst_item_list", commonDao.getP_InstItem(map) );
		//����������������
		putDataMap("struct_comp_list", commonDao.getP_StructComp(map) );
		
		
		putDataMap("detailSensor", sensorManageDao.modViewSensor(map));
		putDataMap("rsSensorPosObj", rptRtStatDao.sensorPosObj(map));
		return "editViewSensor_success";
	}
	
	public String delSensor() throws Exception{
		
		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
		map = getReqMap();
		
		sensorManageDao.delSensor(getReqMap());
		
		String sensorId = "1^";
		String rsltVal = this.realMeasureInfodata(sensorId);
		if( "error_network".equals(rsltVal) )
		{
			putDataMap("errorMsg", "���� ������ �ñ׳� �˸� ����");
			return "addSensor_fail";
		}
		else
		{
			putDataMap("okMsg", "���� ������ �ñ׳� �˸�  ����");
		}
		
		return "delSensor_success";
	}
	
	//PPP����
	public String editSensor() throws Exception
	{
		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
		map = getReqMap();
		
		sensorManageDao.editSensor(map);
		putDataMap("detailSensor", sensorManageDao.modViewSensor(map));
		String interFaceYn = commonDao.getInterfaceYN(map);
		String sensorId = "";
		if("Y".equals(interFaceYn))
		{
			sensorId = "1^";
			String rsltVal = this.realMeasureInfodata(sensorId);
			
			if( "error_network".equals(rsltVal) )
			{
				putDataMap("errorMsg", "���� ������ �ñ׳� �˸� ����");
				return "addSensor_fail";
			}
			else
			{
				putDataMap("okMsg", "���� ������ �ñ׳� �˸�  ����");
			}
		}
		
		return "editSensor_success";
	}
	
	// ppp �űԵ�� ȭ��
	public String addViewSensor() throws Exception
	{
		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
		map = getReqMap();
		
		//������ ��ǥ �̹��� �����´�
		
		String[] imageP = String.valueOf( commonDao.getImageStr(map) ).split("=");
		
		putDataMap("strImage", imageP[1].replace("}", "") );
		
		//����ID������
		putDataMap("ref_sensor_list", commonDao.getP_AllSensorId(map) );
		//��������������
		putDataMap("sensor_type_list", commonDao.getP_SensorTypId(map) );
		//detector ������
		putDataMap("detector_list", commonDao.getP_DetectorId(map) );
		//Channel ������
		putDataMap("channel_list", commonDao.getP_ChannelId(map) );
		//�����׸񼿷���
		putDataMap("inst_item_list", commonDao.getP_InstItem(map) );
		//����������������
		putDataMap("struct_comp_list", commonDao.getP_StructComp(map) );
		

		
		return "addSensor";
	}
	
	public void selectField() throws Exception
	{
		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
		map = getReqMap();
		
		PrintWriter printWriter = null;
		String selectF = "";
		String rtnVal = "";
		Map<String,String> selMap = null;
		map = getReqMap();
    	List fieldSelect = commonDao.getdetectorChannelField(map);
    	try
		{
    		ServletActionContext.getResponse().setContentType("text/html;charset=utf-8");			
			printWriter = ServletActionContext.getResponse().getWriter();
			
			String id = "channel_id";
			
			selectF = "<select name=" + id + " id='" + id + "'>";
			
			for( int i=0; i<fieldSelect.size(); i++ )
			{
				selMap = (Map)fieldSelect.get(i);
				
				String selVal = "";
				String selName = "";
				
				if( selMap.get("channel_id") != null ) selVal = selMap.get("channel_id").toString();
				if( selMap.get("channel_nm") != null ) selName = selMap.get("channel_nm").toString();
				
				selectF += "<option  value='";
				selectF += selVal;
				selectF += "'>";
				selectF += selName;
				selectF += "</option>";
				
			}
			selectF += "</select>\n";
			printWriter.print(selectF);
		}
		catch (Exception e) 
		{
			Log4j.log.error("commonCdChkGatherData:", e);
		}
		finally
		{
			printWriter.close();
		}
	}
	public String reActionSensor() throws Exception
	{
		map = getReqMap();
		
		String sensorId = "2^"+ map.get("sensor_id").toString();
		
		String rsltVal = this.realMeasureInfodata(sensorId);
		
		if( "error_network".equals(rsltVal) )
		{
			putDataMap("errorMsg", "���� �缳�� ����");
			return "addSensor_fail";
		}
		else
		{
			putDataMap("sensor_id", map.get("sensor_id").toString());
			putDataMap("okMsg", "���� �缳�� ����");
		}
		
		return "re_action";
	}
	// ppp �űԵ�� 
	public String addSensor() throws Exception
	{
		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
		map = getReqMap();
	
		if(sensorManageDao.sensorIdChk(map) > 0){
			putDataMap("errorMsg", "�̹̻������ ID�Դϴ�");
			return "addSensor_error";
		}
		
		sensorManageDao.addSensor(map);
		
		String sensorId = map.get("sensor_id").toString();
		
		//����ID������
		putDataMap("ref_sensor_list", commonDao.getP_AllSensorId(map) );
		//��������������
		putDataMap("sensor_type_list", commonDao.getP_SensorTypId(map) );
		//detector ������
		putDataMap("detector_list", commonDao.getP_DetectorId(map) );
		//Channel ������
		putDataMap("channel_list", commonDao.getP_ChannelId(map) );
		//�����׸񼿷���
		putDataMap("inst_item_list", commonDao.getP_InstItem(map) );
		//����������������
		putDataMap("struct_comp_list", commonDao.getP_StructComp(map) );
		
		putDataMap("sensor_id",sensorId);
		
		String interFaceYn = String.valueOf(commonDao.getInterfaceYN(map));

		
		/*
		 * �������̽� ���ΰ� 'Y'�ΰ�쿡�� �Ŵ������� �ñ׳��� ������.
		 */
		if("Y".equals(interFaceYn))
		{
			sensorId = "1^";
			String rsltVal = this.realMeasureInfodata(sensorId);
			
			if( "error_network".equals(rsltVal) )
			{
				putDataMap("errorMsg", "���� �ű� �߰��ñ׳ξ˸� ����");
				return "addSensor_fail";
			}
			else
			{
				putDataMap("okMsg", "���� �ű� �߰��ñ׳ξ˸� ����");
			}
		}
		
		
		return "addSensor_success";
	}
	//
	
	public void sensorIdChk() throws Exception
	{
		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
		PrintWriter printWriter = null;
		try {
			ServletActionContext.getResponse().setContentType("text/html;charset=utf-8");			
			printWriter = ServletActionContext.getResponse().getWriter();
			
			String senId = getReqMap().get("sensor_id").toString();
			
			if( !"".equals(senId) )
			{
				if(sensorManageDao.sensorIdChk(getReqMap()) == 0){
					printWriter.print("<font color=blue> ����Ҽ� �ִ� ����ID ���Դϴ�.</font>");
				}
				else{
					printWriter.print("<font color=red> �̹� �����ϴ� ID ���Դϴ�.</font>");
				}
			}
			else
			{
				printWriter.print("<font color=red> ���� ID�� �Է��� �ּ���.</font>");
			}
			
			
				
		} catch (Exception e) {
			Log4j.log.error("sensorIdChkGatherData:", e);
		} finally{
			printWriter.close();
		}
	}
	
	public String realMeasureInfodata(String senId) throws Exception{
		
		String callManagerVal = sensorManageDao.callManage(senId);
		String rtnMsg;
			if( callManagerVal == null || ! "Y".equals(callManagerVal) || "".equals(callManagerVal) )
			{
				rtnMsg = "error_network";
			}
			else
			{
				rtnMsg = "ok_network";
			}
			
		return rtnMsg;
	}
}

