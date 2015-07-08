/*
 * imageManageAction.java
 * @author ������
 * @version 1.0 
 * @Date 2010. 02. 05.
 * Copyright (c) 2008 BY LSWARE INC. All rights reserved.
 */

package shms.action.baseInfo;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import shms.common.Log4j;
import shms.common.ParamMap;
import shms.dao.baseInfo.imageManageDao;
import shms.dao.common.CommonDao;
import shms.service.FileService;

import com.lsware.utils.DateUtils;
import com.lsware.utils.StringUtils;



	
/**
 * 
 * @author ������
 * @version 1.0,  2009. 10. 22.
 */
public class imageManageAction extends ParamMap {

	private imageManageDao imageManageDao; 
	private CommonDao commonDao;
	private FileService fileService;
	

	public void setFileService(FileService fileService) {
		this.fileService = fileService;
	}
	
	public void setCommonDao(CommonDao commonDao) {
		this.commonDao = commonDao;
	}

	public void setImageManageDao(imageManageDao imageManageDao) {
		this.imageManageDao = imageManageDao;
	}
	
	Map map;
	
	public String listImage() throws Exception
	{
		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
		map = getReqMap();
		
		int resultCount = imageManageDao.countImageDoing(map);
		
		putDataMap("resultCount", resultCount );
		putDataMap("listImage_1", imageManageDao.listImage(getPaging(resultCount)));
		
		return "listImage_success";
	}
	
	public String addViewImage() throws Exception
	{
		map = getReqMap();
		
		if( map.get("basecall") != null )
		{
			putDataMap("basecall", map.get("basecall") );
		}
		
		//����ǥ���̹������м�����
		putDataMap("sensor_image_type_list", commonDao.getImageType() );
		
		//PHOTO���м�����
		putDataMap("phto_type_list", commonDao.getPhtoType() );
		
		return "addViewImage_success";
	}
	
	public String editViewImage() throws Exception
	{
		map = getReqMap();
		
		
		
		//����ǥ���̹������м�����
		putDataMap("sensor_image_type_list", commonDao.getImageType() );
		
		//PHOTO���м�����
		putDataMap("phto_type_list", commonDao.getPhtoType() );
		
		putDataMap("image_type", map.get("image_type") );
		
		putDataMap("detailImage", imageManageDao.detailImage(map));
		
		return "editViewImage_success";
	}
	
	public String editImage() throws Exception
	{
		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
		map = getReqMap();
		
	
		//����ǥ���̹������м�����
		putDataMap("sensor_image_type_list", commonDao.getImageType() );
		
		return "editImage_success";
	}
	
	public String addImage() throws Exception
	{
		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
		map = getReqMap();
		
		PrintWriter printWriter = null;
		
		putDataMap("detailImage", imageManageDao.detailImage(getReqMap()));
					
		
		return "addImage_success";
	}
	
	public String fileUpLoad() throws Exception
	{
		
		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
		map = getReqMap();
		
		PrintWriter printWriter = null;
		
		if( !"edit".equals(map.get("image_type")) )
		{
			if(imageManageDao.imageIdChk(map) > 0){
				putDataMap("errorMsg", "�̹̻������ ID�Դϴ�");
				return "fail";
			}
			
			if( "".equals(map.get("image_id")) )
			{
				putDataMap("errorMsg", "IMAGE ID�� �Է� �� �ּ���.");
				return "fail";
			}
			
		}
		
		
		if(getDataMap().get("upload") != null){
			ServletActionContext.getResponse().setContentType("text/html;charset=utf-8");			
			printWriter = ServletActionContext.getResponse().getWriter();
			
			File[] upload = (File[]) getDataMap().get("upload");
			String[] uploadContentType = (String[]) getDataMap().get("uploadContentType");
			String[] uploadFileName = (String[]) getDataMap().get("uploadFileName");
			
			
			for(int i=0; i < upload.length; i++){

				if(upload[i].isFile()){
					
					getReqMap().put("CONTENT_TYPE", uploadContentType[i]);
					getReqMap().put("LOCAL_FILE_NAME", uploadFileName[i]);
//					getReqMap().put("PARENT_SEQ_ID", getReqMap().get("bulletin_seq_id"));
					
					String savePath = fileService.saveFile(upload[i], uploadFileName[i]);
					
					
					getReqMap().put("image_path", savePath );
					
					getReqMap().put("image_name", uploadFileName[i]);
					
					if( !"edit".equals(map.get("image_type")) )
					{
						imageManageDao.addImage(getReqMap());
					}
					else
					{
						imageManageDao.editImage(getReqMap());
						return "editUpLoad_success";
					}
					
				}
				else
				{
					putDataMap("errorMsg", "���Ͼ��ε����.");
					return "errorUpload";
				}
				
			}
		}
		else if( "edit".equals(map.get("image_type")) )
		{
			imageManageDao.editImage(getReqMap());
			return "editUpLoad_success";
		}
		else
		{
			putDataMap("errorMsg", "�̹��������þ��ϼ̽��ϴ�.");
			return "errorUpload";
		}
		
		return "fileUpLoad_success";
	}
	
