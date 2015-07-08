<%@ page language="java" import="java.util.*" pageEncoding="EUC-KR"%>
<%
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
String RootPath = request.getContextPath() + "/";
String ImgPath  = request.getContextPath() + "/images/";
%>
<%@taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
<title>SHMS</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link href="<%=RootPath%>css/common01.css" rel="stylesheet" type="text/css">
<script type="text/JavaScript">
<!--
	function MM_preloadImages() { //v3.0
		var d = document;
		if (d.images) {
			if (!d.MM_p) d.MM_p = new Array();
			var i, j = d.MM_p.length, a = MM_preloadImages.arguments;
			for (i = 0; i < a.length; i++)
				if (a[i].indexOf("#") != 0) {
					d.MM_p[j] = new Image;
					d.MM_p[j++].src = a[i];
				}
		}
	}
//-->
</script>
<style type="text/css">
<!--
body { margin-left: 28px; margin-top: 30px; margin-right: 0px; margin-bottom: 0px;}
.style3 { color: #ffa72a; font-weight: bold; }
-->
</style>

</head>

<body bgproperties="fixed">

<s:form id="form1" namespace="/baseInfo" action="listSensor" theme="simple" method="get">

<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" background="<%=ImgPath%>bg.gif">
<tr>
	<td valign="top">
		<table width="750" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td height="32" colspan="2" background="<%=ImgPath%>title_bg.gif">
				<table width="740" border="0" cellspacing="0" cellpadding="0" style="padding:0px 0px 0px 5px;">
				<tr>
					<td width="20" valign="top"><img src="<%=ImgPath%>point_title_01.gif" width="20" height="17"></td>
					<td width="270" class="title_01">센서</td>
					<td width="450" class="route"><div align="right">홈&nbsp;&gt;&nbsp;기준정보&nbsp;&gt;&nbsp;센서</div></td>
				</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td height="22" colspan="2">&nbsp;</td>
		</tr>
		<tr>
			<td colspan="2">
				<table width="750" border="0" cellpadding="0" cellspacing="1" class="MSlinetd">
				<tr>
					<td colspan="4" height="2" class="MS01td"></td>
				</tr>
				<tr>
					<td height="25" class="MS05td" width="110"><div align="center">센서</div></td>
					<td width="265" class="MS06td" style="padding-left:5px">
						<input name="Input22722263322222" type="text" class="box" style="width:130">
					</td>
					<td class="MS05td" width="110"><div align="center">센서종류</div></td>
					<td width="265" class="MS06td" style="padding-left:5px">
						<select name="select2" class="box" id="select2" style="width:130px">
						<option>변형율계</option>
						<option>각도계</option>
						<option>온도계</option>
						</select>
					</td>
				</tr>
				<tr>
					<td height="25" class="MS05td" width="110"><div align="center">디렉터</div></td>
					<td width="265" class="MS07td" style="padding-left:5px">
						<select name="select" class="box" id="select" style="width:130px">
						<option>디텍터1</option>
						<option>디텍터2</option>
						<option>디텍터3</option>
						<option>디텍터4</option>
						<option>디텍터5</option>
						<option>디텍터6</option>
						<option>디텍터7</option>
						<option>디텍터8</option>
						</select>
					</td>
					<td class="MS05td" width="110"><div align="center">채널</div></td>
					<td width="265" class="MS07td" style="padding-left:5px">
						<table width="110" height="24" border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td width="57">
								<select name="select3" class="box" id="select3" style="width:130px">
								<option>채널1</option>
								<option>채널2</option>
								<option>채널3</option>
								<option>채널4</option>
								<option>채널5</option>
								</select>
							</td>
							<td width="53" align="left">
								<table>
								<tr><td><a href="#"><img src="<%=ImgPath%>btnS_search.gif" width="32" height="17" border="0"></a></td></tr>
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
			<td width="500" height="57">
				<table width="490" height="16" border="0" cellpadding="0" cellspacing="0" style="padding:20px 0px 0px 1px;">
				<tr>
					<td width="12" valign="middle"><img src="<%=ImgPath%>point_title_02.gif" width="5" height="13"></td>
					<td width="478" class="title_02">센서현황 [140건] </td>
				</tr>
				</table>
			</td>
			<td width="250" valign="top" style="padding:30px 0px 0px 200px;"><a href="#"><img src="<%=ImgPath%>btn_regist.gif" width="59" height="20" border="0"></a></td>
		</tr>
		<tr>
			<td colspan="2">
				<table width="750" border="0" cellspacing="1" bgcolor="#CCCCCC" cellpadding="2">
				<tr>
					<td colspan="10" height="2" class="MS01td"></td>
				</tr>
				<tr>
					<td width="20" height="25" align="center" class="MS05td">NO</td>
					<td width="40" align="center" class="MS05td">센서</td>
					<td width="110" align="center" class="MS05td">설치위치좌표</td>
					<td width="90" align="center" class="MS05td">설치위치</td>
					<td width="70" align="center" class="MS05td">계측항목</td>
					<td width="70" align="center" class="MS05td">센서종류</td>
					<td width="70" align="center" class="MS05td">고유값</td>
					<td width="120" align="center" class="MS05td">계측범위</td>
					<td width="70" align="center" class="MS05td">기본값</td>
					<td width="90" align="center" class="MS05td">관리</td>
				</tr>
				<tr>
					<td width="20" height="22" align="center" class="MSlist02td">1</td>
					<td align="center" class="MSlist02td">SS1</td>
					<td align="center" class="MSlist02td">X:100,Y:100,Z:100</td>
					<td align="center" class="MSlist02td">주탑</td>
					<td align="center" class="MSlist02td">경사범위</td>
					<td align="center" class="MSlist02td">변형율계</td>
					<td align="center" class="MSlist02td">5104.000</td>
					<td align="center" class="MSlist02td">5104.0100~5104.0300</td>
					<td align="center" class="MSlist02td">5104.0100</td>
					<td align="center" class="MSlist02td">
						<a href="#"><img src="<%=ImgPath%>btnS_delet.gif" width="32" height="17" border="0"></a>
						<a href="#"><img src="<%=ImgPath%>btnS_view0.gif" width="32" height="17" border="0"></a>
					</td>
				</tr>
				<tr>
					<td height="22" align="center" class="MSlist03td">2</td>
					<td align="center" class="MSlist03td">SS2</td>
					<td align="center" class="MSlist03td">X:100,Y:100,Z:100</td>
					<td align="center" class="MSlist03td">주탑</td>
					<td align="center" class="MSlist03td">경사범위</td>
					<td align="center" class="MSlist03td">변형율계</td>
					<td align="center" class="MSlist03td">5104.000</td>
					<td align="center" class="MSlist03td">5104.0100~5104.0300</td>
					<td align="center" class="MSlist03td">5104.0000</td>
					<td align="center" class="MSlist03td">
						<a href="#"><img src="<%=ImgPath%>btnS_delet.gif" width="32" height="17" border="0"></a>
						<a href="#"><img src="<%=ImgPath%>btnS_view0.gif" width="32" height="17" border="0"></a>
					</td>
				</tr>
				<tr>
					<td height="22" align="center" class="MSlist02td">3</td>
					<td align="center" class="MSlist02td">SS1</td>
					<td align="center" class="MSlist02td">X:100,Y:100,Z:100</td>
					<td align="center" class="MSlist02td">주탑</td>
					<td align="center" class="MSlist02td">경사범위</td>
					<td align="center" class="MSlist02td">변형율계</td>
					<td align="center" class="MSlist02td">5104.000</td>
					<td align="center" class="MSlist02td">5104.0100~5104.0300</td>
					<td align="center" class="MSlist02td">5104.0100</td>
					<td align="center" class="MSlist02td">
						<a href="#"><img src="<%=ImgPath%>btnS_delet.gif" width="32" height="17" border="0"></a>
						<a href="#"><img src="<%=ImgPath%>btnS_view0.gif" width="32" height="17" border="0"></a>
					</td>
				</tr>
				<tr>
					<td height="22" align="center" class="MSlist03td">4</td>
					<td align="center" class="MSlist03td">SS2</td>
					<td align="center" class="MSlist03td">X:100,Y:100,Z:100</td>
					<td align="center" class="MSlist03td">주탑</td>
					<td align="center" class="MSlist03td">경사범위</td>
					<td align="center" class="MSlist03td">변형율계</td>
					<td align="center" class="MSlist03td">5104.000</td>
					<td align="center" class="MSlist03td">5104.0100~5104.0300</td>
					<td align="center" class="MSlist03td">5104.0000</td>
					<td align="center" class="MSlist03td">
						<a href="#"><img src="<%=ImgPath%>btnS_delet.gif" width="32" height="17" border="0"></a>
						<a href="#"><img src="<%=ImgPath%>btnS_view0.gif" width="32" height="17" border="0"></a>
					</td>
				</tr>
				<tr>
					<td height="22" align="center" class="MSlist02td">5</td>
					<td align="center" class="MSlist02td">SS1</td>
					<td align="center" class="MSlist02td">X:100,Y:100,Z:100</td>
					<td align="center" class="MSlist02td">주탑</td>
					<td align="center" class="MSlist02td">경사범위</td>
					<td align="center" class="MSlist02td">변형율계</td>
					<td align="center" class="MSlist02td">5104.000</td>
					<td align="center" class="MSlist02td">5104.0100~5104.0300</td>
					<td align="center" class="MSlist02td">5104.0100</td>
					<td align="center" class="MSlist02td">
						<a href="#"><img src="<%=ImgPath%>btnS_delet.gif" width="32" height="17" border="0"></a>
						<a href="#"><img src="<%=ImgPath%>btnS_view0.gif" width="32" height="17" border="0"></a>
					</td>
				</tr>
				<tr>
					<td height="22" align="center" class="MSlist03td">6</td>
					<td align="center" class="MSlist03td">SS2</td>
					<td align="center" class="MSlist03td">X:100,Y:100,Z:100</td>
					<td align="center" class="MSlist03td">주탑</td>
					<td align="center" class="MSlist03td">경사범위</td>
					<td align="center" class="MSlist03td">변형율계</td>
					<td align="center" class="MSlist03td">5104.000</td>
					<td align="center" class="MSlist03td">5104.0100~5104.0300</td>
					<td align="center" class="MSlist03td">5104.0000</td>
					<td align="center" class="MSlist03td">
						<a href="#"><img src="<%=ImgPath%>btnS_delet.gif" width="32" height="17" border="0"></a>
						<a href="#"><img src="<%=ImgPath%>btnS_view0.gif" width="32" height="17" border="0"></a>
					</td>
				</tr>
				<tr>
					<td height="22" align="center" class="MSlist02td">7</td>
					<td align="center" class="MSlist02td">SS1</td>
					<td align="center" class="MSlist02td">X:100,Y:100,Z:100</td>
					<td align="center" class="MSlist02td">주탑</td>
					<td align="center" class="MSlist02td">경사범위</td>
					<td align="center" class="MSlist02td">변형율계</td>
					<td align="center" class="MSlist02td">5104.000</td>
					<td align="center" class="MSlist02td">5104.0100~5104.0300</td>
					<td align="center" class="MSlist02td">5104.0100</td>
					<td align="center" class="MSlist02td">
						<a href="#"><img src="<%=ImgPath%>btnS_delet.gif" width="32" height="17" border="0"></a>
						<a href="#"><img src="<%=ImgPath%>btnS_view0.gif" width="32" height="17" border="0"></a>
					</td>
				</tr>
				<tr>
					<td height="22" align="center" class="MSlist03td">8</td>
					<td align="center" class="MSlist03td">SS2</td>
					<td align="center" class="MSlist03td">X:100,Y:100,Z:100</td>
					<td align="center" class="MSlist03td">주탑</td>
					<td align="center" class="MSlist03td">경사범위</td>
					<td align="center" class="MSlist03td">변형율계</td>
					<td align="center" class="MSlist03td">5104.000</td>
					<td align="center" class="MSlist03td">5104.0100~5104.0300</td>
					<td align="center" class="MSlist03td">5104.0000</td>
					<td align="center" class="MSlist03td">
						<a href="#"><img src="<%=ImgPath%>btnS_delet.gif" width="32" height="17" border="0"></a>
						<a href="#"><img src="<%=ImgPath%>btnS_view0.gif" width="32" height="17" border="0"></a>
					</td>
				</tr>
				<tr>
					<td height="22" align="center" class="MSlist02td">9</td>
					<td align="center" class="MSlist02td">SS1</td>
					<td align="center" class="MSlist02td">X:100,Y:100,Z:100</td>
					<td align="center" class="MSlist02td">주탑</td>
					<td align="center" class="MSlist02td">경사범위</td>
					<td align="center" class="MSlist02td">변형율계</td>
					<td align="center" class="MSlist02td">5104.000</td>
					<td align="center" class="MSlist02td">5104.0100~5104.0300</td>
					<td align="center" class="MSlist02td">5104.0100</td>
					<td align="center" class="MSlist02td">
						<a href="#"><img src="<%=ImgPath%>btnS_delet.gif" width="32" height="17" border="0"></a>
						<a href="#"><img src="<%=ImgPath%>btnS_view0.gif" width="32" height="17" border="0"></a>
					</td>
				</tr>
				<tr>
					<td height="22" align="center" class="MSlist03td">10</td>
					<td align="center" class="MSlist03td">SS2</td>
					<td align="center" class="MSlist03td">X:100,Y:100,Z:100</td>
					<td align="center" class="MSlist03td">주탑</td>
					<td align="center" class="MSlist03td">경사범위</td>
					<td align="center" class="MSlist03td">변형율계</td>
					<td align="center" class="MSlist03td">5104.000</td>
					<td align="center" class="MSlist03td">5104.0100~5104.0300</td>
					<td align="center" class="MSlist03td">5104.0000</td>
					<td align="center" class="MSlist03td">
						<a href="#"><img src="<%=ImgPath%>btnS_delet.gif" width="32" height="17" border="0"></a>
						<a href="#"><img src="<%=ImgPath%>btnS_view0.gif" width="32" height="17" border="0"></a>
					</td>
				</tr>
				</table>
			</td>
		</tr>
		<tr><td></td></tr>
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
							<td width="13"><a href="#"><img src="<%=ImgPath%>btn_first.gif" width="13" height="13" border="0"></a></td>
							<td width="8">&nbsp;</td>
							<td width="13"><a href="#"><img src="<%=ImgPath%>btn_back.gif" width="13" height="13" border="0"></a></td>
							<td width="12">&nbsp;</td>
							<td><span class="style3">1</span></td>
							<td width="12">&nbsp;</td>
							<td><a href="#">2</a></td>
							<td width="12">&nbsp;</td>
							<td><a href="#">3</a></td>
							<td width="12">&nbsp;</td>
							<td><a href="#">4</a></td>
							<td width="12">&nbsp;</td>
							<td><a href="#">5</a></td>
							<td width="12">&nbsp;</td>
							<td><a href="#">6</a></td>
							<td width="12">&nbsp;</td>
							<td><a href="#">7</a></td>
							<td width="12">&nbsp;</td>
							<td><a href="#">8</a></td>
							<td width="12">&nbsp;</td>
							<td><a href="#">9</a></td>
							<td width="12">&nbsp;</td>
							<td><a href="#">10</a></td>
							<td width="12">&nbsp;</td>
							<td width="13"><a href="#"><img src="<%=ImgPath%>btn_next.gif" width="13" height="13" border="0"></a></td>
							<td width="8">&nbsp;</td>
							<td width="13"><a href="#"><img src="<%=ImgPath%>btn_end.gif" width="13" height="13" border="0"></a></td>
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

</body>
</html>