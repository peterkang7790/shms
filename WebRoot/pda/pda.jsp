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
<title>���ð���������͸��ý���</title>
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
			<li id="current"><a href="Home.html"><span>�溸��Ȳ</span></a></li>
			<li><a href="Products.html"><span>�溸�̷�</span></a></li>
			<li><a href="Services.html"><span>������Ȳ</span></a></li>
		</ul>
	</div>
	</td>
</tr>

<tr>
<td colspan="3">
<div id="subTitle"><img src="../pdaImages/sub_title_icon.gif"/>�溸��Ȳ</div>

<fieldset ><legend>�������溸����</legend>����(0��) ���(1��) ����(3��) ����(20��)</fieldset>
<table width="235" border="0" cellspacing="0" cellpadding="0" class="contentTable"  style="table-layout:fixed; word-break:break-all;">
  <tr>
    <th width="35">NO</th>
    <th width="90">����</th>
    <th width="70">���<br/>�߻��ð�</th>
    <th width="40">����<br/>����</th>
  </tr>
  <tr>
    <td id="cenText">1</td>
    <td>2�����</td>
    <td>10-29 23:00</td>
    <td id="cenText">����</td>
  </tr>
  <tr>
    <td id="cenText">2</td>
    <td>1�� ���ӵ���</td>
    <td>10-24 10:00</td>

    <td id="cenText">����</td>

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
