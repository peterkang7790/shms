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

  <table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" background="../images/bg.gif">
    <tr>
      <td valign="top">
	  <table width="750" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="32" background="../images/title_bg.gif">
		  <table width="740" border="0" cellspacing="0" cellpadding="0" style="padding:0px 0px 0px 5px;">
            <tr>
              <td width="20" valign="top"><img src="../images/point_title_01.gif" width="20" height="17"></td>
              <td width="270" class="title_01">������� Ÿ��Ʋ 3</td>
              <td width="450" class="route"><div align="right">Ȩ&nbsp;&gt;&nbsp;������Ȳ&nbsp;&gt;&nbsp;�����󼼺���</div></td>
            </tr>
          </table></td>
        </tr>
        <tr>
          <td height="57" valign="top"><table width="740" height="16" border="0" cellpadding="0" cellspacing="0" style="padding:30px 0px 0px 1px;">
              <tr>
                <td width="12" valign="middle"><img src="../images/point_title_02.gif" width="5" height="13"></td>
                <td width="682" class="title_02">�����󼼺���</td>
              </tr>
          </table></td>
        </tr>
        <tr>
          <td><table width="750" border="0" cellpadding="0" cellspacing="1" class="MSlinetd">
            <tr>
              <td colspan="4" height="2" class="MS01td">
			  </td>
            </tr>
            <tr>
              <td width="110" height="25" class="MS05td"><div align="center">����ID</div></td>
              <td width="230" class="MS06td" style="padding-left:5px">SENSOR001</td>
              <td class="MS05td" width="110"><div align="center">��ġ��ġ ��ǥ </div></td>
              <td width="300" class="MS06td" style="padding-left:5px"> 
			     X:100 &nbsp; Y:100 &nbsp; Z:100</td>
            </tr>
            <tr>
              <td width="110" height="25" class="MS05td"><div align="center">��ġ��ġ</div>
			  </td>
              <td colspan="3" class="MS07td" style="padding-left:5px">��ž���</td>
            </tr>
            <tr>
              <td width="110" height="25" class="MS05td"><div align="center">�����Ӱ�ġ</div></td>
              <td width="230" class="MS06td" style="padding-left:5px">
5104.3900                ~5104.0300</td>
              <td width="110" class="MS05td"><div align="center">����Ӱ�ġ</div></td>
              <td width="300" class="MS06td" style="padding-left:5px">
				5104.3900                ~5104.0300</td>
            </tr>
            <tr>
              <td width="110" height="25" class="MS05td"><div align="center">������</div></td>
              <td width="230" class="MS07td" style="padding-left:5px"> 5104.0000</td>
              <td width="110" class="MS05td"><div align="center">�⺻��(������)</div></td>
              <td width="300" class="MS07td" style="padding-left:5px">5104.0100</td>
            </tr>
            <tr>
              <td width="110" height="25" class="MS05td"><div align="center">G/F</div></td>
              <td width="230" class="MS06td" style="padding-left:5px">800</td>
              <td width="110" class="MS05td"><div align="center">G/L</div></td>
              <td width="300" class="MS06td" style="padding-left:5px">10</td>
            </tr>
            <tr>
              <td width="110" height="25" class="MS05td"><div align="center">ȯ�����</div></td>
              <td width="230" class="MS07td" style="padding-left:5px">0.000001</td>
              <td width="110" class="MS05td"><div align="center">��������</div></td>
              <td width="300" class="MS07td" style="padding-left:5px">
				5104.4100 ~ 5104.0100 </td>
            </tr>
            <tr>
              <td width="110" height="25" class="MS05td"><div align="center">��������</div></td>
              <td width="230" class="MS06td" style="padding-left:5px">��������</td>
              <td width="110" class="MS05td"><div align="center">�����׸�</div></td>
              <td width="300" class="MS06td" style="padding-left:5px">������</td>
            </tr>
            <tr>
              <td width="110" height="25" class="MS05td"><div align="center">������ ����</div></td>
              <td width="230" class="MS07td" style="padding-left:5px">��ž</td>
              <td width="110" class="MS05td"><div align="center">������</div></td>
              <td width="300" class="MS07td" style="padding-left:5px">������1</td>
            </tr>
            <tr>
              <td width="110" height="25" class="MS05td"><div align="center">ä��</div></td>
              <td width="230" class="MS06td" style="padding-left:5px">ä��1</td>
              <td width="110" class="MS05td"><div align="center">���輾��</div></td>
              <td width="300" class="MS06td" style="padding-left:5px"><a href="#"></a>
                <table width="120" height="17" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td width="105" class="text" style="padding-top:2px"> SENSOR002 </td>
                    <td width="53" align="left"><a href="#"><img src="../images/btnS_search.gif" width="32" height="17" border="0"></a></td>
                  </tr>
                </table></td>
            </tr>
          </table>
		  </td>
        </tr>
        <tr>
          <td height="57" valign="top">
		  <table width="740" height="16" border="0" cellpadding="0" cellspacing="0" style="padding:30px 0px 0px 1px;">
            <tr>
              <td width="12" valign="middle"><img src="../images/point_title_02.gif" width="5" height="13"></td>
              <td width="682" class="title_02">������ġ</td>
              </tr>
          </table></td>
        </tr>
        <tr>
          <td><table width="750" border="0" cellspacing="1" bgcolor="#CCCCCC" cellpadding="2">
            <tr>
              <td height="2" colspan="2" class="MS01td"></td>
            </tr>
			<tr>
			  <td width="450" height="25"class="MS05td" style="padding-left:15px"><strong>���ش뱳 ���� �̹���</strong></td>
			  	<td width="300"class="MS05td"style="padding-left:15px"> <strong>������ġ</strong>&nbsp;&nbsp;&nbsp;&nbsp;
				X&nbsp;:&nbsp;25&nbsp;&nbsp;&nbsp;&nbsp;Y&nbsp;:&nbsp;27</td>
			</tr>
			<tr>
              <td height="230" colspan="2"class="MS07td">
			  <div align="center"><img src="../images/img_test_sensor01.gif" width="390" height="200"></div>
			  </td>
			  </tr>
          </table></td>
        </tr>
        <tr>        </tr>
        <tr>
          <td><table width="750" border="0" cellspacing="0" cellpadding="0">
            <tr>            
			</tr>
            <tr>
              <td height="20">
			  </td>
            </tr>
            <tr>
              <td align="center"><a href="#"><img src="../images/btn_delet.gif" width="59" height="20" border="0"></a>&nbsp;&nbsp;&nbsp;
			    <a href="#"><img src="../images/btn_close.gif" width="59" height="20" border="0"></a> </td>
            </tr>
          </table></td>
        </tr>
      </table>
	  <br>
	  <br>
	  </td>
    </tr>
  </table>

</s:form>

</body>
</html>
