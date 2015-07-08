/*
 * UserDao.java 1.0, 2009. 5. 27.
 * 
 * Copyright (c) 2008 BY LSWARE INC. All rights reserved.
 */

package shms.dao.baseInfo;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import com.command.OAMPCommandManager;

import shms.common.ShmsCommon;

public class SensorManageDao {

    private SqlMapClientTemplate sqlMapClientTemplate;
	
   
    
    public void setSqlMapClientTemplate(SqlMapClientTemplate sqlMapClientTemplate) {
		this.sqlMapClientTemplate = sqlMapClientTemplate;
	}
    
    /**
     * ppp_�Է� ȭ��
     * @param map
     * @return
     */
	public void addSensor(Map map){
		sqlMapClientTemplate.insert("addSensor", map);
	}
	
  	
	/**
	 * p_ī��Ʈ
	 * @param map
	 * @return
	 */
	public int p_countSensorDoing(Map map){
		
		return (Integer)sqlMapClientTemplate.queryForObject("countSensorDoing", map);
	}
	
	/**
     * P �� ��ȸ
     * @param map
     * @return
     */
	public Object p_detailSensor(Map map){

    	return sqlMapClientTemplate.queryForObject("detailSensor", map);
	}
	
	
	/**
	 * P ����
	 */
	public Object modViewSensor(Map map)
	{
		return sqlMapClientTemplate.queryForObject("detailSensor", map);
	}
	
		/**
	    * P_����Ʈ ��ȸ
	    * @param map
	    * @return
	    */
		public List p_listSensor(Map map){

			
			List alrLstA = sqlMapClientTemplate.queryForList("listSensor", map);
			
//			// ����¡ ������ ��� ������ȣ �ֱ�
//			int nPage = Integer.parseInt(map.get("nowPage").toString());
//			int endPage = Integer.parseInt(map.get("endRow").toString());
//			
//			int a = ShmsCommon.rtPageNum(nPage, endPage);
//			
//			Map<String,String> almMap = null;
//			for(int i=0;i<alrLstA.size(); i++)
//			{
//				almMap = (Map)alrLstA.get(i);
//				almMap.put("msr_item_id", ShmsCommon.getMsrItemMap(almMap.get("msr_item_id"))  );
//				almMap.put("sensor_type_id", ShmsCommon.getSenTypeMap(almMap.get("sensor_type_id"))  );
//			}
	     	return alrLstA;
		}
	
	
	/**
	 *PPP ����Ʈ ����
	 * @param map
	 * @return
	 */
	public void delSensor(Map map){
		
		sqlMapClientTemplate.delete("delSensor", map);
	}
	
	/**
	 * PPP ���� ����
	 */
	public void editSensor(Map map)
	{
		sqlMapClientTemplate.update("upDateSensor", map);
	}
	
	public void editSensorInst(Map map)
	{
		sqlMapClientTemplate.update("editSensor_INST", map);
	}
	public void editSensorTyp(Map map)
	{
		sqlMapClientTemplate.update("editSensor_TYPE", map);
	}
	
	public int sensorIdChk(Map map){
		
		return (Integer)sqlMapClientTemplate.queryForObject("sensorIdChk", map);
	}
	
	public String callManage(String senId) {

		String testVIP = "";
		OAMPCommandManager rsltTest = new OAMPCommandManager();
		try {
			 testVIP = rsltTest.sendMsg2OM(senId);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			System.out.println("network error ===>"+e);
			testVIP = null;
		}
		
		return testVIP;
	}
	
	
}

