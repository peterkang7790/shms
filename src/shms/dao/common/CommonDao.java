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
     * sequenceNm에 해당하는 이름의 sequence id를 불러온다.
     * @param sequenceNm
     * @return
     */
	public String SequenceId(String sequenceNm){
		return (String) sqlMapClientTemplate.queryForObject("commonSequenceId", sequenceNm);
	}
	
	/**
	 * 코드테이블에서 codeType에 해당하는 리스트를 출력한다.
	 * @param codeType
	 * @return
	 */
	public List getCodeList(String codeType){
		return sqlMapClientTemplate.queryForList("commonListCode", codeType);
	}
	
	/**
	 * 약관지침준수 리스트를 출력한다.
	 * @param codeType
	 * @return
	 */
	public List getRuleItem(){
		return sqlMapClientTemplate.queryForList("commonListRuleItem");
	}
	
	/**
	 * PPP 계측항목 셀렉터를 출력한다.
	 * @param 
	 * @return
	 */
	public List getP_InstItem(Map map){
		return sqlMapClientTemplate.queryForList("commonListInstitem",map);
	}
	
	/**
	 * PPP 구조물구성 셀렉터를 출력한다.
	 * @param 
	 * @return
	 */
	public List getP_StructComp(Map map){
		return sqlMapClientTemplate.queryForList("commonListStructComp",map);
	}
	
	/**
	 * PPP 센서 셀렉터를 출력한다.
	 * @param 
	 * @return
	 */
	public List getP_SensorId(Map map){
		return sqlMapClientTemplate.queryForList("commonListSensor",map);
	}
	
	/**
	 * PPP ALL 센서 셀렉터를 출력한다.
	 * @param 
	 * @return
	 */
	public List getP_AllSensorId(Map map){
		return sqlMapClientTemplate.queryForList("commonAllListSensor",map);
	}
	
	/**
	 * PPP 센서종류 셀렉터를 출력한다.
	 * @param 
	 * @return
	 */
	public List getP_SensorTypId(Map map){
		return sqlMapClientTemplate.queryForList("commonListP_SensorType",map);
	}
	
	/**
	 * PPP Detector 셀렉터를 출력한다.
	 * @param 
	 * @return
	 */
	public List getP_DetectorId(Map map){
		return sqlMapClientTemplate.queryForList("commonListP_Detector", map);
	}
	
	/**
	 * PPP Channel 셀렉터를 출력한다.
	 * @param 
	 * @return
	 */
	public List getP_ChannelId(Map map){
		return sqlMapClientTemplate.queryForList("commonListP_Channel",map);
	}
	
	/**
	 * 계축항목 셀렉터를 출력한다.
	 * @param 
	 * @return
	 */
	public List getMsrItem(Map map){
		return sqlMapClientTemplate.queryForList("commonListMsrItem",map);
	}
	
	/**
	 * 센서종류 셀렉터를 출력한다
	 * @param 
	 * @return
	 */
	public List getSensorType(Map map){
		return sqlMapClientTemplate.queryForList("commonListSensorType",map);
	}
	
	/**
     * sequenceNm에 해당하는 이름의 sequence id를 불러온다.
     * @param sequenceNm
     * @return
     */
	public String getSensorSeq(String sequenceNm){
		return (String)sqlMapClientTemplate.queryForObject("listSensor_getid",sequenceNm);
	}
	
	/**
	 * 약관지침 준수 rule_item_id에 해당하는 약관지침준수상세항목 리스트를 출력한다.
	 * @param map parameter
	 * @return
	 */
	public String getRuleItemSub(Map map){
		StringBuffer ruleItemSub = new StringBuffer();
		
		List commonListRuleItemSub_list = sqlMapClientTemplate.queryForList("commonListRuleItemSub", map);
		
		ruleItemSub.append("지침준수 상세항목 <select id='rule_itemsub_id' name='rule_itemsub_id'>  ");
		ruleItemSub.append("	<option value=''>전체</option>	");	
		
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
	 * 약관지침 준수 rule_item_id에 해당하는 약관지침준수상세항목 리스트를 출력한다.
	 * 전체가 없는 지침준수 상세항목
	 * @param map parameter
	 * @return
	 */
	public String getDetailAddRuleWordItemSub(Map map){
		StringBuffer ruleItemSub = new StringBuffer();
		
		List commonListRuleItemSub_list = sqlMapClientTemplate.queryForList("commonListRuleItemSub", map);
		
		ruleItemSub.append("지침준수 상세항목 <select id='rule_itemsub_id' name='rule_itemsub_id'>  ");
		
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
	    * hemsfos사용자 리스트 조회
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
	    
//***************** 기준정보의 구조물 관련 sql start********************//
	    /**
		 * 구조물구분 셀렉터를 출력한다.
		 * @param 
		 * @return
		 */
		public List getStructName(){
			return sqlMapClientTemplate.queryForList("commonListStruct");
		}
		
		/**
		 * 센서표시이미지 셀렉터를 출력한다.
		 * @param 
		 * @return
		 */
		public List getSensorImageName(Map map){
			return sqlMapClientTemplate.queryForList("commonSensorImageList",map);
		}
		
		/**
		 * 센서표시이미지 구분 셀렉터를 출력한다. 시스템구성이미지
		 * @param 
		 * @return
		 */
		public List getSensorImageType(){
			return sqlMapClientTemplate.queryForList("commonSensorImageTypList");
		}
		
		/**
		 * 이미지 구분 셀렉터를 출력한다. 시스템구성이미지
		 * @param 
		 * @return
		 */
		public List getImageType(){
			return sqlMapClientTemplate.queryForList("commonImageTypList");
		}
		
		/**
		 * 이미지 구분 셀렉터를 출력한다. PHTO
		 * @param 
		 * @return
		 */
		public List getPhtoType(){
			return sqlMapClientTemplate.queryForList("commonPhtoTypList");
		}
		
	    
		/**
		 * 개요이미지 구분셀렉터
		 * @param 
		 * @return
		 */
		public List getIntroImageType(Map map){
			return sqlMapClientTemplate.queryForList("commonIntroImageList",map);
		}
		
		/**
		 * 시스템구성 1 셀렉터
		 * @param 
		 * @return
		 */
		public List getSystemImage1Type(Map map){
			return sqlMapClientTemplate.queryForList("commonSystemImage1List",map);
		}
	    
		
		/**
		 * 시스템구성 2 셀렉터
		 * @param 
		 * @return
		 */
		public List getSystemImage2Type(Map map){
			return sqlMapClientTemplate.queryForList("commonSystemImage2List",map);
		}
		
		/**
		 * 도면 1 셀렉터
		 * @param 
		 * @return
		 */
		public List getDrawImage1Type(Map map){
			return sqlMapClientTemplate.queryForList("commonDrawImage1List",map);
		}
		
		/**
		 * 도면 2 셀렉터
		 * @param 
		 * @return
		 */
		public List getDrawImage2Type(Map map){
			return sqlMapClientTemplate.queryForList("commonDrawImage2List",map);
		}
		
		/**
		 * 도면 3 셀렉터
		 * @param 
		 * @return
		 */
		public List getDrawImage3Type(Map map){
			return sqlMapClientTemplate.queryForList("commonDrawImage3List",map);
		}
		
		/**
		 * 도면 4 셀렉터
		 * @param 
		 * @return
		 */
		public List getDrawImage4Type(Map map){
			return sqlMapClientTemplate.queryForList("commonDrawImage4List",map);
		}
		
		/**
		 * 도면 5 셀렉터
		 * @param 
		 * @return
		 */
		public List getDrawImage5Type(Map map){
			return sqlMapClientTemplate.queryForList("commonDrawImage5List",map);
		}

		/**
		 * 그룹 셀렉터
		 * @param 
		 * @return
		 */
		public List getGroupID(Map map){
			return sqlMapClientTemplate.queryForList("group_list",map);
		}

		/**
		 * 사용등급 셀렉터
		 * @param 
		 * @return
		 */
		public List getUsedClassCd(Map map){
			return sqlMapClientTemplate.queryForList("usedclass_list",map);
		}

		/**
		 * 상위메뉴 셀렉터
		 * @param 
		 * @return
		 */
		public List getParentMenu(Map map){
			return sqlMapClientTemplate.queryForList("parentmenu_list",map);
		}

		/**
		 * Y/N 셀렉터
		 * @param 
		 * @return
		 */
		public List getYN(Map map){
			return sqlMapClientTemplate.queryForList("yn_list",map);
		}

//***************** 기준정보의 구조물 관련 sql END********************//  
		
		/**
		 * 대시보드 리스트 출력한다.
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
		
//***************** 공통코드 sql END********************//  
		
		/**
		 * 공통코드 유형 출력한다.
		 * @param 
		 * @return
		 */
		public List getCommonCodeType(Map map){
			return sqlMapClientTemplate.queryForList("commonCodeTypelist",map);
		}
	    
		/**
		 * 공통코드 TABLE 출력한다.
		 * @param 
		 * @return
		 */
		public List getCommonCodeTable(Map map){
			return sqlMapClientTemplate.queryForList("commonCodeTablelist",map);
		}
		
		/**
		 * 공통코드 FIELD 출력한다.
		 * @param 
		 * @return
		 */
		public List getCommonCodeField(Map map){
			return sqlMapClientTemplate.queryForList("commonCodeFieldlist",map);
		}
		
		/**
		 * detector별 채널 리스트
		 * @param 
		 * @return
		 */
		public List getdetectorChannelField(Map map){
			return sqlMapClientTemplate.queryForList("commondetectorChanlist",map);
		}
		
		/**
		 * 공통코드 LEN 출력한다.
		 * @param 
		 * @return
		 */
		public List getCommonLenField(Map map){
			return sqlMapClientTemplate.queryForList("commonCodeLenlist",map);
		}

		/**
		 * 센서 셀렉터
		 * @param 
		 * @return
		 */
		public List getSensor(Map map){
			return sqlMapClientTemplate.queryForList("sensor_list",map);
		}

		/**
		 * 경보등급 셀렉터
		 * @param 
		 * @return
		 */
		public List getTroubleClass(Map map){
			return sqlMapClientTemplate.queryForList("troubleclass_list",map);
		}
		
		/**
		 * 장애유형 셀렉터
		 * @param 
		 * @return
		 */
		public List getErrType(Map map){
			return sqlMapClientTemplate.queryForList("errtype_list",map);
		}
		
		/**
		 * 구조물 구성 상위 ID 셀렉터
		 * @param 
		 * @return
		 */
		public List getStructCompP(Map map){
			return sqlMapClientTemplate.queryForList("p_struct_comp_list",map);
		}
		
		/**
		 * rpt 센서 셀렉터를 출력한다.
		 * @param 
		 * @return
		 */
		public List getSensorSelector(Map map){
			return sqlMapClientTemplate.queryForList("sensorSELECTOR",map);
		}
		
		/**
		 * 년도 셀렉터를 출력한다.
		 * @param 
		 * @return
		 */
		public List getYearSelector(){
			return sqlMapClientTemplate.queryForList("yearSql");
		}
		
		/**
		 * Month 셀렉터를 출력한다.
		 * @param 
		 * @return
		 */
		public List getMonthSelector(){
			return sqlMapClientTemplate.queryForList("monthSql");
		}
		
		/**
		 * 대표이미지를 가져온다
		 * @param 
		 * @return
		 */
		public Object getImageStr(Map map){
			return sqlMapClientTemplate.queryForObject("imageSTRSql",map);
		}
		
		/**
		 * interface여부를 가져온다
		 * @param 
		 * @return
		 */
		public String getInterfaceYN(Map map){
			return (String)sqlMapClientTemplate.queryForObject("interFaceYNSql",map);
		}
		
		/**
		 * interface여부를 가져온다
		 * @param 
		 * @return
		 */
		public int getStructCount(Map map){
			return (Integer)sqlMapClientTemplate.queryForObject("myStructSql",map);
		}
		
		/**
		 * 최초 사용자 등록후 구조물 아이디를 등록 해야 하는데 슈퍼관리자가 등록 해 주도록 함( 테이블을 직접 핸들링 )
		 * @param 
		 * @return
		 */
		public String getStructStart(Map map){
			return (String)sqlMapClientTemplate.queryForObject("myStructStartSql",map);
		}
		
		
}

