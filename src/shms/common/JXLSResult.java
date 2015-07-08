package shms.common;

/**
 * ���� �� ���ǽ� ���� Result ������ 
 * ���� ���� �ʿ� ��а�STOP 
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
 	/** ���� ���ø� */
    private String template;
    /** ������ ����� ��ü�� */
    private String beans;
    /** �����̸��� ���� Ű�� */
    private String filenameKey = "filename";




	public void execute(ActionInvocation invocation) throws Exception {
	    
		ActionContext actionContext = invocation.getInvocationContext();
	    ServletContext context = (ServletContext) actionContext.get(StrutsStatics.SERVLET_CONTEXT);
	    
	    HttpServletResponse response 
	        = (HttpServletResponse) actionContext.get(StrutsStatics.HTTP_RESPONSE);
	    
	    // ����� bean���� �����.
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
	                // ����
	            }
	        }
	    }
	    String filename = invocation.getStack().findString(filenameKey);
	    if (filename == null) filename = "�⺻�����̸�";
	    writeWorkbook(filename, response, workbook);
	}
	
	/** ������ ����� ��ü�̸�(key)���� �и��Ѵ�. */
	private String[] splitBeans() {
	    return this.beans.split(",");
	}
	/** ���� ����� ����Ѵ�. */
	private void writeWorkbook(
	    String filename, HttpServletResponse response, HSSFWorkbook workbook) 
	    throws IOException {
	    response.setHeader(
	        "Content-disposition", "attachment;filename=" + encodeFileName(filename + ".xls"));
	    response.setContentType("application/x-msexel");
	    workbook.write(response.getOutputStream());
	}
	/** �����̸� ���ڵ� */
	private String encodeFileName(String filename) {
	    try {
	        return URLEncoder.encode(filename, "UTF-8");
	    } catch (UnsupportedEncodingException e) {
	        throw new RuntimeException(e.getMessage(), e);
	    }
	}
	/** ���� ���ø��� �д´�. */
	private InputStream readTemplate(
	    String finalTemplate, ServletContext context) throws FileNotFoundException {
	    String templateFilePath = context.getRealPath(finalTemplate);
	    return new FileInputStream(templateFilePath);
	}
	
	/**
	 * @param template ���� ���ø�
	 */
	public void setTemplate(String template) {
	    this.template = template;
	}
	/**
	 * @param beans ������ ����� ��ü��
	 */
	public void setBeans(String beans) {
	    this.beans = beans;
	}
	/**
	 * @param filenameKey �����̸��� ���� Ű��
	 */
	public void setFilenameKey(String filenameKey) {
	    this.filenameKey = filenameKey;
	}
}






