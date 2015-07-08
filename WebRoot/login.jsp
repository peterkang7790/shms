<%@ page language="java" import="java.util.*" pageEncoding="EUC-KR"  contentType="text/html; charset=euc-kr"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <base href="<%=basePath%>">
	<title>SHMS</title>
	<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
	<link rel="stylesheet" href="/css/common01.css" type="text/css">
	<link href="/css/shmsStyle.css" rel="stylesheet" type="text/css"/>
	<script type="text/javascript" src="script/ComUtil.js" ></script>
	<script type="text/javascript" src="script/jquery.js"></script>
	<script type="text/javascript" src="script/script.js"></script>
	<script type="text/javascript" src="script/md5.js" language="javascript"></script>
	<script language="javascript">
	
	$(document).ready(function(){

		$('#user_id').focus();
		
		$('form').submit(function(){

			if($('#user_id').val() == ''){
				alert("ID를 입력해 주세요");		
				$('#user_id').focus();
				return false;
			}
			
			if($('#password').val() == ''){
				alert("패스워드를 입력해 주세요");		
				$('#password').focus();
				return false;
			}
		});
	});

</script>
<script language="javascript">
	function init(){
		var ID = document.getElementById("user_id");
		ID.focus();
	}
</script>
<SCRIPT LANGUAGE="JavaScript">
function checkCapsLock( e ) {
    var myKeyCode=0;
    var myShiftKey=false;
    var myMsg='Caps Lock 이 켜져 있습니다..\n\nCaps Lock 을 off 시켜 주세요.';
    
    // Internet Explorer 4+
    if ( document.all ) {
        myKeyCode=e.keyCode;
        myShiftKey=e.shiftKey;
    // Netscape 4
    } else if ( document.layers ) {
        myKeyCode=e.which;
        myShiftKey=( myKeyCode == 16 ) ? true : false;
    // Netscape 6
    } else if ( document.getElementById ) {
        myKeyCode=e.which;
        myShiftKey=( myKeyCode == 16 ) ? true : false;
    }
    
    // Upper case letters are seen without depressing the Shift key, therefore Caps Lock is on
    if ( ( myKeyCode >= 65 && myKeyCode <= 90 ) && !myShiftKey ) {
        alert( myMsg );
    // Lower case letters are seen while depressing the Shift key, therefore Caps Lock is on
    } else if ( ( myKeyCode >= 97 && myKeyCode <= 122 ) && myShiftKey ) {
        alert( myMsg );
    }
}
</script>
</head>

<body onLoad="init()">

<s:form theme="simple" namespace="/common" action="loginUser">
<div id="login_layout">
<table height="100%" width="100%"  >
<tr>
	<td align="center" valign="middle">
		<table width="595" border="0" cellspacing="0" cellpadding="0" class="loginTable" style="table-layout:fixed; word-break:break-all;">
		<tr>
			<td><img src="images/login_top.gif" /></td>
		</tr>
		<tr>
			<td><img src="images/login_top_message.gif" /></td>
		</tr>
		<tr>
			<td background="images/login_bg.gif" width="595" height="125" align="center" class="login_bg" >
				
				<table width="450" height="87" border="0" cellspacing="0" cellpadding="0" bgcolor="#f5f7fc">
				<tr>
					<td width="34" rowspan="4">&nbsp;</td>
					<td width="38" rowspan="4"><img src="images/loginkey.gif" alt="key"></td>
					<td width="52">&nbsp;</td>
					<td width="107">&nbsp;</td>
					<td width="61" rowspan="4">
						<s:submit type="image" src="images/login_btn.gif" title="loginbtn" onfocus="this.blur();"/>
					</td>
					<td width="35" rowspan="4">&nbsp;</td>
				</tr>
				<tr>
					<td><img src="images/UserID.gif" alt="userid" width="45" height="12"></td>
					<td ><input type="text" name="user_id" id="user_id" value="" style="width:102px; height:18px;"  tabindex="1"/></td>
				</tr>
				<tr>
					<td><img src="images/Password.gif" alt="password" width="45" height="11"></td>
					<td ><input type="password" name="password" id="password" onkeypress="checkCapsLock(event);" value="" style="width:102px; height:18px;" tabindex="2"/></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td width="107">&nbsp;</td>
				</tr>
				</table>

			</td>
		</tr>
		<tr>
			<td><img src="images/login_bottom.gif" /></td>
		</tr>
		</table>
	</td>
</tr>
</table>
</div>	
</s:form>	


</body>
</html>