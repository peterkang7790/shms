<%@ page language="java" import="java.util.*" pageEncoding="EUC-KR"  contentType="text/html; charset=euc-kr"%>
<%@ page language="java" import="com.lsware.utils.*" %>
<%
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
String bg = "";

String p_user_id = request.getParameter("p_user_id"); if(p_user_id==null) p_user_id = "";
String p_user_nm = request.getParameter("p_user_nm"); if(p_user_nm==null) p_user_nm = "";

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
	function delUser(user_id, rowNo) {
		var url = "delUser.do?user_id=" + user_id + "&nowPage=" + rowNo;
		if (confirm("정말로 삭제하시겠습니까?\n(하위정보도같이 삭제 됩니다.)")) {
			listUser.method = "post";
			listUser.target = "_self";
			listUser.action = url;
			listUser.submit();
		}
		else {
			// 취소 버튼을 눌렀을 때 실행
			return false;
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

<s:form id="form1" namespace="/admin" action="listUser" theme="simple" method="get">

<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" background="../images/bg.gif">
<tr>
	<td valign="top" width="750">
		<table width="750" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td height="32" colspan="2" background="../images/title_bg.gif">
				<table width="740" border="0" cellspacing="0" cellpadding="0" style="padding:0px 0px 0px 5px;">
				<tr>
					<td width="20" valign="top"><img src="../images/point_title_01.gif" width="20" height="17"></td>
					<td width="270" class="title_01">사용자 리스트</td>
					<td width="450" class="route"><div align="right">홈 &nbsp;&gt;&nbsp; Admin &nbsp;&gt;&nbsp; 사용자</div></td>
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
					<td height="25" class="MS05td" width="110" style="padding-left:10px"><div align="left">사용자ID</div></td>
					<td width="265" class="MS06td" style="padding-left:5px">
						<input name="p_user_id" type="text" class="box" style="width:130" value="<%=p_user_id%>">
					</td>
					<td class="MS05td" width="110" style="padding-left:10px"><div align="left">사용자명</div></td>
					<td width="265" class="MS06td" style="padding-left:5px">
						<input name="p_user_nm" type="text" class="box" style="width:130" value="<%=p_user_nm%>">
					</td>
				</tr>
				<tr>
					<td height="25" class="MS05td" width="110" style="padding-left:10px"><div align="left">그룹</div></td>
					<td width="265" class="MS07td" style="padding-left:5px">
						<s:select name="p_group_id" id="p_group_id" list="group_list" listKey="group_id" listValue="group_nm" headerKey="" headerValue="선택" cssStyle="width:130px"></s:select>
					</td>
					<td class="MS05td" width="110" style="padding-left:10px"><div align="left">사용등급</div></td>
					<td width="265" class="MS07td" style="padding-left:5px">
						<table width="110" height="24" border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td width="57">
								<s:select name="p_used_class_cd" id="p_used_class_cd" list="usedclass_list" listKey="used_class_cd" listValue="used_class_nm" headerKey="" headerValue="선택" cssStyle="width:130px"></s:select>
							</td>
							<td width="53" align="left">
								<table>
								<tr><td><s:submit type="image" src="../images/btnS_search.gif" /></td></tr>
								</table>
							</td>
						</tr>
						</table>
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
					<td width="478" class="title_02">사용자 현황 [<s:property value="resultCount" />건]</td>
				</tr>
				</table>
			</td>
			<td width="250" valign="top" style="padding:10px 0px 0px 200px;">
				<s:if test='#session.USED_CLASS_CD=="1"'>
					<s:url id="viewAddUser" action="viewAddUser"></s:url>
					<s:a href="%{viewAddUser}"><img src="../images/btn_regist.gif" width="59" height="20" border="0"></s:a>
				</s:if>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<table width="750" border="0" cellspacing="1" bgcolor="#CCCCCC" cellpadding="2">
				<tr>
					<td colspan="10" height="2" class="MS01td"></td>
				</tr>
				<tr>
					<td width="20" height="25" align="center" class="MS05td">NO</td>
					<td width="60" align="center" class="MS05td">사용자ID</td>
					<td width="80" align="center" class="MS05td">사용자명</td>
					<td width="140" align="center" class="MS05td">그룹</td>
					<td width="140" align="center" class="MS05td">이메일</td>
					<td width="100" align="center" class="MS05td">핸드폰</td>
					<td width="40" align="center" class="MS05td">SMS</td>
					<td width="60" align="center" class="MS05td">사용등급</td>
					<td width="80" align="center" class="MS05td">관리</td>
				</tr>

				<s:iterator value="rsListUser" status="stat">
				<s:if test="rnum%2==0"> <% bg = "MSlist03td"; %> </s:if><s:else> <% bg = "MSlist02td"; %> </s:else>
				
				<tr>
					<td height="22" align="center" class="<%=bg%>"><s:if test="rnum==null">&nbsp;</s:if><s:else><s:property value="rnum" /></s:else></td>
					<td align="center" class="<%=bg%>" style="padding-left:10px"><div align="left"><s:if test="user_id==null">&nbsp;</s:if><s:else><s:property value="user_id" /></s:else></div></td>
					<td align="center" class="<%=bg%>" style="padding-left:10px"><div align="left"><s:if test="user_nm==null">&nbsp;</s:if><s:else><s:property value="user_nm" /></s:else></div></td>
					<td align="center" class="<%=bg%>" style="padding-left:10px"><div align="left"><s:if test="group_nm==null">&nbsp;</s:if><s:else><s:property value="group_nm" /></s:else></div></td>
					<td align="center" class="<%=bg%>" style="padding-left:10px"><div align="left"><s:if test="email==null">&nbsp;</s:if><s:else><s:property value="email" /></s:else></div></td>
					<%
					    String mNo = "";
						if( request.getAttribute("mobile_no") != null )
						{
							mNo = StringUtils.strMobileNo(String.valueOf( request.getAttribute("mobile_no") ) );	
						}
					%>
					<td align="center" class="<%=bg%>" style="padding-left:10px"><div align="left"><s:if test="mobile_no==null">&nbsp;</s:if><s:else><%=mNo%></s:else></div></td>
					<td align="center" class="<%=bg%>" ><s:if test="sms_recv_yn==null">&nbsp;</s:if><s:else><s:property value="sms_recv_yn" /></s:else></td>
					<td align="center" class="<%=bg%>" style="padding-left:10px"><div align="left"><s:if test="used_class_nm==null">&nbsp;</s:if><s:else><s:property value="used_class_nm" /></s:else></div></td>
					<td align="center" class="<%=bg%>">
						<s:a href="detailUser.do?user_id=%{user_id}"><img src="../images/btnS_view0.gif" width="32" height="17" border="0"></s:a>
						<s:if test='#session.USED_CLASS_CD=="1"'>
							<s:url id="delUser" action="delUser">
								<s:param name="user_id" value="user_id"/>
							</s:url>
							<s:a href="#" onclick="delUser( '%{user_id}',%{reqMap.nowPage} )"><img src="../images/btnS_delet.gif" width="32" height="17" border="0"></s:a>
						</s:if>
					</td>
				</tr>

				</s:iterator>
				
				<s:if test="resultCount == 0">
				<tr>
					<td colspan="10" class="MSlist02td" align="center">검색된 결과가 없습니다.</td>
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
