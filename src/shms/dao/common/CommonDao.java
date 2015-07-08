/*
 * Common.java 1.0, 2009. 6. 27.
 * 
 * Copyright (c) 2008 BY LSWARE INC. All rights reserved.
 */

package shms.dao.common;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import com.lsware.utils.DateUtils;
import com.lsware.utils.StringUtils;

public class CommonDao {
	
    private SqlMapClientTemplate sqlMapClientTemplate;
	
    public void setSqlMapClientTemplate(SqlMapClientTemplate sqlMapClientTemplate) {
		this.sqlMapClientTemplate = sqlMapClientTemplate;
	}	
	
    /**
     * sequenceNm�� �ش��ϴ� �̸��� sequence id�� �ҷ��´�.
     * @param sequenceNm
     * @return
     */
	public String SequenceId(String sequenceNm){
		return (String) sqlMapClientTemplate.queryForObject("commonSequenceId", sequenceNm);
	}
	
	/**
	 * �ڵ����̺��� codeType�� �ش��ϴ� ����Ʈ�� ����Ѵ�.
	 * @param codeType
	 * @return
	 */
	public List getCodeList(String codeType){
		return sqlMapClientTemplate.queryForList("commonListCode", codeType);
	}
	
	/**
	 * �����ħ�ؼ� ����Ʈ�� ����Ѵ�.
	 * @param codeType
	 * @return
	 */
	public List getRuleItem(){
		return sqlMapClientTemplate.queryForList("commonListRuleItem");
	}
	
	/**
	 * PPP �����׸� �����͸� ����Ѵ�.
	 * @param 
	 * @return
	 */
	public List getP_InstItem(Map map){
		return sqlMapClientTemplate.queryForList("commonListInstitem",map);
	}
	
	/**
	 * PPP ���������� �����͸� ����Ѵ�.
	 * @param 
	 * @return
	 */
	public List getP_StructComp(Map map){
		return sqlMapClientTemplate.queryForList("commonListStructComp",map);
	}
	
	/**
	 * PPP ���� �����͸� ����Ѵ�.
	 * @param 
	 * @return
	 */
	public List getP_SensorId(Map map){
		return sqlMapClientTemplate.queryForList("commonListSensor",map);
	}
	
	/**
	 * PPP ALL ���� �����͸� ����Ѵ�.
	 * @param 
	 * @return
	 */
	public List getP_AllSensorId(Map map){
		return sqlMapClientTemplate.queryForList("commonAllListSensor",map);
	}
	
	/**
	 * PPP �������� �����͸� ����Ѵ�.
	 * @param 
	 * @return
	 */
	public List getP_SensorTypId(Map map){
		return sqlMapClientTemplate.queryForList("commonListP_SensorType",map);
	}
	
	/**
	 * PPP Detector �����͸� ����Ѵ�.
	 * @param 
	 * @return
	 */
	public List getP_DetectorId(Map map){
		return sqlMapClientTemplate.queryForList("commonListP_Detector", map);
	}
	
	/**
	 * PPP Channel �����͸� ����Ѵ�.
	 * @param 
	 * @return
	 */
	public List getP_ChannelId(Map map){
		return sqlMapClientTemplate.queryForList("commonListP_Channel",map);
	}
	
	/**
	 * �����׸� �����͸� ����Ѵ�.
	 * @param 
	 * @return
	 */
	public List getMsrItem(Map map){
		return sqlMapClientTemplate.queryForList("commonListMsrItem",map);
	}
	
	/**
	 * �������� �����͸� ����Ѵ�
	 * @param 
	 * @return
	 */
	public List getSensorType(Map map){
		return sqlMapClientTemplate.queryForList("commonListSensorType",map);
	}
	
	/**
     * sequenceNm�� �ش��ϴ� �̸��� sequence id�� �ҷ��´�.
     * @param sequenceNm
     * @return
     */
	public String getSensorSeq(String sequenceNm){
		return (String)sqlMapClientTemplate.queryForObject("listSensor_getid",sequenceNm);
	}
	
