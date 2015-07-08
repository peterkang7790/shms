/*
 * structManageAction.java
 * @author ������
 * @version 1.0 
 * @Date 2010. 01. 28.
 * Copyright (c) 2008 BY LSWARE INC. All rights reserved.
 */

package shms.action.baseInfo;

import java.io.PrintWriter;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import shms.common.Log4j;
import shms.common.ParamMap;
import shms.dao.baseInfo.structDao;
import shms.dao.common.CommonDao;

import com.lsware.utils.DateUtils;
import com.lsware.utils.StringUtils;


/**
 * 
 * @author ������
 * @version 1.0,  2009. 10. 22.
 */
public class structManageAction extends ParamMap {
	
	
	private structDao structDao;
	private CommonDao commonDao;
	
	Map map;
	public void setStructDao(structDao structDao) {
		this.structDao = structDao;
	}
	
	public void setCommonDao(CommonDao commonDao) {
		this.commonDao = commonDao;
	}
	
	public String listStruct() throws Exception {

		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
		getReqMap().put("user_id", ServletActionContext.getRequest().getSession().getAttribute("USER_ID"));
		map = getReqMap();
		
		int resultCount = structDao.countStruct(map);

		putDataMap("resultCount", resultCount);
		putDataMap("listStruct", structDao
				.listStruct(getPaging(resultCount)));
		

		return "listStruct_success";
	}
	
	public String addViewStruct() throws Exception {

		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
		map = getReqMap();	
		
		//���������м�����
		putDataMap("struct_type_cd_list", commonDao.getStructName() );
		
		//����ǥ���̹���������
		putDataMap("image_nm_list", commonDao.getSensorImageName(map) );
		
		//����ǥ���̹������м�����
		putDataMap("sensor_image_type_list", commonDao.getSensorImageType() );
		
		//�����̹������м�����
		putDataMap("intro_image_nm_list", commonDao.getIntroImageType(map) );
		
		
		//�ý��۱�������������
		putDataMap("system_image_nm1_list", commonDao.getSystemImage1Type(map) );
		
		//�ý��۱�������������
		putDataMap("system_image_nm2_list", commonDao.getSystemImage2Type(map) );
		
		//�������1������
		putDataMap("draw_image_nm1_list", commonDao.getDrawImage1Type(map) );
		
		//�������2������
		putDataMap("draw_image_nm2_list", commonDao.getDrawImage2Type(map) );
		
		//�������3������
		putDataMap("draw_image_nm3_list", commonDao.getDrawImage3Type(map) );
		
		//�������4������
		putDataMap("draw_image_nm4_list", commonDao.getDrawImage4Type(map) );
		
		//�������5������
		putDataMap("draw_image_nm5_list", commonDao.getDrawImage5Type(map) );
		
		// Y/N ������
		putDataMap("yn_list", commonDao.getYN(map));
		
		
//		structDao.addStruct(map);
		
		return "addViewStruct_success";
	}
	
	public String addStruct() throws Exception {

		
		getReqMap().put("user_id", ServletActionContext.getRequest().getSession().getAttribute("USER_ID"));
		map = getReqMap();	
		
		if(structDao.structIdChk(map) > 0){
			putDataMap("errorMsg", "�̹̻������ ID�Դϴ�");
			return "addStruct_error";
		}
		
		String contYear = "";
		if( map.get("prod_dt") != null )
		{
			contYear = map.get("prod_dt").toString().replace("-", "");
		}
		else
		{
			contYear = DateUtils.getCurrentDate().replace("-", "");
		}
		
		map.put("construct_year", contYear);
		
		structDao.accStruct(map);
		structDao.addStruct(map);
		
		putDataMap("struct_id", map.get("struct_id"));
		putDataMap("user_id", map.get("user_id"));
		
		putDataMap("detailStruct", structDao.detailStruct(map));
		
		if( structDao.detailImage(map) != null )
		{
			putDataMap("listImage", structDao.detailImage(map));
		}
		
		return "addStruct_success";
	}
	
