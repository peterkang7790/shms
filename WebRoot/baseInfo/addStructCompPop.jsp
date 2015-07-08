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
	function structCompIdChk(strId){
		toUpper(strId);
		$('#agreeView').load('../baseInfo/structCompIdChk.do', {struct_comp_id:strId.value});
	}
</script>
<style type="text/css">
<!--
body { margin-left: 0px; margin-top: 0px; margin-right: 0px; margin-bottom: 0px;}
-->
</style>

</head>

<body bgproperties="fixed">

<s:form name="form1" namespace="/baseInfo"  action="addStructCompPop" theme="simple" method="get">

<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" background="../images/bg.gif">
<tr>
	<td valign="top">
		<table width="500" height="250" border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td width="250" height="40" background="../images/popup_img_bg.gif">
				<table width="500" height="40" border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td width="32"><img src="../images/popup_img_point.gif" width="32" height="40"></td>
					<td width="198" class="popup_title" style="padding-top:4px">구조물구성등록</td>
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
				<table width="420" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td><table width="420" border="0" cellpadding="0" cellspacing="1" class="MSlinetd">
						<tr>
							<td colspan="2" height="2" class="MS01td"></td>
						</tr>
						<tr>
							<td height="25" class="MS05td" width="110" style="padding-left:10px"><div align="left">구조물구성ID</div></td>
							<td width="260" class="MS06td" style="padding-left:5px">
								<input type="text" name="struct_comp_id" id="struct_comp_id" class="box" style="width:130" onblur="javascript:structCompIdChk(this)">
								<br>
								<span id="agreeView"></span>
							</td>
						</tr>
						<tr>
							<td height="25" class="MS05td" width="110" style="padding-left:10px"><div align="left">구성명</div></td>
							<td width="265" class="MS06td" style="padding-left:5px">
								<input type="text" name="struct_comp_nm" id="struct_comp_nm" class="box" style="width:130">
							</td>
						</tr>
						<tr>
							<td height="25" class="MS05td" width="110" style="padding-left:10px"><div align="left">상위ID</div></td>
							<td class="MS06td" style="padding-left:5px">
								<s:select name="p_struct_comp_id" id="p_struct_comp_id" list="list_p_struct_comp" listKey="p_struct_comp_id" listValue="struct_comp_nm" headerKey="" headerValue="상위ID선택" cssStyle="width:130px"></s:select>
							</td>
						</tr>
						<tr>
							<td height="25" class="MS05td" width="110" style="padding-left:10px"><div align="left">비고</div></td>
							<td width="265" class="MS06td" style="padding-left:5px">
								<textarea name="descr" style="width:300">${descr}</textarea>
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
						<s:url id="baseInfo" action="addStructCompPop">
						<s:param name="struct_comp_id" value="struct_comp_id" />
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
