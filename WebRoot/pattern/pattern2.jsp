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

<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" background="../images/bg.gif">
<tr>
	<td valign="top">
		<table width="750" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td width="1220" height="32" colspan="4" background="../images/title_bg.gif">
				<table width="740" border="0" cellspacing="0" cellpadding="0" style="padding:0px 0px 0px 5px;">
				<tr>
					<td width="20" valign="top"><img src="../images/point_title_01.gif" width="20" height="17"></td>
					<td width="270" class="title_01">사용자별 접근권한 리스트</td>
					<td width="450" class="route"><div align="right">홈 &nbsp;&gt;&nbsp; Admin &nbsp;&gt;&nbsp; 접근권한</div></td>
				</tr>
				</table>			</td>
		</tr>
		<tr>
			<td height="22" colspan="4">&nbsp;</td>
		</tr>
		<tr>
		  <td height="22" colspan="4"><table width="750" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="240" height="57"><table width="240" height="16" border="0" cellpadding="0" cellspacing="0" style="padding:20px 0px 0px 1px;">
                  <tr>
                    <td width="12" valign="middle"><img src="../images/point_title_02.gif" width="5" height="13" /></td>
                    <td width="228" class="title_02">사용자 현황 </td>
                  </tr>
              </table></td>
              <td width="50">&nbsp;</td>
              <td width="230"><table width="260" height="16" border="0" cellpadding="0" cellspacing="0" style="padding:20px 0px 0px 1px;">
                <tr>
                  <td width="12" valign="middle"><img src="../images/point_title_02.gif" width="5" height="13" /></td>
                  <td width="248" class="title_02">메뉴별 접근권한 현황 </td>
                </tr>
              </table></td>
              <td width="150"style="padding:30px 0px 0px 100px;">
                <input name="image2" type="image" id="image" value="Submit" src="../images/btn_save.gif" alt="Submit"/>
              </td>
            </tr>
            <tr>
              <td valign="top"><table width="240" border="0" cellspacing="1" bgcolor="#CCCCCC" cellpadding="2">
                <tr>
                  <td colspan="3" height="2" class="MS01td"></td>
                </tr>
                <tr>
                  <td width="20" height="25" align="center" class="MS05td">NO</td>
                  <td width="90" align="center" class="MS05td">사용자ID</td>
                  <td width="130" align="center" class="MS05td">사용자명</td>
                </tr>
                <tr>
                  <td height="22" align="center" class="MSlist02td">1</td>
                  <td align="center" class="MSlist02td"><a href="#">1111</a> </td>
                  <td align="center" class="MSlist02td"><a href="#">강평희</a> </td>
                </tr>
                <tr>
                  <td height="22" align="center" class="MSlist03td">2</td>
                  <td align="center" class="MSlist03td"><a href="#">2222</a> </td>
                  <td align="center" class="MSlist03td"><a href="#">TESTER</a> </td>
                </tr>
                <tr>
                  <td height="22" align="center" class="MSlist02td">3</td>
                  <td align="center" class="MSlist02td"><a href="#">3333</a> </td>
                  <td align="center" class="MSlist02td"><a href="#">3333</a> </td>
                </tr>
                <tr>
                  <td height="22" align="center" class="MSlist03td">4</td>
                  <td align="center" class="MSlist03td"><a href="#">admin</a> </td>
                  <td align="center" class="MSlist03td"><a href="#">관리자</a> </td>
                </tr>
                <tr>
                  <td height="22" align="center" class="MSlist02td">5</td>
                  <td align="center" class="MSlist02td"><a href="#">kevin</a> </td>
                  <td align="center" class="MSlist02td"><a href="#">김종범</a> </td>
                </tr>
              </table></td>
              <td>&nbsp;</td>
              <td colspan="2"><table width="460" border="0" cellspacing="1" bgcolor="#CCCCCC" cellpadding="2">
                <tr>
                  <td colspan="4" height="2" class="MS01td"></td>
                </tr>
                <tr>
                  <td width="20" height="25" align="center" class="MS05td">NO</td>
                  <td width="100" align="center" class="MS05td">메뉴ID</td>
                  <td width="240" align="center" class="MS05td">메뉴명</td>
                  <td width="100" align="center" class="MS05td">접근권한</td>
                </tr>
                <tr>
                  <td height="22" align="center" class="MSlist02td">1</td>
                  <td align="center" class="MSlist02td">1000</td>
                  <td align="center" class="MSlist02td">기준정보</td>
                  <td align="center" class="MSlist02td"> Y </td>
                </tr>
                <tr>
                  <td height="22" align="center" class="MSlist03td">2</td>
                  <td align="center" class="MSlist03td">1100</td>
                  <td align="center" class="MSlist03td">구조물</td>
                  <td align="center" class="MSlist03td"> Y </td>
                </tr>
                <tr>
                  <td height="22" align="center" class="MSlist02td">3</td>
                  <td align="center" class="MSlist02td">1200</td>
                  <td align="center" class="MSlist02td">디텍터</td>
                  <td align="center" class="MSlist02td"> Y </td>
                </tr>
                <tr>
                  <td height="22" align="center" class="MSlist03td">4</td>
                  <td align="center" class="MSlist03td">1300</td>
                  <td align="center" class="MSlist03td">센서</td>
                  <td align="center" class="MSlist03td"> Y </td>
                </tr>
                <tr>
                  <td height="22" align="center" class="MSlist02td">5</td>
                  <td align="center" class="MSlist02td">2000</td>
                  <td align="center" class="MSlist02td">계측현황</td>
                  <td align="center" class="MSlist02td"> Y </td>
                </tr>
                <tr>
                  <td height="22" align="center" class="MSlist03td">6</td>
                  <td align="center" class="MSlist03td">2100</td>
                  <td align="center" class="MSlist03td">실시간통계</td>
                  <td align="center" class="MSlist03td"> Y </td>
                </tr>
                <tr>
                  <td height="22" align="center" class="MSlist02td">7</td>
                  <td align="center" class="MSlist02td">2200</td>
                  <td align="center" class="MSlist02td">주기별통계</td>
                  <td align="center" class="MSlist02td"> Y </td>
                </tr>
                <tr>
                  <td height="22" align="center" class="MSlist03td">8</td>
                  <td align="center" class="MSlist03td">3000</td>
                  <td align="center" class="MSlist03td">센서현황</td>
                  <td align="center" class="MSlist03td"> Y </td>
                </tr>
                <tr>
                  <td height="22" align="center" class="MSlist02td">9</td>
                  <td align="center" class="MSlist02td">3100</td>
                  <td align="center" class="MSlist02td">센서현황</td>
                  <td align="center" class="MSlist02td"> Y </td>
                </tr>
              </table></td>
            </tr>
            
          </table></td>
		  </tr>
		</table>
	</td>
</tr>
</table>

</body>
</html>