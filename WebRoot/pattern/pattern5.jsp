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
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
-->
</style>

</head>

<body bgproperties="fixed">

  <table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" background="../images/bg.gif">
    <tr>
      <td valign="top">
	  <table width="400" height="250" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td width="250" height="40" background="../images/popup_img_bg.gif">
		  <table width="400" height="40" border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td width="32"><img src="../images/popup_img_point.gif" width="32" height="40"></td>
              <td width="198" class="popup_title" style="padding-top:4px"> CHANNEL 등록</td>
              <td width="170"><img src="../images/popup_img_text.gif" width="170" height="40"></td>
            </tr>
          </table></td>
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
                    <td height="25" class="MS05td" width="110"><div align="center">ID</div></td>
                    <td width="260" class="MS06td" style="padding-left:5px"><input name="Input22722263322222" type="text" class="box" style="width:130">
                    </td>
                  </tr>
                  <tr>
                    <td height="25" class="MS05td" width="110"><div align="center">채널명</div></td>
                    <td width="265" class="MS07td" style="padding-left:5px"><input name="Input227222633222222" type="text" class="box" style="width:130">
                    </td>
                  </tr>
                  <tr>
                    <td height="25" class="MS05td" width="110"><div align="center">디렉터</div></td>
                    <td class="MS06td" style="padding-left:5px"><select name="select" class="box" id="select" style="width:130">
                        <option >선택</option>
                      </select>
                    </td>
                  </tr>
              </table></td>
            </tr>
            <tr>
              <td height="30"></td>
            </tr>
            <tr>
              <td align="center"><a href="#"><img src="../images/btn_cancel.gif" width="59" height="20" border="0"></a>&nbsp;&nbsp;&nbsp; <a href="#"><img src="../images/btn_save.gif" width="59" height="20" border="0"></a></td>
            </tr>
          </table></td>
        </tr>
      </table>	
	  </td>
    </tr>
  </table>

</body>
</html>
