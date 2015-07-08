<%@ page language="java" import="java.util.*" pageEncoding="EUC-KR"%>
<%
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
String bg = "";
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
<script  type="text/javascript" src="../script/ComUtil.js" ></script>
<style type="text/css">
<!--
body { margin-left: 10px; margin-top: 10px; margin-right: 0px; margin-bottom: 0px;}
.style3 { color: #ffa72a; font-weight: bold; }
#floater {position:absolute; visibility:visible; }
-->
</style>
<script type="text/javascript">
	//$(document).ready(function(){});
<%--	function doBlink() { --%>
<%--	var blink = document.all.tags("BLINK") --%>
<%--	for (var i=0; i < blink.length; i++) --%>
<%--	blink[i].style.visibility = blink[i].style.visibility == "" ? "hidden" : "" --%>
<%--	} --%>
<%--	function startBlink() { --%>
<%--		if (document.all) --%>
<%--		setInterval("doBlink()",400)  //속도 --%>
<%--	} --%>
<%--	window.onload = startBlink; --%>
	
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

//		x = x + 23;
		
		obj = document.form1.img;
		var intImageX = GetObjectLeft(obj);
		var intImageY = GetObjectTop(obj);

		var ex_obj = document.getElementById(nm);

		ex_obj.style.left = intImageX + x - 3 + "px";
		ex_obj.style.top  = intImageY + y - 3 + "px";
		ex_obj.style.display = 'block';
	}

<%--	function redraw() {--%>
<%--		var x = document.form1.sensor_x_loc.value.int();--%>
<%--		var y = document.form1.sensor_y_loc.value.int();--%>
<%--		init(x,y);--%>
<%--	} --%>
<%--	--%>
<%--	function draw(obj) {--%>
<%--		e = event;--%>
<%--		if (!e) e = window.Event;--%>
<%--		var screenPos = absPos(e);--%>
<%----%>
<%--		var intImageX = GetObjectLeft(obj);--%>
<%--		var intImageY = GetObjectTop(obj);--%>
<%--		intImageX = screenPos.x - intImageX - 1;--%>
<%--		intImageY = screenPos.y - intImageY - 1;--%>
<%----%>
<%--		var ex_obj = document.getElementById('imglay');--%>
<%--		ex_obj.style.left = screenPos.x - 3 + "px";--%>
<%--		ex_obj.style.top  = screenPos.y - 3 + "px";--%>
<%--		ex_obj.style.display = 'block';--%>
<%--		--%>
<%--		document.form1.sensor_x_loc.value = intImageX;--%>
<%--		document.form1.sensor_y_loc.value = intImageY;--%>
<%--	}--%>
	
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

<s:form id="form1" namespace="/baseInfo" action="detailSensor" theme="simple" method="get">
<s:push value="detailSensor" >

<table width="830" height="100%" border="0" cellpadding="0" cellspacing="0" background="../images/bg.gif">
<tr>
	<td valign="top">
		<table width="750" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td height="32" background="../images/title_bg.gif">
				<table width="740" border="0" cellspacing="0" cellpadding="0" style="padding:0px 0px 0px 5px;">
				<tr>
					<td width="20" valign="top"><img src="../images/point_title_01.gif" width="20" height="17"></td>
					<td width="270" class="title_01">센서 상세보기 </td>
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
			<td>
			<table width="750" border="0" cellpadding="0" cellspacing="1" class="MSlinetd">
				<tr>
					<td colspan="4" height="2" class="MS01td"></td>
				</tr>
				<tr>
					<td width="110" height="25" class="MS05td" style="padding-left:10px"><div align="left">센서ID</div></td>
					<td width="230" class="MS06td" style="padding-left:5px">
						<s:if test="sensor_id==null">&nbsp;</s:if><s:else><s:property value="sensor_id" /></s:else>
					</td>
					<td width="110" height="25" class="MS05td" style="padding-left:10px"><div align="left">센서종류</div></td>
					<td width="230" class="MS06td" style="padding-left:5px">
						<s:if test="sensor_type_nm">&nbsp;</s:if><s:else><s:property value="sensor_type_nm" /></s:else>				
					</td>
					
				</tr>
				<tr>
					<td width="110" height="25" class="MS05td" style="padding-left:10px"><div align="left">설치위치</div></td>
					<td colspan="3" class="MS07td" style="padding-left:5px">
						<s:if test="loc_nm==null">&nbsp;</s:if><s:else><s:property value="loc_nm" /></s:else>
					</td>
				</tr>
				<tr>
					<td class="MS05td" width="110" style="padding-left:10px"><div align="left">설치위치 좌표 </div></td>
					<td width="300" class="MS07td" style="padding-left:5px">
						X :<s:if test="x_loc==null">&nbsp;</s:if><s:else><s:property value="x_loc" /></s:else> &nbsp;
						Y :<s:if test="y_loc==null">&nbsp;</s:if><s:else><s:property value="y_loc" /></s:else> &nbsp;
						Z :<s:if test="z_loc==null">&nbsp;</s:if><s:else><s:property value="z_loc" /></s:else> 
					</td>
					<td width="110" height="25" class="MS05td"style="padding-left:10px"><div align="left">구조물 구성</div></td>
					<td width="300" class="MS07td" style="padding-left:5px">
						<s:if test="struct_comp_nm">&nbsp;</s:if><s:else><s:property value="struct_comp_nm" /></s:else>
					</td>
				</tr>
				<tr>
					<td width="110" height="25" class="MS05td" style="padding-left:10px"><div align="left">계측항목</div></td>
					<td width="300" class="MS07td" style="padding-left:5px">
						<s:if test="inst_item_nm==null">&nbsp;</s:if><s:else><s:property value="inst_item_nm" /></s:else>           
					</td>
					<td width="110" class="MS05td" style="padding-left:10px"><div align="left">계측범위</div></td>
					<td width="300" class="MS06td" style="padding-left:5px">
						<s:if test="l_inst_range_lmt==null" >&nbsp;</s:if><s:else><s:property value="l_inst_range_lmt" /></s:else> &nbsp;~&nbsp;
						<s:if test="h_inst_range_lmt==null" >&nbsp;</s:if><s:else><s:property value="h_inst_range_lmt" />
						<s:if test="sensor_type_cd==1" >με</s:if>
						<s:elseif test="sensor_type_cd==2" > °</s:elseif>
						<s:elseif test="sensor_type_cd==3"> ℃</s:elseif>
						<s:else></s:else>
						</s:else>
					</td>
				</tr>
				<tr>
					<td width="110" height="25" class="MS05td" style="padding-left:10px"><div align="left">고유값</div></td>
					<td width="230" class="MS06td" style="padding-left:5px">
						<s:if test="eigen_value==null">&nbsp;</s:if>
						<s:else>
							<s:property value="eigen_value" /> nm