	public String detailStruct() throws Exception
	{
		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
		getReqMap().put("user_id", ServletActionContext.getRequest().getSession().getAttribute("USER_ID"));
		map = getReqMap();
		
		putDataMap("struct_id", map.get("struct_id"));
		putDataMap("user_id", map.get("user_id"));
		
		if( structDao.detailStruct(map) != null )
		{
			Map map1 =(Map) structDao.detailStruct(map);
			
			String strTelno = "";
			if( map1.get("struct_tel_no") != null )
			{
				strTelno = StringUtils.strTelNo( map1.get("struct_tel_no").toString());
				putDataMap("p_struct_tel_no", strTelno);
			}
			
			putDataMap("construct_year", map1.get("construct_year"));
			putDataMap("detailStruct", structDao.detailStruct(map));
			putDataMap("listImage", map1);
		}
		else
		{
			putDataMap("errorMsg", "��ϵ� �������� �����ϴ�.");
			return "addStruct_error";
		}
		
		return "detailStruct_success";
	}
	
	public String editViewStruct() throws Exception
	{
		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
		getReqMap().put("user_id", ServletActionContext.getRequest().getSession().getAttribute("USER_ID"));
		map = getReqMap();
		
		putDataMap("struct_id", map.get("struct_id"));
		putDataMap("user_id", map.get("user_id"));
		putDataMap("struct_type_cd", map.get("struct_type_cd"));
		getReqMap().get(structDao.detailStruct(map));

		if( map.get("construct_year") != null )
		{
			putDataMap("construct_year", map.get("construct_year"));
		}
		
		
		//���������м�����
		putDataMap("struct_type_cd_list", commonDao.getStructName() );
		
		//����ǥ���̹���������
		putDataMap("image_nm_list", commonDao.getSensorImageName(map) );
		
		//����ǥ���̹������м�����
		putDataMap("sensor_image_type_list", commonDao.getSensorImageType() );
		
		//�����̹������м�����
		putDataMap("intro_image_nm_list", commonDao.getIntroImageType(map) );
		
		
		//�ý��۱�������������
		putDataMap("system_image_nm1_list", commonDao.getSystemImage1Type(map) );
		
		//�ý��۱�������������
		putDataMap("system_image_nm2_list", commonDao.getSystemImage2Type(map) );
		
		//�������1������
		putDataMap("draw_image_nm1_list", commonDao.getDrawImage1Type(map) );
		
		//�������2������
		putDataMap("draw_image_nm2_list", commonDao.getDrawImage2Type(map) );
		
		//�������3������
		putDataMap("draw_image_nm3_list", commonDao.getDrawImage3Type(map) );
		
		//�������4������
		putDataMap("draw_image_nm4_list", commonDao.getDrawImage4Type(map) );
		
		//�������5������
		putDataMap("draw_image_nm5_list", commonDao.getDrawImage5Type(map) );
		// Y/N ������
		putDataMap("yn_list", commonDao.getYN(map));
		
		putDataMap("detailStruct", structDao.detailStruct(map));
		
		return "editViewStruct_success";
	}
	
	public String editStruct() throws Exception
	{
		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
		map = getReqMap();
		
		String cons = "";
		
		if( map.get("construct_year") != null )
		{
			cons = map.get("construct_year").toString().replace("-", "");
		}
		
		map.put("construct_year", cons); 
		
		structDao.editStruct(map);
			
		return "editStruct_success";
	}
	
	public void structIdChk() throws Exception
	{
		
		PrintWriter printWriter = null;
		try {
			ServletActionContext.getResponse().setContentType("text/html;charset=utf-8");			
			printWriter = ServletActionContext.getResponse().getWriter();
			
			if( structDao.structIdChk(getReqMap()) == 0){
				printWriter.print("<font color=blue> ����Ҽ� �ִ� STRUCT ID ���Դϴ�.</font>");
			}
			else{
				printWriter.print("<font color=red> �̹� �����ϴ� STRUCT ID ���Դϴ�.</font>");
			}
				
		} catch (Exception e) {
			Log4j.log.error("structIdChkGatherData:", e);
		} finally{
			printWriter.close();
		}
	}
	
