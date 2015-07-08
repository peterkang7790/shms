<%@ page language="java" import="java.util.*" pageEncoding="EUC-KR"%>
<%
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
String icon = "sensor_G_01.gif";
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
<script type="text/javascript" src="../script/jquery.js" ></script>
<script type="text/javascript" src="../script/script.js" ></script>
<style type="text/css">
<!--
body { margin-left: 10px; margin-top: 10px; margin-right: 0px; margin-bottom: 0px;}
.style3 { color: #ffa72a; font-weight: bold; }
#floater {position:absolute; visibility:visible; }
-->
</style>
<script type="text/javascript">
	//$(document).ready(function(){});
	
	function sensorIdChk(sensor_id) {
		toUpper(sensor_id);
		$('#agreeView').load('../baseInfo/sensorIdChk.do', {sensor_id:sensor_id.value});
	}
	
	function cancelAct(obj) {
		if (obj.form ) {
			obj.reset();
		}
	}

	// 이미지 제어용
	
	function GetObjectTop(obj) {
		if (obj.offsetParent == document.body)
			return obj.offsetTop;
		else
			return obj.offsetTop + GetObjectTop(obj.offsetParent);
	}

	function GetObjectLeft(obj) {
		if (obj.offsetParent == document.body)
			return obj.offsetLeft;
		else
			return obj.offsetLeft + GetObjectLeft(obj.offsetParent);
	}

	function absPos(e) {
		this.x = e.clientX + (document.documentElement.scrollLeft?document.documentElement.scrollLeft:document.body.scrollLeft);
		this.y = e.clientY + (document.documentElement.scrollTop?document.documentElement.scrollTop:document.body.scrollTop);
		return this;
	}

	function init(x,y,nm) {
		obj = document.form1.img;

		var intImageX = GetObjectLeft(obj);
		var intImageY = GetObjectTop(obj);
		
		var ex_obj = document.getElementById(nm);
		ex_obj.style.left = intImageX + x - 3 + "px";
		ex_obj.style.top  = intImageY + y - 3 + "px";
		ex_obj.style.display = 'block';
	}

	function redraw() {
		var x = document.form1.sensor_x_loc.value.int();
		var y = document.form1.sensor_y_loc.value.int();
		init(x,y);
	} 
	
	function draw(obj) {
		e = event;
		if (!e) e = window.Event;
		var screenPos = absPos(e);

		var intImageX = GetObjectLeft(obj);
		var intImageY = GetObjectTop(obj);
		intImageX = screenPos.x - intImageX - 1;
		intImageY = screenPos.y - intImageY - 1;

		var ex_obj = document.getElementById('imglay');
		ex_obj.style.left = screenPos.x - 3 + "px";
		ex_obj.style.top  = screenPos.y - 3 + "px";
		ex_obj.style.display = 'block';
		
		document.form1.sensor_x_loc.value = intImageX;
		document.form1.sensor_y_loc.value = intImageY;
	}

	function validSensorType(obj) {

		var ref_sensor_id = document.form1.ref_sensor_id;
		var base_temp_value = document.form1.base_temp_value;
	
		var base_temp_td = document.getElementById("base_temp_td");
		var base_temp_unit = document.form1.base_temp_unit;
	
		var gl_value = document.form1.gl_value;
//		var convert_unit = document.form1.convert_unit;
//		var convert_unit_td = document.form1.convert_unit_td;
		
		var l_cri_lmt = document.form1.l_cri_lmt;
		var h_cri_lmt = document.form1.h_cri_lmt;
		var l_maj_lmt = document.form1.l_maj_lmt;
		var h_maj_lmt = document.form1.h_maj_lmt;

		var almTr = document.getElementById('almTr');

		var htmlStrUnit_1 = 'nm';
		
		if (obj.value == "1") { // 변형율계
			base_temp_value.readOnly = true;

			gl_value.readOnly = false;
			ref_sensor_id.disabled = false;
			l_cri_lmt.readOnly = false;
			h_cri_lmt.readOnly = false;
			l_maj_lmt.readOnly = false;
			h_maj_lmt.readOnly = false;


			base_temp_value.style.visibility = 'hidden';

			var htmlStr = '';
			var htmlStr1 = '';
			
//			document.getElementById('base_temp_td').innerHTML = htmlStr;
			document.getElementById('base_temp_unit').innerHTML = htmlStr1; 

			var htmlStrUnit = 'με';
			
			document.getElementById('unitVal_h_inst_range_lmt').innerHTML = htmlStrUnit;
			document.getElementById('unitVal_base_value').innerHTML = htmlStrUnit_1;
			document.getElementById('unitVal_eigen_value').innerHTML = htmlStrUnit_1;
			document.getElementById('unitVal_gf_value').innerHTML = htmlStrUnit;
			document.getElementById('unitVal_gl_value').innerHTML = htmlStrUnit;
			document.getElementById('unitVal_h_cri_lmt').innerHTML = htmlStrUnit;
			document.getElementById('unitVal_h_maj_lmt').innerHTML = htmlStrUnit;

			gl_value.className = "box";
			ref_sensor_id.className = "box";
			l_cri_lmt.className = "box";
			h_cri_lmt.className = "box";
			l_maj_lmt.className = "box";
			h_maj_lmt.className = "box";
		} else if (obj.value == "2") { // 각도계
			base_temp_value.value = "0";
			base_temp_value.readOnly = true;
			gl_value.readOnly = true;

			ref_sensor_id.disabled = false;
			l_cri_lmt.readOnly = false;
			h_cri_lmt.readOnly = false;
			l_maj_lmt.readOnly = false;
			h_maj_lmt.readOnly = false;

			base_temp_value.style.visibility = 'hidden';
			gl_value.style.visibility = 'hidden';
				
			var htmlStr = '';
			var htmlStr1 = '';
			
//			document.getElementById('base_temp_td').innerHTML = htmlStr;
			document.getElementById('base_temp_unit').innerHTML = htmlStr1; 

//			document.getElementById('gl_value_td').innerHTML = htmlStr;
			document.getElementById('unitVal_gl_value').innerHTML = htmlStr1; 
			
			var htmlStrUnit = ' °';
			
			
			document.getElementById('unitVal_h_inst_range_lmt').innerHTML = htmlStrUnit;
			document.getElementById('unitVal_base_value').innerHTML = htmlStrUnit_1;
			document.getElementById('unitVal_eigen_value').innerHTML = htmlStrUnit_1;
			document.getElementById('unitVal_gf_value').innerHTML = htmlStrUnit;
//			document.getElementById('unitVal_gl_value').innerHTML = htmlStrUnit;
			document.getElementById('unitVal_h_cri_lmt').innerHTML = htmlStrUnit;
			document.getElementById('unitVal_h_maj_lmt').innerHTML = htmlStrUnit;

			base_temp_value.className = "graybox";
			gl_value.className = "graybox";
			ref_sensor_id.className = "box";
			l_cri_lmt.className = "box";
			h_cri_lmt.className = "box";
			l_maj_lmt.className = "box";
			h_maj_lmt.className = "box";
		} else if (obj.value == "3") { // 온도계
			base_temp_value.readOnly = false;

			gl_value.readOnly = true;
			ref_sensor_id.value = "";
			ref_sensor_id.disabled = true;
			l_cri_lmt.readOnly = true;
			h_cri_lmt.readOnly = true;
			l_maj_lmt.readOnly = true;
			h_maj_lmt.readOnly = true;

			almTr.style.display = "none";

			var htmlStrUnit = ' ℃';
			
			document.getElementById('unitVal_h_inst_range_lmt').innerHTML = htmlStrUnit;
			document.getElementById('unitVal_base_value').innerHTML = htmlStrUnit_1;
			document.getElementById('unitVal_eigen_value').innerHTML = htmlStrUnit_1;
			document.getElementById('unitVal_gf_value').innerHTML = htmlStrUnit;
			document.getElementById('unitVal_gl_value').innerHTML = htmlStrUnit;
			document.getElementById('unitVal_h_cri_lmt').innerHTML = htmlStrUnit;
			document.getElementById('unitVal_h_maj_lmt').innerHTML = htmlStrUnit;
			
			base_temp_value.className = "box";
			gl_value.className = "graybox";
			ref_sensor_id.className = "graybox";
			l_cri_lmt.className = "graybox";
			h_cri_lmt.className = "graybox";
			l_maj_lmt.className = "graybox";
			h_maj_lmt.className = "graybox";
		} else { // 아무것도 선택하지 않으면
			base_temp_value.readOnly = true;
			gl_value.readOnly = true;
			ref_sensor_id.disabled = false;
			l_cri_lmt.readOnly = true;
			h_cri_lmt.readOnly = true;
			l_maj_lmt.readOnly = true;
			h_maj_lmt.readOnly = true;

			base_temp_value.style.visibility = 'visible';
			gl_value.style.visibility = 'visible';

			almTr.style.display = "";
			
			var htmlStr = '온도기본값';
			var htmlStr1 = ' ℃';
			
			document.getElementById('base_temp_td').innerHTML = htmlStr;
			document.getElementById('base_temp_unit').innerHTML = htmlStr1; 

			var htmlStrUnit = '';
			
			document.getElementById('unitVal_h_inst_range_lmt').innerHTML = htmlStrUnit;
			document.getElementById('unitVal_base_value').innerHTML = htmlStrUnit;
			document.getElementById('unitVal_eigen_value').innerHTML = htmlStrUnit;
			document.getElementById('unitVal_gf_value').innerHTML = htmlStrUnit;
			document.getElementById('unitVal_gl_value').innerHTML = htmlStrUnit;
			document.getElementById('unitVal_h_cri_lmt').innerHTML = htmlStrUnit;
			document.getElementById('unitVal_h_maj_lmt').innerHTML = htmlStrUnit;
			
			base_temp_value.className = "box";
			gl_value.className = "box";
			ref_sensor_id.className = "box";
			l_cri_lmt.className = "box";
			h_cri_lmt.className = "box";
			l_maj_lmt.className = "box";
			h_maj_lmt.className = "box";
		}
	}
	
	function saveSensor() {
		// -----------------------------------------------------
		var sensor_type_cd = document.form1.sensor_type_cd;

		
		if (trim(sensor_type_cd.value) == "") {
			alert("센서종류는 반드시 입력되어야 합니다.");
			sensor_type_cd.focus();
			return;
		} 

		// -----------------------------------------------------
		var h_inst_range_lmt = document.form1.h_inst_range_lmt;
		if (trim(h_inst_range_lmt.value) == "") {
			alert("(상위)계측범위는 반드시 입력되어야 합니다.");
			h_inst_range_lmt.focus();
			return;
		} 

		var l_inst_range_lmt = document.form1.l_inst_range_lmt;
		if (trim(l_inst_range_lmt.value) == "") {
			alert("(하위)계측범위는 반드시 입력되어야 합니다.");
			l_inst_range_lmt.focus();
			return;
		} 

		if (trim(h_inst_range_lmt.value) <= trim(l_inst_range_lmt.value)) {
			alert("상위 계측범위는 하위 계측범위 보다 항상 커야 합니다.");
			h_inst_range_lmt.focus();
			return;
		} 

		// -----------------------------------------------------
		var base_value = document.form1.base_value;
		if (trim(base_value.value) == "") {
			alert("고유값은 반드시 입력되어야 합니다.");
			base_value.focus();
			return;
		} 

		/*
		if (!(trim(base_value.value) <= trim(h_inst_range_lmt.value) && trim(base_value.value) >= trim(l_inst_range_lmt.value))) {
			alert("고유값은 영점값의 계측범위 안에 있어야 합니다.");
			base_value.focus();
			return;
		} 
		*/
		// -----------------------------------------------------
		var eigen_value = document.form1.eigen_value;
		if (trim(eigen_value.value) == "") {
			alert("기본(영점)값은 반드시 입력되어야 합니다.");
			eigen_value.focus();
			return;
		} 

		// -----------------------------------------------------
		var gf_value = document.form1.gf_value;
		if (trim(gf_value.value) == "") {
			alert("G/F값은 반드시 입력되어야 합니다.");
			gf_value.focus();
			return;
		} 

		// -----------------------------------------------------
		if(sensor_type_cd.value == "1" )
		{
			var gl_value = document.form1.gl_value;
			if (trim(gl_value.value) == "1") {
				if (trim(gf_value.value) == "") {
					alert("변형율계 센서의 경우에는 G/L값은 반드시 입력되어야 합니다.");
					gl_value.focus();
					return;
				}
			}
		}
		 

		// -----------------------------------------------------
		if (trim(sensor_type_cd.value) == "1" && trim(sensor_type_cd.value) == "2") {
			var h_cri_lmt = document.form1.h_cri_lmt;
			if (trim(h_cri_lmt.value) == "") {
				alert("(상위)위험임계치는 반드시 입력되어야 합니다.");
				h_cri_lmt.focus();
				return;
			} 
	
			var l_cri_lmt = document.form1.l_cri_lmt;
			if (trim(l_cri_lmt.value) == "") {
				alert("(하위)위험임계치는 반드시 입력되어야 합니다.");
				l_cri_lmt.focus();
				return;
			} 
	
			if (trim(h_cri_lmt.value) <= trim(l_cri_lmt.value)) {
				alert("상위 위험임계치는 하위 위험임계치 보다 항상 커야 합니다.");
				h_cri_lmt.focus();
				return;
			} 
			
			if (!(trim(h_cri_lmt.value) <= trim(h_inst_range_lmt.value) && trim(h_cri_lmt.value) >= trim(l_inst_range_lmt.value))) {
				alert("상위 위험임계치는 계측범위 안에 있어야 합니다.");
				h_cri_lmt.focus();
				return;
			} 
	
			if (!(trim(l_cri_lmt.value) <= trim(h_inst_range_lmt.value) && trim(l_cri_lmt.value) >= trim(l_inst_range_lmt.value))) {
				alert("하위 위험임계치는 계측범위 안에 있어야 합니다.");
				h_cri_lmt.focus();
				return;
			}
		} 

		// -----------------------------------------------------
		if (trim(sensor_type_cd.value) == "1" && trim(sensor_type_cd.value) == "2") {
			var h_maj_lmt = document.form1.h_maj_lmt;
			if (trim(h_maj_lmt.value) == "") {
				alert("(상위)경고임계치는 반드시 입력되어야 합니다.");
				h_maj_lmt.focus();
				return;
			} 
	
			var l_maj_lmt = document.form1.l_maj_lmt;
			if (trim(l_maj_lmt.value) == "") {
				alert("(하위)경고임계치는 반드시 입력되어야 합니다.");
				l_maj_lmt.focus();
				return;
			} 
	
			if (trim(h_maj_lmt.value) <= trim(l_maj_lmt.value)) {
				alert("상위 경고임계치는 하위 경고임계치 보다 항상 커야 합니다.");
				h_maj_lmt.focus();
				return;
			} 
					
			if (!(trim(h_maj_lmt.value) <= trim(h_inst_range_lmt.value) && trim(h_maj_lmt.value) >= trim(l_inst_range_lmt.value))) {
				alert("상위 경고임계치는 계측범위 안에 있어야 합니다.");
				h_maj_lmt.focus();
				return;
			} 
	
			if (!(trim(l_maj_lmt.value) <= trim(h_inst_range_lmt.value) && trim(l_maj_lmt.value) >= trim(l_inst_range_lmt.value))) {
				alert("하위 경고임계치는 계측범위 안에 있어야 합니다.");
				l_maj_lmt.focus();
				return;
			} 
		}
		// -----------------------------------------------------
/*
		if (sensor_type_cd.value == '1') {
			var convert_unit = document.form1.convert_unit;
			if (trim(convert_unit.value) == null || trim(convert_unit.value) == undefined || trim(convert_unit.value) == "")
			{
				alert("변형율계 센서의 경우에는 환산단위값은 반드시 입력되어야 합니다.");
				convert_unit.focus();
				return;
			} 
		}
*/		
		// -----------------------------------------------------
		if ( trim(sensor_type_cd.value) == '3') {
			var base_temp_value = document.form1.base_temp_value;
			if (trim(base_temp_value.value) == null || trim(base_temp_value.value) == undefined || trim(base_temp_value.value) == "") {
				alert("온도계 센서의 경우에는 온도기본값은 반드시 입력되어야 합니다.");
				base_temp_value.focus();
				return;
			}
		} 
//		else 
//		{
//			base_temp_value.value = "0";
//		} 
		
		// -----------------------------------------------------
		/*
		if (trim(sensor_type_cd.value) != '3') {
			var ref_sensor_id = document.form1.ref_sensor_id;
			if (trim(ref_sensor_id.value) == null || trim(ref_sensor_id.value) == undefined || trim(ref_sensor_id.value) == "") {
				alert("변형율계/각도계 센서의 경우에는 연계센서는 반드시 선택되어야 합니다.");
				ref_sensor_id.focus();
				return;
			} 
		}
*/
		// -----------------------------------------------------
		var detector_id = document.form1.detector_id;
		if (trim(detector_id.value) == null || trim(detector_id.value) == undefined || trim(detector_id.value) == "") {
			alert("디텍터는 반드시 입력되어야 합니다.");
			detector_id.focus();
			return;
		} 

		// -----------------------------------------------------
		var channel_id = document.form1.channel_id;
		if (trim(channel_id.value) == null || trim(channel_id.value) == undefined || trim(channel_id.value) == "") {
			alert("채널은 반드시 입력되어야 합니다.");
			channel_id.focus();
			return;
		} 

		editSensor.method = "post";
		editSensor.target = "_self";
		editSensor.action = "editSensor.do";
		editSensor.submit();
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

<s:form id="form1" namespace="/baseInfo" action="editSensor" theme="simple" method="get">
<s:push value="detailSensor">

<table width="750" height="100%" border="0" cellpadding="0" cellspacing="0" background="../images/bg.gif">
<tr>
	<td valign="top">
		<table width="750" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td height="32" background="../images/title_bg.gif">
				<table width="740" border="0" cellspacing="0" cellpadding="0" style="padding:0px 0px 0px 5px;">
				<tr>
					<td width="20" valign="top"><img src="../images/point_title_01.gif" width="20" height="17"></td>
					<td width="270" class="title_01">센서수정 </td>
					<td width="450" class="route"><div align="right">홈 &nbsp;&gt;&nbsp; 기준정보 &nbsp;&gt;&nbsp; 센서</div></td>
				</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td height="30" valign="top">
				<table width="740" height="16" border="0" cellpadding="0" cellspacing="0" style="padding:10px 0px 0px 1px;">
				<tr>
					<td width="12" valign="middle"><img src="../images/point_title_02.gif" width="5" height="13"></td>
					<td width="682" class="title_02">센서정보</td>
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
					<td width="110" height="25" class="MS05td" style="padding-left:10px"><div align="left">센서ID</div></td>
					<td width="230" class="MS06td" style="padding-left:5px">
						<input type="text" name="sensor_id" value="${sensor_id}" class="m_box" style="width:115" onblur="sensorIdChk(this)" /> 
						<br/>
						<span id="agreeView"></span>             
					</td>
					<td class="MS05td" width="110" style="padding-left:10px"><div align="left">센서종류 </div></td>
					<td width="300" class="MS06td" style="padding-left:5px">
						<s:select name="sensor_type_cd" id="sensor_type_cd" list="sensor_type_list" listKey="sensor_type_cd" listValue="sensor_type_nm" headerKey="" headerValue="선택" cssStyle="width:130px" onchange="validSensorType(this);"></s:select>				
					</td>
				</tr>
				<tr>
					<td width="110" height="25" class="MS05td" style="padding-left:10px"><div align="left">설치위치</div></td>
					<td colspan="3" class="MS07td" style="padding-left:5px">
						<input type="text" name="loc_nm" value="${loc_nm}" class="box" style="width:530" />			
					</td>
				</tr>
				<tr>
					<td width="110" class="MS05td" style="padding-left:10px"><div align="left">설치위치 좌표</div></td>
					<td width="300" class="MS07td" style="padding-left:5px">
						X :<input type="text" name="x_loc" value="${x_loc}" class="box" style="width:40" /> &nbsp;
						Y :<input type="text" name="y_loc" value="${y_loc}" class="box" style="width:40" /> &nbsp; 
						Z :<input type="text" name="z_loc" value="${z_loc}" class="box" style="width:40" />
					</td>
					<td height="25" class="MS05td" style="padding-left:10px"><div align="left">구조물 구성</div></td>
					<td width="300" class="MS07td" style="padding-left:5px">
						<s:select name="struct_comp_id" id="struct_comp_id" list="struct_comp_list" listKey="struct_comp_id" listValue="struct_comp_nm" headerKey="" headerValue="선택" cssStyle="width:130px"></s:select>
					</td>
				</tr>
				<tr>
					<td width="110" height="25" class="MS05td" style="padding-left:10px"><div align="left">계측항목</div></td>
					<td width="230" class="MS07td" style="padding-left:5px">
						<s:select name="inst_item_cd" id="inst_item__cd" list="inst_item_list" listKey="inst_item_cd" listValue="inst_item_nm" headerKey="" headerValue="선택" cssStyle="width:130px"></s:select>           
					</td>
					<td height="25" class="MS05td" style="padding-left:10px"><div align="left">계측범위</div></td>
					<td width="230" class="MS06td" style="padding-left:5px">
						<input name="l_inst_range_lmt" id="l_inst_range_lmt" type="text" value="${l_inst_range_lmt}" class="box" style="width:80" /> &nbsp;~&nbsp;	  
						<input name="h_inst_range_lmt" id="h_inst_range_lmt" type="text" value="${h_inst_range_lmt}" class="box" style="width:80" />
						<s:if test="sensor_type_cd==1" >με</s:if>
						<s:elseif test="sensor_type_cd==2" > °</s:elseif>
						<s:elseif test="sensor_type_cd==3"> ℃</s:elseif>
						<s:else></s:else>
					</td>
				</tr>
				<tr>
					<td width="110" class="MS05td" style="padding-left:10px"><div align="left">고유값</div></td>
					<td width="300" class="MS06td" style="padding-left:5px">
						<input type="text" name="eigen_value" value="${eigen_value}" class="box" style="width:80" /> nm
<%--						<s:if test="sensor_type_cd==1" >με</s:if>--%>
<%--						<s:elseif test="sensor_type_cd==2" > °</s:elseif>--%>
<%--						<s:elseif test="sensor_type_cd==3"> ℃</s:elseif>--%>
<%--						<s:else></s:else>--%>
					</td>
					<td height="25" class="MS05td" style="padding-left:10px"><div align="left">기본값(영점값)</div></td>
					<td width="230" class="MS07td" style="padding-left:5px">
						<input type="text" name="base_value" value="${base_value}" class="box" style="width:80" /> nm
<%--						<s:if test="sensor_type_cd==1" >με</s:if>--%>
<%--						<s:elseif test="sensor_type_cd==2" > °</s:elseif>--%>
<%--						<s:elseif test="sensor_type_cd==3"> ℃</s:elseif>--%>
<%--						<s:else></s:else>--%>
					</td>
				</tr>
				<tr>
					<td width="110"  height="25" class="MS05td" style="padding-left:10px"><div align="left">G/F</div></td>
					<td width="300" class="MS07td" style="padding-left:5px">
						<input name="gf_value" id="gf_value" type="text" value="${gf_value}" class="box" style="width:50"/>
						<s:if test="gf_value==null">&nbsp;</s:if>
						<s:else>
							<s:if test="sensor_type_cd==1" >με/nm</s:if>
							<s:elseif test="sensor_type_cd==2" > nm/°</s:elseif>
							<s:elseif test="sensor_type_cd==3"> nm/℃</s:elseif>
							<s:else></s:else>
						</s:else>
					</td>
					<td class="MS05td" style="padding-left:10px"><div align="left" id="gl_value_td">G/L</div></td>
					<td width="300" class="MS07td" style="padding-left:5px">
						<s:if test="sensor_type_cd==1">
							<input name="gl_value" id="gl_value" type="text" value="${gl_value}" class="graybox" style="width:50" />
							<s:if test="gl_value==null">&nbsp;</s:if>
							<s:else>
								 mm
							</s:else>
						<s:else></s:else>
						</s:if>
					</td>
				</tr>
				<tr>
					<td width="110"  height="25" class="MS05td" style="padding-left:10px"><div align="left">디텍터</div></td>
					<td width="230" class="MS06td" style="padding-left:5px">
						<s:select name="detector_id" id="detector_id" list="detector_list" listKey="detector_id" listValue="detector_nm" headerKey="" headerValue="선택" cssStyle="width:130px" ></s:select>				
					</td>
					<td height="25" class="MS05td" style="padding-left:10px"><div align="left">채널</div></td>
					<td width="300" class="MS06td" style="padding-left:5px">
					<s:if test="channel_id==null"><div id="fieldView"></div></s:if>
					<s:else>
						<s:select name="channel_id" id="channel_id" list="channel_list" listKey="channel_id" listValue="channel_nm" headerKey="" headerValue="선택" cssStyle="width:130px" ></s:select>	
					</s:else>		
					</td>
				</tr>
				<tr id="almTr">
					<td width="110" height="25" class="MS05td" style="padding-left:10px"><div align="left">위험임계치</div></td>
					<td width="230" class="MS06td" style="padding-left:5px">
						<input type="text" name="l_cri_lmt" size="11" value="${l_cri_lmt}" class="graybox" style="width:80" /> &nbsp;~&nbsp; 
						<input type="text" name="h_cri_lmt" size="11" value="${h_cri_lmt}" class="graybox" style="width:80" />
						<s:if test="sensor_type_cd==1" >με</s:if>
						<s:elseif test="sensor_type_cd==2" > °</s:elseif>
						<s:else></s:else>
					</td>
					<td class="MS05td" style="padding-left:10px"><div align="left">경고임계치</div></td>
					<td width="300" class="MS06td" style="padding-left:5px">
						<input type="text" name="l_maj_lmt" size="11" value="${l_maj_lmt}" class="graybox" style="width:80" /> &nbsp;~&nbsp; 
						<input type="text" name="h_maj_lmt" size="11" value="${h_maj_lmt}" class="graybox" style="width:80" />
						<s:if test="sensor_type_cd==1" >με</s:if>
						<s:elseif test="sensor_type_cd==2" > °</s:elseif>
						<s:else></s:else>
					</td>
				</tr>
				<tr>
					<td width="110" height="25" class="MS05td" style="padding-left:10px"><div align="left">연계센서</div></td>
					<td width="300" class="MS06td" style="padding-left:5px">
						<s:select name="ref_sensor_id" id="ref_sensor_id" list="ref_sensor_list" listKey="sensor_id" listValue="sensor_id" headerKey="" headerValue="선택" cssStyle="width:130px" cssClass="box"></s:select>
					</td>
					<td class="MS05td" style="padding-left:10px"><div align="left" id="base_temp_td">온도기본값</div></td>
					<td width="230" class="MS06td" style="padding-left:5px">
						<s:if test="sensor_type_cd==3">
							<input type="text" name="base_temp_value" value="${base_temp_value}" class="box" style="width:80" />
							<s:if test="base_temp_value==null">&nbsp;</s:if><s:else> ℃</s:else>
						</s:if>
					</td>
					
				</tr>
				</table>
			</td>
		</tr>
		<%
			String cd = "";
			if( request.getAttribute("sensor_type_cd") != null )
			{
				cd = request.getAttribute("sensor_type_cd").toString();
			}
		%>
		
		<script type="text/javascript">
		if( <%=cd%> == '3' )
		{
			var layer_1 = document.getElementById("almTr");
			layer_1.style.display = "none";
		}
		
		
		</script>
		<tr>
			<td height="30" valign="top">
				<table width="740" height="16" border="0" cellpadding="0" cellspacing="0" style="padding:10px 0px 0px 1px;">
				<tr>
					<td width="12" valign="middle"><img src="../images/point_title_02.gif" width="5" height="13"></td>
					<td width="682" class="title_02">센서위치</td>
				</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td><table width="750" border="0" cellspacing="1" bgcolor="#CCCCCC" cellpadding="2">
				<tr>
					<td height="2" colspan="3" class="MS01td"></td>
				</tr>
				<tr>
					<td width="450" height="25" class="MS05td" style="padding-left:15px"><strong>${image_nm}</strong></td>
					<td width="80" class="MS05td" style="padding-left:30px">센서위치</td>
					<td width="220" class="MS05td" style="padding-left:15px">
						X :<input type="text" name="sensor_x_loc" value="${sensor_x_loc}" class="box" style="width:40" onblur="redraw();" /> &nbsp;
						Y :<input type="text" name="sensor_y_loc" value="${sensor_y_loc}" class="box" style="width:40" onblur="redraw();" /> 
					</td>
				</tr>
				<tr>
					<td height="310" colspan="3" class="MS07td">
						<div align="center"><img name="img" src="../upload/${image_path}" height="300" onclick="draw(this);" style="cursor:crosshair;"></div>
						<div id="imglay" style="position:absolute; display:none;"><img src="../images/sensor_R_01.gif" width="7" height="7" style="cursor:hand;"></div>
						<s:push value="rsSensorPosObj" >
							<div id="img_${sensor_id}" style="position:absolute; display:none;">
							<%
								String senTyp = request.getAttribute("sensor_type_cd")==null?"9":request.getAttribute("sensor_type_cd").toString();
								String troClass = request.getAttribute("trouble_class_cd")==null?null:request.getAttribute("trouble_class_cd").toString();
								
								if( "1".equals(senTyp) )
							    {
							    	if( troClass != null )
							    	{
							    		if( "1".equals(troClass) ) icon = "sensor_R_01_ani_05.gif";
								    	if( "2".equals(troClass) ) icon = "sensor_O_01_ani_05.gif";
							    	}
							    	else
							    	{
							    		icon = "sensor_G_01_ani_05.gif";
							    	}
							    }
							    else if( "2".equals(senTyp) )
							    {
							    	if( troClass != null )
							    	{
							    		if( "1".equals(troClass) ) icon = "sensor_R_01_ani_05.gif";
								    	if( "2".equals(troClass) ) icon = "sensor_O_01_ani_05.gif";
							    	}
							    	else
							    	{
							    		icon = "sensor_G_01_ani_05.gif";
							    	}
							    }
							    else
							    {
							    	if( troClass != null )
							    	{
							    		if( "1".equals(troClass) ) icon = "sensor_R_01_ani_05.gif";
								    	if( "2".equals(troClass) ) icon = "sensor_O_01_ani_05.gif";
							    	}
							    	else
							    	{
							    		icon = "sensor_G_01_ani_05.gif";
							    	}
							    }
								%>
								<img src="../images/<%=icon%>" width="7" height="7" style="cursor:hand;" alt="${sensor_id}" border="0">
							</div>
						</s:push>
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
						<!-- s :submit type="image" src="../images/btn_save.gif"></s :submit -->
						<s:a href="javascript:saveSensor();"><img src="../images/btn_save.gif" border="0"></s:a>
						<s:a href="listSensor.do"><img src="../images/btn_list.gif" border="0"></s:a>
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

<script type="text/javascript">
var x = "${sensor_x_loc}".int();
var y = "${sensor_y_loc}".int();
init(x,y,"img_${sensor_id}"); 



var sensor_type_cd = document.form1.sensor_type_cd;

var ref_sensor_id = document.form1.ref_sensor_id;
var base_temp_value = document.form1.base_temp_value;
var gl_value = document.form1.gl_value;
var l_cri_lmt = document.form1.l_cri_lmt;
var h_cri_lmt = document.form1.h_cri_lmt;
var l_maj_lmt = document.form1.l_maj_lmt;
var h_maj_lmt = document.form1.h_maj_lmt;

if (sensor_type_cd.value == "1") { // 변형율계

	gl_value.readOnly = false;
	ref_sensor_id.disabled = false;
	l_cri_lmt.readOnly = false;
	h_cri_lmt.readOnly = false;
	l_maj_lmt.readOnly = false;
	h_maj_lmt.readOnly = false;

	gl_value.className = "box";
	ref_sensor_id.className = "box";
	l_cri_lmt.className = "box";
	h_cri_lmt.className = "box";
	l_maj_lmt.className = "box";
	h_maj_lmt.className = "box";
} else if (sensor_type_cd.value == "2") { // 각도계

	ref_sensor_id.disabled = false;
	l_cri_lmt.readOnly = false;
	h_cri_lmt.readOnly = false;
	l_maj_lmt.readOnly = false;
	h_maj_lmt.readOnly = false;

	ref_sensor_id.className = "box";
	l_cri_lmt.className = "box";
	h_cri_lmt.className = "box";
	l_maj_lmt.className = "box";
	h_maj_lmt.className = "box";
} else if (sensor_type_cd.value == "3") { // 온도계
	base_temp_value.readOnly = false;

	ref_sensor_id.value = "";
	ref_sensor_id.disabled = true;
	l_cri_lmt.readOnly = true;
	h_cri_lmt.readOnly = true;
	l_maj_lmt.readOnly = true;
	h_maj_lmt.readOnly = true;

	base_temp_value.className = "box";
	ref_sensor_id.className = "graybox";
	l_cri_lmt.className = "graybox";
	h_cri_lmt.className = "graybox";
	l_maj_lmt.className = "graybox";
	h_maj_lmt.className = "graybox";
} else { // 아무것도 선택하지 않으면
	base_temp_value.readOnly = true;
	gl_value.readOnly = true;
	ref_sensor_id.disabled = true;
	l_cri_lmt.readOnly = true;
	h_cri_lmt.readOnly = true;
	l_maj_lmt.readOnly = true;
	h_maj_lmt.readOnly = true;

	base_temp_value.className = "graybox";
	gl_value.className = "graybox";
	ref_sensor_id.className = "graybox";
	l_cri_lmt.className = "graybox";
	h_cri_lmt.className = "graybox";
	l_maj_lmt.className = "graybox";
	h_maj_lmt.className = "graybox";
}

</script>

</s:push>
</s:form>
<td valign="top">
	<!-- 퀵메뉴 -->
	<div id="floater" style="left:800px; top:30px; width:160; height:0; z-index:10">
		<table width="180" border="0" bordercolor="red" cellspacing="0" cellpadding="0"style="margin:20px 0px 0px 14px;">
			<tr>
				<s:include value="../common/quickmenu.jsp"></s:include>
			</tr>
		</table>
	</div>
</td>	
</body>
</html>

</s:else>
