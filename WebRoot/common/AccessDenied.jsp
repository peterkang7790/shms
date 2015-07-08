<%@ page language="java" import="java.util.*" pageEncoding="EUC-KR"  contentType="text/html; charset=euc-kr"%>
<%
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
String RootPath = request.getContextPath() + "/";
String ImgPath  = request.getContextPath() + "/images/";
%>
<%@taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
 
<title>SHMS</title>

<link href="<%=RootPath%>css/common01.css" rel="stylesheet" type="text/css">
   
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">    
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<script type="text/JavaScript">
	function goLogin() {
		parent.location.href = "../login.jsp";
	}
</script></head>

<body>

<table width="100%" height="100%" border="0">
<tr><td height="30"></td></tr>
<tr>
	<td align="center" valign="middle">
		<table width="90%" height="90%" border="0" cellpadding="0" cellspacing="1" class="MSlinetd" style="padding-top: 20px;">
		<tr>
			<td align="center" valign="middle" class="MS05td">
				<table>
				<tr>
					<td align="center" valign="middle" class="MS05td">
						Access denied to Windows Management Instrumentation server on SHMS. Have an administrator change your access permissions.
					</td>
				</tr>
				<tr>
					<td align="center" valign="middle" class="MS05td">
						SHMS의 서버를 액세스할 수 없습니다. 관리자에게 요청하여 액세스 권한을 변경하십시오.
					</td>
				</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td align="center" valign="middle" class="MS06td">
				<s:a href="javascript:goLogin();"><img src="../images/login_btn.gif" border="0" /></s:a>
			</td>
		</tr>
		</table>
	</td>
</tr>
</table>

</body>
</html>
