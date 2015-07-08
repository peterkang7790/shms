<%@ page language="java" import="java.util.*" pageEncoding="EUC-KR"%>
<%
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
String RootPath = request.getContextPath() + "/";
String ImgPath  = request.getContextPath() + "/images/";
String bg = "";
String icon = "sensor_G_01.gif";
String altVal = "";
%>
<%@taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
<title>SHMS</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link href="<%=RootPath%>css/common01.css" rel="stylesheet" type="text/css">

</head>

<body>
<s:iterator value="rsSensorPos" status="stat">

<div id="img_${sensor_id}" style="position:absolute; display:none;">
	<s:a href="#" onclick="sensor('%{sensor_id}')">
		<s:if test="sensor_type_cd==null">&nbsp;</s:if>
		<s:else>
		<%
			altVal = request.getAttribute("sensor_id")==null?"":request.getAttribute("sensor_id").toString();
		%>
			<s:if test='sensor_type_cd=="1"'>
				<s:if test="trouble_class_cd!=null">
					<s:if test='trouble_class_cd=="1"'><% icon = "sensor_R_01.gif"; %></s:if>
					<s:elseif test='trouble_class_cd=="2"'><% icon = "sensor_O_01.gif"; %></s:elseif>
					<s:else>
					 	<s:if test='err_type_cd=="1"'>
					 		<% icon = "sensor_error_01_1.gif";
					 		   altVal = altVal + "[센서장애]";	
					 		%>
					 	</s:if>
					 	<s:else>
					 		<% icon = "sensor_error_02_1.gif"; 
					 		   altVal = altVal + "[네트워크장애]";	
					 		%>
					 	</s:else>
					</s:else>
				</s:if>
				<s:else>
<%--					<% icon = "sensor_G_01.gif"; %>--%>
						<s:if test='err_type_cd=="1"'>
					 		<% icon = "sensor_error_01_1.gif";
					 		   altVal = altVal + "[센서장애]";	
					 		%>
					 	</s:if>
					 	<s:elseif test='err_type_cd=="2"'>
					 		<% icon = "sensor_error_02_1.gif"; 
					 		   altVal = altVal + "[네트워크장애]";	
					 		%>
					 	</s:elseif>
					 	<s:else>
					 		<% icon = "sensor_G_01.gif"; %>
					 	</s:else>
				</s:else>
			</s:if>
			<s:elseif test='sensor_type_cd=="2"'>
				<% icon = "sensor_G_02.gif"; %>
				<s:if test="trouble_class_cd!=null">
					<s:if test='trouble_class_cd=="1"'><% icon = "sensor_R_02.gif"; %></s:if>
					<s:elseif test='trouble_class_cd=="2"'><% icon = "sensor_O_02.gif"; %></s:elseif>
					<s:else>
					 	<s:if test='err_type_cd=="1"'>
					 		<% icon = "sensor_error_01_1.gif";
					 		   altVal = altVal + "[센서장애]";	
					 		%>
					 	</s:if>
					 	<s:else>
					 		<% icon = "sensor_error_02_1.gif"; 
					 		   altVal = altVal + "[네트워크장애]";	
					 		%>
					 	</s:else>
					</s:else>
				</s:if>
				<s:else>
<%--					<% icon = "sensor_G_02.gif"; %>--%>
						<s:if test='err_type_cd=="1"'>
					 		<% icon = "sensor_error_01_1.gif";
					 		   altVal = altVal + "[센서장애]";	
					 		%>
					 	</s:if>
					 	<s:elseif test='err_type_cd=="2"'>
					 		<% icon = "sensor_error_02_1.gif"; 
					 		   altVal = altVal + "[네트워크장애]";	
					 		%>
					 	</s:elseif>
					 	<s:else>
					 		<% icon = "sensor_G_02.gif"; %>
					 	</s:else>
				</s:else>
			</s:elseif>
			<s:if test='sensor_type_cd=="3"'>
				<s:if test="trouble_class_cd!=null">
					<s:if test='trouble_class_cd=="1"'><% icon = "sensor_R_03.gif"; %></s:if>
					<s:elseif test='trouble_class_cd=="2"'><% icon = "sensor_O_03.gif"; %></s:elseif>
					<s:else>
					 	<s:if test='err_type_cd=="1"'>
					 		<% icon = "sensor_error_01_1.gif";
					 		   altVal = altVal + "[센서장애]";	
					 		%>
					 	</s:if>
					 	<s:else>
					 		<% icon = "sensor_error_02_1.gif"; 
					 		   altVal = altVal + "[네트워크장애]";	
					 		%>
					 	</s:else>
					</s:else>
				</s:if>
				<s:else>
<%--					<% icon = "sensor_G_03.gif"; %>--%>
						<s:if test='err_type_cd=="1"'>
					 		<% icon = "sensor_error_01_1.gif";
					 		   altVal = altVal + "[센서장애]";	
					 		%>
					 	</s:if>
					 	<s:elseif test='err_type_cd=="2"'>
					 		<% icon = "sensor_error_02_1.gif"; 
					 		   altVal = altVal + "[네트워크장애]";	
					 		%>
					 	</s:elseif>
					 	<s:else>
					 		<% icon = "sensor_G_03.gif"; %>
					 	</s:else>
				</s:else>
			</s:if>
		</s:else> 
		<img src="../images/<%=icon%>" width="8" height="8" style="cursor:hand;" alt="<%=altVal %>" border="0">
	</s:a>
</div>
<script type="text/javascript">
	var x = "${sensor_x_loc}".int();
	var y = "${sensor_y_loc}".int();
	init(x,y,"img_${sensor_id}"); 
</script>

</s:iterator>

</body>
</html>



