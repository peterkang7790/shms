<%@ page language="java" import="java.util.*" pageEncoding="EUC-KR"%>
<%
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
String bg = "";
String p_sensor = request.getParameter("p_sensor"); if(p_sensor==null) p_sensor = "";
String p_errtype = request.getParameter("p_errtype"); if(p_errtype==null) p_errtype = "";
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
body { margin-left: 10px; margin-top: 10px; margin-right: 0px; margin-bottom: 0px;}
.style3 { color: #ffa72a; font-weight: bold; }
#floater {position:absolute; visibility:visible; }
-->
</style>
<script type="text/JavaScript">
	function winOpen(url) {
		var properties = "dialogwidth:765px;dialogHeight:300px;status:no;help:no"; 
		var returnValue = window.showModalDialog(url, "", properties); 
	}

	function initSensorErr() {
		var url = "initSensorErr.do";
		if (confirm("장애초기화를 실행합니다.")) {
			// 확인 버튼을 눌렀을 때 실행
			listSensorErr.method = "post";
			listSensorErr.target = "_self";
			listSensorErr.action = url;
			listSensorErr.submit();
		}
		else {
			// 취소 버튼을 눌렀을 때 실행
			return;
		}  
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

<s:form id="form1" namespace="/alarmManage" action="listSensorErrPda" theme="simple" method="get">

<table width="750" height="100%" border="0" cellpadding="0" cellspacing="0" background="../images/bg.gif">
<tr>
	<td valign="top">
		<table width="750" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td height="32" colspan="2" background="../images/title_bg.gif">
				<table width="740" border="0" cellspacing="0" cellpadding="0" style="padding:0px 0px 0px 5px;">
				<tr>
					<td width="20" valign="top"><img src="../images/point_title_01.gif" width="20" height="17"></td>
					<td width="270" class="title_01">장애관리</td>
					<td width="450" class="route"><div align="right">홈 &nbsp;&gt;&nbsp; 경보관리 &nbsp;&gt;&nbsp; 장애관리</div></td>
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
					<td class="MS05td" width="110"><div align="center">장애등급</div></td>
					<td width="265" class="MS06td" style="padding-left:5px">
						<s:select name="p_errtype" id="p_errtype" list="errtype_list" listKey="err_cd" listValue="err_nm" headerKey="" headerValue="선택" cssStyle="width:130px"></s:select>
					</td>
				</tr>
				<tr>
					<td height="25" class="MS05td" width="110"><div align="center">조치여부</div></td>
					<td width="265" class="MS07td" style="padding-left:5px" colspan="3">
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
			<td height="30" colspan="2">
				<table width="750" height="16" border="0" cellpadding="0" cellspacing="0" style="padding:10px 0px 0px 1px;">
				<tr>
					<td width="12" valign="middle"><img src="../images/point_title_02.gif" width="5" height="13"></td>
					<td width="488" class="title_02">장애현황 [<s:property value="resultCount" />건]</td>
<%--					<td width="250" align="right" style="padding:25px 0px 0px 130px;">--%>
<%--						<a href="javascript:initSensorErr();" onfocus="this.blur();">--%>
<%--							<img src="../images/btn_reset.gif" border="0" alt="Manage Server의 장애정보에 대한 초기화를 실행" align="absmiddle">--%>
<%--						</a>--%>
<%--					</td>--%>
				</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<table width="750" border="0" cellspacing="1" bgcolor="#CCCCCC" cellpadding="2">
				<tr>
					<td colspan="8" height="2" class="MS01td"></td>
				</tr>
				<tr>
					<td width="20" height="25" align="center" class="MS05td">NO</td>
					<td width="70" align="center" class="MS05td">장애ID</td>
					<td width="100" align="center" class="MS05td">센서ID</td>
					<td width="110" align="center" class="MS05td">장애종류</td>
					<td width="140" align="center" class="MS05td">장애발생일시</td>
					<td width="80" align="center" class="MS05td">조치여부</td>
					<td width="140" align="center" class="MS05td">조치일시</td>
					<td width="90" align="center" class="MS05td">관리</td> 
				</tr>

				<s:iterator value="rsListSensorErr" status="stat">
				<s:if test="rnum%2==0"> <% bg = "MSlist03td"; %> </s:if><s:else> <% bg = "MSlist02td"; %> </s:else>
				
				<tr>
					<td height="22" align="center" class="<%=bg%>"><s:if test="rnum==null">&nbsp;</s:if><s:else><s:property value="rnum" /></s:else></td>
					<td align="center" class="<%=bg%>"><s:if test="err_id==null">&nbsp;</s:if><s:else><s:property value="err_id" /></s:else></td>
					<td align="center" class="<%=bg%>"><s:if test="sensor_id==null">&nbsp;</s:if><s:else><s:property value="sensor_id" /></s:else></td>
					<td align="center" class="<%=bg%>"><s:if test="err_type_nm==null">&nbsp;</s:if><s:else><s:property value="err_type_nm" /></s:else></td>
					<td align="center" class="<%=bg%>"><s:if test="prod_dt==null">&nbsp;</s:if><s:else><s:property value="prod_dt" /></s:else></td>
					<td align="center" class="<%=bg%>"><s:if test="marking_yn==null">&nbsp;</s:if><s:else><s:property value="marking_yn" /></s:else></td>
					<td align="center" class="<%=bg%>"><s:if test="marking_dt==null">&nbsp;</s:if><s:else><s:property value="marking_dt" /></s:else></td>
					<td align="center" class="<%=bg%>" style="padding-left:5px">
						<s:if test='marking_yn == "N"'> 
							<s:a href="editSensorErrPda.do?err_id=%{err_id}&sensor_id=%{p_sensor}&nowPage=%{reqMap.nowPage}&err_type_cd=%{p_errtype}&marking_yn=%{p_markingyn}" onfocus="this.blur();">
								<img src="../images/btnS_action.gif" width="32" height="17" border="0" alt="장애정보에 대한 조치실행" align="absmiddle">
							</s:a>
						</s:if>
						<s:else>
							<font size="2" color='#9D9D9D'>조치완료</font>
						</s:else>
					</td>
				</tr>

				</s:iterator>
				
				<s:if test="resultCount == 0">
				<tr>
					<td colspan="8" class="MSlist02td" align="center">검색된 결과가 없습니다.</td>
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
						<table border="0" cellspacing="0" cellpadding="0" >
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
				<s:include value="../common/quickmenu1.jsp"></s:include>
			</tr>
		</table>
	</div>
</td>
</body>
</html>

</s:else>
