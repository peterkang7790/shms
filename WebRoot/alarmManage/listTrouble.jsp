<%@ page language="java" import="java.util.*" pageEncoding="EUC-KR"%>
<%
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
String bg = "";
String p_sensor = request.getParameter("p_sensor"); if(p_sensor==null) p_sensor = "";
String p_troubleclass = request.getParameter("p_troubleclass"); if(p_troubleclass==null) p_troubleclass = "";
String marking = "0px";
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
body { 
		margin-left: 10px; 
		margin-top: 10px; 
		margin-right: 0px; 
		margin-bottom: 0px;
	}
.style3 { color: #ffa72a; font-weight: bold; }
#floater {position:absolute; visibility:visible; }
-->
</style>
<%--<script type="text/JavaScript">--%>
<%--	function winOpen(url) {--%>
<%--		var properties = "dialogwidth:765px;dialogHeight:300px;status:no;help:no"; --%>
<%--		var returnValue = window.showModalDialog(url, "", properties); --%>
<%--	}--%>
<%--</script>--%>
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

<s:form id="form1" namespace="/alarmManage" action="listTrouble" theme="simple" method="get">

<table width="750" height="100%" border="0" cellpadding="0" cellspacing="0" background="../images/bg.gif">
<tr>
	<td valign="top">
		<table width="750" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td height="32" colspan="2" background="../images/title_bg.gif">
				<table width="740" border="0" cellspacing="0" cellpadding="0" style="padding:0px 0px 0px 5px;">
				<tr>
					<td width="20" valign="top"><img src="../images/point_title_01.gif" width="20" height="17"></td>
					<td width="270" class="title_01">경보관리</td>
					<td width="450" class="route"><div align="right">홈 &nbsp;&gt;&nbsp; 경보관리 &nbsp;&gt;&nbsp; 경보관리</div></td>
				</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td height="10" colspan="2"></td>
		</tr>
		<tr>
			<td colspan="2">
				<table width="750" border="0" cellpadding="0" cellspacing="1" class="MSlinetd">
				<tr>
					<td colspan="4" height="2" class="MS01td"></td>
				</tr>
				<tr>
					<td height="25" class="MS05td" width="110"><div align="center">센서</div></td>
					<td width="265" class="MS06td" style="padding-left:5px">
						<s:select name="p_sensor" id="p_sensor" list="sensor_list" listKey="sensor_id" listValue="sensor_nm" headerKey="" headerValue="선택" cssStyle="width:130px"></s:select>
					</td>
					<td class="MS05td" width="110"><div align="center">경보등급</div></td>
					<td width="265" class="MS06td" style="padding-left:5px">
						<s:select name="p_troubleclass" id="p_troubleclass" list="troubleclass_list" listKey="trouble_class_cd" listValue="trouble_class_nm" headerKey="" headerValue="선택" cssStyle="width:130px"></s:select>
					</td>
				</tr>
				<tr>
					<td height="25" class="MS05td" width="110"><div align="center">SMS통보여부</div></td>
					<td width="265" class="MS07td" style="padding-left:5px">
						<s:select name="p_smssendyn" id="p_smssendyn" list="smssendyn_list" listKey="cd" listValue="nm" headerKey="" headerValue="선택" cssStyle="width:130px"></s:select>
					</td>
					<td class="MS05td" width="110"><div align="center">조치여부</div></td>
					<td width="265" class="MS07td" style="padding-left:5px">
						<table width="110" height="24" border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td width="57">
								<s:select name="p_markingyn" id="p_markingyn" list="markingyn_list" listKey="cd" listValue="nm" headerKey="" headerValue="선택" cssStyle="width:130px"></s:select>
							</td>
							<td width="53" align="left">
								<table>
								<tr><td><s:submit type="image" src="../images/btnS_search.gif" /></td></tr>
								</table>
							</td>
						</tr>
						</table>
					</td>
				</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td width="500" height="30">
				<table width="490" height="16" border="0" cellpadding="0" cellspacing="0" style="padding:20px 0px 0px 1px;">
				<tr>
					<td width="12" valign="middle"><img src="../images/point_title_02.gif" width="5" height="13"></td>
					<td width="478" class="title_02">경보현황 [<s:property value="resultCount" />건]</td>
				</tr>
				</table>
			</td>
			<td width="250" valign="top" style="padding:30px 0px 0px 200px;">
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<table width="750" border="0" cellspacing="1" bgcolor="#CCCCCC" cellpadding="2">
				<tr>
					<td colspan="10" height="2" class="MS01td"></td>
				</tr>
				<tr>
					<td width="20" height="25" align="center" class="MS05td">NO</td>
					<td width="80" align="center" class="MS05td">센서ID</td>
					<td width="70" align="center" class="MS05td">경보등급</td>
					<td width="70" align="center" class="MS05td">SMS통보</td>
					<td width="120" align="center" class="MS05td">장애발생일시</td>
					<td width="70" align="center" class="MS05td">조치여부</td>
					<td width="120" align="center" class="MS05td">조치일시</td>
					<td width="70" align="center" class="MS05td">조치자</td>
					<td width="80" align="center" class="MS05td">관리</td>
				</tr>

				<s:iterator value="rsListTrouble" status="stat">
				<s:if test="rnum%2==0"> <% bg = "MSlist03td"; %> </s:if><s:else> <% bg = "MSlist02td"; %> </s:else>
				
				<s:if test='marking_yn == "Y"'><% marking = "15px"; %></s:if>
				<s:else><% marking = "0px"; %></s:else>
				
				<tr>
					<td height="22" align="center" class="<%=bg%>">
						<s:if test="rnum==null">&nbsp;</s:if>
						<s:else>
							<s:property value="rnum" />
						</s:else>
					</td>
					<td align="center" class="<%=bg%>">
						<s:if test="sensor_id==null">&nbsp;</s:if>
						<s:else>
							<s:property value="sensor_id" />
						</s:else>
					</td>
					<td align="center" class="<%=bg%>">
						<s:if test="trouble_class_nm==null">&nbsp;</s:if>
						<s:else>
						 	<s:if test="trouble_class_nm=='위험'">
						 		<font color="red"><s:property value="trouble_class_nm" /></font>
						 	</s:if>
						 	<s:else>
						 		<font color="orange"><s:property value="trouble_class_nm" /></font>
						 	</s:else>
						</s:else>
					</td>
					<td align="center" class="<%=bg%>"><s:if test="sms_send_yn==null">&nbsp;</s:if><s:else><s:property value="sms_send_yn" /></s:else></td>
					<td align="center" class="<%=bg%>"><s:if test="trouble_prod_dt==null">&nbsp;</s:if><s:else><s:property value="trouble_prod_dt" /></s:else></td>
					<td align="center" class="<%=bg%>" style="padding-left:<%=marking%>;">
						<s:if test="marking_yn==null">&nbsp;</s:if>
						<s:else>
							<s:property value="marking_yn" />
							<s:if test='marking_yn == "Y"'><img src="../images/help.bmp" border="0" alt="${trouble_cancel_reason}" style="cursor:hand;" /></s:if>
						</s:else>
					</td>
					<td align="center" class="<%=bg%>"><s:if test="marking_dt==null">&nbsp;</s:if><s:else><s:property value="marking_dt" /></s:else></td>
					<td align="center" class="<%=bg%>"><s:if test="user_nm==null">&nbsp;</s:if><s:else><s:property value="user_nm" /></s:else></td>
					<td align="center" class="<%=bg%>" style="padding-left:5px">
				    	<s:a href="detailTrouble.do?trouble_id=%{trouble_id}" onfocus="this.blur();"><img src="../images/btnS_view0.gif" width="32" height="17" alt="경보상세보기" border="0" align="absmiddle"></s:a>
						<s:if test='marking_yn == "N"'>
							<s:if test="#session.USED_CLASS_CD==1">
								<a href="javascript:MM_openBrWindow('editViewTrouble.do?trouble_id=<s:property value="trouble_id" />','','width=760,height=350,resizable=yes');" onfocus="this.blur();">
									<img src="../images/btnS_action.gif" width="32" height="17" border="0" alt="경보 조치 화면" align="absmiddle">
								</a>
							</s:if> 
						</s:if>
					</td>
				</tr>

				</s:iterator>
				
				<s:if test="resultCount == 0">
				<tr>
					<td colspan="10" class="MSlist02td" align="center">검색된 결과가 없습니다.</td>
				</tr>
				</s:if>	
				
				</table>
			</td>
		</tr>

		<s:if test="resultCount != 0">
		<tr>
			<td colspan="2">
				<table width="750" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td height="20"></td>
				</tr>
				<tr>
					<td align="center">
						<table border="0" cellspacing="0" cellpadding="0">
						<tr align="center">
							<td width="12">&nbsp;</td>
							<td><s:property value="pagingString" escape="false" /></td>
							<td width="12">&nbsp;</td>
						</tr>
						</table>
					</td>
				</tr>
				</table>
			</td>
		</tr>
		</s:if>
		
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
