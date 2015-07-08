<%@ page language="java" import="java.util.*" pageEncoding="EUC-KR"  contentType="text/html; charset=euc-kr"%>
<%@ page language="java" import="com.lsware.utils.*" %>
<%
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
String bg = "";
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
body { 
		margin-left: 10px; 
		margin-top: 10px; 
		margin-right: 0px; 
		margin-bottom: 0px;
	}
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

<s:form id="form1" namespace="/alarmManage" action="almSMSRecv" theme="simple" method="get">

<table width="750" height="100%" border="0" cellpadding="0" cellspacing="0" background="../images/bg.gif">
<tr>
	<td valign="top">
		<table width="750" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td height="32" colspan="2" background="../images/title_bg.gif">
				<table width="740" border="0" cellspacing="0" cellpadding="0" style="padding:0px 0px 0px 0px;">
				<tr>
					<td width="20" valign="top"><img src="../images/point_title_01.gif" width="20" height="17"></td>
					<td width="270" class="title_01">SMS통보자</td>
					<td width="450" class="route"><div align="right">홈 &nbsp;&gt;&nbsp; 경보관리 &nbsp;&gt;&nbsp; SMS통보자</div></td>
				</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td width="500" height="30">
				<table width="490" height="16" border="0" cellpadding="0" cellspacing="0" style="padding:10px 0px 0px 1px;">
				<tr>
					<td width="12" valign="middle"><img src="../images/point_title_02.gif" width="5" height="13"></td>
					<td width="478" class="title_02">사용자 </td>
				</tr>
				</table>
			</td>
			<!--  
			<td width="250" valign="top" style="padding:30px 0px 0px 200px;">
				<s:if test='#session.USED_CLASS_CD=="1"'>
					<s:a href="javascript:saveSMS();"><img src="../images/btn_save.gif" width="59" height="20" border="0"></s:a>
				</s:if>
			</td>
			-->
		</tr>
		<tr>
			<td colspan="2">
				<table width="750" border="0" cellspacing="1" bgcolor="#CCCCCC" cellpadding="2">
				<tr>
					<td colspan="10" height="2" class="MS01td"></td>
				</tr>
				<tr>
					<td width="20" height="25" align="center" class="MS05td">NO</td>
					<td width="70" align="center" class="MS05td">사용자ID</td>
					<td width="100" align="center" class="MS05td">사용자명</td>
					<td width="130" align="center" class="MS05td">휴대폰</td>
					<td width="130" align="center" class="MS05td">그룹</td>
					<td width="110" align="center" class="MS05td">사용등급</td>
					<td width="120" align="center" class="MS05td">SMS수신여부</td>
					<!--
					<td width="70" align="center" class="MS05td">수신여부
					</td>
					-->
				</tr>
				<s:iterator value="rsSMSRecvUser" status="stat">
				<s:if test="rnum % 2 == 0"> <% bg = "MSlist03td"; %> </s:if><s:else> <% bg = "MSlist02td"; %> </s:else>
				
				<tr>
					<td height="22" class="<%=bg%>" style="padding-left:10px"><div align="left"><s:if test="rnum==null">&nbsp;</s:if><s:else><s:property value="rnum" /></s:else></div></td>
					<td align="center" class="<%=bg%>" style="padding-left:10px">
						<div align="left">
							<s:if test="user_id==null">&nbsp;</s:if><s:else><s:property value="user_id" /></s:else>
						</div>
					</td>
					<td class="<%=bg%>" style="padding-left:10px">
						<div align="left"> &nbsp;
							<s:if test="user_nm==null">&nbsp;</s:if><s:else><s:property value="user_nm" /></s:else>
						</div>	
					</td>
					<td align="center" class="<%=bg%>"> &nbsp;
					<%
					    String mNo = "";
						if( request.getAttribute("mobile_no") != null )
						{
							mNo = StringUtils.strMobileNo(String.valueOf( request.getAttribute("mobile_no") ) );	
						}
					%>
						<s:if test="mobile_no==null">&nbsp;</s:if><s:else><%=mNo%></s:else>
					</td>
					<td align="center" class="<%=bg%>"> &nbsp;
						<s:if test="group_nm==null">&nbsp;</s:if><s:else><s:property value="group_nm" /></s:else>
					</td>
					<td class="<%=bg%>" style="padding-left:10px">
						<div align="left"> &nbsp;
							<s:if test="used_class_nm==null">&nbsp;</s:if><s:else><s:property value="used_class_nm" /></s:else>
						</div>	
					</td>
					<td align="center" class="<%=bg%>"> &nbsp;
						<s:if test="sms_recv_yn==null">&nbsp;</s:if><s:else><s:property value="sms_recv_yn" /></s:else>
					</td>
					<!--  
					<td align="center" class="<%=bg%>">
						<s:checkbox name="access_yn" id="access_yn" fieldValue="%{access_yn + ',' + user_id}" value="%{access_yn}" />
					</td>
					-->
				</tr>

				</s:iterator>

				</table>
			</td>
		</tr>
		</table>
	</td>
</tr>
</table>

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