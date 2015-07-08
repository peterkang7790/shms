/*
 * paging.java 1.0, 2009. 5. 28.
 * 
 * Copyright (c) 2008 BY LSWARE INC. All rights reserved.
 */

package shms.common;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;

/**
 * 
 * @author ��ȣ��(hoya@lsware.co.kr)
 * @version 1.0,  2009. 5. 28.
 */
public class Paging {
	
	private boolean isPrevPage;
	private boolean isNextPage;
	private int nowPage; // ���� ������
	private int rowTotal; // �� �Խù��� ��
	private int blockList; // �� �������� ǥ���� �Խù��� ��
	private int blockPage; // ǥ���� ������ ��
	private int totalPage;
	private int	startPage;
	private int	endPage;
	private int	startRow;
	private int	endRow;
	    
	private String pagingString;
	
	public int getBlockList() {
	    return blockList;
	}
	
	public int getBlockPage() {
	    return blockPage;
	}
	
	public int getEndPage() {
	    return endPage;
	}
	
	public int getEndRow() {
	    return endRow;
	}
	
	public int getNowPage() {
	    return nowPage;
	}
	
	public int getRowTotal() {
	    return rowTotal;
	}
	
	public String getPagingString() {
		return pagingString;
	}

	public void setPagingString(String pagingString) {
		this.pagingString = pagingString;
	}

	public int getStartPage() {
	    return startPage;
	}
	
	public int getStartRow() {
	    return startRow;
	}
	
