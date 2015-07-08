<%@ page language="java" import="java.util.*" pageEncoding="EUC-KR"  contentType="text/html; charset=euc-kr"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String bg = "";
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
	<%@ include file = "../pda/pdaTop.jsp" %>
	</td>
</tr>

<tr>
<td colspan="3">
<div id="content">

<div id="subTitle"><img src="../pdaImages/sub_title_icon.gif"/>경보이력 <font color="blue" size="1">검색 결과	[<s:property value="cnt" />]</font></div>

<table width="235" border="0" cellspacing="0" cellpadding="0" class="contentTable"  style="table-layout:fixed; word-break:break-all;">
  <tr>
    <th width="80">센서</th>
    <th width="60">발생일</th>
    <th width="60">경보</th>
  </tr>
  
  <s:iterator value="cntalmshis_sub" status="stat">
  <s:if test="rnum%2==0"> <% bg = "MSlist03td"; %> </s:if><s:else> <% bg = "MSlist02td"; %> </s:else>
    <tr>
	    <td class="<%=bg%>">
	    	<s:url id="cntalmshis_sub" action="listAlmHis">
			<s:param name="sensor_id" value="sensor_id"/>
			</s:url>
	    	<s:a href="detailAlmHis.do?sensor_id=%{sensor_id}&cnt=%{cnt}&trouble_prod_dt=%{trouble_prod_dt}" >
	    		<s:if test="sensor_id==null">&nbsp;</s:if>
	    		<s:else>
	    			<s:property value="sensor_id" />
	    		</s:else>
	    	</s:a>
	    </td>
	    <td id="cenText" class="<%=bg%>">
	    	
	    	<s:if test="t_prod_dt==null">&nbsp;</s:if>
	    	<s:else>
	    		<s:a href="detailAlmHis.do?sensor_id=%{sensor_id}&cnt=%{cnt}&trouble_prod_dt=%{trouble_prod_dt}"><s:property value="t_prod_dt" /></s:a>
	    	</s:else>
	    	
	    </td>
	    <td id="cenText" class="<%=bg%>">
	    	<s:if test="trouble_type_nm==null">&nbsp;</s:if>
	    	<s:elseif test="trouble_type_nm=='위험'" ><img src="../pdaImages/text_risk.gif"/></s:elseif>
	    	<s:else><img src="../pdaImages/text_warning.gif"/></s:else>
	    </td>
	  </tr>
  </s:iterator>
</table>
<div id="btn_layout">
<!--  <a href="detailStatGrap.jsp"><img src="../pdaImages/btn_statGraph.gif"/></a> --> 
	<s:a href="listAlmHisTotal.do"><img src="../pdaImages/btn_back.gif"/></s:a></div>
</div>
</td>
</tr>


<tr>
	<td align="center" colspan="3" id="footer">Copyright (c) LSware Inc. </td>
</tr>
</table>



</body>
</html>
