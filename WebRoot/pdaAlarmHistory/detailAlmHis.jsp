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
		<%@ include file = "../pda/pdaTop.jsp" %>
	</div>
	</td>
</tr>

<tr>
<td colspan="3">
<div id="content">

<div id="subTitle"><img src="../pdaImages/sub_title_icon.gif"/>경보이력상세</div>

<s:push value="detailAlarmHis" >
	<table width="230" border="0" cellspacing="0" cellpadding="0" class="contentTable"  style="table-layout:fixed; word-break:break-all;">
	  <tr>
	    <th width="80" align="left">구분</th>
	    <td width="150" >
			<s:if test="struct_comp_nm==null">&nbsp;</s:if>
			<s:else><s:property value="struct_comp_nm" /></s:else>
		</td>
	  </tr>
	  <tr>
	    <th align="left" width="80">계측항목</th>
	    <td >
			<s:if test="inst_item_nm==null">&nbsp;</s:if>
			<s:else><s:property value="inst_item_nm" /></s:else>
		</td>
	  </tr>
	  <tr>
	    <th align="left">센서종류</th>
	    <td >
			<s:if test="sensor_type_nm">&nbsp;</s:if>
			<s:else><s:property value="sensor_type_nm" /></s:else>
		</td>
	  </tr>
	  <tr>
	    <th align="left">설치위치</th>
	    <td>X :<s:property value="x_loc" /> 
			|| Y :<s:property value="y_loc" /> 
			|| Z :<s:property value="z_loc" /> </td>
	  </tr>
	  <tr>
	    <th align="left">위치이름</th>
	    <td><s:property value="loc_nm" /></td>
	  </tr> 
	  <tr>
	    <th align="left">측정범위</th>
	    <td><s:property value="h_inst_range_lmt" />~<s:property value="l_inst_range_lmt" /></td>
	  </tr> 
	  <tr>
	    <th align="left">기본값</th>
	    <td><s:property value="base_value" /></td>
	  </tr>
	  <tr>
		<th align="left">High 임계치(위험 / 경고)</th>
		<td><s:property value="h_cri_lmt" /> / <s:property value="h_maj_lmt" /> </td>
	  </tr>
	  <tr>
		<th align="left">Low 임계치(위험 / 경고)</th>
		<td><s:property value="l_cri_lmt" /> / <s:property value="l_maj_lmt" /> </td>
	  </tr>
	</table>

<div id="btn_layout">
<!--  <a href="detailStatGrap.jsp"><img src="../pdaImages/btn_statGraph.gif"/></a> --> 
	<s:a href="listAlmHis.do?sensor_id=%{sensor_id}&cnt=%{cnt}&trouble_prod_dt=%{trouble_prod_dt}"><img src="../pdaImages/btn_back.gif"/></s:a></div>
</s:push>
</div>
</td>
</tr>


<tr>
<td colspan="3" id="footer">Copyright (c) LSware Inc. </td>
</tr>
</table>



</body>
</html>
