<%@ page language="java" import="java.util.*" pageEncoding="EUC-KR"%>
<%
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
%>
<%@taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
<title>SHMS</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link href="../css/common01.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../script/ComUtil.js" ></script>
<script type="text/javascript" src="../script/jquery.js" ></script>
<script type="text/javascript" src="../script/script.js" ></script>
<script type="text/javascript">
	function commonCdChk(common_cd){
		toUpper(common_cd);
		$('#agreeView').load('../admin/commonCdChk.do', {common_cd:common_cd.value});
	}

	$(document).ready(function(){
		var changeTBCheckedVal = $("#table_id option:selected").val();
		if(changeTBCheckedVal == null || changeTBCheckedVal == undefined || changeTBCheckedVal == ""  ){
			$('#fId').hide();
		}
		$("#table_id").change(onSelectChange);
	
    });  

    function onSelectChange(){  

		var selected = $("#table_id option:selected");       

	if(selected.val() != 0){
	
		$('#fId').show();	 

		var parameter = selected.val();

		$('#fieldView').load('../admin/selectField.do', {table_id:parameter});
//		var url = "addViewCommonCode.do?table_nm=" + parameter;
//		$('#formV').method = "post";
//		$('#formV').target = "_self";
//		$('#formV').action = url;
//		$('#formV').submit();

	}
  }
</script>
<style type="text/css">
<!--
body { margin-left: 0px; margin-top: 0px; margin-right: 0px; margin-bottom: 0px;}
-->
</style>

</head>

<body bgproperties="fixed">

<s:form id="formV" name="form1" namespace="/admin"  action="addViewCommonCode" theme="simple" method="get">

<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" background="../images/bg.gif">
<tr>
	<td valign="top">
		<table width="400" height="250" border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td width="250" height="40" background="../images/popup_img_bg.gif">
				<table width="400" height="40" border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td width="32"><img src="../images/popup_img_point.gif" width="32" height="40"></td>
					<td width="198" class="popup_title" style="padding-top:4px">공통코드 등록</td>
					<td width="170"><img src="../images/popup_img_text.gif" width="170" height="40"></td>
				</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td height="6" bgcolor="#d7edf9"></td>
		</tr>
		<tr>
			<td height="204" valign="top" bgcolor="#FFFFFF" style="padding:40px 0px 0px 40px;">
				<table width="320" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td><table width="320" border="0" cellpadding="0" cellspacing="1" class="MSlinetd">
						<tr>
							<td colspan="2" height="2" class="MS01td"></td>
						</tr>
						<tr>
							<td height="25" class="MS05td" width="110"><div align="center">공통코드ID</div></td>
							<td width="260" class="MS07td" style="padding-left:5px">
								<input type="text" name="common_cd" id="common_cd" class="box" style="width:130" onblur="javascript:commonCdChk(this)">
								<br>
								<span id="agreeView"></span>
							</td>
						</tr>
						<tr>
							<td height="25" class="MS05td" width="110"><div align="center">공통코드명</div></td>
							<td width="265" class="MS07td" style="padding-left:5px">
								<input type="text" name="common_nm" id="common_nm" class="box" style="width:130">
							</td>
						</tr>
						<tr>
							<td height="25" class="MS05td" width="110"><div align="center">코드유형</div></td>
							<td width="265" class="MS07td" style="padding-left:5px">
								<s:select name="common_det_cd" id="common_det_cd" list="common_det_cd_list" listKey="common_det_cd" listValue="common_det_nm" headerKey="" headerValue="--코드유형선택--" cssStyle="width:130px"></s:select>
							</td>
						</tr>
						<tr>
							<td height="25" class="MS05td" width="110"><div align="center">테이블명</div></td>
							<td width="265" class="MS07td" style="padding-left:5px">
								<s:select name="table_id" id="table_id" list="table_nm_list" listKey="table_id" listValue="table_name" headerKey="" headerValue="--테이블명선택--" cssStyle="width:130px"></s:select>
							</td>
						</tr>
					
						<tr id="fId">
							<td height="25" class="MS05td" width="110"><div align="center">필드명</div></td>
							<td width="265" class="MS07td" style="padding-left:5px">
								<div id="fieldView"></div>
							</td>
						</tr>
						<tr>
							<td height="25" class="MS05td" width="110"><div align="center">길이</div></td>
							<td width="265" class="MS07td" style="padding-left:5px">
								<s:select name="nm" id="nm" list="nm_list" listKey="len" listValue="nm" headerKey="" headerValue="--길이선택--" cssStyle="width:130px"></s:select>
							</td>
						</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td height="30"></td>
				</tr>
				<tr>
					<td align="center">
						<div class="text-align:center" >
						<s:url id="admin" action="addCommonCode">
						<s:param name="common_cd" value="common_cd" />
						</s:url>
						<s:submit type="image" src="../images/btn_save.gif"></s:submit>
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
