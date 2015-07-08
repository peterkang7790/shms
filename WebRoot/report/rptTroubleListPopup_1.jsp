<%@ page language="java" import="java.util.*" pageEncoding="EUC-KR"%>
<%
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
String bg = "";
String trouble_id = request.getParameter("trouble_id"); if (trouble_id==null) trouble_id = "";
%>
<%@taglib prefix="s" uri="/struts-tags" %>

<s:if test="#session.USER_ID==null">
	<s:include value="../common/AccessDenied.jsp"></s:include>
</s:if>
<s:else>

<html>
<head>
<title>SHMS</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link href="../css/common01.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../script/ComUtil.js" ></script>
<style type="text/css">
<!--
body { margin-left: 10px; margin-top: 10px; margin-right: 0px; margin-bottom: 0px;}
.style3 { color: #ffa72a; font-weight: bold; }
#floater {position:absolute; visibility:visible; }
-->
</style>
<script type="text/javascript">
	function searchTroubleList() {
		document.form1.trouble_id.value = "";
		
		rptTroubleList.method = "post";
		rptTroubleList.target = "_self";
		rptTroubleList.action = "rptTroubleList.do";
		rptTroubleList.submit();
	}
</script>
<script language="JavaScript"> 
<!-- 
self.onError=null; 
currentX = currentY = 0; 
whichIt = null; 
lastScrollX = 0; lastScrollY = 0; 
NS = (document.layers) ? 1 : 0; 
IE = (document.all) ? 1: 0; 
 
function heartBeat() { 
	if(IE) { 
		if( document.body == null || document.body == undefined || document.body == "" )
		{
			diffY = 0;
		}
		else
		{
			diffY = document.body.scrollTop;
		}
		diffX = 0; 
	} 
	if(NS) { diffY = self.pageYOffset; diffX = self.pageXOffset; } 
	if(diffY != lastScrollY) { 
		percent = .1 * (diffY - lastScrollY); 
		if(percent > 0) percent = Math.ceil(percent); 
		else percent = Math.floor(percent); 
		if(IE) document.all.floater.style.pixelTop += percent; 
		if(NS) document.floater.top += percent; 
		lastScrollY = lastScrollY + percent; 
	} 
	if(diffX != lastScrollX) { 
		percent = .1 * (diffX - lastScrollX); 
		if(percent > 0) percent = Math.ceil(percent); 
		else percent = Math.floor(percent); 
		if(IE) document.all.floater.style.pixelLeft += percent; 
		if(NS) document.floater.top += percent; 
		lastScrollY = lastScrollY + percent; 
	} 
} 
if(NS || IE) action = window.setInterval("heartBeat()",1);
-->
</script>
</head>

<body bgproperties="fixed">
<s:push value="rsRptTroubleList_Detail" >
<s:form id="form1" namespace="/report" action="rptTroubleListPopup" theme="simple" method="get">
<input type="hidden" name="trouble_id" id="trouble_id" value="<%=trouble_id%>"/>

<table width="750" height="100%" border="0" cellpadding="0" cellspacing="0" background="../images/bg.gif">
<tr>
	<td valign="top">
		<table width="750" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td height="32" colspan="2" background="../images/popup_img_bg.gif">
				<table width="740" border="0" cellspacing="0" cellpadding="0" style="padding:0px 0px 0px 5px;">
				<tr>
					<td width="32"><img src="../images/popup_img_point.gif" width="32" height="40"></td>
					<td width="270" class="popup_title" style="padding-top:4px">센서조치 내역 </td>
					<td width="170"><img src="../images/popup_img_text.gif" width="170" height="40"></td>
				</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td height="10" colspan="2"></td>
		</tr>
		<tr>
			<table width="750" border="0" cellpadding="0" cellspacing="1" class="MSlinetd">
			<tr>
				<td colspan="4" height="2" class="MS01td"></td>
			</tr>
			<tr>
				<td width="110" height="22" class="MS05td" style="padding-left:5px"><div align="left">경보ID</div></td>
				<td width="250" class="MS06td" style="padding-left:5px">
					<s:if test="trouble_id==null">&nbsp;</s:if><s:else><s:property value="trouble_id" /></s:else>
				</td>
				<td width="110" height="22" class="MS05td" style="padding-left:5px"><div align="left">센서ID</div></td>
				<td class="MS06td" style="padding-left:5px">
					<s:if test="sensor_id==null">&nbsp;</s:if><s:else><s:property value="sensor_id" /></s:else>
				</td>
			</tr>
			<tr>
				<td height="22" class="MS05td" style="padding-left:5px"><div align="left">경보등급</div></td>
				<td class="MS06td" style="padding-left:5px">
					<s:if test="trouble_class_nm==null">&nbsp;</s:if><s:else><s:property value="trouble_class_nm" /></s:else>
				</td>
				<td height="22" class="MS05td" style="padding-left:5px"><div align="left">SMS통보여부</div></td>
				<td class="MS06td" style="padding-left:5px">
					<s:if test="sms_send_yn==null">&nbsp;</s:if><s:else><s:property value="sms_send_yn" /></s:else>
				</td>
			</tr>
			<tr>
				<td height="22" class="MS05td" style="padding-left:5px"><div align="left">장애발생일시</div></td>
				<td class="MS06td" style="padding-left:5px">
					<s:if test="trouble_prod_dt==null">&nbsp;</s:if><s:else><s:property value="trouble_prod_dt" /></s:else>
				</td>
				<td height="22" class="MS05td" style="padding-left:5px"><div align="left">조치일시</div></td>
				<td class="MS06td" style="padding-left:5px">
					<s:if test="marking_dt==null">&nbsp;</s:if><s:else><s:property value="marking_dt" /></s:else>
				</td>
			</tr>
			<tr>
				<td height="22" class="MS05td" style="padding-left:5px"><div align="left">조치여부</div></td>
				<td class="MS06td" style="padding-left:5px">
					<s:if test="marking_yn==null">&nbsp;</s:if><s:else><s:property value="marking_yn" /></s:else>
				</td>
				<td height="22" class="MS05td" style="padding-left:5px"><div align="left">조치자</div></td>
				<td class="MS06td" style="padding-left:5px">
					<s:if test="user_nm==null">&nbsp;</s:if>
					<s:else>
						<s:property value="user_nm" /> &nbsp;
						(<s:if test="user_id==null">&nbsp;</s:if><s:else><s:property value="user_id" /></s:else>)
					</s:else>
				</td>
			</tr>
			<tr>
				<td height="22" class="MS05td" style="padding-left:5px"><div align="left">경보접속URL</div></td>
				<td class="MS06td" style="padding-left:5px" colspan="3">
					<s:if test="trouble_url==null">&nbsp;</s:if><s:else><s:property value="trouble_url" /></s:else>
				</td>
			</tr>
			<tr>
				<td height="22" class="MS05td" style="padding-left:5px"><div align="left">경보메시지</div></td>
				<td class="MS06td" style="padding-left:5px" colspan="3">
					<s:if test="trouble_msg==null">&nbsp;</s:if><s:else><s:property value="trouble_msg" /></s:else>
				</td>
			</tr>
			<tr>
				<td height="22" class="MS05td" style="padding-left:5px"><div align="left">장애해지사유</div></td>
				<td class="MS06td" style="padding-left:5px" colspan="3">
					<s:if test="trouble_cancel_reason==null">&nbsp;</s:if><s:else><s:property value="trouble_cancel_reason" /></s:else>
				</td>
			</tr>
			</table>
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
<%--				<s:submit type="image" src="../images/btn_save.gif"></s:submit>--%>
				<s:a href="#"><img src="../images/btn_close.gif" onclick="self.close();" border="0"></s:a>
				</div>
			</td>
		</tr>
		</table>
	</td>
</tr>
</table>

</s:form>
</s:push>
<table><tr><td height="15"></td></tr></table>
</body>
</html>

</s:else>
