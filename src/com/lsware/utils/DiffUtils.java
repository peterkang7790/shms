/*
 * DiffUtils.java 1.0, 2009. 8. 26.
 * 
 * Copyright (c) 2009 by LSware Inc. All rights reserved.
 */
package com.lsware.utils; 

import java.io.IOException;
import java.util.List;

import org.incava.util.diff.Diff;
import org.incava.util.diff.Difference;

public class DiffUtils {
	
	String diffResultHtmlHeaderPath = null;
	String diffResultHtmlFooterPath = null;
	
	
	public DiffUtils(String diffResultHtmlHeaderPath, String diffResultHtmlFooterPath) {
		setDiffResultHtmlHeaderPath(diffResultHtmlHeaderPath);
		setDiffResultHtmlFooterPath(diffResultHtmlFooterPath);
	}

	public DiffUtils() {
		// TODO Auto-generated constructor stub
	}

	public void setDiffResultHtmlHeaderPath(String diffResultHtmlHeaderPath){
		this.diffResultHtmlHeaderPath = diffResultHtmlHeaderPath;
	}
	
	public String getDiffResultHtmlHeaderPath(){
		return this.diffResultHtmlHeaderPath;
	}
	
	public void setDiffResultHtmlFooterPath(String diffResultHtmlFooterPath){
		this.diffResultHtmlFooterPath = diffResultHtmlFooterPath;
	}
	
	public String getDiffResultHtmlFooterPath(){
		return this.diffResultHtmlFooterPath;
	}
	
	public StringBuffer getDiffHtml(String[] leftLines,
			String[] rightLines) {
		
		if(leftLines == null){
			leftLines = new String[1];
			leftLines[0] = "";
		}
		
		if(rightLines == null){
			rightLines = new String[1];
			rightLines[0] = "";
		}
		
		List<Difference> diffs  = (new Diff<String>(leftLines, rightLines)).diff();
		
		String[] leftDiffType = new String[leftLines.length+1];
		String[] rightDiffType = new String[rightLines.length+1];
		
		setDiffTypeFromDifference(diffs, leftDiffType, rightDiffType);
		
		StringBuffer resultBuf = new StringBuffer();
		
		/* diff Result HTML Header */
		setDiffResultHtmlHeader(resultBuf);
		
		/* diff Result HTML Body */
		setDiffResultHtmlBody(resultBuf, leftDiffType, rightDiffType, leftLines, rightLines);
				
		/* diff Result HTML Footer */
		setDiffResultHtmlFooter(resultBuf);
		
		return resultBuf;
	}

