<%@ page language="java" import="java.util.*" pageEncoding="EUC-KR"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />

<script language="JavaScript">
<!--
function toggleMenu(currMenu) {
        if (document.all) {
                thisMenu = eval("document.all." + currMenu + ".style")
                if (thisMenu.display == "block") {
                        thisMenu.display = "none"
                }
                else {
                        thisMenu.display = "block"
                }
                return false
        }
        else {
                return true
        }
}
//-->
</script>
<STYLE TYPE="TEXT/CSS">
#menu1 {display:none;}
#menu2 {display:none;}
#menu3 {display:none;}
#menu2_1 {display:none;}
#menu1_1 {display:none;}
</STYLE>
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
	<%@ include file = "../pda/pdaTop.jsp" %>
	</td>
</tr>

<tr>
<td colspan="3">
<div id="content">

	<div id="subTitle"><img src="../pdaImages/sub_title_icon.gif"/>계측현황</div>
	
	
	<table width="235" border="0" cellspacing="1" cellpadding="0" class="treeTable"> 
	  <tr >
	    <td style="background-color:#82add9;"><a href="listStatus1_2.jsp" ><b>보강형</b></a></td>
	  </tr>	
	  <tr id="menu1">
	    <td style="background-color:#cbdef2;"><a href="#" onClick="return toggleMenu('menu1_1')">&nbsp;&nbsp;&nbsp;경사변위</a></td>
	  </tr>
	  <tr id="menu1_1">
	    <td  ><a href="detailStatGrap.jsp">&nbsp;&nbsp;&nbsp;&nbsp;경사변위111</a></td>
	  </tr>
	
	  <tr>
	    <td style="background-color:#82add9;"><a href="#"  onClick="return toggleMenu('menu2')"><b>주탑</b></a></td>
	  </tr>

	  <tr>
	    <td style="background-color:#82add9;"><a href="#"><b>케이블</b></a></td>
	  </tr>
	
	
	</table>
</div>


</td>
</tr>


<tr>
<td colspan="3" id="footer">Copyright (c) LSware Inc. </td>
</tr>
</table>



</body>
</html>
