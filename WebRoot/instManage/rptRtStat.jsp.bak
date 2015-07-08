<%@ page language="java" import="java.util.*" pageEncoding="EUC-KR"%>
<%@ page import="org.apache.struts2.ServletActionContext" %>
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
<script language="JavaScript" src="../script/FusionCharts.js"></script>
<script type="text/javascript" src="../script/common-user.js" ></script>
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
#tooltipShow   
        {   
            position: absolute;   
            background: #FDF8B3;   
            border: 1px solid #fcc;   
            padding: 3px;   
            width: 450px;  
            font-size: 11px; 
            color: #726CDD;
            font-family: "돋움"
        } 
-->
</style>
<script type="text/javascript">

jQuery(document).ready(function(){

	 var positionTooltip = function (event) {   
        //              alert("이벤트발생");   
        var tPosX = event.pageX - 5;   
        var tPosY = event.pageY + 15;   
        //              alert(tPosX +  "-" +  tPosY);   
        $('#tooltipShow').css({ top: tPosY, left: tPosX });   
    };   
       
    $('#tooltipShow').hide();   

    $('#tooltip').hover(function () {   
        $('#tooltipShow').show();   
    },   
    function () {   
        $('#tooltipShow').hide();   
    })   
    .mousemove(positionTooltip);  
    
	});	


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
	
	function init(x, y, nm) {

		x = x + 20;
		
		obj = document.form1.img;
		var intsen1x, intsen1y;
		var intImageX = GetObjectLeft(obj);
		var intImageY = GetObjectTop(obj);

		var ex_obj = document.getElementById(nm);
		ex_obj.style.left = intImageX + x - 3 + "px";
		ex_obj.style.top  = intImageY + y - 3 + "px";
		ex_obj.style.display = 'block';
	}

	var myChart = new FusionCharts("../Charts/FCF_Line.swf?ChartNoDataText=Please select a SENSOR above POHTO", "myChartId", "750", "400");

	var xmlChartHeader =   "<graph caption='SENSOR' subcaption='' " 
		                 + "lineColor='0000FF' xAxisName='Time[분:초]' yAxisName='Value' yAxisMinValue='-10' yAxisMaxValue='10' " 
		                 + "rotateNames='1' showLegend='1' legendPosition='BOTTOM' legendCaption='TIME[시분초]' legendMarkerCircle='0' legendBgColor='FFFFFF' "
		                 + "numdivlines='5'  showNames='1' decimalPrecision='0' formatNumberScale='0'  showValues='1000'	animation='0'	showAnchors='1' anchorRadius='1' >";
	var xmlChartBottom = "</graph>";
	var xmlChartBody = "${rsGraph}";
	var xmlChartData ="";

	var tid ="";
	var grobal_sensor_id = '';
	var tmp_sensor_id, 
	tmp_loc_nm, 
	tmp_l_inst_range_lmt, 
	tmp_h_inst_range_lmt, 
	tmp_l_cri_lmt, 
	tmp_h_cri_lmt, 
	tmp_l_maj_lmt, 
	tmp_h_maj_lmt, 
	tmp_sensor_type_nm, 
	tmp_ref_sensor_id,
	tmp_x_loc,
	tmp_y_loc,
	tmp_z_loc, 
