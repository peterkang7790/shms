<%@ page language="java" import="java.util.*" pageEncoding="EUC-KR"%>
<%@ page import="shms.pda.*" %>
<%@page import="com.lsware.utils.DateUtils"%>
<%
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
String aaa = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/";
String RootPath = request.getContextPath() + "/";
String ImgPath  = request.getContextPath() + "/images/";
String bg = "";
String icon = "sensor_G_01.gif";

%>

<%@taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
<title>SHMS</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link href="<%=RootPath%>css/common01.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../script/ComUtil.js" ></script>
<script type="text/javascript" src="../script/jquery.js" ></script>
<script type="text/javascript" src="../script/script.js" ></script>
<script language="JavaScript" src="../script/FusionCharts.js"></script>
<script type="text/javascript" src="../script/common-user.js" ></script>
<script type="text/javascript" src="../script/ajax.js" ></script>

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
     
	defVal();
	subLst();
	window.setInterval(subLst, 5000);
	});	

function defVal()
{
	var senId = "";
	var url = "subMainlst_def.do";
	var param = "";
	$.getJSON(url, param, function(resultJSon)
			{
				senId = resultJSon.sensor_id;

				sensor(senId);			
			});
/*	
	jQuery("#subMainlst_def").load(url, function(result, type) {
		if (type=="success") {
			if( result != null )
			{
				sensor(result);
			}
		} 
	});
*/	
}

function subLst()
{
	/*
	var tmp_rnum, 
		tmp_sensor_id, 
		tmp_loc_nm, 
		tmp_inst_item_nm, 
		tmp_sensor_type_nm, 
		tmp_base_value, 
		tmp_trouble_act_y_count, 
		tmp_trouble_act_n_count, 
		tmp_trouble_cri_count, 
		tmp_trouble_maj_count; 
	*/	
	
	var url = "subMainlst.do";
	
	jQuery("#subMainlst").load(url, function(result, type) {
		if (type=="success") {
			if( result != null )
			{
				jQuery("#subMainlst").html(result);
			}
		} else if (type=="error") {
			alert("센스정보 실행중 실패했습니다.");
		}
	});
/*
	$.getJSON(url, param, function(resultJSon)
		{
			tmp_rnum = resultJSon.rnum;
			tmp_sensor_id = resultJSon.sensor_id;
			tmp_loc_nm = resultJSon.loc_nm;
			tmp_inst_item_nm = resultJSon.inst_item_nm;
			tmp_sensor_type_nm = resultJSon.sensor_type_nm;
			tmp_base_value = resultJSon.base_value;
			tmp_trouble_act_y_count = resultJSon.trouble_act_y_count;
			tmp_trouble_act_n_count = resultJSon.trouble_act_n_count;
			tmp_trouble_cri_count = resultJSon.trouble_cri_count;
			tmp_trouble_maj_count = resultJSon.trouble_maj_count;
	
			jQuery("#subMainlst_rnum").html(tmp_rnum=="null"?"":tmp_rnum);
			jQuery("#subMainlst_sensor_id").html(tmp_sensor_id=="null"?"":tmp_sensor_id);
			jQuery("#subMainlst_loc_nm").html(tmp_loc_nm=="null"?"":tmp_loc_nm);
			jQuery("#subMainlst_inst_item_nm").html(tmp_inst_item_nm=="null"?"":tmp_inst_item_nm);
			jQuery("#subMainlst_sensor_type_nm").html((tmp_l_maj_lmt=="null"?"":tmp_l_maj_lmt)+(tmp_h_maj_lmt=="null"?"":" &nbsp;~&nbsp; "+tmp_h_maj_lmt));
			jQuery("#subMainlst_base_value").html(tmp_sensor_type_nm=="null"?"":tmp_sensor_type_nm);
			jQuery("#subMainlst_trouble_act_y_count").html(tmp_ref_sensor_id=="null"?"":tmp_ref_sensor_id);
			jQuery("#subMainlst_trouble_act_n_count").html((tmp_sensor_x_loc=="null"?"":"X:"+tmp_sensor_x_loc)+(tmp_sensor_y_loc=="null"?"":" , Y:"+tmp_sensor_y_loc));
			jQuery("#subMainlst_trouble_cri_count").html((trouble_cri_count>0"../pdaImages/text_risk.gif"?"":trouble_cri_count)+(tmp_h_cri_lmt=="null"?"":" &nbsp;~&nbsp; "+tmp_h_cri_lmt));
			jQuery("#subMainlst_trouble_maj_count").html(tmp_struct_comp_nm=="null"?"":tmp_struct_comp_nm);
		});
*/

<s:if test="trouble_cri_count>0"><img src="../pdaImages/text_risk.gif"/></s:if>
<s:elseif test="trouble_maj_count>0"><img src="../pdaImages/text_warning.gif"/></s:elseif>

	var url = "graphPoint.do";
	jQuery("#graphPoint").load(url, function(result, type) {
		if (type=="success") {
			if( result != null )
			{
				jQuery("#graphPoint").html(result);
			}
		} else if (type=="error") {
			alert("센스정보 실행중 실패했습니다.");
		}
	});

}
</script>
<script type="text/javascript">

