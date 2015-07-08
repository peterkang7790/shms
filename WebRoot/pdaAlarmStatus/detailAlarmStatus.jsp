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
	<%@ include file = "../pda/pdaTop.jsp" %>
	</td>
</tr>

<tr>
	<td colspan="4">
	<div id="content">
	
	<div id="subTitle"><img src="../pdaImages/sub_title_icon.gif"/>경보현황상세</div>
	
	<s:push value="detailAlarmStatus">
		<table width="235" border="0" cellspacing="0" cellpadding="0" class="contentTable"  style="table-layout:fixed; word-break:break-all;">
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
				, Y :<s:property value="y_loc" /> 
				, Z :<s:property value="z_loc" /> </td>
		  </tr>
		  <tr>
		    <th align="left">위치이름</th>
		    <td><s:property value="loc_nm" /></td>
		  </tr> 
		  <tr>
		    <th align="left">계측범위</th>
		    <td><s:property value="h_inst_range_lmt" /> ~<s:property value="l_inst_range_lmt" />
		    			<s:if test="sensor_type_cd==1" >με</s:if>
						<s:elseif test="sensor_type_cd==2" > °</s:elseif>
						<s:elseif test="sensor_type_cd==3"> ℃</s:elseif>
						<s:else>&nbsp;</s:else>
			</td>
		  </tr> 
		  <tr>
		    <th align="left">기본값</th>
		    <td><s:property value="base_value" /> nm</td>
		  </tr>
		  <tr id="layer_1">
		  	<th align="left">위험임계치</th>
			<td class="MS06td" style="padding-left:5px">
				<s:if test="sensor_type_cd==3"></s:if>
				<s:else>
					<s:if test="l_cri_lmt==null">&nbsp;</s:if>
					<s:else>
						<s:property value="l_cri_lmt" />
					</s:else> &nbsp;~&nbsp; 
					<s:if test="h_cri_lmt==null">&nbsp;</s:if>
					<s:else>
						<s:property value="h_cri_lmt" />
						<s:if test="sensor_type_cd==1" >με</s:if>
						<s:elseif test="sensor_type_cd==2" > °</s:elseif>
						<s:else>&nbsp;</s:else>
					</s:else>
				</s:else>
			</td>
			</tr>
			<tr id="layer_2" >
				<th align="left">경고임계치</th>
				<td class="MS06td" style="padding-left:5px">
					<s:if test="l_maj_lmt==null">&nbsp;</s:if><s:else><s:property value="l_maj_lmt" /></s:else> &nbsp;~&nbsp; 
					<s:if test="h_maj_lmt==null">&nbsp;</s:if>
					<s:else>
						<s:property value="h_maj_lmt" />
						<s:if test="sensor_type_cd==1" >με</s:if>
						<s:elseif test="sensor_type_cd==2" > °</s:elseif>
						<s:else>&nbsp;</s:else>
					</s:else> 
				</td>
			</tr>
			<tr>
				<th align="left">G/F</th>
				<td class="MS07td" style="padding-left:5px">
					<s:if test="gf_value==null">&nbsp;</s:if>
					<s:else>
						<s:property value="gf_value" />
						<s:if test="sensor_type_cd==1" >με</s:if>
						<s:elseif test="sensor_type_cd==2" > °</s:elseif>
						<s:elseif test="sensor_type_cd==3"> ℃</s:elseif>
						<s:else>&nbsp;</s:else>
					</s:else>
				</td>
			</tr>
			<tr>	
				<th align="left">G/L</th>	
				<td class="MS07td" style="padding-left:5px">
					<s:if test="sensor_type_cd==1">
						<s:if test="gl_value==null">&nbsp;</s:if>
						<s:else>
							<s:property value="gl_value" /> με	
						</s:else>
					</s:if>
					<s:else>&nbsp;</s:else>
				</td>
			</tr>
<%--		  <tr>--%>
<%--			<th align="left">High 임계치(위험 / 경고)</th>--%>
<%--			<td><s:property value="h_cri_lmt" /> / <s:property value="h_maj_lmt" /> </td>--%>
<%--		  </tr>--%>
<%--		  <tr>--%>
<%--			<th align="left">Low 임계치(위험 / 경고)</th>--%>
<%--			<td><s:property value="l_cri_lmt" /> / <s:property value="l_maj_lmt" /> </td>--%>
<%--		  </tr>--%>
		  <tr>
		  	<th align="left">상태</th>
		  		<td>
					<s:if test="trouble_class_nm=='위험'">
							<img src="../pdaImages/text_risk.gif" align="absmiddle"/>
					</s:if>
	    			<s:elseif test="trouble_class_nm=='경고'">
	    				<img src="../pdaImages/text_warning.gif" align="absmiddle"/>
	    			</s:elseif>
	    			<s:else>
	    				<img src="../pdaImages/text_safe.gif" align="absmiddle"/>
	    			</s:else>
	    		</td>	
	    	</tr>	
		</table>
		<%
			String cd = "";
			if( request.getAttribute("sensor_type_cd") != null )
			{
				cd = request.getAttribute("sensor_type_cd").toString();
			}
		%>
		
		<script type="text/javascript">
		if( <%=cd%> == '3' )
		{
			var layer_1 = document.getElementById("layer_1");
			var layer_2 = document.getElementById("layer_2");
			layer_1.style.display = "none";
			layer_2.style.display = "none";
		}
		</script>
	</s:push>
	<div id="btn_layout"><!-- <a href="detailStatGrap.jsp"><img src="../pdaImages/btn_statGraph.gif"/></a> --> <a href="listAlarmStatus.do?sensor_id=<s:property value="sensor_id" />" ><img src="../pdaImages/btn_back.gif"/></a></div>
	
	</div>
	</td>
</tr>


<tr>
<td colspan="3" id="footer">Copyright (c) LSware Inc. </td>
</tr>
</table>



</body>
</html>
