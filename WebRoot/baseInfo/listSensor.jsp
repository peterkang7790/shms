<%@ page language="java" import="java.util.*" pageEncoding="EUC-KR"%>
<%
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
String bg = "";
String sensor_id_nm = request.getParameter("sensor_id_nm"); if(sensor_id_nm==null) sensor_id_nm = "";

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
.tdStyle { background-color:#FFDDDD; padding:10px; border:1px solid #ACB4F2; }
#floater {position:absolute; visibility:visible; }
-->
</style>
<script type="text/javascript">
	function delSensor(senid,rowNo) {
		var url = "delSensor.do?sensor_id="+senid+"&nowPage="+rowNo;
		if (confirm("정말로 삭제하시겠습니까?\n(하위정보도같이 삭제 됩니다.)")) {
			// 확인 버튼을 눌렀을 때 실행
			listSensor.method = "post";
			listSensor.target = "_self";
			listSensor.action = url;
			listSensor.submit();
		}
		else {
			// 취소 버튼을 눌렀을 때 실행
			return false;
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

<s:form id="form1" namespace="/baseInfo" action="listSensor" theme="simple" method="get">

<table width="750" height="100%" border="0" cellpadding="0" cellspacing="0" background="../images/bg.gif">
<tr>
	<td valign="top">
		<table width="750" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td height="32" colspan="2" background="../images/title_bg.gif">
				<table width="740" border="0" cellspacing="0" cellpadding="0" style="padding:0px 0px 0px 5px;">
				<tr>
					<td width="20" valign="top"><img src="../images/point_title_01.gif" width="20" height="17"></td>
					<td width="270" class="title_01">센서 리스트</td>
					<td width="450" class="route"><div align="right">홈 &nbsp;&gt;&nbsp; 기준정보 &nbsp;&gt;&nbsp; 센서</div></td>
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
						<input name="sensor_id_nm" type="text" class="box" style="width:130" onblur="toUpper(this);" value="<%=sensor_id_nm%>">
					</td>
					<td class="MS05td" width="110"><div align="center">센서종류</div></td>
					<td width="265" class="MS06td" style="padding-left:5px">
						<s:select name="sensor_type_cd" id="sensor_type_cd" list="sensor_type_list" listKey="sensor_type_cd" listValue="sensor_type_nm" headerKey="" headerValue="선택" cssStyle="width:130px"></s:select>
					</td>
				</tr>
				<tr>
					<td height="25" class="MS05td" width="110"><div align="center">디렉터</div></td>
					<td width="265" class="MS07td" style="padding-left:5px">
						<s:select name="detector_id" id="detector_id" list="detector_list" listKey="detector_id" listValue="detector_nm" headerKey="" headerValue="선택" cssStyle="width:130px"></s:select>
					</td>
					<td class="MS05td" width="110"><div align="center">채널</div></td>
					<td width="265" class="MS07td" style="padding-left:5px">
						<table width="110" height="24" border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td width="57">
								<s:select name="channel_id" id="channel_id" list="channel_list" listKey="channel_id" listValue="channel_nm" headerKey="" headerValue="선택" cssStyle="width:130px"></s:select>
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
			<td width="500" height="57">
				<table width="490" height="16" border="0" cellpadding="0" cellspacing="0" style="padding:20px 0px 0px 1px;">
				<tr>
					<td width="12" valign="middle"><img src="../images/point_title_02.gif" width="5" height="13"></td>
					<td width="478" class="title_02">센서 현황 [<s:property value="resultCount" />건]</td>
				</tr>
				</table>
			</td>
			<td width="250" valign="top" style="padding:30px 0px 0px 200px;">
				<s:a href="addViewSensor.do"><img src="../images/btn_regist.gif" width="59" height="20" border="0"></s:a>
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
					<td width="60" align="center" class="MS05td">센서</td>
					<td width="140" align="center" class="MS05td">설치위치좌표</td>
					<td width="100" align="center" class="MS05td">설치위치</td>
					<td width="100" align="center" class="MS05td">계측항목</td>
					<td width="90" align="center" class="MS05td">센서종류</td>
					<td width="150" align="center" class="MS05td">계측범위</td>
					<td width="90" align="center" class="MS05td">관리</td>
				</tr>

				<s:iterator value="listSensor" status="stat">
				<s:if test="rnum%2==0"> <% bg = "MSlist03td"; %> </s:if><s:else> <% bg = "MSlist02td"; %> </s:else>
				
				<tr>
					<td height="22" align="center" class="<%=bg%>"><s:if test="rnum==null">&nbsp;</s:if><s:else><s:property value="rnum" /></s:else></td>
					<td class="<%=bg%>" style="padding-left:5px" align="left"><s:if test="sensor_id==null">&nbsp;</s:if><s:else><s:property value="sensor_id" /></s:else></td>
					<td align="center" class="<%=bg%>">
						X:<s:if test="x_loc==null"></s:if><s:else><s:property value="x_loc" /></s:else>,
						Y:<s:if test="y_loc==null"></s:if><s:else><s:property value="y_loc" /></s:else>,
						Z:<s:if test="z_loc==null"></s:if><s:else><s:property value="z_loc" /></s:else>
					</td>
					<td class="<%=bg%>" style="padding-left:5px" align="left"><s:if test="loc_nm==null">&nbsp;</s:if><s:else><s:property value="loc_nm" /></s:else></td>
					<td class="<%=bg%>" style="padding-left:5px" align="left"><s:if test="inst_item_nm==null">&nbsp;</s:if><s:else><s:property value="inst_item_nm" /></s:else></td>
					<td class="<%=bg%>" style="padding-left:5px" align="left"><s:if test="sensor_type_nm==null">&nbsp;</s:if><s:else><s:property value="sensor_type_nm" /></s:else></td>
					<td align="center" class="<%=bg%>">
						<s:if test="l_inst_range_lmt==null">&nbsp;</s:if><s:else><s:property value="l_inst_range_lmt" /></s:else>
						~
						<s:if test="h_inst_range_lmt==null">&nbsp;</s:if><s:else><s:property value="h_inst_range_lmt" /></s:else>
					</td>
					<td align="center" class="<%=bg%>" id="sen_view">
						<s:a href="detailSensor.do?sensor_id=%{sensor_id}"><img src="../images/btnS_view0.gif" width="32" height="17" border="0"></s:a>
						<s:url id="delSensor" action="delSensor">
							<s:param name="sensor_id" value="sensor_id"/>
						</s:url>
						<s:a href="#" onclick="delSensor( '%{sensor_id}',%{reqMap.nowPage} )"><img src="../images/btnS_delet.gif" width="32" height="17" border="0"></s:a>
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
<%--							<td width="13"><a href="#"><img src="../images/btn_first.gif" width="13" height="13" border="0"></a></td>--%>
<%--							<td width="8">&nbsp;</td>--%>
<%--							<td width="13"><a href="#"><img src="../images/btn_back.gif" width="13" height="13" border="0"></a></td>--%>
							<td width="12">&nbsp;</td>
							<td><s:property value="pagingString" escape="false" /></td>
							<td width="12">&nbsp;</td>
<%--							<td width="13"><a href="#"><img src="../images/btn_next.gif" width="13" height="13" border="0"></a></td>--%>
<%--							<td width="8">&nbsp;</td>--%>
<%--							<td width="13"><a href="#"><img src="../images/btn_end.gif" width="13" height="13" border="0"></a></td>--%>
						</tr>
						</table>
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
