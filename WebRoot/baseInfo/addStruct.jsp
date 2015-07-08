<%@ page language="java" import="java.util.*" pageEncoding="EUC-KR"  contentType="text/html; charset=euc-kr"%>
<%
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
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
<script type="text/javascript" src="../script/ComUtil.js" ></script>
<script  type="text/javascript" src="../script/jquery.js" ></script>
<script  type="text/javascript" src="../script/script.js" ></script>
<script type="text/javascript" src="../script/ui/ui.datepicker.js"></script>
<script type="text/javascript" src="../script/ui/i18n/ui.datepicker-ko.js"></script>
<style type="text/css">
<!--
#floater {position:absolute; visibility:visible; }
.demo {width:330px; border:1px solid #CCCCCC; padding:20px; background-color:#FFFFFF}
.text {font-size:12px; margin-right:4px; width:80px; line-height:20px;}
-->
</style>
<script type="text/JavaScript">
function structIdChk(obj) {
	toUpper(obj);
	$('#agreeView').load('../baseInfo/structIdChk.do', {struct_id:obj.value});
}
//-->
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

<s:form theme="simple" namespace="/baseInfo" action="addStruct" theme="simple" method="get">
<s:hidden name="user_id" value="%{user_id}" />

<table width="830" height="100%" border="0" cellpadding="0" cellspacing="0" background="../images/bg.gif">
<tr>
	<td valign="top">
		<table width="750" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td height="32" background="../images/title_bg.gif">
				<table width="740" border="0" cellspacing="0" cellpadding="0" style="padding:0px 0px 0px 5px;">
				<tr>
					<td width="20" valign="top"><img src="../images/point_title_01.gif" width="20" height="17"></td>
					<td width="270" class="title_01">구조물 </td>
					<td width="450" class="route"><div align="right">홈 &nbsp;&gt;&nbsp; 기준정보&nbsp;&gt;&nbsp;구조물등록</div></td>
				</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td height="57" valign="top">
				<table width="740" height="16" border="0" cellpadding="0" cellspacing="0" style="padding:30px 0px 0px 1px;">
				<tr>
					<td width="12" valign="middle"><img src="../images/point_title_02.gif" width="5" height="13"></td>
					<td width="682" class="title_02">구조물등록</td>
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
					<td width="120" height="22" class="MS05td" style="padding-left:10px"><div align="left">구조물ID</div></td>
					<td width="300" class="MS06td" style="padding-left:5px">
						<input type="text" name="struct_id" class="m_box" style="width:130" onblur="structIdChk(this)" />
						<br>
						<span id="agreeView"></span>
					</td>
					<td width="120" height="22" class="MS05td" style="padding-left:10px"><div align="left">건립연월</div></td>
					<td class="MS06td" style="padding-left:5px">
						<s:textfield cssClass="datepicker" name="prod_dt" size="10"  readonly="true" />
					</td>
				</tr>
				<tr>
					<td height="22" class="MS05td" style="padding-left:10px"><div align="left">구조물명</div></td>
					<td class="MS07td" style="padding-left:5px" >
						<input type="text" name="struct_nm" class="box" style="width:250" />
					</td>
					<td height="22" class="MS05td" style="padding-left:10px"><div align="left">관리전화번호</div></td>
					<td class="MS07td" style="padding-left:5px" >
						<input type="text" name="struct_tel_no" class="box" style="width:150" />
					</td>
				</tr>
				<tr>
					<td height="22" class="MS05td" style="padding-left:10px"><div align="left">설치위치</div></td>
					<td class="MS06td" style="padding-left:5px" colspan="3">
						<input type="text" name="loc_nm" class="box" style="width:250"  />
					</td>
				</tr>
				<tr>
					<td height="22" class="MS05td" style="padding-left:10px"><div align="left">구분</div></td>
					<td class="MS07td" style="padding-left:5px" colspan="3">
						<s:select name="struct_type_cd" id="struct_type_cd" list="struct_type_cd_list" listKey="struct_type_cd" listValue="struct_type_nm" headerKey="" headerValue="선택" cssStyle="width:250px"></s:select>
					</td>
				</tr>
				<tr>
					<td height="22" class="MS05td" style="padding-left:10px"><div align="left">센서표시이미지</div></td>
					<td class="MS06td" style="padding-left:5px" colspan="3">
						<s:select name="sensor_image_id" id="sensor_image_id" list="image_nm_list" listKey="sensor_image_id" listValue="sensor_image_nm" headerKey="" headerValue="선택" cssStyle="width:250px"></s:select>
					</td>
				</tr>
				<tr>
					<td  height="22" class="MS05td" style="padding-left:10px"><div align="left"">이미지구분</div>
					</td>
					<td class="MS07td" style="padding-left:5px" colspan="3">
						<s:select name="sensor_image_type" id="sensor_image_type" list="sensor_image_type_list" listKey="sensor_image_type" listValue="sensor_image_type_nm" headerKey="" headerValue="선택" cssStyle="width:250px"></s:select>
					</td>
				</tr>
				<tr>
					<td height="100" class="MS05td" style="padding-left:10px"><div align="left">개요</div>
					</td>
					<td height="100" class="MS06td" style="padding-left:5px" colspan="3">
						<textarea name="intro" style="width:550;height=90"></textarea>
					</td>
				</tr>
<%--				<tr>--%>
<%--					<td height="22" class="MS07td" style="padding-left:5px" colspan="3">--%>
<%--						<s:select name="intro_image_id" id="intro_image_id" list="intro_image_nm_list" listKey="image_id" listValue="intro_image_nm" headerKey="" headerValue="선택" cssStyle="width:250px"></s:select>--%>
<%--					</td>--%>
<%--				</tr>--%>
				<tr>
					<td height="44" class="MS05td" rowspan="2">
						<div align="center">시스템구성 이미지</div>
					</td>
					<td height="22" class="MS06td" style="padding-left:5px" colspan="3">
						<s:select name="system_image_id_1" id="system_image_id_1" list="system_image_nm1_list" listKey="system_image_id_1" listValue="system_image_nm1" headerKey="" headerValue="선택" cssStyle="width:250px"></s:select>
					</td>
				</tr>
				<tr>
					<td height="22" class="MS07td" style="padding-left:5px" colspan="3">
						<s:select name="system_image_id_2" id="system_image_id_2" list="system_image_nm2_list" listKey="system_image_id_2" listValue="system_image_nm2" headerKey="" headerValue="선택" cssStyle="width:250px"></s:select>
					</td>
				</tr>
				<tr>
					<td height="110" class="MS05td" rowspan="5" style="padding-left:10px"><div align="left">도면이미지</div>
					</td>
					<td height="22" class="MS06td" style="padding-left:5px" colspan="3">
						<s:select name="draw_image_id_1" id="draw_image_id_1" list="draw_image_nm1_list" listKey="draw_image_id_1" listValue="draw_image_nm1" headerKey="" headerValue="선택" cssStyle="width:250px"></s:select>
					</td>
				</tr>
				<tr>
					<td height="22" class="MS07td" style="padding-left:5px" colspan="3">
						<s:select name="draw_image_id_2" id="draw_image_id_2" list="draw_image_nm2_list" listKey="draw_image_id_2" listValue="draw_image_nm2" headerKey="" headerValue="선택" cssStyle="width:250px"></s:select>
					</td>
				</tr>
				<tr>
					<td height="22" class="MS06td" style="padding-left:5px" colspan="3">
						<s:select name="draw_image_id_3" id="draw_image_id_3" list="draw_image_nm3_list" listKey="draw_image_id_3" listValue="draw_image_nm3" headerKey="" headerValue="선택" cssStyle="width:250px"></s:select>
					</td>
				</tr>
				<tr>
					<td height="22" class="MS07td" style="padding-left:5px" colspan="3">
						<s:select name="draw_image_id_4" id="draw_image_id_4" list="draw_image_nm4_list" listKey="draw_image_id_4" listValue="draw_image_nm4" headerKey="" headerValue="선택" cssStyle="width:250px"></s:select>
					</td>
				</tr>
				<tr>
					<td height="22" class="MS06td" style="padding-left:5px" colspan="3">
						<s:select name="draw_image_id_5" id="draw_image_id_5" list="draw_image_nm5_list" listKey="draw_image_id_5" listValue="draw_image_nm5" headerKey="" headerValue="선택" cssStyle="width:250px"></s:select>
					</td>
				</tr>
				<tr>	
					<td height="22" class="MS05td" style="padding-left:10px"><div align="left">AGENT ID</div></td>
					<td class="MS07td" style="padding-left:5px" colspan="3">
						<input type="text" name="agent_id" class="box" style="width:250" />
					</td>
				</tr>
				<tr>	
					<td height="22" class="MS05td" style="padding-left:10px"><div align="left">AGENT IP</div></td>
					<td class="MS06td" style="padding-left:5px" colspan="3">
						<input type="text" name="agent_ip" class="box" style="width:250" />
					</td>
				</tr>
				<tr>	
					<td height="22" class="MS05td" style="padding-left:10px"><div align="left">일괄처리여부</div></td>
					<td class="MS07td" style="padding-left:5px" colspan="3" >
						<s:select name="interface_yn" id="sel_yn" list="yn_list" listKey="cd" listValue="nm" headerKey="" headerValue="선택" cssStyle="width:60px"></s:select>
						<span class="main_text">* 일괄처리여부는 센서 등록/수정/삭제를 일괄처리 할 수 있는 여부</span>
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
						<s:submit type="image" src="../images/btn_save.gif"></s:submit>
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

<table><tr><td height="15"></td></tr></table>

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