	private void setDiffResultHtmlBody(StringBuffer resultBuf,
			String[] leftDiffType, String[] rightDiffType, String[] leftLines,
			String[] rightLines) {
		
		/* resultHtmlBody */		
		for(int leftLineNo=1, rightLineNo=1; (leftLineNo <= leftLines.length) || (rightLineNo <= rightLines.length) ; ){
		
			/* leftDiffType */
			String leftDiffTypeItem = "-";
			if((rightLineNo <= rightLines.length) && ("a".equals(rightDiffType[rightLineNo]))){
				leftDiffTypeItem = "-";
			}
			else{
				if(leftLineNo <= leftLines.length){
					if(leftDiffType[leftLineNo] != null){
						leftDiffTypeItem = leftDiffType[leftLineNo];
					}else{
						leftDiffTypeItem = "n";
					}
				}
				else{
					leftDiffTypeItem = "-";
				}
			}
			
			/* rightDiffType */
			String rightDiffTypeItem = "-";
			if((leftLineNo <= leftLines.length) && ("d".equals(leftDiffType[leftLineNo]))){
				rightDiffTypeItem = "-";
			}
			else{
				if(rightLineNo <= rightLines.length){
					if(rightDiffType[rightLineNo] != null){
						rightDiffTypeItem = rightDiffType[rightLineNo];
					}else{
						rightDiffTypeItem = "n";
					}
				}
				else{
					rightDiffTypeItem = "-";
				}
			}
			
			String tbodyTagClassAttribute = "";
			
			if((leftLineNo <= leftLines.length) && ("d".equals(leftDiffType[leftLineNo]))){
				tbodyTagClassAttribute = "class=\"del\"";
			}
			else if(((leftLineNo <= leftLines.length) && ("c".equals(leftDiffType[leftLineNo])))
					||((rightLineNo <= rightLines.length) && ("c".equals(rightDiffType[rightLineNo])))){
				tbodyTagClassAttribute = "class=\"mod\"";
			}
			else if((rightLineNo <= rightLines.length) && ("a".equals(rightDiffType[rightLineNo]))){
				tbodyTagClassAttribute = "class=\"add\"";
			}
			
			String tbodyTagStart = "<tbody " + tbodyTagClassAttribute + ">\r\n"; 
			resultBuf.append(tbodyTagStart);
			
			resultBuf.append("<tr>\r\n");
			
			/* left LineNo */
			resultBuf.append("<th>");
			if(isAddLines(rightLines, rightDiffType, rightLineNo)){
				resultBuf.append("-");
			}
			else{
				if(leftLineNo <= leftLines.length){
					/* right가 변경되고  left의 해당라인에 변경이 없으면 leftNo는 증가하지 않는다. */
					if("n".equals(leftDiffTypeItem) && "c".equals(rightDiffTypeItem)){
						resultBuf.append("-");
					}
					else{
						resultBuf.append(leftLineNo);
					}
				}
				else{
					resultBuf.append("-");
				}
			}
			resultBuf.append("</th>");
			
			
			/* leftDiffType */			
//			resultBuf.append("<td>");
//			resultBuf.append(leftDiffTypeItem);
//			resultBuf.append("</td>");
			
		
			
			
			/* left LineContents */
			resultBuf.append("<td class=\"l\">");			
			if(isAddLines(rightLines, rightDiffType, rightLineNo)){
				resultBuf.append("&nbsp");
			}
			else{			
				if(leftLineNo <= leftLines.length){
					/* right가 변경되고  left의 해당라인에 변경이 없으면 left는 blank(&nbsp)를 출력한다. */
					if("n".equals(leftDiffTypeItem) && "c".equals(rightDiffTypeItem)){
						resultBuf.append("&nbsp");
					}
					else{
						if(leftLines[leftLineNo-1].length() != 0){
							if((leftLineNo <= leftLines.length) && ("d".equals(leftDiffType[leftLineNo]))){
								resultBuf.append("<del>");
								resultBuf.append(leftLines[leftLineNo-1]);
								resultBuf.append("</del>");
							}
							else if((leftLineNo <= leftLines.length) && ("c".equals(leftDiffType[leftLineNo]))){
								resultBuf.append("<mod>");
								resultBuf.append(leftLines[leftLineNo-1]);
								resultBuf.append("</mod>");
							}
							else if((leftLineNo <= leftLines.length) && ("a".equals(leftDiffType[leftLineNo]))){
								resultBuf.append("<add>");
								resultBuf.append(leftLines[leftLineNo-1]);
								resultBuf.append("</add>");
							}
							else{
								resultBuf.append(leftLines[leftLineNo-1]);
							}
						}
						else{
							resultBuf.append("&nbsp");
						}
					}
				}
				else{
					resultBuf.append("&nbsp");
				}
			}
			
			resultBuf.append("</td>");
			
			/* right LineNo */
			resultBuf.append("<th>");
			if(isDelLines(leftLines, leftDiffType, leftLineNo)){
				resultBuf.append("-");
			}
			else{
				if(rightLineNo <= rightLines.length){
					/* left가 변경되고 right의 해당라인에 변경이 없으면 rightNo는 증가하지 않는다. */
					if("c".equals(leftDiffTypeItem) && "n".equals(rightDiffTypeItem)){
						resultBuf.append("-");
					}
					else{
						resultBuf.append(rightLineNo);
					}
				}
				else{
					resultBuf.append("-");
				}
			}
			resultBuf.append("</th>");
			
			
			/* rightDiffType */
//			resultBuf.append("<td>");
//			resultBuf.append(rightDiffTypeItem);
//			resultBuf.append("</td>");
			
			/* right LineContents */			
			resultBuf.append("<td class=\"r\">");
			if(isDelLines(leftLines, leftDiffType, leftLineNo)){
				resultBuf.append("&nbsp");
			}
			else{
				if(rightLineNo <= rightLines.length){					
					/* left가 변경되고  right의 해당라인에 변경이 없으면 right는 blank(&nbsp)를 출력한다. */
					if("c".equals(leftDiffTypeItem) && "n".equals(rightDiffTypeItem)){
						resultBuf.append("&nbsp");
					}
					else{
						if(rightLines[rightLineNo-1].length() != 0){
							if((rightLineNo <= rightLines.length) && ("d".equals(rightDiffType[rightLineNo]))){
								resultBuf.append("<del>");
								resultBuf.append(rightLines[rightLineNo-1]);
								resultBuf.append("</del>");
							}
							else if((rightLineNo <= rightLines.length) && ("c".equals(rightDiffType[rightLineNo]))){
								resultBuf.append("<mod>");
								resultBuf.append(rightLines[rightLineNo-1]);
								resultBuf.append("</mod>");
							}
							else if((rightLineNo <= rightLines.length) && ("a".equals(rightDiffType[rightLineNo]))){
								resultBuf.append("<add>");
								resultBuf.append(rightLines[rightLineNo-1]);
								resultBuf.append("</add>");
							}
							else{
								resultBuf.append(rightLines[rightLineNo-1]);
							}
						}
						else{
							resultBuf.append("&nbsp");
						}
					}
				}
				else{
					resultBuf.append("&nbsp");
				}
				
			}
			
			/* leftLineCount */
			/* right가 변경되고  left의 해당라인에 변경이 없으면 leftNo는 증가하지 않는다. */
			if("n".equals(leftDiffTypeItem) && "c".equals(rightDiffTypeItem)){
				//leftLineNo--;
			}
			else{
				if(!isAddLines(rightLines, rightDiffType, rightLineNo)){
					leftLineNo++;
				}
			}
			
			/* rightLineCount */
			/* left가 변경되고 right의 해당라인에 변경이 없으면 rightNo는 증가하지 않는다. */
			if("c".equals(leftDiffTypeItem) && "n".equals(rightDiffTypeItem)){
				//rightLineNo--;
			}
			else{
				if(!isDelLines(leftLines, leftDiffType, leftLineNo)){
					rightLineNo++;
				}
			}
			
			
			
			resultBuf.append("</td>");			
			resultBuf.append("\r\n</tr>");			
			resultBuf.append("\r\n</tbody>\r\n");
		}
		
	}

