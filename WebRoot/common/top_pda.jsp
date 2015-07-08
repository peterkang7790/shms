<%@ page language="java" import="java.util.*" pageEncoding="EUC-KR"  contentType="text/html; charset=euc-kr"%>
<%
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
%>
<%@taglib prefix="s" uri="/struts-tags" %>
<html>
<head>

<title>SHMS</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link href="../css/common01.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../script/ComUtil.js" ></script>
<script type="text/javascript">
function gogo(str){
	str.style.background = 'blue'
	str.style.color = 'orange'
		
	}

	function gogo2(str){
	str.style.background = ''
	str.style.color = ''
	//str.style.color = 'rgb(0,255,255)'
	//str.style.color = '#ff0000'
	}
function moveMenu(url) {
//	top.frames["leftFrame"].location.href = "leftMenu.do?num=" + num;
	top.frames["mainFrame"].location.href = url;
}

function realtimeClock() {
		document.getElementById('rtcInput').innerHTML = "<font color='white'>"+getTimeStamp()+"</font>";
	    setTimeout("realtimeClock()", 1000);
	}


	function getTimeStamp() { // 24시간제
	  var d = new Date();

	  var s =
	    leadingZeros(d.getFullYear(), 4) + '년' +
	    leadingZeros(d.getMonth() + 1, 2) + '월' +
	    leadingZeros(d.getDate(), 2) + '일 ' +

	    leadingZeros(d.getHours(), 2) + ':' +
	    leadingZeros(d.getMinutes(), 2) + ':' +
	    leadingZeros(d.getSeconds(), 2);

	  return s;
	}


	function leadingZeros(n, digits) {
	  var zero = '';
	  n = n.toString();

	  if (n.length < digits) {
	    for (i = 0; i < digits - n.length; i++)
	      zero += '0';
	  }
	  return zero + n;
	}


</script>
</head>




<body leftmargin="0" topmargin="0" bgproperties="fixed" marginwidth="0" marginheight="0" onload="realtimeClock();">
<form name="form1">
<table width="100%" border="0" cellspacing="0" cellpadding="0" height="114">
<tr>
	<td height="78" valign="top" bgcolor="#3770b0">
		<table width="700" height="78" border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td width="400" height="78">
				<img src="../images/top_01.gif" width="433" height="78" border="0" usemap="#home_logo" align="absmiddle"/><br>
				<map name="home_logo">
<%--					<area shape="rect" coords="10,25,255,60" href="../pda/indexpda.jsp" target="_top"  alt="Go home" onfocus="this.blur();"/>--%>
				</map>
			</td>
			<td width="300" height="78"><img src="../images/top_02.gif" width="300" height="78" /></td>
		</tr>
		</table>
		<div id="timer" style="position:absolute; left:20px; top:57px; width:200; height:10; z-index:0;">
			<table border="0" cellpading="0" cellspacing="0" >
				<td id="rtcInput" style="font-size:11px">
				</td>
			</table>
		</div>
		
	</td>
</tr>
<tr>
	<td height="36" valign="top" background="../images/menu_bg.gif">
		<table width="750" height="36" border="0" cellpadding="0" cellspacing="0" style="margin:0px 0px 0px 10px;">
		<tr>
			<td width="130" class="dashboard" ><s:property value="%{#session.STRUCT_NM}"/></td>
			<td align="center" width="120">
				<a href="javascript:MM_openBrWindow('new_dashborad.do','','width=750,height=550, resizable=yes, scrollbars=no');" title="구조물종합현황" onfocus="this.blur();" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image10','','../images/btn_dashboard_o.gif',1)">
					<img src="../images/btn_dashboard_d.gif" name="Image10" width="76" height="18" border="0" alt="구조물 종합현황보기" align="absmiddle">
				</a>
			</td>
			<td width="20" ></td>
<%--			<td width="180" align="center" >--%>
<%--				<a href="javascript:moveMenu('<%=basePath %>common/mainViewPda.do');" onmouseout="gogo2(this)" onMouseOver="gogo(this);" ><font color="#FFFFFF" size='2'>구조물현황</font></a>--%>
<%--			</td>--%>
<%--			<td width="180" align="center">--%>
<%--				<a href="javascript:moveMenu('<%=basePath %>instManage/rptRtStat_pda.do');" onmouseout="gogo2(this)" onMouseOver="gogo(this);">--%>
<%--					<font color="#FFFFFF" size='2'>실시간차트</font>--%>
<%--				</a>--%>
<%--			</td>--%>
			<td width="180" align="center">
				<a href="javascript:moveMenu('<%=basePath %>sensorManage/senSensorList_pda.do');" onmouseout="gogo2(this)" onMouseOver="gogo(this);">
					<font color="#FFFFFF" size='2'>센서현황</font>
				</a>
			</td>
			<td width="180" align="center" >
				<a href="javascript:moveMenu('<%=basePath %>alarmManage/listTroublePda.do?pdaTyp=nopda');" onmouseout="gogo2(this)" onMouseOver="gogo(this);">
					<font color="#FFFFFF" size='2'>경보관리</font>
				</a>
			</td>
			<td width="180" align="center" >
				<a href="javascript:moveMenu('<%=basePath %>alarmManage/listSensorErrPda.do');" onmouseout="gogo2(this)" onMouseOver="gogo(this);">
					<font color="#FFFFFF" size='2'>장애관리</font>
				</a>
			</td>
			<td width="200" >
				<table width="200" border="0" cellspacing="0" cellpadding="0" style="margin:0px 0px 0px 30px;">
				<tr>
					<td width="150" align="right" class="admin_info"><font color="yellow"><s:property value="%{#session.USER_NM}"/></font>님 환영합니다</td>
					<td width="32">
					
						<a href="../logoutPda.do" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image10','','../images/btn_logout_o.gif',1)"  target="_top"> 
						<img src="../images/btn_logout_d.gif" name="Image10" width="32" height="11" border="0" alt="로그아웃처리">
						</a>
					</td>
					
				</tr>
				</table>
			</td>
		</tr>
		</table>
	</td>
</tr>
</table>
</form>
</body>
</html>
