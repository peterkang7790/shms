<%@ page language="java" import="java.util.*" pageEncoding="EUC-KR"  contentType="text/html; charset=euc-kr"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="shms.service.Thumbnail" %>
<%
String image_name = "";		// 업로드된 이미지 파일 이름
String image_sub_name = "";		// 변환된 썸네일 이미지 파일 이름

MultipartRequest multi = null;

try {
	String realFolder = application.getRealPath("upload");
	
	multi = new MultipartRequest(request, realFolder, 5*1024*1024, "utf-8", new DefaultFileRenamePolicy());

	image_name = multi.getFilesystemName("image");
	image_sub_name = image_name + ".thumb";
	
	File orgFile = new File(realFolder + "\\" + image_name);
	File destFile = new File(realFolder + "\\" + image_sub_name);
	
	Thumbnail.createThumb(orgFile, destFile, 100, 100);			// 썸네일 생성
	
} catch (IOException ioe) {
	ioe.printStackTrace();
} catch (Exception ex) {
	ex.printStackTrace();
}
%>

원본 이미지: <%=image_name%> <br />
<img src="../upload/<%=image_name %>" border="0" alt="<%=image_name %>"> <br /><br />

썸네일 이미지: <%=image_sub_name %> <br />
<img src="../upload/<%=image_sub_name %>" border="0" alt="<%=image_sub_name %>"> <br /><br />