<%@ page language="java" import="java.util.*" pageEncoding="EUC-KR"  contentType="text/html; charset=euc-kr"%>
<%
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
String RootPath = request.getContextPath() + "/";
String ImgPath  = request.getContextPath() + "/images/";
%>




<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@taglib prefix="s" uri="/struts-tags" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<title>SHMS-PDA</title>
<link href="../css/pdaStyle.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="<%=RootPath%>script/jquery.js"></script>
	<script type="text/javascript" src="<%=RootPath%>script/script.js"></script>
	<script type="text/javascript" src="../scripts/md5.js" language="javascript"></script>
	<script language="javascript">
	
	$(document).ready(function(){
		$('#user_id').focus();
		
		$('form').submit(function(){
			if($('#user_id').val() == ''){
				alert("ID를 입력해 주세요");		
				$('#user_id').focus();
				return false;
			}
			
			if($('#password').val() == ''){
				alert("패스워드를 입력해 주세요");		
				$('#password').focus();
				return false;
			}
		});
	});

</script>
<script language="javascript">
	function init(){
		var ID = document.getElementById("user_id");
		ID.focus();
	}
</script>
</head>

<body onLoad="init()">

<s:form theme="simple"  action="loginUserPda">
<table width="235px" border="0" cellspacing="0" cellpadding="0" class="loginTable" >
	<tr>
		<th colspan="2" height="100px">
		<img src="../pdaImages/pdaLogin_top.gif" width="235px" height="90"/>
		</th>
	</tr>
	<tr>
		<td width="80px" style="text-align:right;"><img src="../pdaImages/pdaLogin_id.gif" /></td>
		<td width="150px"><input type="text" name="user_id" id="user_id" size="15"/></td>
	</tr>
	<tr>
		<td width="80px" style="text-align:right;"><img src="../pdaImages/pdaLogin_pw.gif" /></td>
		<td><input type="text" name="password" id="password" size="15"/></td>
	</tr>
	<tr>
		<td colspan="2"  height="60px" style="text-align:center;">
			<a href="../pdaAlarmStatus/listAlarmStatus.do">
			<s:submit type="image" src="../pdaImages/btn_login.gif" title="loginbtn" onfocus="this.blur();"/>
			</a>
		</td>
	</tr>
	<tr>
		<td colspan="2" id="footer">Copyright (c) LSware Inc. </td>
	</tr>
</table>


</s:form>
</body>
</html>
