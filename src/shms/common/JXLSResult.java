package shms.common;

/**
 * 엑셀 및 오피스 관련 Result 구현물 
 * 향후 조정 필요 당분간STOP 
 * 09.11.23 peterkang
 */

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;

import net.sf.jxls.transformer.XLSTransformer;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.struts2.StrutsStatics;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.Result;
import com.opensymphony.xwork2.util.TextParseUtil;

public class JXLSResult implements Result {
 	/** 엑셀 템플릿 */
    private String template;
    /** 엑셀에 출력할 객체들 */
    private String beans;
    /** 파일이름을 얻어올 키값 */
    private String filenameKey = "filename";




	public void execute(ActionInvocation invocation) throws Exception {
	    
		ActionContext actionContext = invocation.getInvocationContext();
	    ServletContext context = (ServletContext) actionContext.get(StrutsStatics.SERVLET_CONTEXT);
	    
	    HttpServletResponse response 
	        = (HttpServletResponse) actionContext.get(StrutsStatics.HTTP_RESPONSE);
	    
	    // 출력할 bean들을 만든다.
	    Map<String, Object> beanParams = new HashMap<String, Object>();
	    String[] beanNames = splitBeans();
	    for (String beanName : beanNames) {
	        beanParams.put(beanName, invocation.getStack().findValue(beanName));
	    }
	    
	    XLSTransformer transformer = new XLSTransformer();
	    InputStream is = null;
	    
	    HSSFWorkbook workbook;
	    String finalTemplate = TextParseUtil.translateVariables(this.template, invocation.getStack());
	    try {
	        is = readTemplate(finalTemplate, context);
	        workbook = transformer.transformXLS(is, beanParams);
	    } finally {
	        if (is != null) {
	            try {
	                is.close();
	            } catch (IOException e) {
	                // 무시
	            }
	        }
	    }
	    String filename = invocation.getStack().findString(filenameKey);
	    if (filename == null) filename = "기본파일이름";
	    writeWorkbook(filename, response, workbook);
	}
	
	/** 엑셀에 출력할 객체이름(key)들을 분리한다. */
	private String[] splitBeans() {
	    return this.beans.split(",");
	}
	/** 엑셀 결과를 출력한다. */
	private void writeWorkbook(
	    String filename, HttpServletResponse response, HSSFWorkbook workbook) 
	    throws IOException {
	    response.setHeader(
	        "Content-disposition", "attachment;filename=" + encodeFileName(filename + ".xls"));
	    response.setContentType("application/x-msexel");
	    workbook.write(response.getOutputStream());
	}
	/** 파일이름 인코딩 */
	private String encodeFileName(String filename) {
	    try {
	        return URLEncoder.encode(filename, "UTF-8");
	    } catch (UnsupportedEncodingException e) {
	        throw new RuntimeException(e.getMessage(), e);
	    }
	}
	/** 엑셀 템플릿을 읽는다. */
	private InputStream readTemplate(
	    String finalTemplate, ServletContext context) throws FileNotFoundException {
	    String templateFilePath = context.getRealPath(finalTemplate);
	    return new FileInputStream(templateFilePath);
	}
	
	/**
	 * @param template 엑셀 템플릿
	 */
	public void setTemplate(String template) {
	    this.template = template;
	}
	/**
	 * @param beans 엑셀에 출력할 객체들
	 */
	public void setBeans(String beans) {
	    this.beans = beans;
	}
	/**
	 * @param filenameKey 파일이름을 얻어올 키값
	 */
	public void setFilenameKey(String filenameKey) {
	    this.filenameKey = filenameKey;
	}
}






