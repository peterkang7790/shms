<%@ page language="java" import="java.util.*" pageEncoding="EUC-KR"%>
<%@ page language="java" import="com.lsware.utils.*" %>
<%
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
String bg = "";
String p_sensor = request.getParameter("p_sensor"); if(p_sensor==null) p_sensor = "";
String p_troubleclass = request.getParameter("p_troubleclass"); if(p_troubleclass==null) p_troubleclass = "";
String marking = "0px";
String trouble_id = request.getParameter("trouble_id"); if (trouble_id==null) trouble_id = "";
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
<link href="../css/themes/ui.all.css" rel="stylesheet" type="text/css" />
<script  type="text/javascript" src="../script/ComUtil.js" ></script>
<script  type="text/javascript" src="../script/script.js" ></script>
<script  type="text/javascript" src="../script/jquery.js" ></script>
<script type="text/javascript" src="../script/ui/ui.datepicker.js"></script>
<script type="text/javascript" src="../script/ui/i18n/ui.datepicker-ko.js"></script>
<style type="text/css">
<!--
body { margin-left: 10px; margin-top: 10px; margin-right: 0px; margin-bottom: 0px;}
.style3 { color: #ffa72a; font-weight: bold; }
#floater {position:absolute; visibility:visible; }
-->
</style>
<script type="text/javascript">
	function searchSmsList() {
		almSMSHist.method = "post";
		almSMSHist.target = "_self";
		almSMSHist.action = "almSMSHist.do";
		almSMSHist.submit();
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

<s:form id="form1" namespace="/alarmManage" action="almSMSHist" theme="simple" method="get">
<input type="hidden" name="trouble_id" id="trouble_id" value="<%=trouble_id%>"/>

<table width="750" height="100%" border="0" cellpadding="0" cellspacing="0" background="../images/bg.gif">
<tr>
	<td valign="top">
		<table width="750" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td height="32" colspan="2" background="../images/title_bg.gif">
				<table width="740" border="0" cellspacing="0" cellpadding="0" style="padding:0px 0px 0px 5px;">
				<tr>
					<td width="20" valign="top"><img src="../images/point_title_01.gif" width="20" height="17"></td>
					<td width="270" class="title_01">SMS 발송이력</td>
					<td width="450" class="route"><div align="right">홈 &nbsp;&gt;&nbsp; 경보관리 &nbsp;&gt;&nbsp; SMS 발송이력</div></td>
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
					<td height="25" class="MS05td" width="110"><div align="center">SMS 발송일</div></td>
					<td width="265" class="MS07td" style="padding-left:5px">
						<s:textfield cssClass="datepicker" name="send_dt" size="10"   readonly="true" />
					</td>
					<td class="MS05td" width="110"><div align="center">수신자명</div></td>
					<td width="100" class="MS07td" style="padding-left:5px">
						<table width="110" height="24" border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td width="57">
									<input type="text" name="recv_nm" style="width:80" />
								</td>
								<td width="50">
									<!--  s:submit type="button" label="검색" / -->
									&nbsp;<a href="javascript:searchSmsList();" onfocus="this.blur();"><img src="../images/btnS_search.gif" width="35" height="20" border="0" alt="조회"  align="absmiddle" /></a>
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
				<table width="490" height="16" border="0" cellpadding="0" cellspacing="0" style="padding:10px 0px 0px 1px;">
				<tr>
					<td width="12" valign="middle"><img src="../images/point_title_02.gif" width="5" height="13"></td>
					<td width="478" class="title_02">SMS 발송 이력 [<s:property value="resultCount" />건]</td>
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
					<td colspan="9" height="2" class="MS01td"></td>
				</tr>
				<tr>
					<td width="20" height="25" align="center" class="MS05td">NO</td>
					<td width="80" align="center" class="MS05td">센서ID</td>
					<td width="60" align="center" class="MS05td">경보등급</td>
					<td width="100" align="center" class="MS05td">경보발생일시</td>
					<td width="100" align="center" class="MS05td">SMS발송일</td>
					<td width="60" align="center" class="MS05td">수신자</td>
					<td width="90" align="center" class="MS05td">수신번호</td>
					<td width="300" align="center" class="MS05td">발신메세지</td>
				</tr>
				<s:iterator value="rsAlmSMSHistTrouble" status="stat">
				<s:if test="rnum%2==0"> <% bg = "MSlist03td"; %> </s:if><s:else> <% bg = "MSlist02td"; %> </s:else>
				<s:if test="trouble_id == sel_trouble_id"><% bg = "MSlist04td"; %></s:if>
				
				<s:if test='marking_yn == "Y"'><% marking = "15px"; %></s:if>
				<s:else><% marking = "0px"; %></s:else>

				<tr>
					<td height="22" align="center" class="<%=bg%>"><s:if test="rnum==null">&nbsp;</s:if><s:else><s:property value="rnum" /></s:else></td>
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
					<td align="center" class="<%=bg%>">
						<s:if test="trouble_prod_dt==null">&nbsp;
						</s:if>
						<s:else>
							<s:property value="trouble_prod_dt" />
						</s:else>
					</td>
					<td align="center" class="<%=bg%>"">
						<s:if test="send_dt==null">&nbsp;</s:if>
						<s:else>
							<s:property value="send_dt" />
						</s:else>
					</td>
					<td align="center" class="<%=bg%>"><s:if test="recv_nm==null">&nbsp;</s:if><s:else><s:property value="recv_nm" /></s:else></td>
					<%
					    String recvNo = "";
						if( request.getAttribute("recv_no") != null )
						{
							recvNo = StringUtils.strMobileNo(String.valueOf( request.getAttribute("recv_no") ) );	
						}
					%>
					<td align="center" class="<%=bg%>">
						<s:if test="recv_no==null">&nbsp;</s:if>
						<s:else>
							<%=recvNo%>
						</s:else>
					</td>
					<td align="left" class="<%=bg%>"><s:if test="send_msg==null">&nbsp;</s:if><s:else><s:property value="send_msg" /></s:else></td>
				</tr>
				
				</s:iterator>
				
				<s:if test="resultCount == 0">
				<tr>
					<td colspan="9" class="MSlist02td" align="center">검색된 결과가 없습니다.</td>
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
						<table border="0" cellspacing="0" cellpadding="0" class="page_view">
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

<table><tr><td height="15"></td></tr></table>
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
