<%@ page language="java" import="java.util.*" pageEncoding="EUC-KR"%>
<%
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
String RootPath = request.getContextPath() + "/";
String bg = "";
%>
<%@taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
<title>SHMS</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<script  type="text/javascript" src="../script/ComUtil.js" ></script>
<script type="text/javascript" src="../script/script.js" ></script>
<link href="../css/common01.css" rel="stylesheet" type="text/css">
</head>

<body>
<table width="750" border="0" cellspacing="0" cellpadding="1">
<tr>
	
	<table width="750" border="0" cellspacing="1" bgcolor="#CCCCCC" cellpadding="2">
		<tr>
			<td colspan="9" height="2" class="MS01td"></td>
		</tr>
		<tr>
			<td width="20" height="25" align="center" class="MS05td">NO</td>
			<td width="100" align="center" class="MS05td">센서</td>
			<td width="90" align="center" class="MS05td">설치위치</td>
			<td width="100" align="center" class="MS05td">계측항목</td>
			<td width="90" align="center" class="MS05td">센서종류</td>
			<td width="100" align="center" class="MS05td">기본값</td>
			<td width="145" align="center" class="MS05td">조치</td>
			<td width="60" align="center" class="MS05td">상태</td>
		</tr>

		<s:iterator value="rsSenSensorList_Sensor" status="stat">
		<s:if test="rnum%2==0"> <% bg = "MSlist03td"; %> </s:if><s:else> <% bg = "MSlist02td"; %> </s:else>
		<s:if test="sensor_id == sel_sensor_id"><% bg = "MSlist04td"; %></s:if>
		<!--  
		<%
			String defCheck = (String)request.getSession().getAttribute("DEF_CHECK");
			String vNum = String.valueOf( request.getAttribute("rnum") );
			String vSensor = "";
			if( "1".equals( vNum) )
			{
				vSensor = (String)request.getAttribute("sensor_id");
			}	
		%>
		
		<script type="text/javascript">
			if( <%=defCheck %> == 'false' )
			{
				sensor(<%=vSensor %>);
			}
			
		</script>
		<%
			request.getSession().removeAttribute("DEF_CHECK");
			request.getSession().setAttribute("DEF_CHECK","true");
		%>
		
		-->
		<tr>
			<td height="22" align="center" class="<%=bg%>"><s:if test="rnum==null">&nbsp;</s:if><s:else><s:property value="rnum" /></s:else></td>
			<td align="left" class="<%=bg%>" >
				<s:if test="sensor_id==null">&nbsp;</s:if>
				<s:else>
					<s:property value="sensor_id" />
				</s:else>
			</td>
			<td align="center" class="<%=bg%>"><s:if test="loc_nm==null">&nbsp;</s:if><s:else><s:property value="loc_nm" /></s:else></td>
			<td align="left" class="<%=bg%>"><s:if test="inst_item_nm==null">&nbsp;</s:if><s:else><s:property value="inst_item_nm" /></s:else></td>
			<td align="left" class="<%=bg%>"><s:if test="sensor_type_nm==null">&nbsp;</s:if><s:else><s:property value="sensor_type_nm" /></s:else></td>
			<td align="right" class="<%=bg%>"><s:if test="base_value==null">&nbsp;</s:if><s:else><s:property value="base_value" /></s:else></td>
			<td align="center" class="<%=bg%>">
				<s:if test="trouble_act_y_count==null">조치:0</s:if>
				<s:else> 
					<s:if test="trouble_act_y_count>0">
						<font color="blue">조치:<s:property value="trouble_act_y_count" /></font>
						<s:a href="javascript:MM_openBrWindow('troubleCancel.do?sensor_id=%{sensor_id}','','width=820,height=450,resizable=yes,scrollbars=yes');" onfocus="this.blur();">
							<img src="../images/help.bmp" border="0" style="cursor:hand;"  />
						</s:a>
					</s:if>
					<s:else>
						조치:<s:property value="trouble_act_y_count" />
					</s:else>
				</s:else> &nbsp;
				<s:if test="trouble_act_n_count==null">미조치:0</s:if>
				<s:else>
					<s:if test="trouble_act_n_count>0">
						<font color="red">미조치:<s:property value="trouble_act_n_count" /></font>
					</s:if>
					<s:else>
						미조치:<s:property value="trouble_act_n_count" />
					</s:else>
				</s:else>
			</td>
			<td align="center" class="<%=bg%>">
				<s:if test="trouble_cri_count>0"><img src="../pdaImages/text_risk.gif"/></s:if>
				<s:elseif test="trouble_maj_count>0"><img src="../pdaImages/text_warning.gif"/></s:elseif>
	    		<s:else><img src="../pdaImages/text_safe.gif"/></s:else>
			</td>
		</tr>
		</s:iterator>
	</table>
</tr>
</table>
</body>
</html>



