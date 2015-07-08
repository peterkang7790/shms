<%@ page language="java" import="java.util.*" pageEncoding="EUC-KR"%>
<%
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
String bg = "";
%>
<%@taglib prefix="s" uri="/struts-tags" %>
<html>
<head>

<meta http-equiv="refresh" content="5">
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link href="../css/common01.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../script/ComUtil.js" ></script>
<script type="text/javascript" src="../script/ajax.js" ></script>
<script type="text/javascript" src="../script/jquery.js" ></script>
<script type="text/javascript" src="../script/script.js" ></script>
<script type="text/javascript" src="../script/common.js" ></script>

<style type="text/css">
<!--
body { margin-left: 10px; margin-top: 10px; margin-right: 10px; margin-bottom: 0px;}
.style3 { color: #ffa72a; font-weight: bold; }
#floater {position:absolute; visibility:visible; }
-->
</style>
<script type="text/javascript">
<!--
function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}
//-->
</script>

</head>
<script type="text/javascript">
<%--$(document).ready(function () {--%>
<%--	setTimeout("location.reload()", 5000);--%>
<%--});--%>
</script>
<body bgproperties="fixed" onLoad="MM_preloadImages('../images/panel_menu_01o.gif','../images/panel_menu_02o.gif','../images/panel_menu_03o.gif')">

<s:form name="form1" namespace="/common"  action="otherStructPop" theme="simple" method="get">

<table align="center" width="50" height="100" border="0" cellpadding="0" cellspacing="0" background="../images/bg.gif">
<tr>
	<td valign="center">
		<table width="90" align="center" border="0" cellspacing="0" bgcolor="#CCCCCC" cellpadding="0">
			<tr>
				<td height="2" class="MS01td"></td>
			</tr>
			<tr >
				<td align="center" class="MSlist03td">
					<s:if test="struct_nm==null">&nbsp;</s:if>
					<s:else><s:property value="struct_nm" /></s:else>
				</td>
			</tr>
			<tr>
	                <td><img src="../images/panel_title01.gif" width="95" height="27"></td>
	        </tr>
	        <tr>
	         	<td height="34" background="../images/panel_bg.gif" >
					<s:if test="trclass==1">
						<img src="../images/panel_check_red_ani_0.gif" width="71" height="27" style="margin:3px 0px 0px 12px;">
					</s:if>
					<s:elseif test="trclass==2">
						<img src="../images/panel_check_yellow_ani_0.gif" width="71" height="27" style="margin:3px 0px 0px 12px;">
					</s:elseif>
					<s:else>
						<img src="../images/panel_check_green.gif" width="71" height="27" style="margin:3px 0px 0px 12px;">
					</s:else>
				</td>
	         </tr>
	         <tr>
	            <td><img src="../images/panel_down.gif" width="95" height="12"></td>
	        </tr>
			<tr>
				<td height="2" class="MS01td"></td>
			</tr>
			<tr>
				<td align="center" colspan="3" class="MS02td" >
					<div class="text-align:right" >
						<s:a href="#"><img src="../images/btn_close.gif" onclick="self.close();" border="0" align="absmiddle"></s:a>
					</div>
				</td>
			</tr>
		</table>
	</td>
</tr>

</table>
</s:form>

</body>
</html>
