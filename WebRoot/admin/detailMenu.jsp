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
<script type="text/javascript" src="../script/ComUtil.js" ></script>
<style type="text/css">
<!--
body { margin-left: 10px; margin-top: 10px; margin-right: 0px; margin-bottom: 0px;}
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

<s:form id="form1" namespace="/admin" action="detailMenu" theme="simple" method="get">
<s:push value="rsOneMenu" >

<table width="750" height="100%" border="0" cellpadding="0" cellspacing="0" background="../images/bg.gif">
<tr>
	<td valign="top">
		<table width="750" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td height="32" background="../images/title_bg.gif">
				<table width="740" border="0" cellspacing="0" cellpadding="0" style="padding:0px 0px 0px 5px;">
				<tr>
					<td width="20" valign="top"><img src="../images/point_title_01.gif" width="20" height="17"></td>
					<td width="270" class="title_01">메뉴 상세보기 </td>
					<td width="450" class="route"><div align="right">홈 &nbsp;&gt;&nbsp; Admin &nbsp;&gt;&nbsp; 메뉴</div></td>
				</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td height="30" valign="top">
				<table width="740" height="16" border="0" cellpadding="0" cellspacing="0" style="padding:10px 0px 0px 1px;">
				<tr>
					<td width="12" valign="middle"><img src="../images/point_title_02.gif" width="5" height="13"></td>
					<td width="682" class="title_02">메뉴정보</td>
				</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td><table width="750" border="0" cellpadding="0" cellspacing="1" class="MSlinetd">
				<tr>
					<td colspan="4" height="2" class="MS01td"></td>
				</tr>
				<tr>
					<td width="110" height="25" class="MS05td" style="padding-left:10px"><div align="left">메뉴ID</div></td>
					<td width="230" class="MS06td" style="padding-left:5px">
						<s:if test="menu_id==null">&nbsp;</s:if><s:else><s:property value="menu_id" /></s:else>
					</td>
					<td class="MS05td" width="110" style="padding-left:10px"><div align="left">메뉴명</div></td>
					<td width="300" class="MS06td" style="padding-left:5px">
						<s:if test="menu_nm==null">&nbsp;</s:if><s:else><s:property value="menu_nm" /></s:else>
					</td>
				</tr>
				<tr>
					<td width="110" height="25" class="MS05td" style="padding-left:10px"><div align="left">메뉴경로</div></td>
					<td colspan="3" class="MS07td" style="padding-left:5px">
						<s:if test="menu_path==null">&nbsp;</s:if><s:else><s:property value="menu_path" /></s:else>
					</td>
				</tr>
				<tr>
					<td width="110" height="25" class="MS05td" style="padding-left:10px"><div align="left">선택가능여부</div></td>
					<td width="230" class="MS06td" style="padding-left:5px">
						<s:if test="sel_yn==null">&nbsp;</s:if><s:else><s:property value="sel_yn" /></s:else>
					</td>
					<td width="110" class="MS05td" style="padding-left:10px"><div align="left">상위메뉴</div></td>
					<td width="300" class="MS06td" style="padding-left:5px">
						<s:if test="p_menu_nm==null">&nbsp;</s:if><s:else><s:property value="p_menu_nm" /></s:else>
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
						<s:url id="listMenu" action="listMenu"></s:url>			                
						<s:a href="listMenu.do"><img src="../images/btn_list.gif" border="0"></s:a>
						<s:url id="viewEditMenu" action="viewEditMenu">
							<s:param name="menu_id" value="menu_id" />
						</s:url>
						<s:a href="%{viewEditMenu}"><img src="../images/btn_modify.gif" border="0"></s:a>
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
		<table width="80" border="0" bordercolor="red" cellspacing="0" cellpadding="0"style="margin:10px 0px 0px 14px;">
			<tr>
				<s:include value="../common/quickmenu.jsp"></s:include>
			</tr>
		</table>
	</div>
</td>
</body>
</html>

</s:else>
