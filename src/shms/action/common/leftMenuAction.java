/*
 * leftMenuAction.java
 * @author 김종범
 * @version 1.0 
 * @Date 2010. 02. 18.
 * Copyright (c) 2010 BY LSWARE INC. All rights reserved.
 */

package shms.action.common;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import shms.common.ParamMap;
import shms.dao.baseInfo.structDao;
import shms.dao.common.leftMenuDao;
import shms.service.Thumbnail;

import com.oreilly.servlet.MultipartRequest;


public class leftMenuAction extends ParamMap {

	private leftMenuDao leftMenuDao;
	private structDao structDao;
	public structDao getStructDao() {
		return structDao;
	}

	public void setStructDao(structDao structDao) {
		this.structDao = structDao;
	}

	public leftMenuDao getLeftMenuDao() {
		return leftMenuDao;
	}

	public void setLeftMenuDao(leftMenuDao leftMenuDao) {
		this.leftMenuDao = leftMenuDao;
	}

	Map map;

	public String listLeftMenu() throws Exception {
		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
		getReqMap().put("user_id", ServletActionContext.getRequest().getSession().getAttribute("USER_ID"));
		map = getReqMap();

		String p_menu_id = "";

		if (map.get("num") != null) {
			map.put("p_menu_id", map.get("num").toString());
		}

		System.out.println("map = " + map);

		putDataMap("rsLeftMenu", leftMenuDao.getLeftMenu(map));
		
		putDataMap("rsBannerMenu", leftMenuDao.getBannerMenu(map));
		
		
		
		if( leftMenuDao.getStrsummMenu(map) == null )
		{
			putDataMap("listStrsumm", leftMenuDao.getStrsummMenu_1(map));
		}
		else
		{
			putDataMap("listStrsumm", leftMenuDao.getStrsummMenu(map));	
		}
		
		
		String orgName = "";		// 업로드된 이미지 파일 이름
		String destName = "";		// 변환된 썸네일 이미지 파일 이름
		String image_id = "";
		int w = 25;
		int h = 25;
		
		MultipartRequest multi = null;
		
		
		
		List imgLst = leftMenuDao.getThumbnailMenu(map);
		
		putDataMap("lstThumbnail", imgLst);
		
		int rsize = imgLst.size();
		
		String[] thImage = new String[rsize];
		String[] thImageID = new String[rsize];
		
		Map mmm = null;
		for(int i=0;i<imgLst.size() && i<3 ; i++)
		{
			mmm = (Map)imgLst.get(i);
			
			if( mmm.get("image_path") != null )
            {
            	orgName = String.valueOf(mmm.get("image_path"));
            	image_id = String.valueOf(mmm.get("image_id"));
            }
			
			String realFolder = super.getServletContext().getRealPath("/upload");
			
			
			destName = orgName + ".thumb";
			
			File orgFile = new File(realFolder + "\\" + orgName);
			File destFile = new File(realFolder + "\\" + destName);
			
			try{
				Thumbnail.createThumb(orgFile, destFile, w, h);			// 썸네일 생성
			}
			catch (Exception e) {
				
				putDataMap("errorMsg", "사진저장시문제가 발생하였습니다. 관리자에게 문의 하시기 바랍니다.");
				return "thumb_fail";
			}
			
			thImage[i] =  destName;
			thImageID[i] = image_id;
			
			map.put("image_path", destName);
			putDataMap("image_path_thum", destName);
			putDataMap("image_path_id", image_id);
		}
		
		if( rsize == 1 )
		{
			putDataMap("imageTumbnail_1", thImage[0]);
			putDataMap("thImageID_1", thImageID[0]);
		}
		else if( rsize == 2 )   
		{
			putDataMap("imageTumbnail_1", thImage[0]);
			putDataMap("thImageID_1", thImageID[0]);
			putDataMap("imageTumbnail_2", thImage[1]);
			putDataMap("thImageID_2", thImageID[1]);
		}
		else if( rsize == 3 )
		{
			putDataMap("imageTumbnail_1", thImage[0]);
			putDataMap("thImageID_1", thImageID[0]);
			putDataMap("imageTumbnail_2", thImage[1]);
			putDataMap("thImageID_2", thImageID[1]);
			putDataMap("imageTumbnail_3", thImage[2]);
			putDataMap("thImageID_3", thImageID[2]);
		}
		else
		{
			putDataMap("imageTumbnail_1", thImage[0]);
			putDataMap("thImageID_1", thImageID[0]);
			putDataMap("imageTumbnail_2", thImage[1]);
			putDataMap("thImageID_2", thImageID[1]);
			putDataMap("imageTumbnail_3", thImage[2]);
			putDataMap("thImageID_3", thImageID[2]);
		}
		
		return "leftMenu_success";
	}
	
	public String strSensorInfom() throws Exception {
		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
		map = getReqMap();
		
		int resultCount = leftMenuDao.countstrSensorType(map);
		 
		putDataMap("resultCount", resultCount );
		putDataMap("listsensortypCnt", leftMenuDao.getStrsensorTypMenu(getPaging(resultCount)) );
		
		return "strSensorInfom";
	}
	
	public String imageView() throws Exception{
		
		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
		map = getReqMap();
		
		putDataMap("image_path", structDao.imageView(map));
		
		return "imageView_success";
	}
	
}