	/**
	 * �����ħ �ؼ� rule_item_id�� �ش��ϴ� �����ħ�ؼ����׸� ����Ʈ�� ����Ѵ�.
	 * @param map parameter
	 * @return
	 */
	public String getRuleItemSub(Map map){
		StringBuffer ruleItemSub = new StringBuffer();
		
		List commonListRuleItemSub_list = sqlMapClientTemplate.queryForList("commonListRuleItemSub", map);
		
		ruleItemSub.append("��ħ�ؼ� ���׸� <select id='rule_itemsub_id' name='rule_itemsub_id'>  ");
		ruleItemSub.append("	<option value=''>��ü</option>	");	
		
		for(int i=0; i<commonListRuleItemSub_list.size(); i++){
			String selected = "";
			Map commonListRuleItemSub_map = (HashMap)commonListRuleItemSub_list.get(i);
			
			if(commonListRuleItemSub_map.get("rule_itemsub_id").equals(map.get("rule_itemsub_id"))){
				selected = "selected";
			}
			ruleItemSub.append("	<option value='"+commonListRuleItemSub_map.get("rule_itemsub_id")+"' "+selected+">"+commonListRuleItemSub_map.get("rule_itemsub_nm")+"</option>");
		}
		ruleItemSub.append("</select> ");
		
		return ruleItemSub.toString();
	}
	
	
	/**
	 * �����ħ �ؼ� rule_item_id�� �ش��ϴ� �����ħ�ؼ����׸� ����Ʈ�� ����Ѵ�.
	 * ��ü�� ���� ��ħ�ؼ� ���׸�
	 * @param map parameter
	 * @return
	 */
	public String getDetailAddRuleWordItemSub(Map map){
		StringBuffer ruleItemSub = new StringBuffer();
		
		List commonListRuleItemSub_list = sqlMapClientTemplate.queryForList("commonListRuleItemSub", map);
		
		ruleItemSub.append("��ħ�ؼ� ���׸� <select id='rule_itemsub_id' name='rule_itemsub_id'>  ");
		
		for(int i=0; i<commonListRuleItemSub_list.size(); i++){
			String selected = "";
			Map commonListRuleItemSub_map = (HashMap)commonListRuleItemSub_list.get(i);
			
			if(commonListRuleItemSub_map.get("rule_itemsub_id").equals(map.get("rule_itemsub_id"))){
				selected = "selected";
			}
			ruleItemSub.append("	<option value='"+commonListRuleItemSub_map.get("rule_itemsub_id")+"' "+selected+">"+commonListRuleItemSub_map.get("rule_itemsub_nm")+"</option>");
		}
		ruleItemSub.append("</select> ");
		
		return ruleItemSub.toString();
	}	
	
	 /**
	    * hemsfos����� ����Ʈ ��ȸ
	    * @param map
	    * @return
	    */
		public List listLoginUser(Map map){
	    	return sqlMapClientTemplate.queryForList("loginUser", map);
		}
	    
		public void updateLoginuser(Map map)
		{
			sqlMapClientTemplate.update("updateUser", map);
		}
		
	    public Object loginUser(Map map){
	    	
	    	try {
	    		
	    		String chaPsw = StringUtils.cha1Security(map.get("password").toString());
	    		map.put("password", chaPsw);
			} catch (Exception e) {
				e.printStackTrace();
			}    	
	    	
	    	return sqlMapClientTemplate.queryForObject("loginUser", map);
	    }
	    
	    public Object loginUserpda(Map map){
	    	
	    	return sqlMapClientTemplate.queryForObject("loginUser", map);
	    }
	    
//***************** ���������� ������ ���� sql start********************//
	    /**
		 * ���������� �����͸� ����Ѵ�.
		 * @param 
		 * @return
		 */
		public List getStructName(){
			return sqlMapClientTemplate.queryForList("commonListStruct");
		}
		
		/**
		 * ����ǥ���̹��� �����͸� ����Ѵ�.
		 * @param 
		 * @return
		 */
		public List getSensorImageName(Map map){
			return sqlMapClientTemplate.queryForList("commonSensorImageList",map);
		}
		
