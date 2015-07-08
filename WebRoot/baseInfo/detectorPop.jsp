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
	function detectorIdChk(detector_id){
		toUpper(detector_id);
		$('#agreeView').load('../baseInfo/detectorIdChk.do', {detector_id:detector_id.value});
	}
</script>
<style type="text/css">
<!--
body { margin-left: 0px; margin-top: 0px; margin-right: 0px; margin-bottom: 0px;}
-->
</style>

</head>

<body bgproperties="fixed">

<s:form name="form1" namespace="/baseInfo"  action="addDetector" theme="simple" method="get">

<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" background="../images/bg.gif">
<tr>
	<td valign="top">
		<table width="400" height="250" border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td width="250" height="40" background="../images/popup_img_bg.gif">
				<table width="400" height="40" border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td width="32"><img src="../images/popup_img_point.gif" width="32" height="40"></td>
					<td width="198" class="popup_title" style="padding-top:4px">디텍터 등록</td>
					<td width="170"><img src="../images/popup_img_text.gif" width="170" height="40"></td>
				</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td height="6" bgcolor="#d7edf9"></td>
		</tr>
		<tr>
			<td height="204" valign="top" bgcolor="#FFFFFF" style="padding:40px 0px 0px 40px;">
				<table width="320" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td><table width="320" border="0" cellpadding="0" cellspacing="1" class="MSlinetd">
						<tr>
							<td colspan="2" height="2" class="MS01td"></td>
						</tr>
						<tr>
							<td height="25" class="MS05td" width="110"><div align="center">디텍터ID</div></td>
							<td width="260" class="MS07td" style="padding-left:5px">
								<input type="text" name="detector_id" id="detector_id" class="box" style="width:130" onblur="javascript:detectorIdChk(this)">
								<br>
								<span id="agreeView"></span>
							</td>
						</tr>
						<tr>
							<td height="25" class="MS05td" width="110"><div align="center">디텍터명</div></td>
							<td width="265" class="MS07td" style="padding-left:5px">
								<input type="text" name="detector_nm" id="detector_nm" class="box" style="width:130">
							</td>
						</tr>
						<tr>
							<td height="25" class="MS05td" width="110"><div align="center">디텍터IP</div></td>
							<td width="265" class="MS07td" style="padding-left:5px">
								<input type="text" name="detector_ip" id="detector_ip" class="box" style="width:130">
							</td>
						</tr>
						<tr>
							<td height="25" class="MS05td" width="110"><div align="center">디텍터PORT</div></td>
							<td width="265" class="MS07td" style="padding-left:5px">
								<input type="text" name="detector_port" id="detector_port" class="box" style="width:130">
							</td>
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
						<s:url id="baseInfo" action="addDetector">
						<s:param name="detector_id" value="detector_id" />
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
