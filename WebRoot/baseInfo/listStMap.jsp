<%@ page language="java" import="java.util.*" pageEncoding="EUC-KR"%>
<%
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
String bg = "";
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
<link href="../css/dtree.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../script/ComUtil.js" ></script>
<script type="text/javascript" src="../script/dtree.js"></script>
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

<table width="750" height="100%" border="0" cellpadding="0" cellspacing="0" background="../images/bg.gif">
<tr>
	<td valign="top">
		<table width="750" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td height="32" colspan="2" background="../images/title_bg.gif">
				<table width="740" border="0" cellspacing="0" cellpadding="0" style="padding:0px 0px 0px 5px;">
				<tr>
					<td width="20" valign="top"><img src="../images/point_title_01.gif" width="20" height="17"></td>
					<td width="270" class="title_01">구조도</td>
					<td width="450" class="route"><div align="right">홈 &nbsp;&gt;&nbsp; 기준정보 &nbsp;&gt;&nbsp; 구조도</div></td>
				</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td height="10" colspan="2"></td>
		</tr>
		</table>

		<div id="layer1" style="overflow:auto; width:250px; height:570px; position:absolute; left:5px; top:45px; z-index:1;">
		<s:form id="form1" namespace="/baseInfo" action="listStMap" theme="simple" method="get">

		<table width="200" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td width="200" rowspan="2" class="dtree">
				<table width="200" height="100%" border="0" cellpadding="0" cellspacing="0">
				<p>
					<a href="javascript: d.openAll();"><img src="../images/openAll.bmp" border="0" alt="open all"/><font size="1">&nbsp;펼치기</font></a> 
					<a href="javascript: d.closeAll();"><img src="../images/closeAll.bmp" border="0" alt="close all"/><font size="1">&nbsp;접기</font></a>
				</p>
				<tr>
					<td bgcolor="#FFFFFF">
						<script type="text/javascript">
						d = new dTree('d');

						<s:iterator value="rsListStMap" status="stat">

						d.add('<s:property value="key_cd" />',
						      '<s:property value="p_key_cd" />',
						      '<s:property value="key_nm" />',
						      '<s:if test="p_key_cd==-1">javascript:void(0);</s:if><s:else>listStMap.do?key_type=<s:property value="key_type"/>&detector_id=<s:property value="detector_id"/>&channel_id=<s:property value="channel_id"/>&sensor_id=<s:property value="sensor_id"/></s:else>');

						</s:iterator>

						document.write(d);

						</script>
					</td>
				</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td height="15"></td>
		</tr>
		</table>

		</s:form>
		</div>

		<div id="layer2" style="width:500px; height:300px; position:absolute; left:260px; top:45px; z-index:1;">

		<table width="500" border="0" cellspacing="0" cellpadding="0">
		<tr height="30" valgin="top">
			<td width="12" valign="middle"><img src="../images/point_title_02.gif" width="5" height="13"></td>
			<td width="458" class="title_02">상세보기</td>
		</tr>
		<tr width="500">
			<td colspan="2">

				<table width="500"  border="0" cellpadding="0" cellspacing="1" class="MSlinetd" >
				<tr>
					<td colspan="2" height="1" class="MS01td"></td>
				</tr>

				<s:if test="rsDetailStMapDetector==null and rsDetailStMapChannel==null and rsDetailStMapSensor==null">
				<tr>
					<td width="110" height="22" class="MS05td"style="padding-left:10px"><div align="left">구조물ID</div></td>
					<td width="320" class="MS06td" style="padding-left:5px"><s:property value="%{#session.STRUCT_ID}"/></td>
				</tr>
				<tr>
					<td height="22" class="MS05td" style="padding-left:10px"><div align="left">구조물명</div></td>
					<td class="MS07td" style="padding-left:5px"><s:property value="%{#session.STRUCT_NM}"/></td>
				</tr>
				</s:if>
				<s:else>
				
				<s:if test="rsDetailStMapDetector!=null">
				<s:push value="rsDetailStMapDetector" >
				<tr>
					<td width="110" height="22" class="MS05td" style="padding-left:10px"><div align="left">디텍터ID</div></td>
					<td width="360" class="MS06td" style="padding-left:5px">
						<s:if test="detector_id==null">&nbsp;</s:if>
						<s:else><s:property value="detector_id" /></s:else>
					</td>
				</tr>
				<tr>
					<td height="22" class="MS05td" style="padding-left:10px"><div align="left">디텍터명</div></td>
					<td class="MS07td" style="padding-left:5px">
						<s:if test="detector_nm==null">&nbsp;</s:if>
						<s:else><s:property value="detector_nm" /></s:else>
					</td>
				</tr>
				<tr>
					<td height="22" class="MS05td" style="padding-left:10px"><div align="left">디텍터IP</div></td>
					<td class="MS06td" style="padding-left:5px">
						<s:if test="detector_ip==null">&nbsp;</s:if>
						<s:else><s:property value="detector_ip" /></s:else>
					</td>
				</tr>
				<tr>
					<td height="22" class="MS05td" style="padding-left:10px"><div align="left">디텍터Port</div></td>
					<td class="MS07td" style="padding-left:5px">
						<s:if test="detector_port==null">&nbsp;</s:if>
						<s:else><s:property value="detector_port" /></s:else>
					</td>
				</tr>
				</s:push>
				</s:if>
				
				<s:if test="rsDetailStMapChannel!=null">
				<s:push value="rsDetailStMapChannel" >
				<tr>
					<td width="110" height="22" class="MS05td" style="padding-left:10px"><div align="left">채널ID</div></td>
					<td width="360" class="MS06td" style="padding-left:5px">
						<s:if test="channel_id==null">&nbsp;</s:if>
						<s:else><s:property value="channel_id" /></s:else>
					</td>
				</tr>
				<tr>
					<td height="22" class="MS05td" style="padding-left:10px"><div align="left">채널명</div></td>
					<td class="MS07td" style="padding-left:5px">
						<s:if test="channel_nm==null">&nbsp;</s:if>
						<s:else><s:property value="channel_nm" /></s:else>
					</td>
				</tr>
				<tr>
					<td height="22" class="MS05td" style="padding-left:10px"><div align="left">디텍터ID</div></td>
					<td class="MS06td" style="padding-left:5px">
						<s:if test="detector_id==null">&nbsp;</s:if>
						<s:else><s:property value="detector_id" /></s:else>
					</td>
				</tr>
				<tr>
					<td height="22" class="MS05td" style="padding-left:10px"><div align="left">디텍터명</div></td>
					<td class="MS07td" style="padding-left:5px">
						<s:if test="detector_id==null">&nbsp;</s:if>
						<s:else><s:property value="detector_nm" /></s:else>
					</td>
				</tr>
				</s:push>
				</s:if>

				<s:if test="rsDetailStMapSensor!=null">
				<s:push value="rsDetailStMapSensor" >
				<tr>
					<td width="110" height="22" class="MS05td" style="padding-left:10px"><div align="left">채널ID</div></td>
					<td width="360" class="MS06td" style="padding-left:5px">
						<s:if test="channel_id==null">&nbsp;</s:if>
						<s:else><s:property value="channel_nm" /> (<s:property value="channel_id" />)</s:else>
					</td>
				</tr>
				<tr>
					<td height="22" class="MS05td" style="padding-left:10px"><div align="left">센서ID</div></td>
					<td class="MS07td" style="padding-left:5px">
						<s:if test="sensor_id==null">&nbsp;</s:if>
						<s:else><s:property value="sensor_id" /></s:else>
					</td>
				</tr>
				<tr>
					<td height="22" class="MS05td" style="padding-left:10px"><div align="left">설치위치</div></td>
					<td class="MS06td" style="padding-left:5px">
						<s:if test="loc_nm==null">&nbsp;</s:if>
						<s:else><s:property value="loc_nm" /></s:else>
					</td>
				</tr>
				<tr>
					<td height="22" class="MS05td" style="padding-left:10px"><div align="left">설치위치좌표</div></td>
					<td class="MS07td" style="padding-left:5px">
						<s:if test="x_loc==null">&nbsp;</s:if>
						<s:else>X:<s:property value="x_loc" /></s:else> &nbsp;
						<s:if test="y_loc==null">&nbsp;</s:if>
						<s:else>Y:<s:property value="y_loc" /></s:else> &nbsp;
						<s:if test="z_loc==null">&nbsp;</s:if>
						<s:else>Z:<s:property value="z_loc" /></s:else>
					</td>
				</tr>
				<tr>
					<td height="22" class="MS05td" style="padding-left:10px"><div align="left">센서종류</div></td>
					<td class="MS06td" style="padding-left:5px">
						<s:if test="sensor_type_nm==null">&nbsp;</s:if>
						<s:else><s:property value="sensor_type_nm" /></s:else>
					</td>
				</tr>
				<tr>
					<td height="22" class="MS05td" style="padding-left:10px"><div align="left">계측항목</div></td>
					<td class="MS07td" style="padding-left:5px">
						<s:if test="inst_item_nm==null">&nbsp;</s:if>
						<s:else><s:property value="inst_item_nm" /></s:else>
					</td>
				</tr>
				<tr>
					<td height="22" class="MS05td" style="padding-left:10px"><div align="left">구조물구성</div></td>
					<td class="MS06td" style="padding-left:5px">
						<s:if test="struct_comp_nm==null">&nbsp;</s:if>
						<s:else><s:property value="struct_comp_nm" /></s:else>
					</td>
				</tr>
				<tr>
					<td height="22" class="MS05td" style="padding-left:10px"><div align="left">계측범위</div></td>
					<td class="MS07td" style="padding-left:5px">
						<s:if test="l_inst_range_lmt==null">&nbsp;</s:if>
						<s:else><s:property value="l_inst_range_lmt" /></s:else>
						~
						<s:if test="h_inst_range_lmt==null">&nbsp;</s:if>
						<s:else><s:property value="h_inst_range_lmt" /></s:else>
					</td>
				</tr>
				<tr>
					<td height="22" class="MS05td" style="padding-left:10px"><div align="left">위험임계치</div></td>
					<td class="MS06td" style="padding-left:5px">
						<s:if test="l_cri_lmt==null">&nbsp;</s:if>
						<s:else><s:property value="l_cri_lmt" /></s:else>
						~
						<s:if test="h_cri_lmt==null">&nbsp;</s:if>
						<s:else><s:property value="h_cri_lmt" /></s:else>
					</td>
				</tr>
				<tr>
					<td height="22" class="MS05td" style="padding-left:10px"><div align="left">경고임계치</div></td>
					<td class="MS07td" style="padding-left:5px">
						<s:if test="l_maj_lmt==null">&nbsp;</s:if>
						<s:else><s:property value="l_maj_lmt" /></s:else>
						~
						<s:if test="h_maj_lmt==null">&nbsp;</s:if>
						<s:else><s:property value="h_maj_lmt" /></s:else>
					</td>
				</tr>
				<tr>
					<td height="22" class="MS05td" style="padding-left:10px"><div align="left">기본값</div></td>
					<td class="MS06td" style="padding-left:5px">
						<s:if test="base_value==null">&nbsp;</s:if>
						<s:else><s:property value="base_value" /></s:else>
					</td>
				</tr>
				<tr>
					<td height="22" class="MS05td" style="padding-left:10px"><div align="left">고유값</div></td>
					<td class="MS07td" style="padding-left:5px">
						<s:if test="eigen_value==null">&nbsp;</s:if>
						<s:else><s:property value="eigen_value" /></s:else>
					</td>
				</tr>
				<tr>
					<td height="22" class="MS05td" style="padding-left:10px"><div align="left">G/F, G/L</div></td>
					<td class="MS06td" style="padding-left:5px">
						<s:if test="gf_value==null">&nbsp;</s:if>
						<s:else>G/F:<s:property value="gf_value" /></s:else> &nbsp;
						<s:if test="gl_value==null">&nbsp;</s:if>
						<s:else>G/L:<s:property value="gl_value" /></s:else>
					</td>
				</tr>
				<tr>
					<td height="22" class="MS05td" style="padding-left:10px"><div align="left">환산단위</div></td>
					<td class="MS07td" style="padding-left:5px">
						<s:if test="convert_unit==null">&nbsp;</s:if>
						<s:else><s:property value="convert_unit" /></s:else>
					</td>
				</tr>
				<tr>
					<td height="22" class="MS05td" style="padding-left:10px"><div align="left">센서좌표</div></td>
					<td class="MS06td" style="padding-left:5px">
						<s:if test="sensor_x_loc==null">&nbsp;</s:if>
						<s:else>X:<s:property value="sensor_x_loc" /></s:else> &nbsp;
						<s:if test="sensor_y_loc==null">&nbsp;</s:if>
						<s:else>Y:<s:property value="sensor_y_loc" /></s:else>
					</td>
				</tr>
				<s:if test='sensor_type_cd=="3"'>
					<tr>
						<td height="22" class="MS05td" style="padding-left:10px"><div align="left">기본온도값</div></td>
						<td class="MS07td" style="padding-left:5px">
							<s:if test="base_temp_value==null">&nbsp;</s:if>
							<s:else><s:property value="base_temp_value" /></s:else>
						</td>
					</tr>
				</s:if>
				<s:else>
					<tr>
						<td height="22" class="MS05td" style="padding-left:10px"><div align="left">연계센서</div></td>
						<td class="MS07td" style="padding-left:5px">
							<s:if test="ref_sensor_id==null">&nbsp;</s:if>
							<s:else><s:property value="ref_sensor_id" /></s:else>
						</td>
					</tr>
				</s:else>
				<tr>
					<td height="22" class="MS05td" style="padding-left:10px"><div align="left">디텍터ID</div></td>
					<td class="MS06td" style="padding-left:5px">
						<s:if test="detector_id==null">&nbsp;</s:if>
						<s:else><s:property value="detector_id" /></s:else>
					</td>
				</tr>
				<tr>
					<td height="22" class="MS05td" style="padding-left:10px"><div align="left">디텍터명</div></td>
					<td class="MS07td" style="padding-left:5px">
						<s:if test="detector_id==null">&nbsp;</s:if>
						<s:else><s:property value="detector_nm" /></s:else>
					</td>
				</tr>
				</s:push>
				</s:if>

				</s:else>

				</table>

			</td>
		</tr>
		</table>

		<table width="470"  border="0" cellpadding="0" cellspacing="1" >
		<tr>
			<td colspan="2" height="10" ></td>
		</tr>
		</table>

		<s:if test="basecall==null"></s:if>
		<s:else>
		<table width="470" border="0" cellspacing="0" cellpadding="0" >
		<tr>
			<s:a href="../baseInfo/listStruct.do" ><img src="../images/btn_list.gif" width="60" height="20" border="0" /></s:a>
		</tr>
		</table>
		</s:else>

		</div>

	</td>
</tr>
</table>
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