	public String editViewStructCompPop() throws Exception{
		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
		map = getReqMap();
		
		//���������� ���� ID ������
		putDataMap("list_p_struct_comp", commonDao.getStructCompP(map) );
		
		putDataMap("editStructCompPop", structDao.editStructComp(map));
		
		return "editViewStructCompPop";
	}
	
	public String editStructCompPop() throws Exception{
		
		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
		map = getReqMap();
		
		structDao.upStructComp(map);
		
		return "editStructCompPop";
	}
	
	public String delStruct() throws Exception{
		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
		getReqMap().put("user_id", ServletActionContext.getRequest().getSession().getAttribute("USER_ID"));
		structDao.delStruct(getReqMap());
		structDao.delAccStruct(getReqMap());
		return "delStruct_success";
	}
	
	public String listStructComp() throws Exception
	{

		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
		map = getReqMap();
		
		
		if( map.get("struct_comp_id") != null || !"".equals(map.get("struct_comp_id"))  )
		{
			if( map.get("basecall") != null && ! "".equals(map.get("basecall")) )
			{
				putDataMap("basecall", map.get("basecall"));
			}
			else
			{
				putDataMap("basecall", null);
			}
			
			if( map.get("formType") != null && ! "".equals(map.get("formType")) )
			{
				putDataMap("formType", map.get("formType"));
			}
			else
			{
				putDataMap("formType", null);
			}
			
			putDataMap("listStructCompTree", structDao.getStructTree(map));
			
			if( map.get("struct_comp_id") != null )
			{
				putDataMap("listStructComp", structDao.editStructComp(map));
			}
			
		}
		
		return "listStructComp_success";
	}
	
	public String addViewStructCompPop() throws Exception
	{
		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
		map = getReqMap();
		
		//���������� ���� ID ������
		putDataMap("list_p_struct_comp", commonDao.getStructCompP(map) );
		
		return "addViewStructCompPop_success";
	}
	
	public String addStructCompPop() throws Exception
	{
		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
		map = getReqMap();
		
		if(structDao.structCompIdChk(map) > 0){
			putDataMap("errorMsg", "�̹̻������ ID�Դϴ�");
			return "addStructComp_error";
		}
		
		structDao.addStructComp(map);
		
		return "addStructPop_success";
	}
	
	public void structCompIdChk() throws Exception
	{
		PrintWriter printWriter = null;
		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
		try {
			ServletActionContext.getResponse().setContentType("text/html;charset=utf-8");			
			printWriter = ServletActionContext.getResponse().getWriter();
			
			String detId = getReqMap().get("struct_comp_id").toString();
			
			if( !"".equals(detId) )
			{
				if(structDao.structCompIdChk(getReqMap()) == 0){
					printWriter.print("<font color=blue> ����Ҽ� �ִ� ������ ���� ���̵� �Դϴ�.</font>");
				}
				else{
					printWriter.print("<font color=red> �̹� �����ϴ� ������ ���� ���̵� �Դϴ�.</font>");
				}
			}
			else
			{
				printWriter.print("<font color=red> ������ ���� ���̵� �� �Է��� �ּ���.</font>");
			}
			
				
		} catch (Exception e) {
			Log4j.log.error("structCompIdChkGatherData:", e);
		} finally{
			printWriter.close();
		}
	}
	
	public String delStructComp() throws Exception{
		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
		map = getReqMap();
		
		structDao.delStructComp(map);
		
		return "delStructComp_success";
	}
	
	public String imageView() throws Exception{
		
		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
		map = getReqMap();
		
		putDataMap("image_path", structDao.imageView(map));
		
		return "imageView_success";
	}
}