//    function a(){
//    	new Ajax.PeriodicalUpdater('frame1','../common/subMain.do')	
//		window.document.frames["frame1"].location.reload();
//		setTimeout('a()', 3000);
//	}
	
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
	
	function init(x, y, nm)
	{		

		x = x + 20;
//        y = y - 10;
		obj = document.form1.img;
		var intsen1x, intsen1y;
		var intImageX = GetObjectLeft(obj);
		var intImageY = GetObjectTop(obj);

		var ex_obj = document.getElementById(nm);
		ex_obj.style.left = intImageX + x - 3 + "px";
		ex_obj.style.top  = intImageY + y - 3 + "px";
		ex_obj.style.display = 'block';
	}

	function doBlink() { 
		var blink = document.all.tags("BLINK") 
		for (var i=0; i < blink.length; i++) 
		blink[i].style.visibility = blink[i].style.visibility == "" ? "hidden" : "" 
	} 

	function startBlink() { 
		if (document.all) 
		setInterval("doBlink()",400)  //속도 
	}
	
	var tid ="";
	var grobal_sensor_id = '';
	function sensor(sensor_id){

		
		 
//		startBlink; 
		
		grobal_sensor_id = sensor_id;
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
			tmp_sensor_x_loc, 
			tmp_sensor_y_loc, 
			tmp_inst_item_nm, 
			tmp_struct_comp_nm, 
			tmp_unit,
			tmp_x_loc,
			tmp_y_loc,
			tmp_eigen_value,
			tmp_base_value,
			tmp_z_loc;
		var url = "sensor.do";
		var param = "sensor_id="+sensor_id;
/*
		jQuery("<div></div>").load(url, param, function(result, type) {
			if (type=="success") {
				if( result != null )
				{
					jQuery("#rsSensor").html(result);
				}
			} else if (type=="error") {
				alert("센스정보 실행중 실패했습니다.");
			}
		});
*/
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
			tmp_x_loc = resultJSon.x_loc;
			tmp_y_loc = resultJSon.y_loc;
			tmp_z_loc = resultJSon.z_loc;
			tmp_eigen_value = resultJSon.eigen_value;
			tmp_base_value = resultJSon.base_value;
			 
			

			jQuery("#rsSensor_sensor_id").html(tmp_sensor_id=="null"?"":tmp_sensor_id);
			jQuery("#rsSensor_loc_nm").html(tmp_loc_nm=="null"?"":tmp_loc_nm);
			jQuery("#rsSensor_inst_range_lmt").html((tmp_l_inst_range_lmt=="null"?"":tmp_l_inst_range_lmt)+(tmp_h_inst_range_lmt=="null"?"":" &nbsp;~&nbsp; "+tmp_h_inst_range_lmt));
			jQuery("#rsSensor_cri_lmt").html((tmp_l_cri_lmt=="null"?"":tmp_l_cri_lmt)+(tmp_h_cri_lmt=="null"?"":" &nbsp;~&nbsp; "+tmp_h_cri_lmt));
			jQuery("#rsSensor_maj_lmt").html((tmp_l_maj_lmt=="null"?"":tmp_l_maj_lmt)+(tmp_h_maj_lmt=="null"?"":" &nbsp;~&nbsp; "+tmp_h_maj_lmt));
			jQuery("#rsSensor_sensor_type_nm").html(tmp_sensor_type_nm=="null"?"":tmp_sensor_type_nm);
			jQuery("#rsSensor_ref_sensor_id").html(tmp_ref_sensor_id=="null"?"":tmp_ref_sensor_id);
			jQuery("#rsSensor_sensor_loc").html((tmp_x_loc=="null"?"":"X:"+tmp_x_loc)+(tmp_y_loc=="null"?"":" , Y:"+tmp_y_loc)+(tmp_z_loc=="null"?"":" , Z:"+tmp_z_loc));
			jQuery("#rsSensor_inst_item_nm").html(tmp_inst_item_nm=="null"?"":tmp_inst_item_nm);
			jQuery("#rsSensor_struct_comp_nm").html(tmp_struct_comp_nm=="null"?"":tmp_struct_comp_nm);
			jQuery("#rsSensor_unit").html(tmp_unit=="null"?"":tmp_unit);
			jQuery("#rsEigen_value").html(tmp_eigen_value=="null"?"":tmp_eigen_value);
			jQuery("#rsBase_value").html(tmp_base_value=="null"?"":tmp_base_value);
			
		});
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

