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
 * @author 이호현(hoya@lsware.co.kr)
 * @version 1.0,  2009. 5. 28.
 */
public class Paging {
	
	private boolean isPrevPage;
	private boolean isNextPage;
	private int nowPage; // 현재 페이지
	private int rowTotal; // 총 게시물의 수
	private int blockList; // 한 페이지당 표현될 게시물의 수
	private int blockPage; // 표현될 페이지 수
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
	 * 페이지를 계산하는 생성자 
	 * @param nowPage 현재 페이지
	 * @param rowTotal 총 게시물의 수
	 * @param blockList 한 페이지당 표현될 게시물의 수
	 * @param blockPage 표현될 페이지 수
	 * @throws UnsupportedEncodingException 
	 */
	public Paging(int nowPage, int rowTotal, int blockList, int blockPage, CaseIgnoreHashMap reqMap, HttpServletRequest request) 
	throws UnsupportedEncodingException {
	    
		StringBuffer pagingStringBuffer = new StringBuffer();
	
	    // 각종 플래그를 초기화
	    isPrevPage = false;
	    isNextPage = false;
	
	    // 입력된 전체 열의 수를 통해 전체 페이지 수를 계산한다
	    this.totalPage = (int) Math.ceil((double)rowTotal / (double)blockList);
	    
	    // 현재 페이지가 전체 페이지수보다 클경우 전체 페이지수로 강제로 조정한다
	    if(nowPage > this.totalPage){
	    	nowPage = this.totalPage;
	    }
	
	    // DB입력을 위한 시작과 종료값을 구한다
	    this.startRow	= (int) ((nowPage - 1) * blockList) + 1;
	    this.endRow		= (int) this.startRow + blockList - 1;
	
	    // 시작페이지와 종료페이지의 값을 구한다
	    this.startPage	= (int) ((nowPage - 1) / blockPage) * blockPage + 1;
	    this.endPage	= (int) this.startPage + blockPage - 1;
	
	    // 마지막 페이지값이 전체 페이지값보다 클 경우 강제 조정
	    if(this.endPage > this.totalPage){
	    	this.endPage = totalPage;
	    }
	
	    // 시작 페이지가 1보다 클 경우 이전 페이징이 가능한것으로 간주한다
	    if(this.startPage > 1){
	    	this.isPrevPage = true;
	    }
	
	    // 종료페이지가 전체페이지보다 작을경우 다음 페이징이 가능한것으로 간주한다
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