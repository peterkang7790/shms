<%@ page language="java" import="java.util.*" pageEncoding="EUC-KR"%>
<%
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
String ImgPath  = request.getContextPath() + "/images/";
String RootPath = request.getContextPath() + "/";
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
	function delCommonCode(common_cd, rowNo) {
		var url = "delCommonCode.do?common_cd=" + common_cd + "&nowPage=" + rowNo;
		if (confirm("정말로 삭제하시겠습니까?\n(하위정보도같이 삭제 됩니다.)")) {
			listCommonCode.method = "post";
			listCommonCode.target = "_self";
			listCommonCode.action = url;
			listCommonCode.submit();
		}
		else {
			// 취소 버튼을 눌렀을 때 실행
			return false;
		}  
	}

	var old_comVd = "";
	var old_rnum = "";
	
	function callIframe( comCd, rnum, codeTyp )
	{
		var caddCs = "";
		if( old_comVd != comCd )
		{
			if( old_rnum%2 == 0 ) caddCs = "MSlist03td";
			else				  caddCs = "MSlist02td";	
			
			$("#test1_"+old_comVd).removeClass("MSlist04td");
			$("#test1_"+old_comVd).addClass(caddCs);
			
			$("#test2_"+old_comVd).removeClass("MSlist04td");
			$("#test2_"+old_comVd).addClass(caddCs);
			$("#test3_"+old_comVd).removeClass("MSlist04td");
			$("#test3_"+old_comVd).addClass(caddCs);
			$("#test4_"+old_comVd).removeClass("MSlist04td");
			$("#test4_"+old_comVd).addClass(caddCs);
			$("#test5_"+old_comVd).removeClass("MSlist04td");
			$("#test5_"+old_comVd).addClass(caddCs);
			$("#test6_"+old_comVd).removeClass("MSlist04td");
			$("#test6_"+old_comVd).addClass(caddCs);
		}
		
			$("#test1_"+comCd).attr("class", "MSlist04td" );
			$("#test2_"+comCd).attr("class", "MSlist04td" );
			$("#test3_"+comCd).attr("class", "MSlist04td" );
			$("#test4_"+comCd).attr("class", "MSlist04td" );
			$("#test5_"+comCd).attr("class", "MSlist04td" );
			$("#test6_"+comCd).attr("class", "MSlist04td" );
			
		old_comVd = comCd;
		old_rnum = rnum;
		
		var Ctnval = "../admin/listCommonCodeDet.do?common_cd="+comCd+"&code_type="+codeTyp;
		$("#frame1").attr("src", Ctnval );

		
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

<table width="750" height="100%" border="0" cellpadding="0" cellspacing="0" background="../images/bg.gif">
<tr>
	<td valign="top">
		<table width="750" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td height="32" colspan="2" background="../images/title_bg.gif">
				<table width="740" border="0" cellspacing="0" cellpadding="0" style="padding:0px 0px 0px 5px;">
				<tr>
					<td width="20" valign="top"><img src="../images/point_title_01.gif" width="20" height="17"></td>
					<td width="270" class="title_01">공통코드</td>
					<td width="450" class="route"><div align="right">홈 &nbsp;&gt;&nbsp; 기준정보 &nbsp;&gt;&nbsp; 공통코드</div></td>
				</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td height="10" colspan="2"></td>
		</tr>
		<tr>
			<td colspan="2">
				<s:form id="form1" namespace="/admin" action="listCommonCode" theme="simple" method="get">
				<table width="750" border="0" cellpadding="0" cellspacing="1" class="MSlinetd">
				<tr>
					<td colspan="4" height="2" class="MS01td"></td>
				</tr>
				<tr>
					<td height="25" class="MS05td" width="110"><div align="center">공통코드ID</div></td>
					<td width="265" class="MS06td" style="padding-left:5px">
						<s:textfield name="common_cd_search" cssStyle="width:115" onblur="toUpper(this);" />
					</td>
					<td class="MS05td" width="110"><div align="center">공통코드명</div></td>
					<td width="265" class="MS06td" style="padding-left:5px">
						<table width="110" height="24" border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td width="57">
								<s:textfield name="common_nm_search" cssStyle="width:115" />
							</td>
							<td width="53" align="left">
								<table>
								<tr>
									<td>
										<s:submit type="image" src="../images/btnS_search.gif" align="absmiddle"/>
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
			</td>
		</tr>
		<tr>
			<td width="500">
				<table width="490" height="16" border="0" cellpadding="0" cellspacing="0" style="padding:0px 0px 0px 1px;">
					<tr>
						<td width="12" valign="middle"><img src="<%=ImgPath%>point_title_02.gif" width="5" height="13"></td>
						<td width="478" class="title_02">공통코드 현황 [<s:property value="resultCount" />건]</td>
					</tr>
				</table>
			</td>
			<td width="250" valign="top" style="padding:1px 0px 0px 200px;">
				<a href="javascript:MM_openBrWindow('addViewCommonCode.do','','width=400,height=350,resizable=yes');">
				<img src="../images/btn_regist.gif" width="59" height="20" border="0">
				</a>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<table width="750" border="0" cellspacing="1" bgcolor="#CCCCCC" cellpadding="2">
				<tr>
					<td colspan="6" height="2" class="MS01td"></td>
				</tr>
				<tr>
					<td width="40" height="25" align="center" class="MS05td">NO</td>
					<td align="center" class="MS05td">코드ID</td>
					<td align="center" class="MS05td">코드명</td>
					<td width="100" align="center" class="MS05td">유형</td>
					<td width="40" align="center" class="MS05td">길이</td>
					<td width="60" align="center" class="MS05td" id="dt_view">관리</td>
				</tr>
				
				<s:iterator value="listCommonCode" status="stat">
				<s:if test="rnum%2==0"> <% bg = "MSlist03td"; %> </s:if><s:else> <% bg = "MSlist02td"; %> </s:else>
				
				<tr>
					<td id="test1_${common_cd}" height="22" align="center" class="<%=bg%>" ><s:if test="rnum==null">&nbsp;</s:if><s:else><s:property value="rnum" /></s:else></td>
					<td id="test2_${common_cd}" style="padding-left:5px" align="left" class="<%=bg%>">
						<s:if test="common_cd==null">&nbsp;</s:if>
						<s:else><s:a href="#" onclick="callIframe('%{common_cd}','%{rnum}','%{code_type}');" id="comCd1" ><s:property value="common_cd" /></s:a>
						</s:else>
					</td>
					<td id="test3_${common_cd}" class="<%=bg%>" style="padding-left:5px" align="left"><s:if test="common_nm==null">&nbsp;</s:if><s:else><s:property value="common_nm" /></s:else></td>
					<td id="test4_${common_cd}" class="<%=bg%>" style="padding-left:5px" align="left"><s:if test="code_type==null">&nbsp;</s:if><s:else><s:property value="code_type" /></s:else></td>
					<td id="test5_${common_cd}" align="center" class="<%=bg%>"><s:if test="len==null">&nbsp;</s:if><s:else><s:property value="len" /></s:else></td>
					<td id="test6_${common_cd}" align="center" class="<%=bg%>">
					<!--  
						<s:a href="javascript:MM_openBrWindow('detailCommonCodePop.do?common_cd=%{common_cd}','','width=400,height=300,resizable=yes');">
							<img src="../images/btnS_view0.gif" width="32" height="17" border="0">
						</s:a>
					-->	
						<s:url id="delCommonCode" action="delCommonCode">
					    <s:param name="common_cd" value="common_cd"/>
					    </s:url>
				        <s:a href="#" onclick="delCommonCode( '%{common_cd}',%{reqMap.nowPage} )" ><img src="../images/btnS_delet.gif" width="32" height="17" border="0"></s:a>
					</td>
				</tr>
				
				</s:iterator>
				</table>
				<table align="center" style="padding-top:50px" >
					<s:if test="resultCount == 0">
					<tr>
						<td colspan="6" class="MSlist02td" align="center">검색된 결과가 없습니다.</td>
					</tr>
					</s:if>	
					<s:else>
						<tr>
						<td align="center" class="MSlist02td" colspan="6">
							<table border="0" cellspacing="0" cellpadding="0" class="page_view">
							<tr align="center">
<%--								<td width="13"><a href="#"><img src="../images/btn_first.gif" width="13" height="13" border="0"></a></td>--%>
<%--								<td width="8">&nbsp;</td>--%>
<%--								<td width="13"><a href="#"><img src="../images/btn_back.gif" width="13" height="13" border="0"></a></td>--%>
								<td width="12">&nbsp;</td>
								<td><s:property value="pagingString" escape="false" /></td>
								<td width="12">&nbsp;</td>
<%--								<td width="13"><a href="#"><img src="../images/btn_next.gif" width="13" height="13" border="0"></a></td>--%>
<%--								<td width="8">&nbsp;</td>--%>
<%--								<td width="13"><a href="#"><img src="../images/btn_end.gif" width="13" height="13" border="0"></a></td>--%>
							</tr>
							</table>
						</td>
					</tr>
					</s:else>
				</table>
			</td>
		</tr>

     	</table>
     	
     	<div >
		    <iframe id="frame1" src="../admin/listCommonCodeDet.do" scrolling="no" width="100%" height="100%" frameborder="0" align="left"></iframe> 
		</div>
     	
     	
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