//	tmp_sensor_x_loc, 
//	tmp_sensor_y_loc,
//	tmp_sensor_z_loc, 
	tmp_inst_item_nm, 
	tmp_struct_comp_nm, 
	tmp_unit;
	var tmp_h_inst_range_lmt, 
	tmp_l_inst_range_lmt, 
	tmp_base_value, 
	tmp_sensor_type_cd, 
	tmp_eigen_value;

	function sensor(sensor_id){
		grobal_sensor_id = sensor_id;

		clearInterval(tid);
		var url = "sensor.do";
		var param = "sensor_id="+sensor_id;
		jQuery.getJSON(url, param, function(resultJSon)
		{
			tmp_sensor_id = resultJSon.sensor_id;
			tmp_loc_nm = resultJSon.loc_nm;
			tmp_l_inst_range_lmt = resultJSon.l_inst_range_lmt;
			tmp_h_inst_range_lmt = resultJSon.h_inst_range_lmt;
			tmp_l_cri_lmt = resultJSon.l_cri_lmt;
			tmp_h_cri_lmt = resultJSon.h_cri_lmt;
			tmp_l_maj_lmt = resultJSon.l_maj_lmt;
			tmp_h_maj_lmt = resultJSon.h_maj_lmt;
			tmp_sensor_type_nm = resultJSon.sensor_type_nm;
			tmp_ref_sensor_id = resultJSon.ref_sensor_id;
//			tmp_sensor_x_loc = resultJSon.sensor_x_loc;
//			tmp_sensor_y_loc = resultJSon.sensor_y_loc;
//			tmp_sensor_z_loc = resultJSon.sensor_z_loc;
			tmp_x_loc = resultJSon.x_loc;
			tmp_y_loc = resultJSon.y_loc;
			tmp_z_loc = resultJSon.z_loc;
			tmp_inst_item_nm = resultJSon.inst_item_nm;
			tmp_struct_comp_nm = resultJSon.struct_comp_nm;
			tmp_unit = resultJSon.unit;
			tmp_eigen_value = resultJSon.eigen_value;

			// 차트에서 필요함
			tmp_h_inst_range_lmt = resultJSon.h_inst_range_lmt;
			tmp_l_inst_range_lmt = resultJSon.l_inst_range_lmt;
			tmp_base_value = resultJSon.base_value;
			tmp_sensor_type_cd = resultJSon.sensor_type_cd;

			jQuery("#rsSensor_sensor_id").html(tmp_sensor_id=="null"?"":tmp_sensor_id);
			jQuery("#rsSensor_loc_nm").html(tmp_loc_nm=="null"?"":tmp_loc_nm);
			jQuery("#rsSensor_inst_range_lmt").html((tmp_l_inst_range_lmt=="null"?"":tmp_l_inst_range_lmt)+(tmp_h_inst_range_lmt=="null"?"":" &nbsp;~&nbsp; "+tmp_h_inst_range_lmt));
			jQuery("#rsSensor_cri_lmt").html((tmp_l_cri_lmt=="null"?"":tmp_l_cri_lmt)+(tmp_h_cri_lmt=="null"?"":" &nbsp;~&nbsp; "+tmp_h_cri_lmt));
			jQuery("#rsSensor_maj_lmt").html((tmp_l_maj_lmt=="null"?"":tmp_l_maj_lmt)+(tmp_h_maj_lmt=="null"?"":" &nbsp;~&nbsp; "+tmp_h_maj_lmt));
			jQuery("#rsSensor_sensor_type_nm").html(tmp_sensor_type_nm=="null"?"":tmp_sensor_type_nm);
			jQuery("#rsSensor_ref_sensor_id").html(tmp_ref_sensor_id=="null"?"":tmp_ref_sensor_id);
			jQuery("#rsSensor_sensor_loc").html((tmp_x_loc=="null"?"":"X:"+tmp_x_loc)+(tmp_y_loc=="null"?"":" , Y:"+tmp_y_loc)+(tmp_z_loc=="null"?"":" , Z:"+tmp_z_loc));
//			jQuery("#rsSensor_sensor_loc").html((tmp_sensor_x_loc=="null"?"":"X:"+tmp_sensor_x_loc)+(tmp_sensor_y_loc=="null"?"":" , Y:"+tmp_sensor_y_loc));
			jQuery("#rsSensor_inst_item_nm").html(tmp_inst_item_nm=="null"?"":tmp_inst_item_nm);
			jQuery("#rsSensor_struct_comp_nm").html(tmp_struct_comp_nm=="null"?"":tmp_struct_comp_nm);
			jQuery("#rsSensor_unit").html(tmp_unit=="null"?"":tmp_unit);
			jQuery("#rsEigen_value").html(tmp_eigen_value=="null"?"":tmp_eigen_value);
			
			setGraphSetHeader();
			setGraphSetBottom();
			realTimeGraph();
		});
		//graph(sensor_id);
	}

	function realTimeGraph() {
		tid = window.setInterval('updateChart()', 1000);
	}

	function updateChart() {
		var url = "graph1.do";
		var param = "sensor_id="+tmp_sensor_id;
		var strTemp;

		$.getJSON(url, param, function(chartJSon)
		{
			if (chartJSon.dt =="")
			{
				alert("센서에 문제가 발생하였거나, 차트 데이터가 존재하지 않습니다\n\n관리자에게 문의하여 주십시오 ");
				xmlChartBody = "";
				xmlChartData = xmlChartHeader + xmlChartBody + xmlChartBottom;
				updateChartXML("myChartId",xmlChartData);
				clearInterval(tid);
				return;
			}
			xmlChartBody = "";
			$.each(chartJSon.dt, function(idx, value){
				strTemp = " showName='0' ";
				if (value[0].substr(6, 9) == "00")
				{
					strTemp = " showName='1' ";
				}

				xmlChartBody += "<set name='" + jQuery.trim(value[0]) + "' value='" + jQuery.trim(value[1]) + "' " + strTemp + "/>";
			});
			xmlChartData = xmlChartHeader + xmlChartBody + xmlChartBottom;
			updateChartXML("myChartId",xmlChartData);
		});
	}

	/*
		센서에 맞는 차트 Header 설정
	*/
	function setGraphSetHeader()
	{
		var subCap ="["+ tmp_sensor_type_nm + "센서 : "+tmp_sensor_id + "]";
    	var unitVal = "";
    	var minY, maxY;
    	var dp = 0;

    	if(tmp_sensor_type_cd == "1")
    	{
    		unitVal = "Micro Strain";	
	    	maxY = eval(tmp_h_cri_lmt) + (eval(tmp_h_cri_lmt)* (1/10.));
	    	minY = eval(tmp_l_cri_lmt) + (eval(tmp_l_cri_lmt)* (1/10.));
	    	de = 0;
    	}
    	else if(tmp_sensor_type_cd ==  "2")
    	{
    		unitVal = "Angle(deg)";	
	    	maxY = eval(tmp_h_cri_lmt) + (eval(tmp_h_cri_lmt)* (1/10.));
	    	minY = eval(tmp_l_cri_lmt) + (eval(tmp_l_cri_lmt)* (1/10.));
	    	dp = 2;
    	}
    	else
    	{
    		unitVal = "Temperature(C)";
	    	maxY = eval(tmp_h_inst_range_lmt);
	    	minY = eval(tmp_l_inst_range_lmt);
	    	dp = 1;
    	}
    	
		xmlChartHeader = "<graph caption='"+ subCap +"' baseFont='굴림' baseFontSize = '11' " 
							+ "lineColor='0000FF' xAxisName='Time[시:분:초]' yAxisName='"+unitVal+"' yAxisMinValue='"+ minY +"' yAxisMaxValue='"+ maxY +"' " 
							+ "numdivlines='5'  showNames='1' decimalPrecision='"+dp+"' formatNumberScale='0'  showValues='0' animation='0'	showAnchors='1' anchorRadius='1' >";

	}

	/*
		센서에 맞는 차트 Bottom 설정
	*/
	function setGraphSetBottom()
	{
    	//영점값
    	if(tmp_sensor_type_cd != "3")
    	{
    		xmlChartBottom = " <trendlines> "
				 + " <line startValue='"+ tmp_h_cri_lmt +"' thickness='2' color='#FF0000' displayValue='위험' showOnTop='0'/>"
				 + " <line startValue='"+ tmp_h_maj_lmt +"' thickness='2' color='#FF9900' displayValue='경고' showOnTop='0'/>"
				 + " <line startValue='"+ tmp_l_cri_lmt +"' thickness='2' color='#FF0000' displayValue='위험' showOnTop='0'/>"
				 + " <line startValue='"+ tmp_l_maj_lmt +"' thickness='2' color='#FF9900' displayValue='경고' showOnTop='0'/>"
				 + " </trendlines></graph>";
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
<div id="tooltipShow">*  아래 좌측의 구조물 상의  이미지를 클릭하시면 <br>*  우측에 선택된 센서 정보 가 보이며 하단에 실시간 그래프가 보여 집니다..</div>
<s:form id="form1" namespace="/instManage" action="rptRtStat" theme="simple" method="get">

<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" background="../images/bg.gif">
<tr>
	<td valign="top">
		<table width="750" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td colspan="2" height="32" background="../images/title_bg.gif">
				<table width="740" border="0" cellspacing="0" cellpadding="0" style="padding:0px 0px 0px 5px;">
				<tr>
					<td width="20" valign="top"><img src="../images/point_title_01.gif" width="20" height="17"></td>
					<td width="270" class="title_01"><span id="tooltip">실시간계측현황</span></td>
					<td width="450" class="route"><div align="right">홈 &nbsp;&gt;&nbsp; 계측현황 &nbsp;&gt;&nbsp; 실시간계측</div></td>
				</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td width="500" valign="top">
				<table width="490" height="16" border="0" cellpadding="0" cellspacing="0" style="padding:10px 0px 0px 1px;">
				<tr>
					<td width="12" valign="middle"><img src="../images/point_title_02.gif" width="5" height="13"></td>
					<td width="478" class="title_02">센서위치</td>
				</tr>
				</table>
			</td>
			<td width="240" valign="top" align="right">
				<table width="238" height="16" border="0" cellpadding="0" cellspacing="0" style="padding:5px 0px 0px 1px;">
				<tr>
					<td width="12" valign="middle"><img src="../images/point_title_02.gif" width="5" height="13"></td>
					<td width="226" class="title_02">센서정보</td>
				</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td valign="top">
				<table width="500" border="0" cellspacing="1" cellpadding="2">
				<tr>
					<td height="2" class="MS01td"></td>
				</tr>
				<tr>
					<td class="MS07td">
						<s:iterator value="rsSensorImage" status="stat">
						<%
								String imageW = request.getAttribute("image_type_cd")==null?"1":request.getAttribute("image_type_cd").toString();
								String imgW = "491";
								String imgH = "300";
								if( "2".equals(imageW) )
								{
									imgW = "250";
									imgH = "300";
								}
							
							%>
						<div align="center">
							<img name="img" src="../upload/<s:if test='image_path==null'>none.gif</s:if><s:else><s:property value='image_path' /></s:else>" width="<%=imgW %>" height="<%=imgH %>" style="cursor:crosshair;" />
						</div>
						</s:iterator>
					</td>
				</tr>
				<tr>
					  <td valign="top">
						  <table width="500" border="0" cellspacing="0" cellpadding="0">
				            <tr>
				              <td width="270" class="MS06td">
					              <table width="270" height="27" border="0" cellpadding="0" cellspacing="1" class="MS0linetd">
					                <tr>
					                  <td width="70" height="27" class="MS09td"><div align="center">센서종류</div></td>
					                  <td width="200" height="27" class="MS06td" style="padding-left:10px">
						                  <img src="../images/sensor_B_011.gif" width="7" height="7" border="0">&nbsp;변형율계 &nbsp; 
						                  <img src="../images/sensor_B_022.gif" width="7" height="7" border="0">&nbsp;각도계 &nbsp; 
						                  <img src="../images/sensor_B_033.gif" width="7" height="7" border="0">&nbsp;온도계
					                  </td>
					                </tr>
					              </table>
				              </td>
				              <td width="10" height="40">&nbsp;</td>
				              <td class="MS06td">
					              <table width="225" height="27" border="0" cellpadding="0" cellspacing="1" class="MS0linetd">
					                <tr>
					                  <td width="70" height="27" class="MS09td"><div align="center">경보등급</div></td>
					                  <td width="155" height="27" class="MS06td" style="padding-left:10px">
						                  <img src="../images/sensor_G_01.gif" width="7" height="7" border="0">&nbsp;안전 &nbsp; 
						                  <img src="../images/sensor_O_01.gif" width="7" height="7" border="0">&nbsp;경고 &nbsp;&nbsp;  
						                  <img src="../images/sensor_R_01.gif" width="7" height="7" border="0">&nbsp;위험&nbsp; &nbsp;
					                  </td>
					                </tr>
					              </table>
				              </td>
				            </tr>
				          </table>
			          </td>
			 	 	</tr>
				</table>
			</td>
			<td valign="top" align="right" style="padding:0px 0px 0px 1px;">
			<div id="rsSensor" >
				<table width="240" border="0" cellpadding="0" cellspacing="1" class="MSlinetd" >
					<tr>
						<td height="2" class="MS01td" colspan="2"></td>
					</tr>
					<tr>
						<td width="80" height="25" class="MS05td" style="padding-left:10px"><div align="left">센서ID</div></td>
						<td width="150" height="25" class="MS06td" style="padding-left:5px" id="rsSensor_sensor_id"></td>
					</tr>
					<tr>
						<td height="25" class="MS05td" style="padding-left:10px"><div align="left">센서종류</div></td>
						<td height="25" class="MS07td" style="padding-left:5px" id="rsSensor_sensor_type_nm"></td>
					</tr>
					<tr>
						<td height="25" class="MS05td" style="padding-left:10px"><div align="left">설치위치</div></td>
						<td height="25" class="MS07td" style="padding-left:5px" id="rsSensor_loc_nm"></td>
					</tr>
					<tr>
						<td height="25" class="MS05td" style="padding-left:10px"><div align="left">위치</div></td>
						<td height="25" class="MS07td" style="padding-left:5px" id="rsSensor_sensor_loc"></td>
					</tr>
					<tr>
						<td height="25" class="MS05td" style="padding-left:10px"><div align="left">계측범위</div></td>
						<td height="25" class="MS06td" style="padding-left:5px" id="rsSensor_inst_range_lmt"></td>
					</tr>
					<tr>
						<td height="25" class="MS05td" style="padding-left:10px"><div align="left">계측항목</div></td>
						<td height="25" class="MS06td" style="padding-left:5px" id="rsSensor_inst_item_nm"></td>
					</tr>
					<tr>
						<td height="25" class="MS05td" style="padding-left:10px"><div align="left">위험임계치</div></td>
						<td height="25" class="MS07td" style="padding-left:5px" id="rsSensor_cri_lmt"></td>
					</tr>
					<tr>
						<td height="25" class="MS05td" style="padding-left:10px"><div align="left">경고임계치</div></td>
						<td height="25" class="MS06td" style="padding-left:5px" id="rsSensor_maj_lmt"></td>
					</tr>
					<tr>
						<td height="25" class="MS05td" style="padding-left:10px"><div align="left">연계센서</div></td>
						<td height="25" class="MS06td" style="padding-left:5px" id="rsSensor_ref_sensor_id"></td>
					</tr>
					<tr>
						<td height="25" class="MS05td" style="padding-left:10px"><div align="left">구조물구성</div></td>
						<td height="25" class="MS07td" style="padding-left:5px" id="rsSensor_struct_comp_nm"></td>
					</tr>
					<tr>
						<td height="25" class="MS05td" style="padding-left:10px"><div align="left">기본값(영점)</div></td>
						<td height="25" class="MS06td" style="padding-left:5px" id="rsEigen_value"></td>
					</tr>
					<tr>
						<td height="25" class="MS05td" style="padding-left:10px"><div align="left">UNIT</div></td>
						<td height="25" class="MS07td" style="padding-left:5px" id="rsSensor_unit"></td>
					</tr>
					</table>
					<table>
					<tr>
					      <td height="1"></td>
					</tr>
					</table>
					<table height="27" border="0" cellpadding="0" cellspacing="0" class="MS0linetd" width="240">
						<tr>
			    		<td class="MS06td">
			              <table width="240" height="25" border="0" cellpadding="0" cellspacing="1" class="MS0linetd">
			                <tr>
			                  <td width="70" height="25" class="MS09td" ><div align="center">장애종류</div></td>
			                  <td width="155" height="25" class="MS06td" style="padding-left:10px">
				                  <img src="../images/sensor_error_01_1.gif" width="8" height="8" border="0">&nbsp;센서장애 &nbsp; 
				                  <img src="../images/sensor_error_02_1.gif" width="8" height="8" border="0">&nbsp;네트워크 &nbsp;  
				              </td>
			                </tr>
			              </table>
		              </td>
					</tr>
			      </table>
			</div>
			</td>
		</tr>
		</table>

		<table width="750" border="0" cellspacing="0" cellpadding="0" style="padding:0px 0px 0px 0px;">
		<tr>
			<td valign="top">
				<table width="750" border="0" cellpadding="0" cellspacing="0" style="padding:0px 0px 0px 0px;">
				<tr>
					<td width="12" valign="middle"><img src="../images/point_title_02.gif" width="5" height="13"></td>
					<td width="738" class="title_02">실시간그래프</td>
				</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td>
				<table width="750" border="0" cellspacing="0" bgcolor="#CCCCCC" cellpadding="0" style="padding:0px 0px 0px 0px;">
					<tr>
						<td height="2" class="MS01td"></td>
					</tr>
					<tr valign="top">
						<td class="MS06td" align="center">
							<div id="chartdiv" align="center">Senser</div>
							<script type="text/javascript">
								xmlChartData = xmlChartHeader + xmlChartBody + xmlChartBottom;
								myChart.setDataXML(xmlChartData); 
								myChart.render("chartdiv");	
							</script>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		</table>
	</td>
</tr>
</table>

<table><tr><td height="15"></td></tr></table>

<s:iterator value="rsSensorPos" status="stat">

<div id="img_${sensor_id}" style="position:absolute; display:none;">
	<s:a href="#" onclick="sensor('%{sensor_id}')">
		<s:if test="sensor_type_cd==null">&nbsp;</s:if>
		<s:else>
			<s:if test='sensor_type_cd=="1"'>
				<s:if test="trouble_class_cd!=null">
					<s:if test='trouble_class_cd=="1"'><% icon = "sensor_R_01.gif"; %></s:if>
					<s:elseif test='trouble_class_cd=="2"'><% icon = "sensor_O_01.gif"; %></s:elseif>
					<s:else>
					 	<s:if test='err_type_cd=="1"'>
					 		<% icon = "sensor_error_01_1.gif"; %>
					 	</s:if>
					 	<s:else>
					 		<% icon = "sensor_error_02_1.gif"; %>
					 	</s:else>
					</s:else>
				</s:if>
				<s:else>
					<s:if test='err_type_cd=="1"'>
					 		<% icon = "sensor_error_01_1.gif"; %>
					 	</s:if>
					 	<s:elseif test='err_type_cd=="2"'>
					 		<% icon = "sensor_error_02_1.gif"; %>
					 	</s:elseif>
					 	<s:else>
					 		<% icon = "sensor_G_01.gif"; %>
					 	</s:else>
				</s:else>
			</s:if>
			<s:elseif test='sensor_type_cd=="2"'>
				<% icon = "sensor_G_02.gif"; %>
				<s:if test="trouble_class_cd!=null">
					<s:if test='trouble_class_cd=="1"'><% icon = "sensor_R_02.gif"; %></s:if>
					<s:elseif test='trouble_class_cd=="2"'><% icon = "sensor_O_02.gif"; %></s:elseif>
					<s:else>
					 	<s:if test='err_type_cd=="1"'>
					 		<% icon = "sensor_error_01_1.gif"; %>
					 	</s:if>
					 	<s:else>
					 		<% icon = "sensor_error_02_1.gif"; %>
					 	</s:else>
					</s:else>
				</s:if>
				<s:else>
						<s:if test='err_type_cd=="1"'>
					 		<% icon = "sensor_error_01_1.gif"; %>
					 	</s:if>
					 	<s:elseif test='err_type_cd=="2"'>
					 		<% icon = "sensor_error_02_1.gif"; %>
					 	</s:elseif>
					 	<s:else>
					 		<% icon = "sensor_G_02.gif"; %>
					 	</s:else>
				</s:else>
			</s:elseif>
			<s:if test='sensor_type_cd=="3"'>
				<s:if test="trouble_class_cd!=null">
					<s:if test='trouble_class_cd=="1"'><% icon = "sensor_R_03.gif"; %></s:if>
					<s:elseif test='trouble_class_cd=="2"'><% icon = "sensor_O_03.gif"; %></s:elseif>
				</s:if>
				<s:else>
						<s:if test='err_type_cd=="1"'>
					 		<% icon = "sensor_error_01_1.gif"; %>
					 	</s:if>
					 	<s:elseif test='err_type_cd=="2"'>
					 		<% icon = "sensor_error_02_1.gif"; %>
					 	</s:elseif>
					 	<s:else>
					 		<% icon = "sensor_G_03.gif"; %>
					 	</s:else>
				</s:else>
			</s:if>
		</s:else> 
		<img src="../images/<%=icon%>" width="7" height="7" style="cursor:hand;" alt="${sensor_id}" border="0">
	</s:a>
</div>
<script type="text/javascript">
	var x = "${sensor_x_loc}".int();
	var y = "${sensor_y_loc}".int();

	init(x,y,"img_${sensor_id}");
	
</script>

</s:iterator>

</s:form>
<!-- div id=floater style="left:790; top:90; width:160; height:53; z-index:10" -->
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


