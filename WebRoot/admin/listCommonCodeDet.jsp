<%@ page language="java" import="java.util.*" pageEncoding="EUC-KR"%>
<%
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
String ImgPath  = request.getContextPath() + "/images/";
String RootPath = request.getContextPath() + "/";
String bg = "";
%>
<%@taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
<title>SHMS</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link href="../css/common01.css" rel="stylesheet" type="text/css">
<script  type="text/javascript" src="../script/ComUtil.js" ></script>
<style type="text/css">
<!--
body { margin-left: 0px; margin-top: 0px; margin-right: 0px; margin-bottom: 0px;}
.style3 { color: #ffa72a; font-weight: bold; }
-->
</style>
<script type="text/javascript">
	function delCommonDet(common_cd, common_det_cd, rowNo) {
		var url = "delCommonDet.do?common_cd=" + common_cd + "&common_det_cd="+common_det_cd+"&nowPage=" + rowNo;
		if (confirm("정말로 삭제하시겠습니까?\n(하위정보도같이 삭제 됩니다.)")) {
			listCommonCodeDet.method = "post";
			listCommonCodeDet.target = "_self";
			listCommonCodeDet.action = url;
			listCommonCodeDet.submit();
		}
		else {
			// 취소 버튼을 눌렀을 때 실행
			return false;
		}  
	}
	
</script>

</head>

<body bgproperties="fixed">

<table width="750" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td width="500" height="10">
				<table width="490" height="16" border="0" cellpadding="0" cellspacing="0" style="padding:0px 0px 0px 0px;">
				<tr>
					<td width="12" valign="middle"><img src="../images/point_title_02.gif" width="5" height="13"></td>
					<td width="478" class="title_02">공통코드 상세 [<s:property value="resultCountP" />건]</td>
				</tr>
				</table>
			</td>
			<td width="250" valign="top" style="padding:0px 0px 0px 200px;">
				<a href="javascript:MM_openBrWindow('addViewCommonCodeDet.do','','width=400,height=250,resizable=yes');">
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
					<td align="center" class="MS05td">상세코드</td>
					<td align="center" class="MS05td">상세코드명</td>
					<td width="140" align="center" class="MS05td">표시명</td>
					<td width="60" align="center" class="MS05td" id="dt_view">관리</td>
				</tr>
				
				<s:iterator value="listCommonCodeDet" status="stat">
				<s:if test="rnum%2==0"> <% bg = "MSlist03td"; %> </s:if><s:else> <% bg = "MSlist02td"; %> </s:else>
				
				<tr>
					<td height="22" align="center" class="<%=bg%>"><s:if test="rnum==null">&nbsp;</s:if><s:else><s:property value="rnum" /></s:else></td>
					<td align="center" class="<%=bg%>"><s:if test="common_det_cd==null">&nbsp;</s:if><s:else><s:property value="common_det_cd" /></s:else></td>
					<td align="center" class="<%=bg%>"><s:if test="common_det_nm==null">&nbsp;</s:if><s:else><s:property value="common_det_nm" /></s:else></td>
					<td align="center" class="<%=bg%>"><s:if test="disp_nm==null">&nbsp;</s:if><s:else><s:property value="disp_nm" /></s:else></td>
					<td align="center" class="<%=bg%>">
					<!--  
						<s:a href="detailCommonDet.do?common_cd=%{common_cd}&common_det_cd=%{comon_det_cd}"><img src="../images/btnS_view0.gif" width="32" height="17" border="0"></s:a>
					-->	
						<s:url id="delCommonDet" action="delCommonDet">
						<s:param name="common_cd" value="common_cd"/>
						<s:param name="common_det_cd" value="common_det_cd"/>
						</s:url>
						<s:a href="#" onclick="delCommonDet( '%{common_cd}','%{common_det_cd}',%{reqMap.nowPage} )" >
				        <img src="../images/btnS_delet.gif" width="32" height="17" border="0">
				        </s:a>
				    </td>
				</tr>
				
				</s:iterator>
				<table align="center" style="padding-top:50px" >
					<s:if test="resultCountP == 0">
						<tr>
							<td colspan="5" class="MSlist02td" align="center">검색된 결과가 없습니다.</td>
						</tr>
					</s:if>	
					<s:else>
						<td  colspan="5" align="center" class="MSlist02td">
							<table border="0" cellspacing="1" cellpadding="0" class="page_view" >
							<tr align="center">
								<td width="12">&nbsp;</td>
								<td><s:property value="pagingString" escape="false" /></td>
								<td width="12">&nbsp;</td>
							</tr>
							</table>
						</td>
					</s:else>
				</table>
				</table>
				
				
			</td>
		</tr>
		</table>
</body>
</html>