		/**
		 * ����ǥ���̹��� ���� �����͸� ����Ѵ�. �ý��۱����̹���
		 * @param 
		 * @return
		 */
		public List getSensorImageType(){
			return sqlMapClientTemplate.queryForList("commonSensorImageTypList");
		}
		
		/**
		 * �̹��� ���� �����͸� ����Ѵ�. �ý��۱����̹���
		 * @param 
		 * @return
		 */
		public List getImageType(){
			return sqlMapClientTemplate.queryForList("commonImageTypList");
		}
		
		/**
		 * �̹��� ���� �����͸� ����Ѵ�. PHTO
		 * @param 
		 * @return
		 */
		public List getPhtoType(){
			return sqlMapClientTemplate.queryForList("commonPhtoTypList");
		}
		
	    
		/**
		 * �����̹��� ���м�����
		 * @param 
		 * @return
		 */
		public List getIntroImageType(Map map){
			return sqlMapClientTemplate.queryForList("commonIntroImageList",map);
		}
		
		/**
		 * �ý��۱��� 1 ������
		 * @param 
		 * @return
		 */
		public List getSystemImage1Type(Map map){
			return sqlMapClientTemplate.queryForList("commonSystemImage1List",map);
		}
	    
		
		/**
		 * �ý��۱��� 2 ������
		 * @param 
		 * @return
		 */
		public List getSystemImage2Type(Map map){
			return sqlMapClientTemplate.queryForList("commonSystemImage2List",map);
		}
		
		/**
		 * ���� 1 ������
		 * @param 
		 * @return
		 */
		public List getDrawImage1Type(Map map){
			return sqlMapClientTemplate.queryForList("commonDrawImage1List",map);
		}
		
		/**
		 * ���� 2 ������
		 * @param 
		 * @return
		 */
		public List getDrawImage2Type(Map map){
			return sqlMapClientTemplate.queryForList("commonDrawImage2List",map);
		}
		
		/**
		 * ���� 3 ������
		 * @param 
		 * @return
		 */
		public List getDrawImage3Type(Map map){
			return sqlMapClientTemplate.queryForList("commonDrawImage3List",map);
		}
		
		/**
		 * ���� 4 ������
		 * @param 
		 * @return
		 */
		public List getDrawImage4Type(Map map){
			return sqlMapClientTemplate.queryForList("commonDrawImage4List",map);
		}
		
		/**
		 * ���� 5 ������
		 * @param 
		 * @return
		 */
		public List getDrawImage5Type(Map map){
			return sqlMapClientTemplate.queryForList("commonDrawImage5List",map);
		}

		/**
		 * �׷� ������
		 * @param 
		 * @return
		 */
		public List getGroupID(Map map){
			return sqlMapClientTemplate.queryForList("group_list",map);
		}

		/**
		 * ����� ������
		 * @param 
		 * @return
		 */
		public List getUsedClassCd(Map map){
			return sqlMapClientTemplate.queryForList("usedclass_list",map);
		}

		/**
		 * �����޴� ������
		 * @param 
		 * @return
		 */
		public List getParentMenu(Map map){
			return sqlMapClientTemplate.queryForList("parentmenu_list",map);
		}

		/**
		 * Y/N ������
		 * @param 
		 * @return
		 */
		public List getYN(Map map){
			return sqlMapClientTemplate.queryForList("yn_list",map);
		}

//***************** ���������� ������ ���� sql END********************//  
		
		/**
		 * ��ú��� ����Ʈ ����Ѵ�.
		 * @param 
		 * @return
		 */
		public List getDashboard(Map map){
			
			List alrLstA = sqlMapClientTemplate.queryForList("dashBoard",map);
			Map<String,String> almMap = null;
			for(int i=0;i<alrLstA.size(); i++)
			{
				almMap = (Map)alrLstA.get(i);
				
				almMap.put("construct_year", DateUtils.getStrDateVer(almMap.get("construct_year")));
			}
	     	return alrLstA;
		}
	    
