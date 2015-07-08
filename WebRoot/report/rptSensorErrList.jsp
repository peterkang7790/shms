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
<link href="../css/themes/ui.all.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../script/jquery.js" ></script>
<script type="text/javascript" src="../script/ui/ui.datepicker.js"></script>
<script type="text/javascript" src="../script/ui/i18n/ui.datepicker-ko.js"></script>
<script type="text/javascript" src="../script/ComUtil.js" ></script>
<style type="text/css">
<!--
body { margin-left: 10px; margin-top: 10px; margin-right: 0px; margin-bottom: 0px;}
.style3 { color: #ffa72a; font-weight: bold; }
#floater {position:absolute; visibility:visible; }
-->
</style>
<script type="text/javascript">
$.datepicker.setDefaults({
    dateFormat: 'yy-mm-dd',
    buttonImageOnly: true,
    buttonText: "달력",
    buttonImage: "/ui/images/calendar.gif"
});
	function searchSensorErrList() {
		rptSensorErrList.method = "post";
		rptSensorErrList.target = "_self";
		rptSensorErrList.action = "rptSensorErrList.do";
		rptSensorErrList.submit();
	}
</script>
<script type="text/javascript">
	function searchTroubleList() {
		document.form1.trouble_id.value = "";
		
		rptTroubleList.method = "post";
		rptTroubleList.target = "_self";
		rptTroubleList.action = "rptTroubleList.do";
		rptTroubleList.submit();
	}

	function toPdf() {

		var global_fr  = $('#form1_fr_prod_dt').val();
		var global_to  = $('#form1_to_prod_dt').val();
		var arr_fr = '';
		var arr_to = '';
		if( global_fr == null || global_fr == undefined || global_fr == '' ) {
			alert("조회 시작일자를 입력해주세요");
			return false;
		}
		else
		{
			arr_fr = global_fr.split("-");
			if( arr_fr.length > 1 )
			{
				global_fr = arr_fr[0]+arr_fr[1]+arr_fr[2];
			}
		}
		
		if( global_to == null || global_to == undefined || global_to == '' ) {
			alert("조회 마지막 일자를 입력해주세요");
			return false;
		}
		else {

			arr_to = global_to.split("-");
			if( arr_to.length > 1 )
			{
				global_to = arr_to[0]+arr_to[1]+arr_to[2];
			}
		}
		
		var p_seneor_type_cd = $("#p_sensor_type_cd option:selected").val();
		var p_sensor_id = $("#p_sensor_id option:selected").val();
		var p_markingyn = $("#p_markingyn option:selected").val();
		
		MM_openBrWindow('../report/rptErrorPdf.do?fr_prod_dt='+global_fr+
				                                  '&to_prod_dt='+global_to+
				                                  '&p_sensor_type_cd='+p_seneor_type_cd+
				                                  '&p_sensor_id='+p_sensor_id+
				                                  '&p_markingyn='+p_markingyn,'','width=770,height=500, resizable=yes, scrollbars=no');
		
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

<s:form id="form1" namespace="/report" action="rptSensorErrList" theme="simple" method="get">

<table width="750" height="100%" border="0" cellpadding="0" cellspacing="0" background="../images/bg.gif">
<tr>
	<td valign="top">
		<table width="750" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td height="32" colspan="2" background="../images/title_bg.gif">
				<table width="740" border="0" cellspacing="0" cellpadding="0" style="padding:0px 0px 0px 5px;">
				<tr>
					<td width="20" valign="top"><img src="../images/point_title_01.gif" width="20" height="17"></td>
					<td width="270" class="title_01">장애현황 보고서</td>
					<td width="450" class="route"><div align="right">홈 &nbsp;&gt;&nbsp; 보고서 &nbsp;&gt;&nbsp; 장애현황</div></td>
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
					<td height="25" class="MS05td" width="110"><div align="center">조회기간</div></td>
					<td width="265" class="MS06td" style="padding-left:5px" colspan="3">
						<s:textfield cssClass="datepicker" name="fr_prod_dt" size="10" value="%{fr_prod_dt}" readonly="true" />
						&nbsp; ~ &nbsp;
						<s:textfield cssClass="datepicker" name="to_prod_dt" size="10" value="%{to_prod_dt}" readonly="true" />
					</td>
				</tr>
				<tr>
					<td width="110" height="25" class="MS05td"><div align="center">센서종류</div></td>
					<td width="265" class="MS06td" style="padding-left:5px">
						<s:select name="p_sensor_type_cd" id="p_sensor_type_cd" list="sensor_type_list" listKey="sensor_type_cd" listValue="sensor_type_nm" headerKey="" headerValue="선택" cssStyle="width:130px"></s:select>
					</td>
					<td width="110" class="MS05td"><div align="center">센서</div></td>
					<td width="265" class="MS06td" style="padding-left:5px">
						<table width="110" height="24" border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td width="57">
								<s:select name="p_sensor_id" id="p_sensor_id" list="sensor_list" listKey="sensor_id" listValue="sensor_nm" headerKey="" headerValue="선택" cssStyle="width:130px"></s:select>
							</td>
							<td width="53" align="left">
								<table>
								<tr>
									<td><s:a href="javascript:searchSensorErrList();"><img src="../images/btnS_search.gif" border="0"></s:a></td>
								</tr>
								</table>
							</td>
						</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td width="110" height="25" class="MS05td"><div align="center">보고서 출력</div></td>
					<td class="MS07td" colspan="3">&nbsp;&nbsp;<font color="#ee8067">장애 현황 보고서 PDF으로 출력</font>&nbsp;&nbsp;
						<input type="button" src="../images/btn_pdf.gif" value="PDF" onclick="javascript:toPdf();" />
					</td>
				</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td width="500" height="30">
				<table width="490" height="16" border="0" cellpadding="0" cellspacing="0" style="padding:10px 0px 0px 1px;">
				<tr>
					<td width="12" valign="middle"><img src="../images/point_title_02.gif" width="5" height="13"></td>
					<td width="478" class="title_02">장애현황 [<s:property value="resultCount" />건]</td>
				</tr>
				</table>
			</td>
			<td width="250" valign="top" style="padding:30px 0px 0px 200px;">
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
					<td width="80" align="center" class="MS05td">장애ID</td>
					<td width="90" align="center" class="MS05td">센서ID</td>
					<td width="100" align="center" class="MS05td">센서종류</td>
					<td width="140" align="center" class="MS05td">발생일시</td>
					<td width="110" align="center" class="MS05td">장애구분</td>
					<td width="70" align="center" class="MS05td">조치여부</td>
					<td width="140" align="center" class="MS05td">조치일자</td>
				</tr>

				<s:iterator value="rsRptSensorErrList" status="stat">
				<s:if test="rnum%2==0"> <% bg = "MSlist03td"; %> </s:if><s:else> <% bg = "MSlist02td"; %> </s:else>
				
				<tr>
					<td height="22" align="center" class="<%=bg%>"><s:if test="rnum==null">&nbsp;</s:if><s:else><s:property value="rnum" /></s:else></td>
					<td align="center" class="<%=bg%>">
						<s:if test="err_id==null">&nbsp;</s:if>
						<s:else>
							<s:a href="javascript:MM_openBrWindow('../report/rptSensorErrListPopup.do?err_id=%{err_id}','','width=770,height=500, resizable=yes, scrollbars=no');" title="센서보고서보기" onfocus="this.blur();" >
							<s:property value="err_id" />
							</s:a>
						</s:else>
					</td>
					<td align="left" class="<%=bg%>"><s:if test="sensor_id==null">&nbsp;</s:if>
						<s:else>
							<s:a href="javascript:MM_openBrWindow('../report/rptSensorErrListPopup.do?err_id=%{err_id}','','width=770,height=500, resizable=yes, scrollbars=no');" title="센서보고서보기" onfocus="this.blur();" >
							<s:property value="sensor_id" />
							</s:a>
						</s:else>
					</td>
					<td align="left" class="<%=bg%>"><s:if test="sensor_type_nm==null">&nbsp;</s:if><s:else><s:property value="sensor_type_nm" /></s:else></td>
					<td align="center" class="<%=bg%>"><s:if test="prod_dt==null">&nbsp;</s:if><s:else><s:property value="prod_dt" /></s:else></td>
					<td align="left" class="<%=bg%>"><s:if test="err_type_nm==null">&nbsp;</s:if><s:else><s:property value="err_type_nm" /></s:else></td>
					<td align="center" class="<%=bg%>"><s:if test="marking_yn==null">&nbsp;</s:if><s:else><s:property value="marking_yn" /></s:else></td>
					<td align="center" class="<%=bg%>"><s:if test="marking_dt==null">&nbsp;</s:if><s:else><s:property value="marking_dt" /></s:else></td>
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
		</s:if>
		
		</table>
	</td>
</tr>
</table>

</s:form>

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
