<%@ page language="java" import="java.util.*" pageEncoding="EUC-KR"%>
<%
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
%>
<%@taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
<title>SHMS</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link href="../css/common01.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../script/ComUtil.js" ></script>
<script type="text/javascript" src="../script/jquery.js" ></script>
<script type="text/javascript" src="../script/script.js" ></script>
<script type="text/javascript">

</script>
<style type="text/css">
<!--
body { margin-left: 0px; margin-top: 0px; margin-right: 0px; margin-bottom: 0px;}
-->
</style>

</head>

<body bgproperties="fixed">

<s:form id="formV" name="form1" namespace="/admin"  action="addCommonCodeDet" theme="simple" method="get">

<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" background="../images/bg.gif">
<tr>
	<td valign="top">
		<table width="400" height="300" border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td width="400" height="40" background="../images/popup_img_bg.gif">
				<table width="100%" height="40" border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td width="32"><img src="../images/popup_img_point.gif" width="32" height="40"></td>
					<td width="200" class="popup_title" style="padding-top:4px">공통코드  상세등록</td>
					<td width="168"><img src="../images/popup_img_text.gif" width="168" height="40"></td>
				</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td height="6" bgcolor="#d7edf9"></td>
		</tr>
		<tr>
			<td height="300" valign="top" bgcolor="#FFFFFF" style="padding:40px 20px 0px 20px;">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td>
						<table width="320" border="0" cellpadding="0" cellspacing="1" class="MSlinetd">
							<tr>
								<td colspan="2" height="1" class="MS01td"></td>
							</tr>
							<tr>
								<td height="25" class="MS05td" width="110"><div align="center">상세코드</div></td>
								<td width="260" class="MS07td" style="padding-left:5px">
									<input type="text" name="common_det_cd" id="common_cd" class="box" style="width:130" ">
								</td>
							</tr>
							<tr>
								<td height="25" class="MS05td" width="110"></td>
							</tr>
								<tr>
								<td height="25" class="MS05td" width="110"><div align="center">상세코드명</div></td>
								<td width="260" class="MS07td" style="padding-left:5px">
									<input type="text" name="common_det_nm" id="common_det_nm" class="box" style="width:130" ">
								</td>
							</tr>
							<tr>
								<td height="25" class="MS05td" width="110"></td>
							</tr>
							<tr>
								<td height="25" class="MS05td" width="110"><div align="center">표시명</div></td>
								<td width="260" class="MS07td" style="padding-left:5px">
									<input type="text" name="disp_nm" id="disp_nm" class="box" style="width:130" ">
								</td>
							</tr>
							<tr>
								<td height="25" class="MS05td" width="110"></td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td height="30"></td>
				</tr>
				<tr>
					<td align="center">
						<div class="text-align:center" >
						<s:url id="admin" action="addCommonCodeDet">
						<s:param name="common_cd" value="common_cd" />
						</s:url>
						<s:submit type="image" src="../images/btn_save.gif"></s:submit>
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
