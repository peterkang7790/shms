<%@ page language="java" import="java.util.*" pageEncoding="EUC-KR"  contentType="text/html; charset=euc-kr"%>
<%
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
String bg = "";
String user_id = request.getParameter("user_id"); if (user_id==null) user_id = "";
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
<script type="text/javascript">
	function saveStaccs() {
		if (document.form1.user_id.value != "") {
			listStaccs.method = "post";
			listStaccs.target = "_self";
			listStaccs.action = "saveStaccs.do";
			listStaccs.submit();
		} else {
			alert("선택된 사용자 정보가 없으면 저장이 불가능 합니다. \n먼저, 사용자를 선택하여 주시기 바랍니다.");
		}
	}

	function allChecked(obj) {
		f = document.form1;
		if (obj.checked) {
			for( i=0 ; i<f.elements.length ; i++) {
				if (f.elements[i].name=="access_yn") {
					f.elements[i].checked = false;
				}
			}
		} else {
			for( i=0 ; i<f.elements.length ; i++) {
				if (f.elements[i].name=="access_yn") {
					f.elements[i].checked = true;
				}
			}
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

<s:form id="form1" namespace="/admin" action="listStaccs" theme="simple" method="get">

<table width="750" height="100%" border="0" cellpadding="0" cellspacing="0" background="../images/bg.gif">
<tr>
	<td valign="top">
		<table width="750" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td width="750" height="32" colspan="4" background="../images/title_bg.gif">
				<table width="740" border="0" cellspacing="0" cellpadding="0" style="padding:0px 0px 0px 5px;">
				<tr>
					<td width="20" valign="top"><img src="../images/point_title_01.gif" width="20" height="17"></td>
					<td width="270" class="title_01">사용자별 구조물 접근권한 리스트</td>
					<td width="450" class="route"><div align="right">홈 &nbsp;&gt;&nbsp; Admin &nbsp;&gt;&nbsp; 구조물 접근권한</div></td>
				</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td height="1" colspan="4"></td>
		</tr>
		<tr>
			<td height="10" colspan="4">

				<table width="750" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="270" height="10">
						<table width="270" height="16" border="0" cellpadding="0" cellspacing="0" style="padding:10px 0px 0px 1px;">
						<tr>
							<td width="12" valign="middle">
								<img src="../images/point_title_02.gif" width="5" height="13" />
							</td>
							<td width="258" class="title_02">사용자	: <input type="text" name="user_id" id="user_id" value="<%=user_id%>" size="10" readOnly></td>
						</tr>
						</table>
					</td>
					<td width="10">&nbsp;</td>
					<td><table width="460" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="270" height="10">
								<table width="260" height="16" border="0" cellpadding="0" cellspacing="0" style="padding:10px 0px 0px 1px;">
								<tr>
									<td width="12" valign="middle"><img src="../images/point_title_02.gif" width="5" height="13" /></td>
									<td width="248" class="title_02">구조물별 접근권한 </td>
								</tr>
								</table>
							</td>
							<td style="padding:10px 0px 0px 130px;">
								<s:if test='#session.USED_CLASS_CD=="1"'>
									<a href="javascript:saveStaccs();" onfocus="this.blur();">
										<img src="../images/btn_save.gif" border="0" align="absmiddle">
									</a>
								</s:if>
							</td>
						</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td valign="top">
						<table width="280" border="0" cellspacing="1" bgcolor="#CCCCCC" cellpadding="2">
						<tr>
							<td colspan="3" height="2" class="MS01td"></td>
						</tr>
						<tr>
							<td width="20" height="25" align="center" class="MS05td">NO</td>
							<td width="100" align="center" class="MS05td">사용자ID</td>
							<td width="160" align="center" class="MS05td">사용자명</td>
						</tr>

						<s:iterator value="rsListStaccsUser" status="stat">
						<s:if test="rnum1 % 2 == 0"> <% bg = "MSlist03td"; %> </s:if><s:else> <% bg = "MSlist02td"; %> </s:else>
						<s:if test="user_id == sel_user_id"><% bg = "MSlist04td"; %></s:if>

						<tr>
							<td height="22" align="center" class="<%=bg%>"><s:if test="rnum1==null">&nbsp;</s:if><s:else><s:property value="rnum1" /></s:else></td>
							<td class="<%=bg%>" style="padding-left:5px" align="left">
								<s:if test="user_id==null">&nbsp;</s:if>
								<s:else><s:a href="listStaccs.do?user_id=%{user_id}"><s:property value="user_id" /></s:a>
								</s:else>
							</td>
							<td class="<%=bg%>" style="padding-left:5px" align="left">
								<s:if test="user_nm==null">&nbsp;</s:if>
								<s:else><s:a href="listStaccs.do?user_id=%{user_id}"><s:property value="user_nm" /></s:a>
								</s:else>
							</td>
						</tr>

						</s:iterator>

						</table>
					</td>
					<td>&nbsp;</td>
					<td valign="top">
						<table width="460" border="0" cellspacing="1" bgcolor="#CCCCCC" cellpadding="2">
						<tr>
							<td colspan="4" height="2" class="MS01td"></td>
						</tr>
						<tr>
							<td width="20" height="25" align="center" class="MS05td">NO</td>
							<td width="100" align="center" class="MS05td">구조물ID</td>
							<td width="240" align="center" class="MS05td">구조물명</td>
							<td width="100" align="center" class="MS05td">접근권한
								<!-- s:checkbox name="sel_all" onchange="javascript:allChecked(this);" /-->
							</td>
						</tr>

						<s:iterator value="rsListStaccsStruct" status="stat">
						<s:if test="rnum2 % 2 == 0"> <% bg = "MSlist03td"; %> </s:if><s:else> <% bg = "MSlist02td"; %> </s:else>

						<tr>
							<td height="22" align="center" class="<%=bg%>"><s:if test="rnum2==null">&nbsp;</s:if><s:else><s:property value="rnum2" /></s:else></td>
							<td align="center" class="<%=bg%>">
								<s:if test="struct_id==null">&nbsp;</s:if><s:else><s:property value="struct_id" /></s:else>
							</td>
							<td align="left" class="<%=bg%>"> &nbsp;
								<s:if test="struct_nm==null">&nbsp;</s:if>
								<s:else>
									<s:property value="struct_nm" />
								</s:else>
							</td>
							<td align="center" class="<%=bg%>">
								<s:checkbox name="access_yn" id="access_yn" fieldValue="%{access_yn + ',' + struct_id}" value="%{access_yn}" />
							</td>
						</tr>

						</s:iterator>

						</table>
					</td>
				</tr>
				</table>
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
