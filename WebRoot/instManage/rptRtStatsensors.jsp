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
<script type="text/javascript" language="javascript">   
        $(document).ready(function () {   
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
           
    </script>  
<script type="text/javascript">
<!--
	var myChart1 = new FusionCharts("../Charts/FCF_MSLine.swf?ChartNoDataText=Please select a SENSOR above POHTO", "myChartId1", "350", "240");
	var myChart2 = new FusionCharts("../Charts/FCF_MSLine.swf?ChartNoDataText=Please select a SENSOR above POHTO", "myChartId2", "350", "240");
	var myChart3 = new FusionCharts("../Charts/FCF_MSLine.swf?ChartNoDataText=Please select a SENSOR above POHTO", "myChartId3", "350", "240");
	var myChart4 = new FusionCharts("../Charts/FCF_MSLine.swf?ChartNoDataText=Please select a SENSOR above POHTO", "myChartId4", "350", "240");

	var xmlChartHeader1, xmlChartHeader2, xmlChartHeader3, xmlChartHeader4;
	var xmlChartBottom = "</graph>";
	var xmlChartBody1 = xmlChartBody2 = xmlChartBody3 = xmlChartBody4 = "";
	var xmlChartData1 = xmlChartData2 = xmlChartData3 = xmlChartData4 = "";
	var xmlChartCate1 = xmlChartCate2 = xmlChartCate3 = xmlChartCate4 = "";
	var arrSearchSensors = arrSearchSensors1 = arrSearchSensors2 = "";
	var arrColor = ["#EC0427", "#0000CA", "#02A872", "#00110C"];
	var tid;
	

	xmlChartHeader1 = "<graph caption='변형율계' baseFont='굴림' baseFontSize = '11' " 
						+ "lineColor='0000FF' xAxisName='Time[시:분:초]' yAxisName='Micro Strain' " 
						+ "numdivlines='5' thickness='1' showNames='1' decimalPrecision='0' formatNumberScale='0'  showValues='0' animation='0'	showAnchors='1' anchorRadius='1' >";

	xmlChartHeader2 = "<graph caption='각도계' baseFont='굴림' baseFontSize = '11' " 
						+ "lineColor='0000FF' xAxisName='Time[시:분:초]' yAxisName='Angle' " 
						+ "numdivlines='5' thickness='1' showNames='1' decimalPrecision='2' formatNumberScale='0'  showValues='0' animation='0'	showAnchors='1' anchorRadius='1' >";

	xmlChartHeader3 = "<graph caption='변형율계' subcaption='[온도계]' baseFont='굴림' baseFontSize = '11' " 
						+ "lineColor='0000FF' xAxisName='Time[시:분:초]' yAxisName='Temperature' " 
						+ "numdivlines='5' thickness='1' showNames='1' decimalPrecision='1' formatNumberScale='0'  showValues='0' animation='0'	showAnchors='1' anchorRadius='1' >";

	xmlChartHeader4 = "<graph caption='각도계' subcaption='[온도계]' baseFont='굴림' baseFontSize = '11' " 
						+ "lineColor='0000FF' xAxisName='Time[시:분:초]' yAxisName='Temperature' " 
						+ "numdivlines='5' thickness='1' showNames='1' decimalPrecision='1' formatNumberScale='0'  showValues='0' animation='0'	showAnchors='1' anchorRadius='1' >";

	function showChart(){
		var tmpCnt1 = tmpCnt2 = 0;
		var tmpSensor1 = tmpSensor2 = "";
		xmlChartBody1 = xmlChartBody2 = xmlChartBody3 = xmlChartBody4 = "";
		xmlChartCate1 = xmlChartCate2 = xmlChartCate3 = xmlChartCate4 = "";

		$("input[name*=snr1_]").each(function()
		{
			if (this.checked)
			{
				tmpSensor1 += this.value + ",";
				if (this.name.indexOf("snr1_p_") >= 0) tmpCnt1++;
			}
		});
		$("input[name*=snr2_]").each(function()
		{
			if (this.checked)
			{
				tmpSensor2 += this.value + ",";
				if (this.name.indexOf("snr2_p_") >= 0) tmpCnt2++;
			}
		});
		if (tmpCnt1 > 3)
		{
			alert("변형율계 센서는 최대 3개까지 가능합니다.");
			return;
		}
		if (tmpCnt2 > 3)
		{
			alert("각도계 센서는 최대 3개까지 가능합니다.");
			return;
		}

		if ((tmpSensor1 + tmpSensor2) == "")
		{
			alert("센서를 선택하여 주십시요");
			xmlChartData1 = xmlChartHeader1 + xmlChartCate1 + xmlChartBody1 + xmlChartBottom;
			xmlChartData2 = xmlChartHeader2 + xmlChartCate2 + xmlChartBody2 + xmlChartBottom;
			xmlChartData3 = xmlChartHeader3 + xmlChartCate3 + xmlChartBody3 + xmlChartBottom;
			xmlChartData4 = xmlChartHeader4 + xmlChartCate4 + xmlChartBody4 + xmlChartBottom;
			updateChartXML("myChartId1",xmlChartData1);
			updateChartXML("myChartId2",xmlChartData2);
			updateChartXML("myChartId3",xmlChartData3);
			updateChartXML("myChartId4",xmlChartData4);
			clearInterval(tid);
			return;
		} 
		arrSearchSensors1 = tmpSensor1;
		arrSearchSensors2 = tmpSensor2;
		arrSearchSensors = (arrSearchSensors1 + arrSearchSensors2);
		if (arrSearchSensors.indexOf(",") > 0) arrSearchSensors = arrSearchSensors.substr(0, arrSearchSensors.lastIndexOf(","));

		clearInterval(tid);
		realTimeGraph();
	}

	function realTimeGraph() {
		tid = window.setInterval(updateChart, 1000);
	}

	function updateChart(){
		xmlChartBody1 = xmlChartBody2 = xmlChartBody3 = xmlChartBody4 = "";
		xmlChartCate1 = xmlChartCate2 = xmlChartCate3 = xmlChartCate4 = "";

		var url = "rptRtStatSensorsGraph.do";
		var param = "sensors_id="+arrSearchSensors;

		$.getJSON(url, param, function(chartJSon)
		{
			if (chartJSon.list =="")
			{
				alert("센서에 문제가 발생하였거나, 차트 데이터가 존재하지 않습니다\n\n관리자에게 문의하여 주십시오 ");
				xmlChartData1 = xmlChartHeader1 + xmlChartCate1 + xmlChartBody1 + xmlChartBottom;
				xmlChartData2 = xmlChartHeader2 + xmlChartCate2 + xmlChartBody2 + xmlChartBottom;
				xmlChartData3 = xmlChartHeader3 + xmlChartCate3 + xmlChartBody3 + xmlChartBottom;
				xmlChartData4 = xmlChartHeader4 + xmlChartCate4 + xmlChartBody4 + xmlChartBottom;
				updateChartXML("myChartId1",xmlChartData1);
				updateChartXML("myChartId2",xmlChartData2);
				updateChartXML("myChartId3",xmlChartData3);
				updateChartXML("myChartId4",xmlChartData4);
				clearInterval(tid);
				return;
			}

			$.each(chartJSon.list, function(idx, value){
				flgCategory = false;
				if (value.st == "1") // 변형율
				{
					xmlChartBody1 += "<dataset seriesName='"+value.sid+"' color='"+arrColor[idx%4]+"'>";

					if (xmlChartCate1 == "") flgCategory = true;
					if (flgCategory) xmlChartCate1 += "<categories>";

					for (i=0; i<value.dt.length; i++)
					{
						if (flgCategory)
						{ 
							if (value.dt[i].substr(5, 6)== "5" )
								xmlChartCate1 += "<category name='"+value.dt[i].substr(0, 2) + ":" + value.dt[i].substr(2, 2) + ":" + value.dt[i].substr(4, 2)+"' showName='1' />";
							else
								xmlChartCate1 += "<category name='"+value.dt[i].substr(0, 2) + ":" + value.dt[i].substr(2, 2) + ":" + value.dt[i].substr(4, 2)+"' showName='0' />";
						}
						if (eval(value.sv[i]) == -1) value.sv[i] = "-1.00001";
						if (eval(value.sv[i]) == 0) value.sv[i] = "0.00001";

						xmlChartBody1 += "<set value='" + jQuery.trim(value.sv[i]) + "' />";
					}
					xmlChartBody1 += "</dataset>";
					if (flgCategory) xmlChartCate1 += "</categories>";

				}
				else if (value.st == "2") // 각도
				{
					xmlChartBody2 += "<dataset seriesName='"+value.sid+"' color='"+arrColor[idx%4]+"'>";
					if (xmlChartCate2 == "") flgCategory = true;
					if (flgCategory) xmlChartCate2 = "<categories>";
					for (i=0; i<value.dt.length; i++)
					{
						if (flgCategory)
						{ 
							if (value.dt[i].substr(5, 6) == "5")
								xmlChartCate2 += "<category name='"+value.dt[i].substr(0, 2) + ":" + value.dt[i].substr(2, 2) + ":" + value.dt[i].substr(4, 2)+"' showName='1' />";
							else
								xmlChartCate2 += "<category name='"+value.dt[i].substr(0, 2) + ":" + value.dt[i].substr(2, 2) + ":" + value.dt[i].substr(4, 2)+"' showName='0' />";
						}
						if (eval(value.sv[i]) == -1) value.sv[i] = "-1.00001";
						if (eval(value.sv[i]) == 0) value.sv[i] = "0.00001";

						xmlChartBody2 += "<set value='" + jQuery.trim(value.sv[i]) + "' />";
					}
					xmlChartBody2 += "</dataset>";
					if (flgCategory) xmlChartCate2 += "</categories>";	
				} 
				else if (value.st == "3") // 온도
				{
					if (arrSearchSensors1.indexOf(value.sid) >= 0)
					{
						xmlChartBody3 = "<dataset seriesName='"+value.sid+"' color='"+arrColor[idx%4]+"'>";
						if (xmlChartCate3 == "") flgCategory = true;
						if (flgCategory) xmlChartCate3 = "<categories>";
					}
					if (arrSearchSensors2.indexOf(value.sid) >= 0)
					{
						xmlChartBody4 = "<dataset seriesName='"+value.sid+"' color='"+arrColor[idx%4]+"'>";
						if (xmlChartCate4 == "") flgCategory = true;
						if (flgCategory) xmlChartCate4 = "<categories>";
					}
					for (i=0; i<value.dt.length; i++)
					{
						if (eval(value.sv[i]) == -1) value.sv[i] = "-1.00001";
						if (eval(value.sv[i]) == 0) value.sv[i] = "0.00001";

						if (arrSearchSensors1.indexOf(value.sid) >= 0)
						{
							if (flgCategory)
							{ 
								if (value.dt[i].substr(5, 6) == "0")
									xmlChartCate3 += "<category name='"+value.dt[i].substr(0, 2) + ":" + value.dt[i].substr(2, 2) + ":" + value.dt[i].substr(4, 2)+"' showName='1' />";
								else
									xmlChartCate3 += "<category name='"+value.dt[i].substr(0, 2) + ":" + value.dt[i].substr(2, 2) + ":" + value.dt[i].substr(4, 2)+"' showName='0' />";
							}
							xmlChartBody3 += "<set value='" + jQuery.trim(value.sv[i]) + "' />";
						}
						if (arrSearchSensors2.indexOf(value.sid) >= 0)
						{
							if (flgCategory)
							{ 
								if (value.dt[i].substr(5, 6) == "0")
									xmlChartCate4 += "<category name='"+value.dt[i].substr(0, 2) + ":" + value.dt[i].substr(2, 2) + ":" + value.dt[i].substr(4, 2)+"' showName='1' />";
								else
									xmlChartCate4 += "<category name='"+value.dt[i].substr(0, 2) + ":" + value.dt[i].substr(2, 2) + ":" + value.dt[i].substr(4, 2)+"' showName='0' />";
							}
							xmlChartBody4 += "<set value='" + jQuery.trim(value.sv[i]) + "' />";
						}
					}
					if (arrSearchSensors1.indexOf(value.sid) >= 0)
					{
						xmlChartBody3 += "</dataset>";
						if (flgCategory) xmlChartCate3 += "</categories>";
					}	
					if (arrSearchSensors2.indexOf(value.sid) >= 0)
					{
						xmlChartBody4 += "</dataset>";
						if (flgCategory) xmlChartCate4 += "</categories>";
					}	
				} 
			});
			xmlChartData1 = xmlChartHeader1 + xmlChartCate1 + xmlChartBody1 + xmlChartBottom;
			xmlChartData2 = xmlChartHeader2 + xmlChartCate2 + xmlChartBody2 + xmlChartBottom;
			xmlChartData3 = xmlChartHeader3 + xmlChartCate3 + xmlChartBody3 + xmlChartBottom;
			xmlChartData4 = xmlChartHeader4 + xmlChartCate4 + xmlChartBody4 + xmlChartBottom;
			updateChartXML("myChartId1",xmlChartData1);
			updateChartXML("myChartId2",xmlChartData2);
			updateChartXML("myChartId3",xmlChartData3);
			updateChartXML("myChartId4",xmlChartData4);
		});
	}

	/*
		체크박스 전체 선택
	*/
	$(document).ready(function()
	{
		$("#snr1all").click(function()				
		{
			var checked_status = this.checked;
			$("input[name*=snr1_]").each(function()
			{
				this.checked = checked_status;
			});
		});
		$("#snr2all").click(function()				
		{
			var checked_status = this.checked;
			$("input[name*=snr2_]").each(function()
			{
				this.checked = checked_status;
			});
		});
		$("input[name*=snr1_p]").click(function()
		{
			var checked_status = this.checked;
			strItem = "snr1_ref_"+this.value;
			$("input[name='"+strItem+"']").each(function()
			{
				this.checked = checked_status;
			});
		});
		$("input[name*=snr2_p]").click(function()
		{
			var checked_status = this.checked;
			strItem = "snr2_ref_"+this.value;
			$("input[name='"+strItem+"']").each(function()
			{
				this.checked = checked_status;
			});
		});
		$("input[name*=snr1_ref]").click(function()
		{
			var checked_status = this.checked;

			strItem = "snr1_p_"+this.name.replace("snr1_ref_", "");
			flgCheck = true;
			$("input[name='"+strItem+"']").each(function()
			{
				if (!this.checked && checked_status)
				{
					if (confirm("연계센서를 보시려면 주센서를 선택하셔야 합니다.\n\n주센서를 함께 선택하시겠습니까?"))
					{
						this.checked = checked_status;
					} else
					{
						flgCheck = false;
					}
				}
			});
			if (!flgCheck) this.checked = flgCheck;
		});
		$("input[name*=snr2_ref_]").click(function()
		{
			var checked_status = this.checked;

			strItem = "snr2_p_"+this.name.replace("snr2_ref_", "");
			flgCheck = true;
			$("input[name='"+strItem+"']").each(function()
			{
				if (!this.checked && checked_status)
				{
					if (confirm("연계센서를 보시려면 주센서를 선택하셔야 합니다.\n\n주센서를 함께 선택하시겠습니까?"))
					{
						this.checked = checked_status;
					} else
					{
						flgCheck = false;
					}
				}
			});
			if (!flgCheck) this.checked = flgCheck;
		});
	});
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
<div id="tooltipShow">*  아래 센서를 선택하시고 우측 하단  센서선택 버튼을 클릭하여 주십시요<br>*  연계센서는 Default로 체크되어있으며 해제하면 연계센서의 그래프는 출력 않됩니다.</div>
  <table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" background="../../images/bg.gif">
    <tr>
      <td valign="top">
	  <table width="750" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="32" background="../images/title_bg.gif">
			  <table width="740" border="0" cellspacing="0" cellpadding="0" style="padding:0px 0px 0px 5px;">
	            <tr>
	              <td width="20" valign="top"><img src="../images/point_title_01.gif" width="20" height="17"></td>
	              <td width="270" class="title_01"><div><span id="tooltip">복합계측현황</span></div></td>
                  <td width="450" class="route"><div align="right">홈 &nbsp;&gt;&nbsp; 계측현황 &nbsp;&gt;&nbsp; 복합계측</div></td>
	            </tr>
	          </table>
          </td>
        </tr>
        <tr>
          <td height="9" valign="top">
		  <table width="750" border="0" cellspacing="0" cellpadding="0">
		  <s:form id="form1" namespace="/instManage" action="rptRtStatsensors" theme="simple" method="get">
            <tr>
              <td width="370" valign="top">
			  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="100%" height="10">
					<table width="220" height="10" border="0" cellpadding="0" cellspacing="0" style="padding:5px 0px 0px 1px;">
                        <tr>
                          <td width="12"><img src="../images/point_title_02.gif" width="5" height="13"> </td>
                          <td width="228" class="title_02">변형율계 리스트 </td>
                        </tr>
                    </table>
					</td>
                  </tr>
                  <tr>
                    <td valign="top">
                       
	                       <table width="349px" border="0" cellspacing="1" bgcolor="#CCCCCC" cellpadding="2">
		                        <tr>
		                          <td colspan="4" height="2" class="MS01td"></td>
		                        </tr>
		                        <tr>
		                          <td width="20px" align="center" class="MS05td"><input type="checkbox" id="snr1all" onfocus="this.blur();" /></td>
		                          <td width="111px" align="center" class="MS05td">센서 ID</td>
		                          <td width="107px" align="center" class="MS05td">위치 </td>
		                          <td width="110px" align="center" class="MS05td">연계센서</td>
		                        </tr>
	                        </table>
	                        <div id="snr1_div" style="overflow:auto; width:370px; height:200px; ">
	                        <table width="350px" border="0" cellspacing="1" bgcolor="#CCCCCC" cellpadding="2">
		                      <s:iterator value="sensors_list" status="stat1">
	                          <s:if test="sensor_type_cd == 1">
	                            <tr>
	                              <td width="20px" align="left" class="MSlist02td"><input type="checkbox" name="snr1_p_<s:property value="sensor_id" />" value="<s:property value="sensor_id" />"/></td>
	                              <td width="110px" align="left" class="MSlist02td"><s:property value="sensor_id" /></td>
	                              <td width="107px" align="center" class="MSlist02td"><s:if test="loc_nm==null">&nbsp;</s:if><s:else><s:property value="loc_nm" /></s:else></td>
	                              <td width="110px" align="left" class="MSlist02td">
	                              	<s:if test="ref_sensor_id==null">&nbsp;</s:if>
	                              	<s:else>
	                              		<input type="checkbox" name="snr1_ref_<s:property value="sensor_id" />" value="<s:property value="ref_sensor_id" />"/>
	                              			<s:property value="ref_sensor_id" />
	                              	</s:else>
	                              </td>
	                            </tr>
	                            </s:if>
	                          </s:iterator>
                           </table>
                          </div>
                     	</td>
                  </tr>
              </table>
    		  </td>
              <td width="10">
			  </td>
              <td width="370" valign="top">
			  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="100%" height="10">
					<table width="220px" height="10" border="0" cellpadding="0" cellspacing="0" style="padding:5px 0px 0px 1px;">
                        <tr>
                          <td width="12px"><img src="../images/point_title_02.gif" width="5" height="13"> </td>
                          <td width="228px" class="title_02">각도계 리스트 </td>
                        </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td valign="top">
                       <table width="349px" border="0" cellspacing="1" bgcolor="#CCCCCC" cellpadding="2">
	                        <tr>
	                          <td colspan="4" height="2" class="MS01td"></td>
	                        </tr>
	                        <tr>
	                          <td width="20px" align="center" class="MS05td"><input type="checkbox" id="snr2all" onfocus="this.blur();" /></td>
	                          <td width="111px" align="center" class="MS05td">센서 ID</td>
	                          <td width="107px" align="center" class="MS05td">위치 </td>
	                          <td width="110px" align="center" class="MS05td">연계센서</td>
	                        </tr>
	                      </table>
	                      <div id="snr2_div" style="overflow:auto; width:370px; height:200px; ">
	                      <table width="350px" border="0" cellspacing="1" bgcolor="#CCCCCC" cellpadding="2">  
                          <s:iterator value="sensors_list" status="stat2" >
                          	<s:if test="sensor_type_cd == 2">
                            <tr>
                              <td width="20px" align="left" class="MSlist02td"><input type="checkbox" name="snr2_p_<s:property value="sensor_id" />" value="<s:property value="sensor_id" />"/></td>
                              <td width="110px" align="left" class="MSlist02td"><s:property value="sensor_id" /></td>
                              <td width="107px" align="center" class="MSlist02td"><s:if test="loc_nm==null">&nbsp;</s:if><s:else><s:property value="loc_nm" /></s:else></td>
                              <td width="110px" align="left" class="MSlist02td"><s:if test="ref_sensor_id==null">&nbsp;</s:if><s:else><input type="checkbox" name="snr2_ref_<s:property value="sensor_id" />" value="<s:property value="ref_sensor_id" />"/><s:property value="ref_sensor_id" /></s:else></td>
                            </tr>
                            </s:if>
                          </s:iterator>
                          </table>
                        </div>
                        </td>
                  </tr>
              </table>
              </td>
            </tr>
            </s:form>
          </table>
          </td>
        </tr>
        <tr>
        	<td align="right" valign="top" style="padding-top:10px">
		          <s:a href="javascript:showChart();" onfocus="this.blur();">
						<img src="../images/btn_sensor_sel.gif" width="81" height="20" border="0" align="absmiddle">
				  </s:a>
			</td> 
        </tr>
        <tr>
          <td>
          <table width="750" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="350" valign="top">
			  <table width="350" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td height="30">
				  <table width="220" height="16" border="0" cellpadding="0" cellspacing="0" style="padding:5px 0px 0px 1px;">
                      <tr>
                        <td width="12"><img src="../images/point_title_02.gif" width="5" height="13"> 
						</td>
                        <td width="228" class="title_02">변형율계
						</td>
                      </tr>
                  </table></td>
                </tr>
                <tr>
                  <td valign="top">
				  <table width="350" border="0" cellspacing="1" bgcolor="#CCCCCC" cellpadding="2">
                      <tr>
                        <td height="2" class="MS01td"></td>
                      </tr>
                      <tr>
                        <td height="240" align="center" class="MS07td">
							<div id="chartdiv1" align="center">Senser</div>
							<script type="text/javascript">
								xmlChartData1 = xmlChartHeader1 + xmlChartCate1 + xmlChartBody1 + xmlChartBottom;
								myChart1.setDataXML(xmlChartData1); 
								myChart1.render("chartdiv1");	
							</script>
							<!-- textarea name="charttext"></textarea-->
						</td>
                        </tr>
                  </table></td>
                </tr>
              </table></td>
              <td width="50"></td>
              <td width="350">
			  <table width="350" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td height="30">
				  <table width="220" height="16" border="0" cellpadding="0" cellspacing="0" style="padding:5px 0px 0px 1px;">
                    <tr>
                      <td width="12"><img src="../images/point_title_02.gif" width="5" height="13">
					   </td>
                      <td width="228" class="title_02">각도계
					  </td>
                    </tr>
                  </table></td>
                </tr>
                <tr>
                  <td valign="top">
				  <table width="350" border="0" cellspacing="1" bgcolor="#CCCCCC" cellpadding="2">
                      <tr>
                        <td height="2" class="MS01td">
						</td>
                      </tr>
                      <tr>
                        <td height="240" align="center" class="MS07td">
							<div id="chartdiv2" align="center">Senser</div>
							<script type="text/javascript">
								xmlChartData2 = xmlChartHeader2 + xmlChartCate2 + xmlChartBody2 + xmlChartBottom;
								myChart2.setDataXML(xmlChartData2); 
								myChart2.render("chartdiv2");	
							</script>
						</td>
                      </tr>
                  </table></td>
                </tr>
              </table></td>
            </tr>
          </table></td>
        </tr>
        <tr>
          <td height="30">&nbsp;</td>
        </tr>
        <tr>
          <td><table width="750" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="350" valign="top">
			  <table width="350" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td height="10">
					<table width="220" height="10" border="0" cellpadding="0" cellspacing="0" style="padding:5px 0px 0px 1px;">
                        <tr>
                          <td width="12"><img src="../images/point_title_02.gif" width="5" height="13"> 
						  </td>
                          <td width="228" class="title_02">온도계</td>
                        </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td valign="top"><table width="350" border="0" cellspacing="1" bgcolor="#CCCCCC" cellpadding="2">
                        <tr>
                          <td height="2" class="MS01td"></td>
                        </tr>
                        <tr>
                          <td height="240" align="center" class="MS07td">
							<div id="chartdiv3" align="center">Senser</div>
							<script type="text/javascript">
								xmlChartData3 = xmlChartHeader3 + xmlChartCate3 + xmlChartBody3 + xmlChartBottom;
								myChart3.setDataXML(xmlChartData3); 
								myChart3.render("chartdiv3");	
							</script>
                          </td>
                        </tr>
                    </table></td>
                  </tr>
              </table></td>
              <td width="50">&nbsp;</td>
              <td width="350">
			  <table width="350" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td height="10">
					<table width="220" height="10" border="0" cellpadding="0" cellspacing="0" style="padding:5px 0px 0px 1px;">
                        <tr>
                          <td width="12"><img src="../images/point_title_02.gif" width="5" height="13"> 
						  </td>
                          <td width="228" class="title_02">온도계</td>
                        </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td valign="top">
					<table width="350" border="0" cellspacing="1" bgcolor="#CCCCCC" cellpadding="2">
                        <tr>
                          <td height="2" class="MS01td">
						  </td>
                        </tr>
                        <tr>
                          <td height="240" align="center" class="MS07td">
							<div id="chartdiv4" align="center">Senser</div>
							<script type="text/javascript">
								xmlChartData4 = xmlChartHeader4 + xmlChartCate4 + xmlChartBody4 + xmlChartBottom;
								myChart4.setDataXML(xmlChartData4); 
								myChart4.render("chartdiv4");		
							</script>
						  </td>
                        </tr>
                    </table></td>
                  </tr>
              </table></td>
            </tr>
          </table></td>
        </tr>
        <tr>
        </tr>
        <tr>
          <td><table width="750" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td height="20"></td>
            </tr>
          </table></td>
        </tr>
      </table>
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