<%@ page language="java" import="java.util.*" pageEncoding="EUC-KR"%>
<%
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
%>
<%@taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
<title>PassWord 수정하기</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link href="../css/common01.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../script/ComUtil.js" ></script>
<script type="text/javascript" src="../script/jquery.js" ></script>
<script type="text/javascript" src="../script/script.js" ></script>
<script type="text/javascript">
var  globalNew = ""; 
	function passwordCdChk(pass_old){
//		toUpper(common_cd);

        if( pass_old == null || pass_old == "" || pass_old == undefined )
        {
			alert("기존 Password를 입력해주세요");
			$('#pass_old').focus();
			return false;
        }
        else
        {
        	$('#agreeView').load('../admin/passwordCdChk.do', {password:pass_old.value});
        }
		
	}

	
	function passwordNew(o)
	{
		globalNew = o.value;
	}
	
    function passwordNewchk(pass_cfm){

    	var passcfm = pass_cfm.value;

    	
    	if( globalNew == null || globalNew == "" || globalNew == undefined )
    	{
			alert("신규지정 Password를 입력해주세요");
			$('#pass_new').focus();
			return false;
    	}
    	else
    	{
        	if( passcfm == null || passcfm == "" || passcfm == undefined )
        	{
        		alert("확인 Password를 입력해주세요");
        		$('#pass_cfm').focus();
        		return false;
        	}
        	else
        	{
        		if( passcfm != globalNew )
        		{
        			alert("Password가 상이합니다. 확인후 다시 입력해 주세요");
        			$('#pass_cfm').focus();
        			return false;
        		}
         	}
    		
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

<s:form id="formV" name="form1" namespace="/admin"  action="editPassWord" theme="simple" method="get">

<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" background="../images/bg.gif">
<tr>
	<td valign="top">
		<table width="400" height="250" border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td width="250" height="40" background="../images/popup_img_bg.gif">
				<table width="400" height="40" border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td width="32"><img src="../images/popup_img_point.gif" width="32" height="40"></td>
					<td width="198" class="popup_title" style="padding-top:4px">Password 수정</td>
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
							<td height="25" class="MS05td" width="110"><div align="center">기존 Password</div></td>
							<td width="260" class="MS07td" style="padding-left:5px">
								<input type="password" name="pass_old" id="pass_old" class="box" style="width:130" onblur="javascript:passwordCdChk(this);">
								<br>
								<span id="agreeView"></span>
							</td>
						</tr>
						<tr>
							<td height="25" class="MS05td" width="110"><div align="center">신규 Password</div></td>
							<td width="265" class="MS07td" style="padding-left:5px">
								<input type="password" name="pass_new" id="pass_new" class="box" style="width:130" onblur="javascript:passwordNew(this);">
							</td>
						</tr>
						<tr>
							<td height="25" class="MS05td" width="110"><div align="center">확인 Password</div></td>
							<td width="265" class="MS07td" style="padding-left:5px">
								<input type="password" name="pass_cfm" id="pass_cfm" class="box" style="width:130" onblur="javascript:passwordNewchk(this);">
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
						<s:url id="admin" action="editPassWord">
						<s:param name="pass_cfm" value="pass_cfm" />
						<s:param name="user_id" value="user_id" />
						</s:url>
						<s:submit type="image" src="../images/btn_modify.gif"></s:submit>
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
