<%@ page language="java" import="java.util.*" pageEncoding="EUC-KR"  contentType="text/html; charset=euc-kr"%>
<%
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
String usedClassCd = request.getSession().getAttribute("USED_CLASS_CD")==null?"2":request.getSession().getAttribute("USED_CLASS_CD").toString();
String adminS = request.getSession().getAttribute("SUPER_ADMIN_YN")==null?"2":request.getSession().getAttribute("SUPER_ADMIN_YN").toString();
String wdth1 = "";
String wdth2 = "120";
if( "2".equals(usedClassCd) )
{
	wdth1 = "190";
	
}
else
{
	if( "1".equals(adminS) )
	{
		wdth1 = "300";
		
	}
	else
	{
		wdth1 = "200";
		wdth2 = "0";
	}
	
}

%>
<%@taglib prefix="s" uri="/struts-tags" %>

<html>
<head>

<title>SHMS</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link href="../css/common01.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../script/ComUtil.js" ></script>
<script type="text/javascript">
function moveLeftMenu(num,url) {
	top.frames["leftFrame"].location.href = "leftMenu.do?num=" + num;
	top.frames["mainFrame"].location.href = url;
}

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

function errMag()
{
	alert("접근 허용이 않되는 권한입니다. ");
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
		<table width="1049" height="78" border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td width="433" height="78">
				<img src="../images/top_01.gif" width="433" height="78" border="0" usemap="#home_logo" align="absmiddle"/><br>
				<map name="home_logo">
				<area shape="rect" coords="10,25,255,60" href="../index.jsp" target="_top"  alt="Go home" onfocus="this.blur();"/>
				</map>
			</td>
			<td width="616" height="78"><img src="../images/top_02.gif" width="616" height="78" /></td>
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
		<table width="1054" height="36" border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td width="205" background="../images/menu_00.gif">
				<table width="150" border="0" cellspacing="0" cellpadding="0" style="margin:0px 0px 0px 20px;">
				<tr>
					<td width="118" class="admin_info"><font color="yellow"><s:property value="%{#session.USER_NM}"/></font>님 환영합니다</td>
					<td width="32">
						<a href="../logout.do" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image10','','../images/btn_logout_o.gif',1)"  target="_top"> 
						<img src="../images/btn_logout_d.gif" name="Image10" width="32" height="11" border="0">
						</a>
					</td>
				</tr>
				</table>
			</td>
			<td width="100">
				<a href="javascript:moveLeftMenu(2000,'<%=basePath %>instManage/rptRtStat.do');" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image3','','../images/menu_01o.gif',1)" onfocus="this.blur();">
					<img src="../images/menu_01x.gif" name="Image3" width="105" height="36" border="0" id="Image3"  />
				</a>
			</td>
			<td width="100">
				<a href="javascript:moveLeftMenu(3000,'<%=basePath %>sensorManage/senSensorList.do');" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image4','','../images/menu_02o.gif',1)" onfocus="this.blur();">
					<img src="../images/menu_02x.gif" name="Image4" width="122" height="36" border="0" id="Image4" />
				</a>
			</td>
			<td width="100">
				<a href="javascript:moveLeftMenu(4000,'<%=basePath %>alarmManage/listTrouble.do');") onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image5','','../images/menu_03o.gif',1)" onfocus="this.blur();">
					<img src="../images/menu_03x.gif" name="Image5" width="120" height="36" border="0" id="Image5" />
				</a>
			</td>
			<td width="98">
				<a href="javascript:moveLeftMenu(5000,'<%=basePath %>statManage/statTrouble.do');"  onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image6','','../images/menu_04o.gif',1)" onfocus="this.blur();">
					<img src="../images/menu_04x.gif" name="Image6" width="98" height="36" border="0" id="Image6" />
				</a>
			</td>
			<td width="100">
				<a href="javascript:moveLeftMenu(6000,'<%=basePath %>report/rptTroubleList.do');" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image7','','../images/menu_05o.gif',1)" onfocus="this.blur();">
					<img src="../images/menu_05x.gif" name="Image7" width="110" height="36" border="0" id="Image7" />
				</a>
			</td>
			<s:if test="#session.USED_CLASS_CD==1">
				<td width="100">
				<s:if test="#session.USED_CLASS_CD==1">
					<a href="javascript:moveLeftMenu(1000,'<%=basePath %>baseInfo/detailStruct.do');" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image8','','../images/menu_06o.gif',1)" onfocus="this.blur();">
						<img src="../images/menu_06x.gif" name="Image8" width="110" height="36" border="0" id="Image8" />
					</a>
				</s:if>
			</td>
			<td width='<%=wdth2 %>'>
				<s:if test="#session.USED_CLASS_CD==1">
					<s:if test="#session.SUPER_ADMIN_YN==1">
					<a href="javascript:moveLeftMenu(7000,'<%=basePath %>admin/listUser.do');" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image9','','../images/menu_07o.gif',1)" onfocus="this.blur();">
						<img src="../images/menu_07x.gif" name="Image9" width="124" height="36" border="0" id="Image9"  />
					</a>
					</s:if>
				</s:if>
				
			</td>
			</s:if>
			
			<td width="71">
				<s:if test="#session.USED_CLASS_CD==2">
					<a href="javascript:MM_openBrWindow('../images/help/powerUser_1.pdf','','width=800,height=600, resizable=yes, scrollbars=no');" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image11','','../images/menu_08o.gif',1)" onfocus="this.blur();" title="도움말기능">
						<img src="../images/menu_08.gif" name="Image11" width="120" height="36" border="0" id="Image11"  />
					</a>
				</s:if>
				<s:else>
					<a href="javascript:MM_openBrWindow('../images/help/powerUser.pdf','','width=800,height=600, resizable=yes, scrollbars=no');" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image11','','../images/menu_08o.gif',1)" onfocus="this.blur();" title="도움말기능">
						<img src="../images/menu_08.gif" name="Image11" width="120" height="36" border="0" id="Image11"  />
					</a>
				</s:else>
			</td>
			
			<td width='<%=wdth1 %>' background="../images/menu_000.gif"></td>
		</tr>
	
		</table>
	</td>
</tr>
</table>
</form>
</body>
</html>
