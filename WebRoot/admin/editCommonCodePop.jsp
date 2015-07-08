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

<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" background="../images/bg.gif">
<tr>
	<td valign="top">
		<table width="400" height="250" border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td width="250" height="40" background="../images/popup_img_bg.gif">
				<table width="400" height="40" border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td width="32"><img src="../images/popup_img_point.gif" width="32" height="40"></td>
					<td width="198" class="popup_title" style="padding-top:4px">공통코드 상세</td>
					<td width="170"><img src="../images/popup_img_text.gif" width="170" height="40"></td>
				</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td height="6" bgcolor="#d7edf9"></td>
		</tr>
		<tr>
		<s:push value="detailCommonCodePop" >
			<td height="204" valign="top" bgcolor="#FFFFFF" style="padding:40px 0px 0px 40px;">
				<table width="320" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td><table width="320" border="0" cellpadding="0" cellspacing="1" class="MSlinetd">
						<tr>
							<td colspan="2" height="2" class="MS01td"></td>
						</tr>
						<tr>
							<td height="25" class="MS05td" width="110"><div align="center">공통코드ID</div></td>
							<td width="260" class="MS07td" style="padding-left:5px">
								<s:if test="common_cd==null">&nbsp;</s:if>
								<s:else><s:property value="common_cd" /></s:else> 
							</td>
						</tr>
						<tr>
							<td height="25" class="MS05td" width="110"><div align="center">공통코드명</div></td>
							<td width="265" class="MS07td" style="padding-left:5px">
								<s:if test="common_nm==null">&nbsp;</s:if>
								<s:else><s:property value="common_nm" /></s:else> 
							</td>
						</tr>
						<tr>
							<td height="25" class="MS05td" width="110"><div align="center">코드유형</div></td>
							<td width="265" class="MS07td" style="padding-left:5px">
								<s:if test="code_type==null">&nbsp;</s:if>
								<s:else><s:property value="code_type" /></s:else> 
							</td>
						</tr>
						<tr>
							<td height="25" class="MS05td" width="110"><div align="center">테이블명</div></td>
							<td width="265" class="MS07td" style="padding-left:5px">
								<s:if test="table_name==null">&nbsp;</s:if>
								<s:else><s:property value="table_name" /></s:else> 
							</td>
						</tr>
					
						<tr id="fId">
							<td height="25" class="MS05td" width="110"><div align="center">필드명</div></td>
							<td width="265" class="MS07td" style="padding-left:5px">
								<s:if test="field_name==null">&nbsp;</s:if>
								<s:else><s:property value="field_name" /></s:else> 
							</td>
						</tr>
						<tr>
							<td height="25" class="MS05td" width="110"><div align="center">길이</div></td>
							<td width="265" class="MS07td" style="padding-left:5px">
								<s:if test="len==null">&nbsp;</s:if>
								<s:else><s:property value="len" /></s:else>
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
						<s:url id="admin" action="editViewCommonCodePop">
						<s:param name="common_cd" value="common_cd" />
						</s:url>
						<s:a href="editViewCommonCodePop.do?common_cd=%{common_cd}"><img src="../images/btn_modify.gif" width="60" height="20" border="0" /></s:a>	                
						<s:a href="#"><img src="../images/btn_close.gif" onclick="self.close();" border="0"></s:a>
						</div>
					</td>
				</tr>
				</table>
			</td>
			</s:push>
		</tr>
		</table>
	</td>
</tr>
</table>
</body>
</html>
