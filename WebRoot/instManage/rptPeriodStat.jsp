<%@ page language="java" import="java.util.*" pageEncoding="EUC-KR"%>
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
<META http-equiv="Page-Enter" content="blendTrans(Duration=0.0)"/>
<META http-equiv="Page-Exit" content="blendTrans(Duration=0.0)"/>
<head>
<title>SHMS</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link href="../css/common01.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../script/ComUtil.js" ></script>
<script type="text/javascript" src="../script/jquery.js" ></script>
<script type="text/javascript" src="../script/script.js" ></script>
<script language="JavaScript" src="../script/FusionCharts.js"></script>
<style type="text/css">
<!--
body { margin-left: 10px; margin-top: 10px; margin-right: 0px; margin-bottom: 0px;}
.style3 { color: #ffa72a; font-weight: bold; }
#floater {position:absolute; visibility:visible; }

.tdStyle { background-color:#FFDDDD; padding:10px; border:1px solid #ACB4F2; }
-->
</style>
<script type="text/javascript">

function informStr(temp){
		var htmlStr = "";

		if( temp == 'B' )
		{
			htmlStr = '<font size="1" color="#5061FC" ><marquee direction="left" scrollamount="8" width="300" behavior="slide" >*현재 시점 부터 1시간전 까지의 5분 통계입니다</marquee></font>';
			document.getElementById('informStr').innerHTML = htmlStr;
		}
		else if( temp == 'H' )
		{
			htmlStr = '<font size="1" color="#5061FC" ><marquee direction="left" scrollamount="8" width="300" behavior="slide" >*현재 시점 부터 1일전 까지의   1시간 통계입니다.</marquee></font>';
			document.getElementById('informStr').innerHTML = htmlStr;
		}
		else if( temp == 'D' )
		{
			htmlStr = '<font size="1" color="#5061FC" ><marquee direction="left" scrollamount="8" width="300" behavior="slide" >*현재 시점 부터 1달전 까지의 1일 통계입니다.</marquee></font>';
			document.getElementById('informStr').innerHTML = htmlStr;
		}
		else if( temp == 'M' )
		{
			htmlStr = '<font size="1" color="#5061FC" ><marquee direction="left" scrollamount="8" width="300" behavior="slide" >*현재 시점 부터 1년전 까지의 한달 통계입니다.</marquee></font>';
			document.getElementById('informStr').innerHTML = htmlStr;
		}
		else
		{
			document.getElementById('informStr').innerHTML = "";
		}
			
}		
	
	var myChart = new FusionCharts("../Charts/FCF_Candlestick.swf?ChartNoDataText=Please select above SELECT_ITEM", "myChartId", "750", "450");

	var xmlChartHeader = "";
	var xmlChartBottom = "</graph>";
	var xmlChartBody = "";
	var xmlChartData ="";
 
	var tmp_sensor_id, tmp_loc_nm, tmp_l_inst_range_lmt, tmp_h_inst_range_lmt, tmp_l_cri_lmt, tmp_h_cri_lmt, tmp_l_maj_lmt, tmp_h_maj_lmt, tmp_sensor_type_nm, tmp_ref_sensor_id, tmp_sensor_x_loc, tmp_sensor_y_loc, tmp_inst_item_nm, tmp_struct_comp_nm, tmp_unit;
	var tmp_c_h_inst_range_lmt, tmp_c_l_inst_range_lmt, tmp_c_base_value, tmp_sensor_type_cd;

	var tid;
	var global_sensor_id = '';
	var graphVail = 'sucess';
	var global_period_cd = '';

	function showGraph() {
		grobal_sensor_id = $("#sensor_id option:selected").val();
		global_period_cd  = $("#select1 option:selected").val();

		if (grobal_sensor_id == "")
		{
			alert("센서를 선택하여 주십시오");
			$("#select1 option:selected").focus();
			return false;
		}

		clearInterval(tid);
		var url = "sensor.do";
		var param = "sensor_id="+grobal_sensor_id;
		$.getJSON(url, param, function(resultJSon)
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
			tmp_sensor_x_loc = resultJSon.sensor_x_loc;
			tmp_sensor_y_loc = resultJSon.sensor_y_loc;
			tmp_inst_item_nm = resultJSon.inst_item_nm;
			tmp_struct_comp_nm = resultJSon.struct_comp_nm;
			tmp_unit = resultJSon.unit;

			// 차트에서 필요함
			tmp_c_h_inst_range_lmt = resultJSon.h_inst_range_lmt;
			tmp_c_l_inst_range_lmt = resultJSon.l_inst_range_lmt;
			tmp_c_base_value = resultJSon.base_value;
			tmp_sensor_type_cd = resultJSon.sensor_type_cd;

			setGraphSetHeader();
			setGraphSetBottom();
			updateChart();
			realTimeGraph();
		});
	}

	// 차트 링크 이벤트
	function showDetail(item)
	{
		var itemArr = item.split(",");
		itemDt = itemArr[0];
		openIt = itemArr[1];
		highIt = itemArr[2];
		lowIt  = itemArr[3];
		closIt = itemArr[4];
		
		if (global_period_cd == "B")
		{
			MM_openBrWindow( '../instManage/rptPeriodPop.do?Open='+openIt+'&High='+highIt+'&Close='+closIt+'&Low='+lowIt+'&itemDt='+itemDt+'&period_cd='+global_period_cd,'','width=450,height=250, resizable=yes, scrollbars=no');
		}
		else if (global_period_cd == "H")
		{
			MM_openBrWindow( '../instManage/rptPeriodPop.do?Open='+openIt+'&High='+highIt+'&Close='+closIt+'&Low='+lowIt+'&itemDt='+itemDt+'&period_cd='+global_period_cd,'','width=450,height=250, resizable=yes, scrollbars=no');
		}
		else if (global_period_cd == "D")
		{
			MM_openBrWindow( '../instManage/rptPeriodPop.do?Open='+openIt+'&High='+highIt+'&Close='+closIt+'&Low='+lowIt+'&itemDt='+itemDt+'&period_cd='+global_period_cd,'','width=450,height=250, resizable=yes, scrollbars=no');
		}
		else if (global_period_cd == "M")
		{
			MM_openBrWindow( '../instManage/rptPeriodPop.do?Open='+openIt+'&High='+highIt+'&Close='+closIt+'&Low='+lowIt+'&itemDt='+itemDt+'&period_cd='+global_period_cd,'','width=450,height=250, resizable=yes, scrollbars=no');
		}
	}

	function realTimeGraph() {
		tid = window.setInterval(updateChart, 30000);
	}

	function updateChart() {
		var url = "periodGraph.do";
		var param = "sensor_id="+tmp_sensor_id +"&period_cd="+ global_period_cd;
		var strDate, strOption, strTemp;
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
			strTemp = "<categories font='' fontSize='10' fontColor='' verticalLineColor='' verticalLineThickness='1' verticalLineAlpha='100'>";
			$.each(chartJSon.dt, function(idx, value){
				strDate = jQuery.trim(value[0]);
				strOption = " borderColor='0000FF' ";
				
				if (global_period_cd == "B")
				{
					strDate = strDate.substr(8,2) + ":" + strDate.substr(10,2);
				}
				else if (global_period_cd == "H")
				{
					strDate = strDate.substr(8,2) + ":" + strDate.substr(10,2);
				}
				else if (global_period_cd == "D")
				{
					strDate = strDate.substr(2,2) + ":" + strDate.substr(4,2) + ":" + strDate.substr(6,2);
				}
				else if (global_period_cd == "M")
				{
					strDate = strDate.substr(0,4) + "-" + strDate.substr(4,2);
				}
				if (eval(value[1]) == -1) value[1] = "-1.00001";
				if (eval(value[2]) == -1) value[2] = "-1.00001";
				if (eval(value[3]) == -1) value[3] = "-1.00001";
				if (eval(value[4]) == -1) value[4] = "-1.00001";
				if (eval(value[1]) == 0) value[1] = "0.00001";
				if (eval(value[2]) == 0) value[2] = "0.00001";
				if (eval(value[3]) == 0) value[3] = "0.00001";
				if (eval(value[4]) == 0) value[4] = "0.00001";

				if ((idx%2) == 0) strTemp += "<category Name='"+strDate+"' xIndex='"+(idx+1)+"' />";

				if (eval(value[2]) >= eval(jQuery.trim(tmp_h_maj_lmt))) strOption = " borderColor='FF9900' ";
				if (eval(value[2]) >= eval(jQuery.trim(tmp_h_cri_lmt))) strOption = " borderColor='FF0000' ";
				if (eval(value[3]) <= eval(jQuery.trim(tmp_l_maj_lmt))) strOption = " borderColor='FF9900' ";
				if (eval(value[3]) <= eval(jQuery.trim(tmp_l_cri_lmt))) strOption = " borderColor='FF0000' ";

				var itemArr = new Array(5);
				itemArr[0] = jQuery.trim(value[0]);
				itemArr[1] = jQuery.trim(value[1]);
				itemArr[2] = jQuery.trim(value[2]);
				itemArr[3] = jQuery.trim(value[3]);
				itemArr[4] = jQuery.trim(value[4]);
				xmlChartBody += "<set date='"+strDate+"' open='" + jQuery.trim(value[1]) + "' high='" + jQuery.trim(value[2]) + "' low='" + jQuery.trim(value[3]) + "' close='" + jQuery.trim(value[4]) + "' "+strOption+" link='javascript:showDetail(\""+itemArr+"\");' />";
			
			});
		
			strTemp += "</categories><data>";
			
			xmlChartData = xmlChartHeader + strTemp + xmlChartBody + xmlChartBottom;

			updateChartXML("myChartId",xmlChartData);
		});
	}

	/*
		센서에 맞는 차트 Header 설정
	*/
	function setGraphSetHeader(){

		var subCap ="센서 : "+tmp_sensor_id;
		var mainCap, strAxisName;
    	var unitVal = "";

		if (global_period_cd == "B")
		{
			mainCap = tmp_sensor_type_nm + "(5분)" + subCap ;
		}
		else if (global_period_cd == "H")
		{
			mainCap = tmp_sensor_type_nm + "(시간 )" + subCap;
		}
		else if (global_period_cd == "D")
		{
			mainCap = tmp_sensor_type_nm + "(일별) " + subCap;
		}
		else if (global_period_cd == "M")
		{
			mainCap = tmp_sensor_type_nm + "(월별 )" + subCap;
		}
		else
		{

		}

		var dp = 0;
		//그래프별 x축 범위를 나태 내줌
		if(tmp_sensor_type_cd == "1")
    	{
    		unitVal = "Nano Meter(nm)";	
	    	maxY = eval(tmp_h_cri_lmt) + (eval(tmp_h_cri_lmt)* (1/10.));
	    	minY = eval(tmp_l_cri_lmt) + (eval(tmp_l_cri_lmt)* (1/10.));
	    	dp = 0;

	    	
    	}
    	else if(tmp_sensor_type_cd ==  "2")
    	{
    		unitVal = "Angle";	
	    	maxY = eval(tmp_h_cri_lmt) + (eval(tmp_h_cri_lmt)* (1/10.));
	    	minY = eval(tmp_l_cri_lmt) + (eval(tmp_l_cri_lmt)* (1/10.));
	    	dp = 2;
    	}
    	else
    	{
    		unitVal = "Temperature(C)";
	    	maxY = eval(tmp_c_h_inst_range_lmt);
	    	minY = eval(tmp_c_l_inst_range_lmt);
	    	dp = 1;
    	}

		 mainCap = mainCap + ": (단위 = "+ unitVal + ")";
		 xmlChartHeader = "<graph caption='["+ mainCap +"]' baseFont='굴림' baseFontSize = '11' yAxisMinValue='"+ minY +"' yAxisMaxValue='"+ maxY +"' yAxisName='"+unitVal+"' decimalPrecision='"+dp+"' candleWidth='25' canvasBorderThickness='1' showNames='1' showAsBars='0' >";	
	
	}

		

	/*
		센서에 맞는 차트 Bottom 설정
	*/
	function setGraphSetBottom()
	{
    	//영점값
    	if(tmp_sensor_type_cd != "3")
    	{
    		xmlChartBottom = "</data> <trendlines> "
				 + " <line startValue='"+ jQuery.trim(tmp_h_cri_lmt) +"' thickness='2' color='#FF0000' displayValue='위험' showOnTop='0'/>"
				 + " <line startValue='"+ jQuery.trim(tmp_h_maj_lmt) +"' thickness='2' color='#FF9900' displayValue='경고' showOnTop='0'/>"
				 + " <line startValue='"+ jQuery.trim(tmp_l_cri_lmt) +"' thickness='2' color='#FF0000' displayValue='위험' showOnTop='0'/>"
				 + " <line startValue='"+ jQuery.trim(tmp_l_maj_lmt) +"' thickness='2' color='#FF9900' displayValue='경고' showOnTop='0'/>"
				 + " </trendlines></graph>";
    	}
    	else
    	{
    		xmlChartBottom = "</data> </graph>";
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

<table width="750" height="100%" border="0" cellpadding="0" cellspacing="0" background="../images/bg.gif">
<tr>
	<td valign="top">
		<table width="750" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td height="32" colspan="2" background="../images/title_bg.gif">
				<table width="740" border="0" cellspacing="0" cellpadding="0" style="padding:0px 0px 0px 5px;">
				<tr>
					<td width="20" valign="top"><img src="../images/point_title_01.gif" width="20" height="17"></td>
					<td width="270" class="title_01">주기별계측현황</td>
					<td width="450" class="route"><div align="right">홈 &nbsp;&gt;&nbsp; 계측현황 &nbsp;&gt;&nbsp; 주기별계측</div></td>
				</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td width="750" height="30" valign="top">
				<table width="490" height="16" border="0" cellpadding="0" cellspacing="0" style="padding:10px 0px 0px 1px;">
				<tr>
					<td width="12" valign="middle"><img src="../images/point_title_02.gif" width="5" height="13"></td>
					<td width="738" class="title_02">센서위치</td>
				</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td colspan="2"></td>
		</tr>
		<tr>
			<td colspan="2">

			<s:form id="foem1" namespace="/baseInfo" action="listDetector" theme="simple" method="get">
				<table width="750" border="0" cellpadding="0" cellspacing="1" class="MSlinetd">
				<tr>
					<td colspan="4" height="3" class="MS01td"></td>
				</tr>
				<tr>
					<td height="25" class="MS05td" width="110"><div align="center">주기</div></td>
					<td width="265" class="MS06td" style="padding-left:5px">
						<select id="select1" name="select1" class="box" id="select1" style="width:130px" onchange="informStr(this.value);">
							<option value="O">선택</option>
							<option value="B">5분</option>
							<option value="H">시</option>
							<option value="D">일</option>
							<option value="M">월</option>
						</select>
					</td>
					<td class="MS05td" width="110"><div align="center">센서</div></td>
					<td width="265" class="MS06td" style="padding-left:5px">&nbsp;&nbsp;&nbsp;
						<s:select name="sensor_id" id="sensor_id" list="sensor_id_list" listKey="sensor_id" listValue="sensor_id" headerKey="" headerValue="센서선택" cssStyle="width:130px"></s:select>
						<a href="#" onfocus="this.blur();">
							<img src="../images/btnS_search.gif" width="32" height="20" border="0" onclick="javascript:showGraph();" alt="센서검색" align="absmiddle"/>
						</a>
					</td>
				</tr>
				</table>
				
			</s:form>

			</td>
		</tr>
		</table>
		<table width="750" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td height="30" valign="top">
				<table width="750" height="16" border="0" cellpadding="0" cellspacing="0" style="padding:10px 0px 0px 1px;">
				<tr>
					<td width="12" valign="middle"><img src="../images/point_title_02.gif" width="5" height="13"></td>
					<td width="100" class="title_02">실시간그래프</td>
					<td id="informStr"></td>
				</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td><table width="750" border="0" cellspacing="1" bgcolor="#CCCCCC" cellpadding="2">
				<tr>
					<td height="2" class="MS01td"></td>
				</tr>
				<tr valign="top">
					<td class="MS06td" align="center">
						<div id="chartdiv" align="center"></div>
						<script type="text/javascript">
							xmlChartData = xmlChartHeader + xmlChartBody + xmlChartBottom;
							myChart.setDataXML(xmlChartData);
							myChart.addParam("WMode", "Transparent");
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
