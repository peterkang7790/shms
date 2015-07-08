<%@ page language="java" import="java.util.*" pageEncoding="EUC-KR"%>
<%
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
String trouble_id = request.getParameter("trouble_id");
if(trouble_id==null) trouble_id = "";
%>
<%@taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
<title>SHMS</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="../css/common01.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../script/ComUtil.js" ></script>
<style type="text/css">
<!--
body { margin-left: 0px; margin-top: 0px; margin-right: 0px; margin-bottom: 0px;}
-->
</style>

</head>

<body bgproperties="fixed">

<s:form id="form1" name="form1" namespace="/alarmManage" action="editTrouble" theme="simple" method="get">
<s:push value="rsDetailTrouble" >

<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" background="../images/bg.gif">
<tr>
	<td valign="top">
		<table width="750" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td height="32" background="../images/title_bg.gif">
				<table width="740" border="0" cellspacing="0" cellpadding="0" style="padding:0px 0px 0px 5px;">
				<tr>
					<td width="20" valign="top"><img src="../images/point_title_01.gif" width="20" height="17"></td>
					<td width="270" class="title_01">경보 조치 </td>
					<td width="450" class="route"><div align="right">홈 &nbsp;&gt;&nbsp;경보관리&nbsp;&gt;&nbsp; 경보관리</div></td>
				</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td height="57" valign="top">
				<table width="740" height="16" border="0" cellpadding="0" cellspacing="0" style="padding:30px 0px 0px 1px;">
				<tr>
					<td width="12" valign="middle"><img src="../images/point_title_02.gif" width="5" height="13"></td>
					<td width="682" class="title_02">경보정보</td>
				</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td><table width="750" border="0" cellpadding="0" cellspacing="1" class="MSlinetd">
				<tr>
					<td height="2" class="MS01td" colspan="2"></td>
				</tr>
				<tr>
					<td width="110" height="25" class="MS05td"><div align="center">경보ID</div></td>
					<td width="630" class="MS06td" style="padding-left:5px">
						<input type="text" name="trouble_id" value="${trouble_id}" class="m_box" style="width:120" readonly/>	
					</td>
				</tr>
				<tr>
					<td width="110" height="25" class="MS05td"><div align="center">경보해지사유</div></td>
					<td width="630" class="MS06td" style="padding-left:5px">
						<textarea name="trouble_cancel_reason" style="width:530">${trouble_cancel_reason}</textarea> 
					</td>
				</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td><table width="750" border="0" cellspacing="0" cellpadding="0">
				<tr><td height="20"></td></tr>
				<tr>
					<td align="center">
						<div class="text-align:center" >
						<s:submit type="image" src="../images/btn_save.gif"></s:submit>
						<s:a href="#"><img src="../images/btn_close.gif" onclick="self.close();" border="0"></s:a>
						</div>
					 </td>
				</tr>
				</table>
			</td>
		</tr>
		</table>
		
		<br><br>
	</td>
</tr>
</table>

</s:push>
</s:form>

</body>
</html>
