<%@ page language="java" import="java.util.*" pageEncoding="EUC-KR"%>
<%
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
String bg = "";
%>
<%@taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
<title>SHMS</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link href="../css/common01.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
body { margin-left: 0px; margin-top: 0px; margin-right: 0px; margin-bottom: 0px;}
-->
</style>

</head>

<body bgproperties="fixed">

<s:form name="form1" namespace="/instManage"  action="rptRtStatsenchoicePop" theme="simple" method="get">

<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" background="../images/bg.gif">
<tr>
	<td valign="top">
		<table width="790" height="250" border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td width="250" height="40" background="../images/popup_img_bg.gif">
				<table width="500" height="40" border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td width="32"><img src="../images/popup_img_point.gif" width="32" height="40"></td>
					<td width="198" class="popup_title" style="padding-top:4px">센서선택</td>
					<td width="170"><img src="../images/popup_img_text.gif" width="170" height="40"></td>
				</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td height="6" bgcolor="#d7edf9"></td>
		</tr>
		<tr>
			<td height="790" valign="top" bgcolor="#FFFFFF" style="padding:10px 0px 0px 6px;">
				<table width="790" border="0" cellspacing="1" bgcolor="#CCCCCC" cellpadding="2">
				<tr>
					<td colspan="6" height="2" class="MS01td"></td>
				</tr>
				<tr>
					<td width="40" height="25" align="center" class="MS05td" style="padding-left:5px">선택</td>
					<td width="150" align="center" class="MS05td" style="padding-left:5px">센서ID</td>
					<td width="150" align="center" class="MS05td" style="padding-left:5px">센서명</td>
					<td width="150" align="center" class="MS05td" style="padding-left:5px">연계센서</td>
					<td width="150" align="center" class="MS05td" style="padding-left:5px">연계센서명</td>
					<td width="80" align="center" class="MS05td" style="padding-left:5px">연관유무</td>
				</tr>
				<tr>
					<td height="22" align="center" class="MSlist02td">
						<div align="center">
							   <input type="checkbox" name="checkbox1_1" value="checkbox1_1" />
						</div>
					</td>
					<td align="center" class="MSlist02td">
					STEST003
					</td>
					<td align="center" class="MSlist02td">
					변형율
					</td>
					<td align="center" class="MSlist02td">
					STEST001
					</td>
					<td align="center" class="MSlist02td">
					온도계
					</td>
					<td align="center" class="MSlist02td">
						<div align="center">
							   <input type="checkbox" name="checkbox1_1" value="checkbox1_1" />
						</div>
					</td>
				</tr>
				<tr>
					<td height="22" align="center" class="MSlist02td">
						<div align="center">
							   <input type="checkbox" name="checkbox1_1" value="checkbox1_1" />
						</div>
					</td>
					<td align="center" class="MSlist02td">
					STEST003
					</td>
					<td align="center" class="MSlist02td">
					변형율
					</td>
					<td align="center" class="MSlist02td">
					STEST001
					</td>
					<td align="center" class="MSlist02td">
					온도계
					</td>
					<td align="center" class="MSlist02td">
						<div align="center">
							   <input type="checkbox" name="checkbox1_1" value="checkbox1_1" />
						</div>
					</td>
				</tr>
				<tr>
					<td height="22" align="center" class="MSlist02td">
						<div align="center">
							   <input type="checkbox" name="checkbox1_1" value="checkbox1_1" />
						</div>
					</td>
					<td align="center" class="MSlist02td">
					STEST003
					</td>
					<td align="center" class="MSlist02td">
					변형율
					</td>
					<td align="center" class="MSlist02td">
					STEST001
					</td>
					<td align="center" class="MSlist02td">
					온도계
					</td>
					<td align="center" class="MSlist02td">
						<div align="center">
							   <input type="checkbox" name="checkbox1_1" value="checkbox1_1" />
						</div>
					</td>
				</tr>
				<tr>
					<td height="22" align="center" class="MSlist02td">
						<div align="center">
							   <input type="checkbox" name="checkbox1_1" value="checkbox1_1" />
						</div>
					</td>
					<td align="center" class="MSlist02td">
					STEST003
					</td>
					<td align="center" class="MSlist02td">
					변형율
					</td>
					<td align="center" class="MSlist02td">
					STEST001
					</td>
					<td align="center" class="MSlist02td">
					온도계
					</td>
					<td align="center" class="MSlist02td">
						<div align="center">
							   <input type="checkbox" name="checkbox1_1" value="checkbox1_1" />
						</div>
					</td>
				</tr>
				</table>
				
				<table align="center" style="padding-top:50px" >
					<s:if test="resultCount == 0">
					<tr>
						<td colspan="5" class="MSlist02td" align="center">검색된 결과가 없습니다.</td>
					</tr>
					</s:if>	
					<s:else>
						<tr>
						<td align="center" class="MSlist02td" colspan="6">
							<table border="0" cellspacing="0" cellpadding="0" class="page_view">
							<tr align="center">
								<td width="13"><a href="#"><img src="../images/btn_first.gif" width="13" height="13" border="0"></a></td>
								<td width="8">&nbsp;</td>
								<td width="13"><a href="#"><img src="../images/btn_back.gif" width="13" height="13" border="0"></a></td>
								<td width="12">&nbsp;</td>
								<td><s:property value="pagingString" escape="false" /></td>
								<td width="12">&nbsp;</td>
								<td width="13"><a href="#"><img src="../images/btn_next.gif" width="13" height="13" border="0"></a></td>
								<td width="8">&nbsp;</td>
								<td width="13"><a href="#"><img src="../images/btn_end.gif" width="13" height="13" border="0"></a></td>
							</tr>
							</table>
						</td>
					</tr>
					</s:else>
					<tr>
						<td height="60"></td>
					</tr>
					<tr>
						<td align="right">
							<div class="text-align:right" >
								<s:a href="#"><img src="../images/btn_close.gif" onclick="self.close();" border="0"></s:a>
							</div>
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

</body>
</html>