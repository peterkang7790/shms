<%@ page language="java" import="java.util.*" pageEncoding="EUC-KR"  contentType="text/html; charset=euc-kr"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>



<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@taglib prefix="s" uri="/struts-tags" %>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<title>도시건전성모니터링시스템</title>
<link href="../css/pdaStyle.css" rel="stylesheet" type="text/css"/>
</head>

<body>
<table width="240px" border="0" cellspacing="0" cellpadding="0" class="cTable"  style="table-layout:fixed; word-break:break-all;">
<tr>
<th width="107px"><img src="../pdaImages/pda_top_logo.jpg" width="107"/></th><th width="7px" background="../pdaImages/pda_bg.jpg">&nbsp;</th><th width="126px"><img src="../pdaImages/pda_top_right.jpg" width="126"/></th>
</tr>
<tr>
	<td colspan="3" id="tabsBg">			
	<div id="tabs">
		<ul>
			<!-- CSS Tabs -->
			<li id="current"><a href="Home.html"><span>경보현황</span></a></li>
			<li><a href="Products.html"><span>경보이력</span></a></li>
			<li><a href="Services.html"><span>계측현황</span></a></li>
		</ul>
	</div>
	</td>
</tr>

<tr>
<td colspan="3">
<div id="subTitle"><img src="../pdaImages/sub_title_icon.gif"/>경보현황</div>

<fieldset ><legend>구조물경보상태</legend>위험(0건) 경고(1건) 주의(3건) 안전(20건)</fieldset>
<table width="235" border="0" cellspacing="0" cellpadding="0" class="contentTable"  style="table-layout:fixed; word-break:break-all;">
  <tr>
    <th width="35">NO</th>
    <th width="90">센서</th>
    <th width="70">장애<br/>발생시간</th>
    <th width="40">위험<br/>상태</th>
  </tr>
  <tr>
    <td id="cenText">1</td>
    <td>2축경사계</td>
    <td>10-29 23:00</td>
    <td id="cenText">위험</td>
  </tr>
  <tr>
    <td id="cenText">2</td>
    <td>1축 가속도계</td>
    <td>10-24 10:00</td>

    <td id="cenText">주의</td>

  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>

    <td>&nbsp;</td>
 
  </tr>
</table>

</td>
</tr>


<tr>
<td colspan="3" id="footer">copyright </td>
</tr>
</table>



</body>
</html>