<body >
<div id="tooltipShow">*  아래 좌측의 구조물 상의  이미지를 클릭하시면 <br>*  우측에 선택된 센서 정보 가 보입니다.</div>
<s:form id="form1" namespace="/common" action="mainView" theme="simple" method="get" >
<table width="750" height="100%" border="0" cellspacing="0" cellpadding="1" background="../../images/bg.gif" >
<tr>
	<td valign="top">
		<table width="750" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td colspan="2" height="32" background="../images/title_bg.gif">
				<table width="750" border="0" cellspacing="0" cellpadding="0" style="padding:0px 0px 0px 5px;">
				<tr>
					<td width="20" valign="top"><img src="../images/point_title_01.gif" width="20" height="17"></td>
					<td width="250" class="title_01"><span id="tooltip">구조물 현황 </span></td>
					<td width="470" class="route"><div align="right">홈 &nbsp;&gt;&nbsp; 계측현황 &nbsp;&gt;&nbsp; 실시간계측</div></td>
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
								<img name="img" src="../upload/<s:if test='image_path==null'>none.gif</s:if><s:else><s:property value='image_path' /></s:else>" width="<%=imgW %>" height="<%=imgH %>" />
							</div>
							</s:iterator>
						</td>
					</tr>
					<tr>
					  <td valign="top">
						  <table width="500" border="0" cellspacing="0" cellpadding="0">
				            <tr>
				              <td width="270" class="MS06td">
					              <table width="270" height="25" border="0" cellpadding="0" cellspacing="1" class="MS0linetd">
					                <tr>
					                  <td width="70" height="25" class="MS09td" ><div align="center">센서종류</div></td>
					                  <td width="200" height="25" class="MS06td" style="padding-left:10px">
						                  <img src="../images/sensor_B_011.gif" width="8" height="8" border="0">&nbsp;변형율계 &nbsp; 
						                  <img src="../images/sensor_B_022.gif" width="8" height="8" border="0">&nbsp;각도계 &nbsp; 
						                  <img src="../images/sensor_B_033.gif" width="8" height="8" border="0">&nbsp;온도계
					                  </td>
					                </tr>
					              </table>
				              </td>
				              <td width="10" height="40">&nbsp;</td>
				              <td class="MS06td">
					              <table width="225" height="25" border="0" cellpadding="0" cellspacing="1" class="MS0linetd">
					                <tr>
					                  <td width="70" height="25" class="MS09td" ><div align="center">경보등급</div></td>
					                  <td width="155" height="25" class="MS06td" style="padding-left:10px">
						                  <img src="../images/sensor_G_01.gif" width="8" height="8" border="0">&nbsp;안전 &nbsp; 
						                  <img src="../images/sensor_O_01.gif" width="8" height="8" border="0">&nbsp;경고 &nbsp;  
						                  <img src="../images/sensor_R_01.gif" width="8" height="8" border="0">&nbsp;위험&nbsp;
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
						<td height="25" class="MS06td" style="padding-left:5px" id="rsBase_value"></td>
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
<%--			    		<td width="12" valign="middle"><img src="../images/dtree/asterisk_yellow.png" width="10" height="12" align="absmiddle"></td>--%>
<%--						<td colspan="2" class="main_text" align="left" >센서정보 변경 : 좌측 PHOTO 센서 클릭</td>--%>
					</tr>
			    </table>
			</div>
		</td>
		</tr>
		</table>
		<div id="subMainlst" >
			<table width="750" border="0" cellspacing="1" bgcolor="#CCCCCC" cellpadding="2">
					<tr>
						<td colspan="9" height="2" class="MS01td"></td>
					</tr>
					<tr>
						<td width="20" height="25" align="center" class="MS05td">NO</td>
						<td width="100" align="center" class="MS05td">센서</td>
						<td width="90" align="center" class="MS05td">설치위치</td>
						<td width="100" align="center" class="MS05td">계측항목</td>
						<td width="90" align="center" class="MS05td">센서종류</td>
						<td width="100" align="center" class="MS05td">기본값</td>
						<td width="145" align="center" class="MS05td">조치</td>
						<td width="60" align="center" class="MS05td">상태</td>
					</tr>
			
					<s:iterator value="rsSenSensorList_Sensor" status="stat">
					<s:if test="rnum%2==0"> <% bg = "MSlist03td"; %> </s:if><s:else> <% bg = "MSlist02td"; %> </s:else>
					<s:if test="sensor_id == sel_sensor_id"><% bg = "MSlist04td"; %></s:if>
					
					<tr>
					 	<td height="22" align="center" class="<%=bg%>"><s:if test="rnum==null">&nbsp;</s:if><s:else><s:property value="rnum" /></s:else></td>
						<td align="left" class="<%=bg%>">
							<s:if test="sensor_id==null">&nbsp;</s:if>
							<s:else>
								<s:property value="sensor_id" />
							</s:else>
						</td>
						<td align="center" class="<%=bg%>"><s:if test="loc_nm==null">&nbsp;</s:if><s:else><s:property value="loc_nm" /></s:else></td>
						<td align="left" class="<%=bg%>"><s:if test="inst_item_nm==null">&nbsp;</s:if><s:else><s:property value="inst_item_nm" /></s:else></td>
						<td align="left" class="<%=bg%>"><s:if test="sensor_type_nm==null">&nbsp;</s:if><s:else><s:property value="sensor_type_nm" /></s:else></td>
						<td align="right" class="<%=bg%>"><s:if test="base_value==null">&nbsp;</s:if><s:else><s:property value="base_value" /></s:else></td>
						<td align="center" class="<%=bg%>">
							<s:if test="trouble_act_y_count==null">조치:0</s:if>
							<s:else> 
								<s:if test="trouble_act_y_count>0">
									<font color="blue">조치:<s:property value="trouble_act_y_count" /></font>
									<s:a href="javascript:MM_openBrWindow('troubleCancel.do?sensor_id=%{sensor_id}','','width=830,height=450,resizable=yes,scrollbars=yes');" title="조치리스트보기" onfocus="this.blur();">
										<img src="../images/help.bmp" border="0" style="cursor:hand;" title="조치리스트보기" align="absmiddle"/>
									</s:a>
								</s:if>
								<s:else>
									조치:<s:property value="trouble_act_y_count" />
								</s:else>
							</s:else> &nbsp;
							<s:if test="trouble_act_n_count==null">미조치:0</s:if>
							<s:else>
								<s:if test="trouble_act_n_count>0">
									<font color="red">미조치:<s:property value="trouble_act_n_count" /></font>
								</s:if>
								<s:else>
									미조치:<s:property value="trouble_act_n_count" />
								</s:else>
							</s:else>
						</td>
						<td align="center" class="<%=bg%>">
							<s:if test="trouble_cri_count>0"><img src="../pdaImages/text_risk.gif"/></s:if>
							<s:elseif test="trouble_maj_count>0"><img src="../pdaImages/text_warning.gif"/></s:elseif>
				    		<s:else><img src="../pdaImages/text_safe.gif"/></s:else>
						</td>
					</tr>
					</s:iterator>
			</table>
		</div>
   	</td>
</tr>   		
</table>
<div id="graphPoint"></div>
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
<div id="subMainlst_def" ></div>
</body>

</html>