	private boolean isDelLines(String[] leftLines,
			String[] leftDiffType, int leftLineNo) {
		if((leftLineNo <= leftLines.length) && ("d".equals(leftDiffType[leftLineNo]))){
			return true;
		}
		else{
			return false;
		}
	}

	private boolean isAddLines(String[] rightLines,
			String[] rightDiffType, int rightLineNo) {
		if((rightLineNo <= rightLines.length) && ("a".equals(rightDiffType[rightLineNo]))){
			return true;
		}
		else{
			return false;
		}
	}
	

	private void setDiffResultHtmlHeader(StringBuffer resultBuf) {
		//resultBuf.append("<html>\r\n");
		//resultBuf.append("<body>\r\n");
		if(getDiffResultHtmlHeaderPath() != null){
			try {
				resultBuf.append(FileUtils.getStringFromFile(getDiffResultHtmlHeaderPath()));
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	private void setDiffResultHtmlFooter(StringBuffer resultBuf) {
		//resultBuf.append("</table>\r\n");
		//resultBuf.append("</body>\r\n");
		//resultBuf.append("</html>\r\n");
		
		if(getDiffResultHtmlFooterPath()!= null){
			try {
				resultBuf.append(FileUtils.getStringFromFile(getDiffResultHtmlFooterPath()));
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	private void setDiffTypeFromDifference(List<Difference> diffs,
			String[] leftDiffType, String[] rightDiffType) {
		for (Difference diff : diffs) {
			int        delStart = diff.getDeletedStart();
            int        delEnd   = diff.getDeletedEnd();
            int        addStart = diff.getAddedStart();
            int        addEnd   = diff.getAddedEnd();
			String     type     = delEnd != Difference.NONE && addEnd != Difference.NONE ? "c" : (delEnd == Difference.NONE ? "a" : "d");
			
            
            /* leftStart/End */
            int leftStartLineNo = getDiffStartLineNo(delStart, delEnd);
            int leftEndLineNo = getDiffEndLineNo(delStart, delEnd);
            
            /* rightStart/End */
            int rightStartLineNo = getDiffStartLineNo(addStart, addEnd);
            int rightEndLineNo = getDiffEndLineNo(addStart, addEnd);
            
            
            //System.out.println(leftStartLineNo+"," + leftEndLineNo + type + rightStartLineNo+"," + rightEndLineNo);
			for(int leftLineNo=leftStartLineNo; leftLineNo <= leftEndLineNo ; leftLineNo++){
				leftDiffType[leftLineNo] = type;
			}	    
			
			for(int rightLineNo=rightStartLineNo; rightLineNo <= rightEndLineNo ; rightLineNo++){
				rightDiffType[rightLineNo] = type;
			}
		}
		
	}

	private int getDiffEndLineNo(int start, int end) {
		int startLineNo = getDiffStartLineNo(start, end);
		int endLineNo = 0;
		
        if (end != Difference.NONE && start != end) {
        	endLineNo = 1 + end;
        }
        else{
        	endLineNo = startLineNo;
        }
        
        return endLineNo;
	}

	private int getDiffStartLineNo(int start, int end) {
		return (end == Difference.NONE ? start : (1 + start));
	}

}
