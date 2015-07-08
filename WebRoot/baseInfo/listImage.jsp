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
<head>
<title>SHMS</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link href="../css/common01.css" rel="stylesheet" type="text/css">
<script  type="text/javascript" src="../script/ComUtil.js" ></script>
<script  type="text/javascript" src="../script/script.js" ></script>
<script  type="text/javascript" src="../script/jquery.js" ></script>
<style type="text/css">
<!--
body { margin-left: 10px; margin-top: 10px; margin-right: 0px; margin-bottom: 0px;}
.style3 { color: #ffa72a; font-weight: bold; }
#floater {position:absolute; visibility:visible; }
-->
</style>
<script type="text/javascript">
	function delImage(imgid,rowNo) {
		var url = "delImage.do?image_id="+imgid+"&nowPage="+rowNo;
		if (confirm("정말로 삭제하시겠습니까?\n(하위정보도같이 삭제 됩니다.)")) {
			// 확인 버튼을 눌렀을 때 실행
			listImage.method = "post";
			listImage.target = "_self";
			listImage.action = url;
			listImage.submit();
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

<s:form id="form1" namespace="/baseInfo" action="listImage" theme="simple" method="get">

<table width="750" height="100%" border="0" cellpadding="0" cellspacing="0" background="../images/bg.gif">
<tr>
	<td valign="top">
		<table width="750" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td height="32" colspan="2" background="../images/title_bg.gif">
				<table width="740" border="0" cellspacing="0" cellpadding="0" style="padding:0px 0px 0px 5px;">
				<tr>
					<td width="20" valign="top"><img src="../images/point_title_01.gif" width="20" height="17"></td>
					<td width="270" class="title_01">이미지</td>
					<td width="450" class="route"><div align="right">홈 &nbsp;&gt;&nbsp; 기준정보 &nbsp;&gt;&nbsp; 이미지</div></td>
				</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td width="500" height="30">
				<table width="490" height="16" border="0" cellpadding="0" cellspacing="0" style="padding:10px 0px 0px 1px;">
				<tr>
					<td width="12" valign="middle"><img src="../images/point_title_02.gif" width="5" height="13"></td>
					<td width="478" class="title_02">구조물 이미지 현황 [<s:property value="resultCount" />건]</td>
				</tr>
				</table>
			</td>
			<td width="250" valign="top" style="padding:10px 0px 0px 200px;">
				<s:a href="addViewImage.do"><img src="../images/btn_regist.gif" width="59" height="20" border="0"></s:a>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<table width="750" border="0" cellspacing="1" bgcolor="#CCCCCC" cellpadding="0">
				<tr>
					<td colspan="8" height="2" class="MS01td"></td>
				</tr>
				<tr>
					<td height="25" align="center" class="MS05td">NO</td>
					<td align="center" class="MS05td">이미지ID</td>
					<td align="center" class="MS05td">이미지명</td>
					<td align="center" class="MS05td">구분</td>
					<td align="center" class="MS05td">Photo구분</td>
					<td align="center" class="MS05td">경로</td>
					<td align="center" class="MS05td">실제사이즈</td>
					<td align="center" class="MS05td" >관리</td>
				</tr>

				<s:iterator value="listImage_1" status="stat">
				<s:if test="rnum%2==0"> <% bg = "MSlist03td"; %> </s:if><s:else> <% bg = "MSlist02td"; %> </s:else>
				
				<tr>
					<td height="22" align="center" class="<%=bg%>">
						<s:if test="rnum==null">&nbsp;</s:if>
						<s:else><s:property value="rnum" /></s:else>
					</td>
					<td style="padding-left:5px" align="left" class="<%=bg%>">
						<s:if test="image_id==null">&nbsp;</s:if>
						<s:else><s:property value="image_id" /></s:else>
					</td>
					<td style="padding-left:5px" align="left" class="<%=bg%>">
						<s:if test="image_title==null">&nbsp;</s:if><s:else><s:property value="image_title" /></s:else>
					</td>
					<td align="center" class="<%=bg%>"><s:if test="gb==null">&nbsp;</s:if><s:else><s:property value="gb" /></s:else></td>
					<td align="center" class="<%=bg%>"><s:if test="phto_type_nm==null">&nbsp;</s:if><s:else><s:property value="phto_type_nm" /></s:else></td>
					<td style="padding-left:5px" align="left" class="<%=bg%>"><s:if test="image_name==null">&nbsp;</s:if><s:else><s:property value="image_name" /></s:else></td>
					<td align="center" class="<%=bg%>"><s:if test="real_size==null">&nbsp;</s:if><s:else><s:property value="real_size" /></s:else></td>
					<td align="center" class="<%=bg%>" id="sen_view">
						<s:a href="detailImage.do?image_id=%{image_id}" onfocus="this.blur();"><img src="../images/btnS_view0.gif" width="32" height="17" border="0" align="absmiddle"></s:a>
						<s:url id="delImage" action="delImage">
							<s:param name="image_id" value="image_id"/>
						</s:url>
						<s:a href="#" onclick="delImage( '%{image_id}',%{reqMap.nowPage} )" onfocus="this.blur();"><img src="../images/btnS_delet.gif" width="32" height="17" border="0" align="absmiddle"></s:a>
					</td>
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
<%--									<td width="13"><a href="#"><img src="../images/btn_first.gif" width="13" height="13" border="0"></a></td>--%>
<%--									<td width="8">&nbsp;</td>--%>
<%--									<td width="13"><a href="#"><img src="../images/btn_back.gif" width="13" height="13" border="0"></a></td>--%>
									<td width="12">&nbsp;</td>
									<td><s:property value="pagingString" escape="false" /></td>
									<td width="12">&nbsp;</td>
<%--									<td width="13"><a href="#"><img src="../images/btn_next.gif" width="13" height="13" border="0"></a></td>--%>
<%--									<td width="8">&nbsp;</td>--%>
<%--									<td width="13"><a href="#"><img src="../images/btn_end.gif" width="13" height="13" border="0"></a></td>--%>
								</tr>
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
