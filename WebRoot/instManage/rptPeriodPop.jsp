<%@ page language="java" import="java.util.*" pageEncoding="EUC-KR"%>
<%
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
String bg = "";
%>
<%@taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
<title>SHMS</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link href="../css/common01.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
body { margin-left: 0px; margin-top: 0px; margin-right: 0px; margin-bottom: 0px;}
-->
</style>

</head>

<body bgproperties="fixed">

<s:form id="formV" name="form1" namespace="/instManage"  action="rptPeriodPop" theme="simple" method="get">

<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" background="../images/bg.gif">
<tr>
	<td valign="top">
		<table width="450" height="250" border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td width="250" height="40" background="../images/popup_img_bg.gif">
				<table width="450" height="40" border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td width="32"><img src="../images/popup_img_point.gif" width="32" height="40"></td>
					<td width="198" class="popup_title" style="padding-top:4px"><s:property value="period_cd"/> 정보</td>
					<td width="170"><img src="../images/popup_img_text.gif" width="170" height="40"></td>
				</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td height="6" bgcolor="#d7edf9"></td>
		</tr>
		<tr>
			<td height="300" valign="top" bgcolor="#FFFFFF" style="padding:20px 0px 0px 0px;">
				<table width="450" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td>
							<table width="450" border="0" cellpadding="0" cellspacing="1" class="MSlinetd">
								<tr>
									<td colspan="4" height="2" class="MS01td"></td>
								</tr>
								<tr>
									<td width="100" height="25" class="MS05td" width="110"><div align="center">구분</div></td>
									<td width="350" class="MS07td" style="padding-left:5px" colspan="3">
									  <s:if test="itemDt!=null"><s:property value="itemDt"/></s:if>
									</td>
								</tr>
								<tr>
									<td height="25" class="MS05td" width="110"><div align="center">시작:마지막</div></td>
									<td width="260" class="MS07td" style="padding-left:5px" colspan="3">
										<s:if test="scVal!=null"><s:property value="scVal"/></s:if>
									</td>
								</tr>
								<tr>
									<td height="25" class="MS05td" width="110"><div align="center">최고:최저</div></td>
									<td width="265" class="MS07td" style="padding-left:5px" colspan="3">
										<s:if test="hlVal!=null"><s:property value="hlVal"/></s:if>
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td height="20"></td>
					</tr>
					<tr>
						<td align="center">
							<div class="text-align:center" >
								<s:a href="#"><img src="../images/btn_close.gif" onclick="self.close();" border="0"></s:a>
							</div>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		</table>
	</td>
</tr>
</table>

</s:form>

</body>
</html>