	public void imageIdChk() throws Exception
	{
		
		map = getReqMap();
		
		PrintWriter printWriter = null;
		try {
			ServletActionContext.getResponse().setContentType("text/html;charset=utf-8");			
			printWriter = ServletActionContext.getResponse().getWriter();
			
			if( !"".equals(map.get("image_id")) )
			{
				if( imageManageDao.imageIdChk(getReqMap()) == 0){
					printWriter.print("<font color=blue> ����Ҽ� �ִ� IMAGE ID ���Դϴ�.</font>");
				}
				else{
					printWriter.print("<font color=red> �̹� �����ϴ� IMAGE ID ���Դϴ�.</font>");
				}
			}
			else
			{
				printWriter.print("<font color=red> IMAGE ID�� �Է��� �ּ���.</font>");
			}
			
				
		} catch (Exception e) {
			Log4j.log.error("imageIdChkGatherData:", e);
		} finally{
			printWriter.close();
		}
	}
	
	public String detailImage() throws Exception
	{
		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
		
		map = getReqMap();
		
		putDataMap("detailImage", imageManageDao.detailImage(map));
		
		return "detailImage_success";
	}
	
	public String uploadImage() throws Exception {
		
		HashMap resultMap = (HashMap)imageManageDao.detailImageFile((String)getReqMap().get("IMAGE_ID"));
		
		if(resultMap == null){
			putDataMap("errorMsg", "����ã�����");
			return "fail";
		}
		
		String baseFileDir = super.getServletContext().getRealPath("../upload");
		String filePath = baseFileDir + "/" + (String)resultMap.get("IMAGE_PATH");;
		String fileName = (String)resultMap.get("IMAGE_NM");
		
		File f = new File(filePath);
		putDataMap("contentLength", f.length());
		putDataMap("contentDisposition", "attachment; filename=" + StringUtils.eucToLatin1(fileName).replaceAll(" ", "%20"));		
		putDataMap("inputStream", new FileInputStream(filePath));
		
		return "uploadImage_Success";
	}
	
	public String delImage() throws Exception{
		
		getReqMap().put("struct_id", ServletActionContext.getRequest().getSession().getAttribute("STRUCT_ID"));
		
		map = getReqMap();
		
		String imgPath = imageManageDao.delImageFile(map);
		
		String basePath = super.getServletContext().getRealPath("/upload") + "\\" + imgPath ;
		
		File f = new File(basePath);
		f.delete();
		
		imageManageDao.delImage(map);
		return "delImage_success";
	}
	
	/**
	 * ���ϻ���
	 * @param filePath
	 * @throws IOException
	 */
	public void deltetFile(String filePath) throws IOException{
		File f = new File(filePath);
		File d = new File(f.getPath().substring(0, f.getPath().lastIndexOf("\\")));
		f.delete(); // ���ϻ���
		d.delete(); // ���丮����
	}
	
}

