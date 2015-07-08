<%@ page language="java" import="java.util.*" pageEncoding="EUC-KR"  contentType="text/html; charset=euc-kr"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="shms.service.Thumbnail" %>
<%
String image_name = "";		// ���ε�� �̹��� ���� �̸�
String image_sub_name = "";		// ��ȯ�� ����� �̹��� ���� �̸�

MultipartRequest multi = null;

try {
	String realFolder = application.getRealPath("upload");
	
	multi = new MultipartRequest(request, realFolder, 5*1024*1024, "utf-8", new DefaultFileRenamePolicy());

	image_name = multi.getFilesystemName("image");
	image_sub_name = image_name + ".thumb";
	
	File orgFile = new File(realFolder + "\\" + image_name);
	File destFile = new File(realFolder + "\\" + image_sub_name);
	
	Thumbnail.createThumb(orgFile, destFile, 100, 100);			// ����� ����
	
} catch (IOException ioe) {
	ioe.printStackTrace();
} catch (Exception ex) {
	ex.printStackTrace();
}
%>

���� �̹���: <%=image_name%> <br />
<img src="../upload/<%=image_name %>" border="0" alt="<%=image_name %>"> <br /><br />

����� �̹���: <%=image_sub_name %> <br />
<img src="../upload/<%=image_sub_name %>" border="0" alt="<%=image_sub_name %>"> <br /><br />