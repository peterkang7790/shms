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
body {
	margin-left: 28px;
	margin-top: 30px;
	margin-right: 0px;
	margin-bottom: 0px;
}
-->
</style>

</head>

<body bgproperties="fixed">

<s:form id="form1" namespace="/baseInfo" action="addSensor" theme="simple" method="get">

<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" background="<%=ImgPath%>bg.gif">
<tr>
	<td valign="top">
		<table width="750" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td height="32" background="<%=ImgPath%>title_bg.gif">
				<table width="740" border="0" cellspacing="0" cellpadding="0" style="padding:0px 0px 0px 5px;">
				<tr>
					<td width="20" valign="top"><img src="<%=ImgPath%>point_title_01.gif" width="20" height="17"></td>
					<td width="270" class="title_01">������� </td>
					<td width="450" class="route"><div align="right">Ȩ&nbsp;&gt;&nbsp;��������&nbsp;&gt;&nbsp;����</div></td>
				</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td height="57" valign="top">
				<table width="740" height="16" border="0" cellpadding="0" cellspacing="0" style="padding:30px 0px 0px 1px;">
				<tr>
					<td width="12" valign="middle"><img src="<%=ImgPath%>point_title_02.gif" width="5" height="13"></td>
					<td width="682" class="title_02">�Է�����</td>
				</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td><table width="750" border="0" cellpadding="0" cellspacing="1" class="MSlinetd">
				<tr>
					<td colspan="4" height="2" class="MS01td"></td>
				</tr>
				<tr>
					<td width="110" height="25" class="MS05td"><div align="center">����ID</div></td>
					<td width="230" class="MS06td" style="padding-left:5px">
						<input name="Input2272226332222432" type="text" class="box" style="width:183"> 
						<br/>
						<span id="agreeView"></span>             
					</td>
					<td class="MS05td" width="110"><div align="center">��ġ��ġ ��ǥ </div></td>
					<td width="300" class="MS06td" style="padding-left:5px">
						X:<input name="Input2272226332222432" type="text" class="box" style="width:40">
						<span class="MS06td" style="padding-left:5px">Y:
						<input name="Input22722263322224322" type="text" class="box" style="width:40">
						</span> 
						<span class="MS06td" style="padding-left:5px">Z:
						<input name="Input227222633222243222" type="text" class="box" style="width:40">
						</span>
					</td>
				</tr>
				<tr>
					<td width="110" height="25" class="MS05td"><div align="center">��ġ��ġ</div></td>
					<td colspan="3" class="MS07td" style="padding-left:5px">
						<input name="Input227222633222243" type="text" class="box" style="width:530">			
					</td>
				</tr>
				<tr>
					<td width="110" height="25" class="MS05td"><div align="center">�����Ӱ�ġ</div></td>
					<td width="230" class="MS06td" style="padding-left:5px">
						<input name="Input227222633222242" type="text" class="box" style="width:80">
						~
						<span class="MS06td" style="padding-left:5px"><input name="Input2272226332222422" type="text" class="box" style="width:80"></span>
					</td>
					<td width="110" class="MS05td"><div align="center">����Ӱ�ġ</div></td>
					<td width="300" class="MS06td" style="padding-left:5px">
						<input name="Input227222633222242" type="text" class="box" style="width:80">
						~ 
						<span class="MS06td" style="padding-left:5px"><input name="Input2272226332222422" type="text" class="box" style="width:80"></span>
					</td>
				</tr>
				<tr>
					<td width="110" height="25" class="MS05td"><div align="center">������</div></td>
					<td width="230" class="MS07td" style="padding-left:5px">
						<input name="Input22722263322224" type="text" class="box" style="width:80"></td>
					<td width="110" class="MS05td"><div align="center">�⺻��(������)</div></td>
					<td width="300" class="MS07td" style="padding-left:5px">
						<input name="Input22722263322224" type="text" class="box" style="width:80"></td>
				</tr>
				<tr>
					<td width="110" height="25" class="MS05td"><div align="center">G/F</div></td>
					<td width="230" class="MS06td" style="padding-left:5px"><input name="Input227222633222242" type="text" class="box" style="width:80"></td>
					<td width="110" class="MS05td"><div align="center">G/L</div></td>
					<td width="300" class="MS06td" style="padding-left:5px"><input name="Input227222633222242" type="text" class="box" style="width:80"></td>
				</tr>
				<tr>
					<td width="110" height="25" class="MS05td"><div align="center">ȯ�����</div></td>
					<td width="230" class="MS07td" style="padding-left:5px"><input name="Input22722263322224" type="text" class="box" style="width:80"></td>
					<td width="110" class="MS05td"><div align="center">��������</div></td>
					<td width="300" class="MS07td" style="padding-left:5px">
						<input name="Input227222633222244" type="text" class="box" style="width:80">
						~
						<span class="MS07td" style="padding-left:5px">
						<input name="Input227222633222245" type="text" class="box" style="width:80"></span>			  
					</td>
				</tr>
				<tr>
					<td width="110" height="25" class="MS05td"><div align="center">��������</div></td>
					<td width="230" class="MS06td" style="padding-left:5px">
						<select name="select1" class="box" id="select1" style="width:130px">
						<option>��������</option>
						<option>������</option>
						<option>�µ���</option>
						</select>				
					</td>
					<td width="110" class="MS05td"><div align="center">�����׸�</div></td>
					<td width="300" class="MS06td" style="padding-left:5px">
						<select name="select2" class="box" id="select2" style="width:130px">
						<option>������</option>
						<option>����</option>
						<option>�µ�</option>
						<option>����</option>
						</select>              
					</td>
				</tr>
				<tr>
					<td width="110" height="25" class="MS05td"><div align="center">������ ����</div></td>
					<td width="230" class="MS07td" style="padding-left:5px">
						<select name="select3" class="box" id="select3" style="width:130px">
						<option>���屳</option>
						<option>���屳/��ž</option>
						<option>���屳/����</option>
						<option>PSM��</option>
						<option>PSM��/����</option>
						</select>
					</td>
					<td width="110" class="MS05td"><div align="center">������</div></td>
					<td width="300" class="MS07td" style="padding-left:5px">
						<select name="select4" class="box" id="select4" style="width:130px">
						<option>������1</option>
						<option>������2</option>
						<option>������3</option>
						<option>������4</option>
						<option>������5</option>
						<option>������6</option>
						</select>				
					</td>
				</tr>
				<tr>
					<td width="110" height="25" class="MS05td"><div align="center">ä��</div></td>
					<td width="230" class="MS06td" style="padding-left:5px">
						<select name="select5" class="box" id="select5" style="width:130px">
						<option>ä��1</option>
						<option>ä��2</option>
						<option>ä��3</option>
						<option>ä��4</option>
						<option>ä��5</option>
						<option>ä��6</option>
						</select>				
					</td>
					<td width="110" class="MS05td"><div align="center">���輾��</div></td>
					<td width="300" class="MS06td" style="padding-left:5px">
						<select name="select6" class="box" id="select6" style="width:130px">
						<option></option>
						<option>SENSOR001</option>
						<option>SENSOR002</option>
						<option>SENSOR003</option>
						<option>SENSOR004</option>
						<option>SENSOR005</option>
						</select>
						<input name="Input227222633222222" type="text" class="graybox" style="width:115">
					</td>
				</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td height="57" valign="top">
				<table width="740" height="16" border="0" cellpadding="0" cellspacing="0" style="padding:30px 0px 0px 1px;">
				<tr>
					<td width="12" valign="middle"><img src="<%=ImgPath%>point_title_02.gif" width="5" height="13"></td>
					<td width="682" class="title_02">������ġ</td>
				</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td><table width="750" border="0" cellspacing="1" bgcolor="#CCCCCC" cellpadding="2">
				<tr>
					<td height="2" colspan="2" class="MS01td"></td>
				</tr>
				<tr>
					<td width="450" height="25" class="MS05td" style="padding-left:15px"><strong>���ش뱳 ���� �̹���</strong></td>
					<td width="300" class="MS05td" style="padding-left:15px"> ������ġ&nbsp;:&nbsp;&nbsp;
						X &nbsp; <input name="Input22722263322224323" type="text" class="box" style="width:40"> &nbsp;&nbsp;
						Y &nbsp; <input name="Input227222633222243223" type="text" class="box" style="width:40">
					</td>
				</tr>
				<tr>
					<td height="230" colspan="2"class="MS07td">
						<div align="center"><img src="<%=ImgPath%>img_test_sensor01.gif" width="390" height="200"></div>
					</td>
				</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td><table width="750" border="0" cellspacing="0" cellpadding="0">
				<tr><td height="20"></td></tr>
				<tr>
					<td align="center">
						<div class="text-align:center" >
						<s:submit type="image" src="../images/btn_save.gif"></s:submit>
						<s:a href="#"><img src="../images/btn_list.gif" border="0"></s:a>
						</div>
					 </td>
				</tr>
				</table>
			</td>
		</tr>
		</table>
		
		<br><br>
	</td>
</tr>
</table>

</s:form>

</body>
</html>
