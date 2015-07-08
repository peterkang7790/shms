<%@ page language="java" import="java.util.*" pageEncoding="EUC-KR"%>
<%@ page import="com.lsware.utils.StringUtils" %>
<%
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
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
<style type="text/css">
<!--
body { margin-left: 10px; margin-top: 10px; margin-right: 0px; margin-bottom: 0px;}
#floater {position:absolute; visibility:visible; }
-->
</style>
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

<s:form id="form1" namespace="/admin" action="detailUser" theme="simple" method="get">
<s:push value="rsOneUser" >

<table width="750" height="100%" border="0" cellpadding="0" cellspacing="0" background="../images/bg.gif">
<tr>
	<td valign="top">
		<table width="750" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td height="32" background="../images/title_bg.gif">
				<table width="740" border="0" cellspacing="0" cellpadding="0" style="padding:0px 0px 0px 5px;">
				<tr>
					<td width="20" valign="top"><img src="../images/point_title_01.gif" width="20" height="17"></td>
					<td width="270" class="title_01">사용자 상세보기 </td>
					<td width="450" class="route"><div align="right">홈 &nbsp;&gt;&nbsp; Admin &nbsp;&gt;&nbsp; 사용자</div></td>
				</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td height="30" valign="top">
				<table width="740" height="16" border="0" cellpadding="0" cellspacing="0" style="padding:10px 0px 0px 1px;">
				<tr>
					<td width="12" valign="middle"><img src="../images/point_title_02.gif" width="5" height="13"></td>
					<td width="682" class="title_02">사용자정보</td>
				</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td><table width="750" border="0" cellpadding="0" cellspacing="1" class="MSlinetd">
				<tr>
					<td colspan="6" height="2" class="MS01td"></td>
				</tr>
				<tr>
					<td width="120" height="25" class="MS05td" style="padding-left:10px"><div align="left">사용자ID</div></td>
					<td width="240" class="MS06td" style="padding-left:5px">
						<s:if test="user_id==null">&nbsp;</s:if><s:else><s:property value="user_id" /></s:else>
					</td>
					<td width="120" class="MS05td" style="padding-left:10px"><div align="left">사용자명</div></td>
					<td width="240" class="MS06td" style="padding-left:5px" colspan="3">
						<s:if test="user_nm==null">&nbsp;</s:if><s:else><s:property value="user_nm" /></s:else>
					</td>
				</tr>
				<tr>
					<td height="25" class="MS05td" style="padding-left:10px"><div align="left">비밀번호</div></td>
					<td class="MS07td" style="padding-left:5px">
						<s:if test="password==null">&nbsp;</s:if><s:else><s:property value="password" /></s:else>
					</td>
					<td class="MS05td" style="padding-left:10px"><div align="left">그룹</div></td>
					<td class="MS07td" style="padding-left:5px" colspan="3">
						<s:if test="group_nm==null">&nbsp;</s:if><s:else><s:property value="group_nm" /></s:else>
					</td>
				</tr>
				<tr>
					<td height="25" class="MS05td" style="padding-left:10px"><div align="left">이메일</div></td>
					<td colspan="5" class="MS06td" style="padding-left:5px">
						<s:if test="email==null">&nbsp;</s:if><s:else><s:property value="email" /></s:else>
					</td>
				</tr>
				<tr>
					<td height="25" class="MS05td" style="padding-left:10px"><div align="left">핸드폰</div></td>
					<td class="MS07td" style="padding-left:5px">
						<s:if test="mobile_no==null">&nbsp;</s:if>
						<s:else>
						<%
							String mNo = request.getAttribute("mobile_no")==null?"":request.getAttribute("mobile_no").toString();
							String moNo = StringUtils.strMobileNo( mNo );
						 %>
							<%=moNo%>
						</s:else>
					</td>
					<td class="MS05td" style="padding-left:10px"><div align="left">전화번호</div></td>
					<td class="MS07td" style="padding-left:5px" colspan="3">
						<s:if test="tel_no==null">&nbsp;</s:if>
						<s:else>
							<%
							String tNo = request.getAttribute("tel_no")==null?"":request.getAttribute("tel_no").toString();
							String toNo = StringUtils.strTelNo( tNo );
						 %>
							<%=toNo%>
						</s:else>	  
					</td>
				</tr>
				<tr>
					<td height="25" class="MS05td" style="padding-left:10px"><div align="left">팩스번호</div></td>
					<td class="MS06td" style="padding-left:5px">
						<s:if test="fax_no==null">&nbsp;</s:if><s:else><s:property value="fax_no" /></s:else>
					</td>
					<td class="MS05td" style="padding-left:10px"><div align="left">SMS수신여부</div></td>
					<td class="MS06td" style="padding-left:5px" colspan="3">
						<s:if test="sms_recv_yn==null">&nbsp;</s:if><s:else><s:property value="sms_recv_yn" /></s:else>
					</td>
				</tr>
				<tr>
					<td height="25" class="MS05td" style="padding-left:10px"><div align="left">사용등급</div></td>
					<td class="MS07td" style="padding-left:5px">
						<s:if test="used_class_nm==null">&nbsp;</s:if><s:else><s:property value="used_class_nm" /></s:else>
					</td>
					<td class="MS05td" style="padding-left:10px"><div align="left">삭제여부</div></td>
					<td width="80"  class="MS07td" style="padding-left:5px">
						<s:if test="del_yn==null">&nbsp;</s:if><s:else><s:property value="del_yn" /></s:else>
					</td>
					<td width="80" class="MS05td" style="padding-left:10px"><div align="left">HOT Line</div></td>
					<td width="80" class="MS07td" style="padding-left:5px">
						<s:if test="hot_line_woker_yn==null">&nbsp;</s:if><s:else><s:property value="hot_line_woker_yn" /></s:else>
					</td>
				</tr>
				<tr>
					<td height="25" class="MS05td" style="padding-left:10px"><div align="left">최종접속일시</div></td>
					<td class="MS06td" style="padding-left:5px">
						<s:if test="last_access_dt==null">&nbsp;</s:if><s:else><s:property value="last_access_dt" /></s:else>
					</td>
					<td class="MS05td" style="padding-left:10px"><div align="left">최종접속 구조물</div></td>
					<td class="MS06td" style="padding-left:5px" colspan="3">
						<s:if test="last_struct_nm==null">&nbsp;</s:if><s:else><s:property value="last_struct_nm" /></s:else>
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
						<s:url id="listUser" action="listUser"></s:url>			                
						<s:a href="listUser.do"><img src="../images/btn_list.gif" border="0"></s:a>
						<s:url id="viewEditUser" action="viewEditUser">
							<s:param name="user_id" value="user_id" />
						</s:url>
						<s:a href="%{viewEditUser}"><img src="../images/btn_modify.gif" border="0"></s:a>
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

</s:push>
</s:form>
<td valign="top">&nbsp;<!-- 퀵메뉴 -->
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
