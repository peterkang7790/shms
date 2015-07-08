<%@ page language="java" import="java.util.*" pageEncoding="EUC-KR"%>
<%
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
%>
<%@taglib prefix="s" uri="/struts-tags" %>
<s:if test="#session.USER_ID==null">
	<s:include  value="../common/AccessDenied.jsp"></s:include>
</s:if>
<s:else>

<html>
<head>
<title>SHMS</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link href="../css/common01.css" rel="stylesheet" type="text/css">
<script  type="text/javascript" src="../script/ComUtil.js" ></script>
<style type="text/css">
<!--
body { margin-left: 10px; margin-top: 10px; margin-right: 0px; margin-bottom: 0px;}
.style3 { color: #ffa72a; font-weight: bold; }
#floater {position:absolute; visibility:visible; }
-->
</style>
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

<s:form id="form1" namespace="/alarmManage" action="detailTrouble" theme="simple" method="get">
<s:push value="rsDetailTrouble" >

<table width="830" height="100%" border="0" cellpadding="0" cellspacing="0" background="../images/bg.gif">
<tr>
	<td valign="top">
		<table width="750" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td height="32" background="../images/title_bg.gif">
				<table width="740" border="0" cellspacing="0" cellpadding="0" style="padding:0px 0px 0px 5px;">
				<tr>
					<td width="20" valign="top"><img src="../images/point_title_01.gif" width="20" height="17"></td>
					<td width="270" class="title_01">경보 상세보기 </td>
					<td width="450" class="route"><div align="right">홈 &nbsp;&gt;&nbsp;경보관리&nbsp;&gt;&nbsp; 경보관리</div></td>
				</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td height="57" valign="top">
				<table width="740" height="16" border="0" cellpadding="0" cellspacing="0" style="padding:10px 0px 0px 1px;">
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
						<s:if test="trouble_id==null">&nbsp;</s:if><s:else><s:property value="trouble_id" /></s:else>
					</td>
				</tr>
				<tr>
					<td width="110" height="25" class="MS05td"><div align="center">센서ID</div></td>
					<td width="630" class="MS07td" style="padding-left:5px">
						<s:if test="sensor_id==null">&nbsp;</s:if><s:else><s:property value="sensor_id" /></s:else>
					</td>
				</tr>
				<tr>
					<td width="110" height="25" class="MS05td"><div align="center">경보등급</div></td>
					<td width="630" class="MS06td" style="padding-left:5px">
						<s:if test="trouble_class_nm==null">&nbsp;</s:if><s:else><s:property value="trouble_class_nm" /></s:else>
					</td>
				</tr>
				<tr>
					<td width="110" height="25" class="MS05td"><div align="center">SMS통보여부</div></td>
					<td width="630" class="MS07td" style="padding-left:5px">
						<s:if test="sms_send_yn==null">&nbsp;</s:if><s:else><s:property value="sms_send_yn" /></s:else>
					</td>
				</tr>
				<tr>
					<td width="110" height="25" class="MS05td"><div align="center">장애발생일시</div></td>
					<td width="630" class="MS06td" style="padding-left:5px">
						<s:if test="trouble_prod_dt==null">&nbsp;</s:if><s:else><s:property value="trouble_prod_dt" /></s:else>
					</td>
				</tr>
				<tr>
					<td width="110" height="25" class="MS05td"><div align="center">경보메시지</div></td>
					<td width="630" class="MS07td" style="padding-left:5px">
						<s:if test="trouble_msg==null">&nbsp;</s:if><s:else><s:property value="trouble_msg" /></s:else>
					</td>
				</tr>
				<tr>
					<td width="110" height="25" class="MS05td"><div align="center">경보접속URL</div></td>
					<td width="630" class="MS06td" style="padding-left:5px">
						<s:if test="trouble_url==null">&nbsp;</s:if><s:else><s:property value="trouble_url" /></s:else>
					</td>
				</tr>
				<tr>
					<td width="110" height="25" class="MS05td"><div align="center">조치여부</div></td>
					<td width="630" class="MS07td" style="padding-left:5px">
						<s:if test="marking_yn==null">&nbsp;</s:if><s:else><s:property value="marking_yn" /></s:else>
					</td>
				</tr>
				<tr>
					<td width="110" height="25" class="MS05td"><div align="center">조치일시</div></td>
					<td width="630" class="MS06td" style="padding-left:5px">
						<s:if test="marking_dt==null">&nbsp;</s:if><s:else><s:property value="marking_dt" /></s:else>
					</td>
				</tr>
				<tr>
					<td width="110" height="25" class="MS05td"><div align="center">조치자</div></td>
					<td width="630" class="MS07td" style="padding-left:5px">
						<s:if test="user_nm==null">&nbsp;</s:if>
						<s:else>
							<s:property value="user_nm" /> &nbsp;
							(<s:if test="user_id==null">&nbsp;</s:if><s:else><s:property value="user_id" /></s:else>)
						</s:else>
					</td>
				</tr>
				<tr>
					<td width="110" height="25" class="MS05td"><div align="center">장애해지사유</div></td>
					<td width="630" class="MS06td" style="padding-left:5px">
						<s:if test="trouble_cancel_reason==null">&nbsp;</s:if><s:else><s:property value="trouble_cancel_reason" /></s:else>
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
							<s:if test="pda=='pda'">
								<s:url id="listTroublePda" action="listTroublePda"></s:url>			                
								<s:a href="listTroublePda.do"><img src="../images/btn_list.gif" border="0"></s:a>
							</s:if>
							<s:else>
								<s:url id="listTrouble" action="listTrouble"></s:url>			                
								<s:a href="listTrouble.do"><img src="../images/btn_list.gif" border="0"></s:a>
							</s:else>
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
<td valign="top">
	<!-- 퀵메뉴 -->
	<div id="floater" style="left:780px; top:0px; width:100; height:0; z-index:10">
		<table width="80" border="0" bordercolor="red" cellspacing="0" cellpadding="0"style="margin:20px 0px 0px 14px;">
			<tr>
			    <s:if test="pda=='pda'"><s:include value="../common/quickmenu1.jsp"></s:include></s:if>
			    <s:else><s:include value="../common/quickmenu.jsp"></s:include></s:else>
			</tr>
		</table>
	</div>
</td>
</body>
</html>

</s:else>
