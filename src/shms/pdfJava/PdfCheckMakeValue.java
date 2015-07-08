package shms.pdfJava;

import java.util.List;

import shms.dao.statManage.statDao;

public class PdfCheckMakeValue {
	
	private statDao statDao;
	
	public statDao getStatDao() {
		return statDao;
	}

	public void setStatDao(statDao statDao) {
		this.statDao = statDao;
	}

	public String pdfTotal_report( String struct_id )
	{
//		List statTot = statDao.statTroubleSen(struct_id);
		
		return "";
	}
			
}
