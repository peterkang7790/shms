<%@ page language="java" import="java.util.*" pageEncoding="EUC-KR"  contentType="text/html; charset=euc-kr"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="shms.service.Thumbnail" %>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
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

<title>SHMS</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link href="<%=RootPath%>css/common01.css" rel="stylesheet" type="text/css">
<script  type="text/javascript" src="../script/script.js" ></script>
<style type="text/css">
<!--
#floater {position:absolute; visibility:visible; }
-->
</style>
<script type="text/JavaScript">
	function MM_openBrWindow(theURL,winName,features) { //v2.0
		  window.open(theURL,winName,features);
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



<table width="750" height="100%" border="0" cellpadding="0" cellspacing="0" background="../images/bg.gif">
<tr>
	<td valign="top">
		<table width="750" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td height="32" background="../images/title_bg.gif">
				<table width="740" border="0" cellspacing="0" cellpadding="0" style="padding:0px 0px 0px 5px;">
				<tr>
					<td width="20" valign="top"><img src="../images/point_title_01.gif" width="20" height="17"></td>
					<td width="270" class="title_01">구조물 </td>
					<td width="450" class="route"><div align="right">홈 &nbsp;&gt;&nbsp; 기준정보&nbsp;&gt;&nbsp;구조물상세보기</div></td>
				</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td height="30" valign="top">
				<table width="740" height="16" border="0" cellpadding="0" cellspacing="0" style="padding:10px 0px 0px 1px;">
				<tr>
					<td width="12" valign="middle"><img src="../images/point_title_02.gif" width="5" height="13"></td>
					<td width="682" class="title_02">구조물상세보기</td>
				</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td>
			<s:push value="detailStruct" >
				<table width="750" border="0" cellpadding="0" cellspacing="1" class="MSlinetd" >
				<tr>
					<td colspan="4" height="2" class="MS01td"></td>
				</tr>
				<tr>
					<td width="130" height="25" class="MS05td" style="padding-left:10px"><div align="left">구조물ID(tel)</div></td>
					<td width="250" class="MS06td" style="padding-left:5px">
						<s:if test="struct_id==null">&nbsp;</s:if>
						<s:else><s:property value="struct_id" /></s:else>
						<s:if test="p_struct_tel_no==null">&nbsp;</s:if>
						<s:else>(<s:property value="p_struct_tel_no" />)</s:else>
					</td>
					<td width="120" height="25" class="MS05td" style="padding-left:10px"><div align="left">건립연월</div></td>
					<td class="MS06td" style="padding-left:5px">
						<s:if test="construct_year==null">&nbsp;</s:if>
						<s:else><s:property value="construct_year" /></s:else>
					</td>
				</tr>
				<tr>
					<td width="130" height="25" class="MS05td" style="padding-left:10px"><div align="left">구조물명 </div></td>
					<td class="MS06td" style="padding-left:5px">
						<s:if test="struct_nm==null">&nbsp;</s:if>
						<s:else><s:property value="struct_nm" /></s:else>
					</td>
					<td height="25" class="MS05td" style="padding-left:10px"><div align="left">설치위치</div></td>
					<td class="MS06td" style="padding-left:5px">
						<s:if test="loc_nm==null" >&nbsp;</s:if>
						<s:else><s:property value="loc_nm" /></s:else>
					</td>
				</tr>
				<tr>
					<td height="25" class="MS05td" style="padding-left:10px"><div align="left">구분</div></td>
					<td class="MS06td" style="padding-left:5px">
						<s:if test="struct_type_nm==null">&nbsp;</s:if>
						<s:else><s:property value="struct_type_nm" /></s:else>
					</td>
					<td height="25" class="MS05td" style="padding-left:10px"><div align="left">센서표시이미지</div></td>
					<td class="MS06td" style="padding-left:5px">
						<s:if test="sensor_image_nm==null">&nbsp;</s:if>
						<s:else>
							<s:property value="sensor_image_nm" />&nbsp;
							<s:a href="javascript:MM_openBrWindow('imageView.do?struct_id=%{struct_id}&sensor_image_id=%{sensor_image_id}','이미지보기','width=650,height=450,titlebar=yes,resizable=yes, toolbar=no,menubar=no,location=no,status=no ');" onfocus="this.blur();">
								<img src="../images/btnS_image.gif" alt="이미지보기" border="0" align="absmiddle" />
							</s:a>
						</s:else>
					</td>
				</tr>
				<tr>
					<td  height="25" class="MS05td" style="padding-left:10px"><div align="left">이미지구분</div></td>
					<td class="MS06td" style="padding-left:5px">
						<s:if test="image_sensor_type==null">&nbsp;</s:if><s:else><s:property value="image_sensor_type" /></s:else>
					</td>
					<td height="25" class="MS05td" style="padding-left:10px"><div align="left">일괄처리여부</div></td>
					<td class="MS06td" style="padding-left:5px">
						<s:if test="interface_yn==null">&nbsp;</s:if>
						<s:else><s:property value="interface_yn" /></s:else>
					</td>
				</tr>
				<tr>
					<td height="25" class="MS05td" style="padding-left:10px"><div align="left">개요</div>
					</td>
					<td class="MS06td" colspan="3"  style="padding-left:5px">
						<s:if test="intro==null">&nbsp;</s:if>
						<s:else>
						<s:property value="intro" />
<%--						&nbsp;<br>--%>
<%--						<s:a href="javascript:MM_openBrWindow('imageView.do?struct_id=%{struct_id}&sensor_image_id=%{intro_image_id}','개요이미지보기','width=650,height=450,titlebar=yes,resizable=yes, toolbar=no,menubar=no,location=no,status=no ');" onfocus="this.blur();">--%>
<%--							<img src="../images/btnS_image.gif" alt="개요이미지보기" border="0" align="absmiddle" />--%>
<%--						</s:a>--%>
						</s:else>
					</td>
				</tr>
				<tr>
					<td height="25" class="MS05td" rowspan="2" style="padding-left:10px"><div align="left">시스템구성 이미지</div></td>
					<td height="25" class="MS06td" colspan="3" style="padding-left:5px">
						<s:if test="system_image_nm_1==null">&nbsp;</s:if>
						<s:else>
						<s:property value="system_image_nm_1" />&nbsp;
							<s:a href="javascript:MM_openBrWindow('imageView.do?struct_id=%{struct_id}&sensor_image_id=%{system_image_id_1}','시스템구성이미지보기','width=650,height=450,titlebar=yes,resizable=yes, toolbar=no,menubar=no,location=no,status=no ');" onfocus="this.blur();">
								<img src="../images/btnS_image.gif" alt="시스템구성이미지보기" border="0" align="absmiddle" />
							</s:a>
						</s:else>
					</td>
				</tr>
				<tr>
					<td height="25" class="MS06td" colspan="3" style="padding-left:5px">
						<s:if test="system_image_nm_2==null">&nbsp;</s:if>
						<s:else>
						<s:property value="system_image_nm_2" />&nbsp;
							<s:a href="javascript:MM_openBrWindow('imageView.do?struct_id=%{struct_id}&sensor_image_id=%{system_image_id_2}','이미지보기','width=650,height=450,titlebar=yes,resizable=yes, toolbar=no,menubar=no,location=no,status=no ');" onfocus="this.blur();">
								<img src="../images/btnS_image.gif" alt="시스템구성이미지보기" border="0" align="absmiddle" />
							</s:a>
						</s:else>
					</td>
				</tr>
				<tr>
					<td height="25" class="MS05td" rowspan="5" style="padding-left:10px"><div align="left">도면이미지</div></td>
					<td height="25" class="MS06td" colspan="3" style="padding-left:5px">
						<s:if test="draw_image_nm_1==null">&nbsp;</s:if>
						<s:else>
						<s:property value="draw_image_nm_1" />&nbsp;
							<s:a href="javascript:MM_openBrWindow('imageView.do?struct_id=%{struct_id}&sensor_image_id=%{draw_image_id_1}','이미지보기','width=650,height=450,titlebar=yes,resizable=yes, toolbar=no,menubar=no,location=no,status=no ');" onfocus="this.blur();">
								<img src="../images/btnS_image.gif" alt="이미지보기" border="0" align="absmiddle" />
							</s:a>
						</s:else>
					</td>
				</tr>
				<tr>
					<td height="25" class="MS06td" colspan="3" style="padding-left:5px">
						<s:if test="draw_image_nm_2==null">&nbsp;</s:if>
						<s:else>
						<s:property value="draw_image_nm_2" />&nbsp;
							<s:a href="javascript:MM_openBrWindow('imageView.do?struct_id=%{struct_id}&sensor_image_id=%{draw_image_id_2}','이미지보기','width=650,height=450,titlebar=yes,resizable=yes, toolbar=no,menubar=no,location=no,status=no ');" onfocus="this.blur();">
								<img src="../images/btnS_image.gif" alt="이미지보기" border="0" align="absmiddle" />
							</s:a>
						</s:else>
					</td>
				</tr>
				<tr>
					<td height="25" class="MS06td" colspan="3" style="padding-left:5px">
						<s:if test="draw_image_nm_3==null">&nbsp;</s:if>
						<s:else>
						<s:property value="draw_image_nm_3" />&nbsp;
							<s:a href="javascript:MM_openBrWindow('imageView.do?struct_id=%{struct_id}&sensor_image_id=%{draw_image_id_3}','이미지보기','width=650,height=450,titlebar=yes,resizable=yes, toolbar=no,menubar=no,location=no,status=no ');" onfocus="this.blur();">
								<img src="../images/btnS_image.gif" alt="이미지보기" border="0" align="absmiddle" />
							</s:a>
						</s:else>
					</td>
				</tr>
				<tr>
					<td height="25" class="MS06td" colspan="3" style="padding-left:5px">
						<s:if test="draw_image_nm_4==null">&nbsp;</s:if>
						<s:else>
						<s:property value="draw_image_nm_4" />&nbsp;
							<s:a href="javascript:MM_openBrWindow('imageView.do?struct_id=%{struct_id}&sensor_image_id=%{draw_image_id_4}','이미지보기','width=650,height=450,titlebar=yes,resizable=yes, toolbar=no,menubar=no,location=no,status=no ');" onfocus="this.blur();">
								<img src="../images/btnS_image.gif" alt="이미지보기" border="0" align="absmiddle" />
							</s:a>
						</s:else>
					</td>
				</tr>
				<tr>
					<td height="25" class="MS06td" colspan="3" style="padding-left:5px">
						<s:if test="draw_image_nm_5==null">&nbsp;</s:if>
						<s:else>
						<s:property value="draw_image_nm_5" />&nbsp;
							<s:a href="javascript:MM_openBrWindow('imageView.do?struct_id=%{struct_id}&sensor_image_id=%{draw_image_id_5}','이미지보기','width=650,height=450,titlebar=yes,resizable=yes, toolbar=no,menubar=no,location=no,status=no ');" onfocus="this.blur();">
								<img src="../images/btnS_image.gif" alt="이미지보기" border="0" align="absmiddle" />
							</s:a>
						</s:else>
					</td>
				</tr>
				<tr>
					<td height="25" class="MS05td" style="padding-left:10px"><div align="left">AGENT ID</div></td>
					<td height="25" class="MS06td" style="padding-left:5px">
						<s:if test="agent_id==null">&nbsp;</s:if>
						<s:else><s:property value="agent_id" /></s:else>
					</td>
					<td height="25" class="MS05td" style="padding-left:10px"><div align="left">AGENT IP</div></td>
					<td class="MS06td" style="padding-left:5px">
						<s:if test="agent_ip==null">&nbsp;</s:if>
						<s:else><s:property value="agent_ip" /></s:else>
					</td>
				</tr>
				</table>
			</s:push>
			</td>
		</tr>
		<tr>
			<td><table width="750" border="0" cellspacing="0" cellpadding="0">
				<tr><td height="20"></td></tr>
				<tr>
					<td align="center">
						<s:url id="editViewStruct" action="editViewStruct">
							<s:param name="construct_year" value="%{construct_year}" />
						</s:url>
						<s:a href="%{editViewStruct}"><img src="../images/btn_modify.gif" width="59" height="20" border="0" /></s:a>
						<!-- 		<s:a href="editStruct.do?struct_id=%{struct_id}&user_id=%{user_id}" ><img src="../images/btn_modify.gif" /></s:a> -->	                
						<!-- 		<s:a href="listStruct.do?struct_id=%{struct_id}&user_id=%{user_id}" ><img src="../images/btn_list.gif" width="60" height="20" border="0" /></s:a>&nbsp;&nbsp; -->
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
