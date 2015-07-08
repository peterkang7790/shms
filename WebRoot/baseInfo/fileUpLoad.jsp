<%@ page language="java" import="java.util.*" pageEncoding="EUC-KR"  contentType="text/html; charset=euc-kr"%>
<%
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
String RootPath = request.getContextPath() + "/";
String ImgPath  = request.getContextPath() + "/images/";
%>



<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@taglib prefix="s" uri="/struts-tags" %>
<s:if test="#session.USER_ID==null">
	<s:include  value="../common/AccessDenied.jsp"></s:include>
</s:if>
<s:else>

<html>
<head>

<title>구조물건전성모니터링</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link href="<%=RootPath%>css/common01.css" rel="stylesheet" type="text/css">
<script  type="text/javascript" src="../script/jquery.js" ></script>
<script  type="text/javascript" src="../script/script.js" ></script>
<style type="text/css">
<!--
#floater {position:absolute; visibility:visible; }
-->
</style>
<script type="text/JavaScript">
function imageIdChk(obj){
    toUpper(obj);
	$('#agreeView').load('../baseInfo/imageIdChk.do', {image_id:obj.value});
	
}

function cancelAct (obj) 
{
     if( obj.form )
     {
		obj.reset();
	 }
}

function toUpper (obj) 
{
	obj.value = obj.value.toUpperCase(); 
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

<s:form theme="simple" namespace="/baseInfo" action="fileUpLoad" enctype="multipart/form-data" method="post">

<table width="750" height="100%" border="0" cellpadding="0" cellspacing="0" background="../images/bg.gif">
<tr>
	<td valign="top">
		<table width="750" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td height="32" background="<%=ImgPath%>title_bg.gif">
				<table width="740" border="0" cellspacing="0" cellpadding="0" style="padding:0px 0px 0px 5px;">
					<tr>
					<td width="20" valign="top"><img src="<%=ImgPath%>point_title_01.gif" width="20" height="17"></td>
					<td width="270" class="title_01">이미지 </td>
					<td width="450" class="route"><div align="right">홈&nbsp;&gt;&nbsp;기준정보&nbsp;&gt;&nbsp;이미지</div></td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td height="30" valign="top">
				<table width="740" height="16" border="0" cellpadding="0" cellspacing="0" style="padding:10px 0px 0px 1px;">
				<tr>
					<td width="12" valign="middle"><img src="<%=ImgPath%>point_title_02.gif" width="5" height="13"></td>
					<td width="682" class="title_02">이미지등록</td>
				</tr>
				</table>
			</td>
		</tr>
		</table>
		
		<table width="750" border="0" cellpadding="0" cellspacing="1" class="MSlinetd" >
		<tr>
			<td colspan="2" height="2" class="MS01td"></td>
		</tr>
		<tr>
			<td height="30" class="MS05td" style="padding-left:10px"><div align="left">이미지ID</div></td>
			<td class="MS06td" style="padding-left:5px">
				<input type="text" name="image_id" class="m_box" onblur="imageIdChk(this)" />
				<br>
				<span id="agreeView"></span>
			</td>
		</tr>
		<tr>	
			<td height="30" class="MS05td" style="padding-left:10px"><div align="left">이미지명 </div></td>
			<td class="MS07td" style="padding-left:5px">
				<input type="text" name="image_title" class="box" />
			</td>
		</tr>
		<tr>
			<td height="40" class="MS05td" style="padding-left:10px"><div align="left">파일</div></td>
			<td class="MS06td" style="padding-left:5px">
				 <s:file name="upload" cssStyle="width:500" />
				 <br/>
				 ※ 최대 업로드 용량은 10MB입니다.
			</td>
		</tr>
		<tr>
			<td  height="30" class="MS05td" style="padding-left:10px"><div align="left">구분</div>
			</td>
			<td class="MS07td" style="padding-left:5px">
				<s:select name="image_type_cd" id="sensor_image_type" list="sensor_image_type_list" listKey="image_type_cd" listValue="sensor_image_type_nm" headerKey="" headerValue="--이미지구분선택--" ></s:select>
			</td>
		</tr>
		<tr>
			<td  height="30" class="MS05td" style="padding-left:10px"><div align="left">PHOTO구분</div>
			</td>
			<td class="MS06td" style="padding-left:5px">
				<s:select name="phto_type_cd" id="phto_type_cd" list="phto_type_list" listKey="phto_type_cd" listValue="phto_type_nm" headerKey="" headerValue="--선택--" ></s:select>
			</td>
		</tr>
		<tr>	
			<td height="30" class="MS05td" style="padding-left:10px"><div align="left">실제사이즈</div>
			</td>
			<td class="MS07td" style="padding-left:5px">
				<input type="text" name="real_size" style="width:100" class="box" /> 
			</td>
		</tr>
		<tr>	
			<td height="30" class="MS05td" style="padding-left:10px"><div align="left">표시사이즈</div>
			</td>
			<td class="MS06td" style="padding-left:5px">
				<input type="text" name="disp_size" style="width:100" class="box" /> 
			</td>
		</tr>
	</table>

	</td>
</tr>
<tr><td height="20" colspan="2"></td></tr>
<tr>
  	<td align="ceneter" colspan="2">
		<table border="0" width="750">
		<tr>
			<td align="center">
				<s:submit type="image" src="../images/btn_save.gif"  ></s:submit>	 
				<s:if test="basecall==null">
					<s:a href="listImage.do" ><img src="../images/btn_list.gif" width="60" height="20" border="0" /></s:a>&nbsp;&nbsp;
				</s:if>
				<s:else>
					<s:a href="../baseInfo/listStruct.do" ><img src="../images/btn_list.gif" width="60" height="20" border="0" /></s:a>&nbsp;&nbsp;
				</s:else>               
			</td>
		</tr>
		</table>
	</td>
</tr>
</table>
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
