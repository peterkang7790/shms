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
	function channelIdChk(channel_id){
		toUpper(channel_id);
		$('#agreeView').load('../baseInfo/channelIdChk.do', {channel_id:channel_id.value});
	}
</script>
<style type="text/css">
<!--
body { margin-left: 0px; margin-top: 0px; margin-right: 0px; margin-bottom: 0px;}
-->
</style>

</head>

<body bgproperties="fixed">

<s:form name="form1" namespace="/baseInfo"  action="addChannel" theme="simple" method="get">

<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" background="../images/bg.gif">
<tr>
	<td valign="top">
		<table width="400" height="250" border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td width="250" height="40" background="../images/popup_img_bg.gif">
				<table width="400" height="40" border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td width="32"><img src="../images/popup_img_point.gif" width="32" height="40"></td>
					<td width="198" class="popup_title" style="padding-top:4px">채널 등록</td>
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
							<td height="25" class="MS05td" width="110"><div align="center">채널ID</div></td>
							<td width="260" class="MS06td" style="padding-left:5px">
								<input type="text" name="channel_id" id="channel_id" class="box" style="width:130" onblur="javascript:channelIdChk(this)">
								<br>
								<span id="agreeView"></span>
							</td>
						</tr>
						<tr>
							<td height="25" class="MS05td" width="110"><div align="center">채널명</div></td>
							<td width="265" class="MS07td" style="padding-left:5px">
								<input type="text" name="channel_nm" id="channel_nm" class="box" style="width:130">
							</td>
						</tr>
						<tr>
							<td height="25" class="MS05td" width="110"><div align="center">디렉터</div></td>
							<td class="MS06td" style="padding-left:5px">
								<s:select name="detector_id" id="detector_id" list="detector_list" listKey="detector_id" listValue="detector_nm" headerKey="" headerValue="선택" cssStyle="width:130px"></s:select>
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
						<s:url id="baseInfo" action="addChannel">
						<s:param name="channel_id" value="channel_id" />
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