		public void updateStruct(Map map)
		{
			sqlMapClientTemplate.update("updateStruct",map);
		}	
		
//***************** �����ڵ� sql END********************//  
		
		/**
		 * �����ڵ� ���� ����Ѵ�.
		 * @param 
		 * @return
		 */
		public List getCommonCodeType(Map map){
			return sqlMapClientTemplate.queryForList("commonCodeTypelist",map);
		}
	    
		/**
		 * �����ڵ� TABLE ����Ѵ�.
		 * @param 
		 * @return
		 */
		public List getCommonCodeTable(Map map){
			return sqlMapClientTemplate.queryForList("commonCodeTablelist",map);
		}
		
		/**
		 * �����ڵ� FIELD ����Ѵ�.
		 * @param 
		 * @return
		 */
		public List getCommonCodeField(Map map){
			return sqlMapClientTemplate.queryForList("commonCodeFieldlist",map);
		}
		
		/**
		 * detector�� ä�� ����Ʈ
		 * @param 
		 * @return
		 */
		public List getdetectorChannelField(Map map){
			return sqlMapClientTemplate.queryForList("commondetectorChanlist",map);
		}
		
		/**
		 * �����ڵ� LEN ����Ѵ�.
		 * @param 
		 * @return
		 */
		public List getCommonLenField(Map map){
			return sqlMapClientTemplate.queryForList("commonCodeLenlist",map);
		}

		/**
		 * ���� ������
		 * @param 
		 * @return
		 */
		public List getSensor(Map map){
			return sqlMapClientTemplate.queryForList("sensor_list",map);
		}

		/**
		 * �溸��� ������
		 * @param 
		 * @return
		 */
		public List getTroubleClass(Map map){
			return sqlMapClientTemplate.queryForList("troubleclass_list",map);
		}
		
		/**
		 * ������� ������
		 * @param 
		 * @return
		 */
		public List getErrType(Map map){
			return sqlMapClientTemplate.queryForList("errtype_list",map);
		}
		
		/**
		 * ������ ���� ���� ID ������
		 * @param 
		 * @return
		 */
		public List getStructCompP(Map map){
			return sqlMapClientTemplate.queryForList("p_struct_comp_list",map);
		}
		
		/**
		 * rpt ���� �����͸� ����Ѵ�.
		 * @param 
		 * @return
		 */
		public List getSensorSelector(Map map){
			return sqlMapClientTemplate.queryForList("sensorSELECTOR",map);
		}
		
		/**
		 * �⵵ �����͸� ����Ѵ�.
		 * @param 
		 * @return
		 */
		public List getYearSelector(){
			return sqlMapClientTemplate.queryForList("yearSql");
		}
		
		/**
		 * Month �����͸� ����Ѵ�.
		 * @param 
		 * @return
		 */
		public List getMonthSelector(){
			return sqlMapClientTemplate.queryForList("monthSql");
		}
		
		/**
		 * ��ǥ�̹����� �����´�
		 * @param 
		 * @return
		 */
		public Object getImageStr(Map map){
			return sqlMapClientTemplate.queryForObject("imageSTRSql",map);
		}
		
		/**
		 * interface���θ� �����´�
		 * @param 
		 * @return
		 */
		public String getInterfaceYN(Map map){
			return (String)sqlMapClientTemplate.queryForObject("interFaceYNSql",map);
		}
		
		/**
		 * interface���θ� �����´�
		 * @param 
		 * @return
		 */
		public int getStructCount(Map map){
			return (Integer)sqlMapClientTemplate.queryForObject("myStructSql",map);
		}
		
		/**
		 * ���� ����� ����� ������ ���̵� ��� �ؾ� �ϴµ� ���۰����ڰ� ��� �� �ֵ��� ��( ���̺��� ���� �ڵ鸵 )
		 * @param 
		 * @return
		 */
		public String getStructStart(Map map){
			return (String)sqlMapClientTemplate.queryForObject("myStructStartSql",map);
		}
		
		
}

