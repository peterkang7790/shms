<%@ page language="java" import="java.util.*" pageEncoding="EUC-KR"  contentType="text/html; charset=euc-kr"%>
<%
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
String RootPath = request.getContextPath() + "/";
String ImgPath  = request.getContextPath() + "/images/";
%>
<%@taglib prefix="s" uri="/struts-tags" %>
<s:if test="#session.USER_ID==null">
	<s:include  value="login.jsp"></s:include>
</s:if>
<s:else>

<html>
<head>
	<title>SHMS</title>
	<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
	<link rel="stylesheet" href="css/common01.css" type="text/css">
	<script type="text/javascript" src="script/ComUtil.js" ></script>
</head>

<frameset  rows="*,22" frameborder="no" border="0" framespacing="0">
	<frameset rows="114,*" cols="*" frameborder="no" border="0" framespacing="0">
		<frame src="<%=RootPath%>common/top_pda.jsp" name="topFrame" scrolling="No" noresize="noresize" id="topFrame" title="topFrame" />
		<frame src="<%=RootPath%>alarmManage/listTroublePda.do?pdatyp=%{pdatyp}" name="mainFrame" id="mainFrame" title="mainFrame" scrolling="auto"/>
	</frameset>
	<frame src="<%=RootPath%>common/footer.jsp" name="bottomFrame" scrolling="No" noresize="noresize" id="bottomFrame" />
</frameset>
<noframes>
	<body>
	<p>이 페이지를 보려면, 프레임을 볼 수 있는 브라우저가 필요합니다.</p>
	</body>
</noframes>
</html>

</s:else>