<%--							<s:if test="sensor_type_cd==1" >με</s:if>--%>
<%--							<s:elseif test="sensor_type_cd==2" > °</s:elseif>--%>
<%--							<s:elseif test="sensor_type_cd==3"> ℃</s:elseif>--%>
<%--							<s:else></s:else>--%>
						</s:else>
					</td>
					<td width="110" height="25" class="MS05td" style="padding-left:10px"><div align="left">기본값(영점값)</div></td>
					<td width="230" class="MS07td" style="padding-left:5px">
						<s:if test="base_value==null">&nbsp;</s:if>
						<s:else>
							<s:property value="base_value" /> nm
<%--							<s:if test="sensor_type_cd==1" >με</s:if>--%>
<%--							<s:elseif test="sensor_type_cd==2" > °</s:elseif>--%>
<%--							<s:elseif test="sensor_type_cd==3"> ℃</s:elseif>--%>
<%--							<s:else></s:else>--%>
						</s:else>
					</td>
				</tr>
				<tr>
					<td width="110" height="25" class="MS05td" style="padding-left:10px"><div align="left">G/F</div></td>
					<td width="300" class="MS07td" style="padding-left:5px">
						<s:if test="gf_value==null">&nbsp;</s:if>
						<s:else>
							<s:property value="gf_value" />
							<s:if test="sensor_type_cd==1" >με/nm</s:if>
							<s:elseif test="sensor_type_cd==2" >nm/°</s:elseif>
							<s:elseif test="sensor_type_cd==3">nm/℃</s:elseif>
							<s:else></s:else>
						</s:else>
					</td>
					<td width="110" class="MS05td" style="padding-left:10px"><div align="left">G/L</div></td>
					<td width="300" class="MS07td" style="padding-left:5px">
						<s:if test="sensor_type_cd==1">
							<s:if test="gl_value==null">&nbsp;</s:if>
							<s:else>
								<s:property value="gl_value" />mm	
							</s:else>
						</s:if>
						<s:else></s:else>
					</td>
				</tr>
				<tr>
					<td width="110" class="MS05td"style="padding-left:10px"><div align="left">디텍터</div></td>
					<td width="230" class="MS06td" style="padding-left:5px">
						<s:if test="detector_nm==null">&nbsp;</s:if><s:else><s:property value="detector_nm" /></s:else>				
					</td>
					<td width="110" height="25" class="MS05td"style="padding-left:10px"><div align="left">채널</div></td>
					<td width="300" class="MS06td" style="padding-left:5px">
						<s:if test="channel_nm">&nbsp;</s:if><s:else><s:property value="channel_nm" /></s:else>				
					</td>
				</tr>
				<tr id="layer_1">
					<td width="110" height="25" class="MS05td" style="padding-left:10px"><div align="left">위험임계치</div></td>
					<td width="230" class="MS06td" style="padding-left:5px">
						<s:if test="sensor_type_cd==3"></s:if>
						<s:else>
							<s:if test="l_cri_lmt==null">&nbsp;</s:if>
							<s:else>
								<s:property value="l_cri_lmt" />
							</s:else> &nbsp;~&nbsp; 
							<s:if test="h_cri_lmt==null">&nbsp;</s:if>
							<s:else>
								<s:property value="h_cri_lmt" />
								<s:if test="sensor_type_cd==1" >με</s:if>
								<s:elseif test="sensor_type_cd==2" > °</s:elseif>
								<s:else></s:else>
							</s:else>
						</s:else>
					</td>
					<td width="110" class="MS05td" style="padding-left:10px"><div align="left">경고임계치</div></td>
					<td width="300" class="MS06td" style="padding-left:5px">
						<s:if test="l_maj_lmt==null">&nbsp;</s:if><s:else><s:property value="l_maj_lmt" /></s:else> &nbsp;~&nbsp; 
						<s:if test="h_maj_lmt==null">&nbsp;</s:if>
						<s:else>
							<s:property value="h_maj_lmt" />
							<s:if test="sensor_type_cd==1" >με</s:if>
							<s:elseif test="sensor_type_cd==2" > °</s:elseif>
							<s:else></s:else>
						</s:else> 
					</td>
				</tr>
				<tr>
					<td width="110" height="25" class="MS05td" style="padding-left:10px"><div align="left">연계센서</div></td>
					<td width="300" class="MS06td" style="padding-left:5px">
						<s:if test="sensor_type_cd==3">
						</s:if>
						<s:else>
							<table width="120" height="17" border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td width="105" class="MS06td" style="padding-top:2px"> 
									<s:if test="ref_sensor_id==null">&nbsp;</s:if><s:else><s:property value="ref_sensor_id" /></s:else>
								</td>
								<td width="53" align="left">
									<s:if test="ref_sensor_id==null">&nbsp;</s:if>
									<s:else>
										<a href="detailSensor.do?sensor_id=<s:property value="ref_sensor_id" />" onfocus="this.blur();">
										<img src="../images/btnS_search.gif" width="32" height="17" border="0" align="absmiddle">
										</a>
									</s:else>
								</td>
							</tr>
							</table>		
						</s:else>
					</td>
					<td width="110" class="MS05td" style="padding-left:10px"><div align="left">온도기본값</div></td>
					<td width="230" class="MS06td" style="padding-left:5px">
					    <s:if test="sensor_type_cd==3">
					    	<s:if test="base_temp_value==null">&nbsp;</s:if><s:else><s:property value="base_temp_value" /> ℃</s:else>
					    </s:if>
					    <s:else></s:else>
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
			var layer_1 = document.getElementById("layer_1");
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
					<td width="450" height="25" class="MS05td" style="padding-left:15px"><strong><s:if test="image_nm==null">&nbsp;</s:if><s:else><s:property value="image_nm" /></s:else></strong></td>
					<td width="80" class="MS05td" style="padding-left:30px">센서위치</td>
					<td width="220" class="MS05td" style="padding-left:15px">
						X :<s:if test="sensor_x_loc==null">&nbsp;</s:if><s:else><s:property value="sensor_x_loc" /></s:else> &nbsp;
						Y :<s:if test="sensor_y_loc==null">&nbsp;</s:if><s:else><s:property value="sensor_y_loc" /></s:else>
						<input type="hidden" name="sensor_x_loc" value="${sensor_x_loc}"  />
						<input type="hidden" name="sensor_y_loc" value="${sensor_y_loc}" /> 
					</td>
				</tr>
				<tr>
					<td height="310" colspan="3" class="MS07td">
						<div align="center">
							<s:if test="image_path==null">&nbsp;</s:if>
							<s:else>
								<img name="img" src="../upload/<s:property value='image_path' />" height="300" style="cursor:crosshair;">
							</s:else>
						</div>
						<s:push value="rsSensorPosObj" >
							<div id="img_${sensor_id}" style="position:absolute; display:none;">
							<%
								String senTyp = request.getAttribute("sensor_type_cd").toString();
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
<%--						<div id="imglay" style="position:absolute; display:none;"><blink><img src="../images/sensor_G_01.gif" width="7" height="7" style="cursor:hand;"></blink></div>--%>
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
						<s:url id="listSensor" action="listSensor"></s:url>			                
						<s:a href="listSensor.do"><img src="../images/btn_list.gif" border="0"></s:a>
						<s:url id="editViewSensor" action="editViewSensor">
							<s:param name="sensor_id"      value="sensor_id" />
							<s:param name="struct_id"      value="struct_id" />
							<s:param name="channel_id"     value="channel_id" />
							<s:param name="detector_id"    value="detector_id" />
							<s:param name="sensor_type_cd" value="sensor_type_cd" />
							<s:param name="ref_sensor_id"  value="ref_sensor_id" />
						</s:url>
						<s:a href="%{editViewSensor}"><img src="../images/btn_modify.gif" border="0"></s:a>
						<s:a href="reActionSensor.do?sensor_id=%{sensor_id}"><img src="../images/btn_setup.gif" border="0"></s:a>
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
</script>

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