	public int getTotalPage() {
	    return totalPage;
	}
	

			
	/**
	 * �������� ����ϴ� ������ 
	 * @param nowPage ���� ������
	 * @param rowTotal �� �Խù��� ��
	 * @param blockList �� �������� ǥ���� �Խù��� ��
	 * @param blockPage ǥ���� ������ ��
	 * @throws UnsupportedEncodingException 
	 */
	public Paging(int nowPage, int rowTotal, int blockList, int blockPage, CaseIgnoreHashMap reqMap, HttpServletRequest request) 
	throws UnsupportedEncodingException {
	    
		StringBuffer pagingStringBuffer = new StringBuffer();
	
	    // ���� �÷��׸� �ʱ�ȭ
	    isPrevPage = false;
	    isNextPage = false;
	
	    // �Էµ� ��ü ���� ���� ���� ��ü ������ ���� ����Ѵ�
	    this.totalPage = (int) Math.ceil((double)rowTotal / (double)blockList);
	    
	    // ���� �������� ��ü ������������ Ŭ��� ��ü ���������� ������ �����Ѵ�
	    if(nowPage > this.totalPage){
	    	nowPage = this.totalPage;
	    }
	
	    // DB�Է��� ���� ���۰� ���ᰪ�� ���Ѵ�
	    this.startRow	= (int) ((nowPage - 1) * blockList) + 1;
	    this.endRow		= (int) this.startRow + blockList - 1;
	
	    // ������������ ������������ ���� ���Ѵ�
	    this.startPage	= (int) ((nowPage - 1) / blockPage) * blockPage + 1;
	    this.endPage	= (int) this.startPage + blockPage - 1;
	
	    // ������ ���������� ��ü ������������ Ŭ ��� ���� ����
	    if(this.endPage > this.totalPage){
	    	this.endPage = totalPage;
	    }
	
	    // ���� �������� 1���� Ŭ ��� ���� ����¡�� �����Ѱ����� �����Ѵ�
	    if(this.startPage > 1){
	    	this.isPrevPage = true;
	    }
	
	    // ������������ ��ü���������� ������� ���� ����¡�� �����Ѱ����� �����Ѵ�
	    if(this.endPage < this.totalPage){
	    	this.isNextPage = true;
	    }
	
        StringBuffer paramUrl = new StringBuffer();
        Iterator itr = reqMap.getCaseHashMap().keySet().iterator();
        while (itr.hasNext()) {
            String key = (String)itr.next();
            String[] values = request.getParameterValues(key);
            
            if(key != null && values != null 
            		&& !key.equals("jsessionid") 
            		&& !key.equals("nowPage") 
            		&& !key.equals("pagingUrl")){
                for(int j=0; j < values.length; j++){
                	paramUrl.append("&");
                	paramUrl.append(key);
                	paramUrl.append("=");
                	paramUrl.append(URLEncoder.encode(values[j], "euc-kr"));
                }
            }
        }
	    
        pagingStringBuffer.append("<div class='bulletin_paging' align='center'> ");
        pagingStringBuffer.append("<table border='0' cellpadding='0' cellspacing='0'> ");
        pagingStringBuffer.append("<tr> ");
        
        if(rowTotal != 0){
		    if(startPage < blockPage){
		    	pagingStringBuffer.append("<td width='20'> ");
		    	pagingStringBuffer.append("<img src='../images/bulletin_pre2.gif' width='11' height='10' border='0' align='absmiddle'> ");
		    	pagingStringBuffer.append("</td> ");

		    	pagingStringBuffer.append("<td width='20'> ");
		    	pagingStringBuffer.append("<img src='../images/bulletin_pre.gif' width='11' height='10' border='0' align='absmiddle'> ");
		    	pagingStringBuffer.append("</td> ");
		    }
		    else{
		    	pagingStringBuffer.append("<td width='20'> ");
		    	pagingStringBuffer.append("<a href='"+request.getRequestURI()+"?nowPage=");
		    	pagingStringBuffer.append(1);
	            pagingStringBuffer.append(paramUrl); 
	            pagingStringBuffer.append("'  onfocus='this.blur();'> ");
		    	pagingStringBuffer.append("<img src='../images/bulletin_pre2.gif' width='11' height='10' border='0' align='absmiddle'> ");
	            pagingStringBuffer.append("</a> ");
		    	pagingStringBuffer.append("</td> ");
		    	
		    	pagingStringBuffer.append("<td width='20'> ");
		    	pagingStringBuffer.append("<a href='"+request.getRequestURI()+"?nowPage=");
		    	pagingStringBuffer.append(((int) this.startPage + blockPage - 1) - (blockPage*2-1));
		        pagingStringBuffer.append(paramUrl); 
	            pagingStringBuffer.append("'  onfocus='this.blur();'> ");
		    	pagingStringBuffer.append("<img src='../images/bulletin_pre.gif' width='11' height='10' align='absmiddle'> ");
	            pagingStringBuffer.append("</a> ");
		    	pagingStringBuffer.append("</td> ");
		    }
        }
//	    System.out.println(startPage+","+totalPage+","+endPage+","+nowPage+","+rowTotal+","+blockPage);
	    pagingStringBuffer.append("<td align='center' class='page_view'> ");	    
	    for(int i = startPage ; i <= endPage ; i++){
	        if(i > totalPage){
	            break;
	        }
	        
	        if(i == nowPage){
	            pagingStringBuffer.append("<b>");
	            pagingStringBuffer.append(i);
	            pagingStringBuffer.append("</b>");
	            if(i < endPage){
	            	pagingStringBuffer.append("<span class='Pageline'>|</span> \n");
	            }
	        }else{
	            pagingStringBuffer.append("<a href='"+request.getRequestURI()+"?nowPage=");
	            pagingStringBuffer.append(i);
	            pagingStringBuffer.append(paramUrl); 
	            pagingStringBuffer.append("'  onfocus='this.blur();'>");
	            pagingStringBuffer.append(i);
	            pagingStringBuffer.append("</a>");
	            if(i < endPage){
	            	pagingStringBuffer.append("<span class='Pageline'>|</span> \n");
	            }
	        }
	    }//end for
	    pagingStringBuffer.append("</td> ");
	    if(rowTotal != 0){
		    if(endPage >= totalPage){
		    	pagingStringBuffer.append("<td width='20' align='right' > ");
		    	pagingStringBuffer.append("<img src='../images/bulletin_next.gif' width='11' height='10' border='0' align='absmiddle'> ");
				pagingStringBuffer.append("</td> \n");

		    	pagingStringBuffer.append("<td width='20' align='right' > ");
		    	pagingStringBuffer.append("<img src='../images/bulletin_next2.gif' width='11' height='10' border='0' align='absmiddle'> ");
				pagingStringBuffer.append("</td> \n");
		    }
		    else{
		    	pagingStringBuffer.append("<td width='20' align='right' > ");
		    	pagingStringBuffer.append("<a href='"+request.getRequestURI()+"?nowPage=");
		    	pagingStringBuffer.append(startPage + 10);
	            pagingStringBuffer.append(paramUrl); 
	            pagingStringBuffer.append("' onfocus='this.blur();'>");
		    	pagingStringBuffer.append("<img src='../images/bulletin_next.gif' width='11' height='10' border='0' align='absmiddle'> ");
	            pagingStringBuffer.append("</a>");
	            pagingStringBuffer.append("</td> \n");

	            pagingStringBuffer.append("<td width='20' align='right' > ");
	            pagingStringBuffer.append("<a href='"+request.getRequestURI()+"?nowPage=");
		    	pagingStringBuffer.append(totalPage);
	            pagingStringBuffer.append(paramUrl);
	            pagingStringBuffer.append("'  onfocus='this.blur();'>");
		    	pagingStringBuffer.append("<img src='../images/bulletin_next2.gif' width='11' height='10' border='0' align='absmiddle'> ");
	            pagingStringBuffer.append("</a>");
				pagingStringBuffer.append("</td> \n");
		    }
	    }
	    pagingStringBuffer.append("</tr> \n");
	    pagingStringBuffer.append("</table> \n");
	    pagingStringBuffer.append("</div> \n");	    
	    
	    setPagingString(pagingStringBuffer.toString());
	}
	
}