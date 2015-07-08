<%@ page language="java" import="java.util.*" pageEncoding="EUC-KR"%>
<%
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
String RootPath = request.getContextPath() + "/";
String ImgPath  = request.getContextPath() + "/images/";
%>
<%@taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
<title>SHMS</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link href="<%=RootPath%>css/common01.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
body { margin-left: 0px; margin-top: 0px; margin-right: 0px; margin-bottom: 0px; }
-->
</style>
</head>
  
<body>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
    <td width="700" height="22" background="<%=ImgPath%>footer_bg.gif">
    	<div align="center">
    		<img src="<%=ImgPath%>footer.gif" width="300" height="22">
    	</div>
    </td>
    <td background="<%=ImgPath%>footer_bg.gif">&nbsp;</td>
</tr>
</table>

</body>
</html>
