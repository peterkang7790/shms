<%@ page language="java" import="java.util.*" pageEncoding="EUC-KR"  contentType="text/html; charset=euc-kr"%>
<%@ page import="shms.common.Log4j" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String mainPageURL = basePath;
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@taglib prefix="s" uri="/struts-tags" %>
<html>
<head>

<title>����������������͸�</title>


<script type="text/jscript" src="../script/script.js"></script>
<script type="text/jscript" src="../script/common.js"></script>
<style type="text/css">

body, div, p, h1, h2, h3, fieldset { padding:0; margin:0; }
/*body { background:#fff url(http://icon.daum-img.net/error/error_top_bg.gif) repeat-x; text-align:center; }*/
body { text-align:center;}
ul, li, dl, dt, dd { list-style:none; margin:0; padding:0; }
h1 { display:none; }

#topArea { width:591px; background:url(../images/error_bg.jpg) no-repeat bottom; margin:72px auto 45px auto; padding-bottom:6px; height:316px; }

#topArea #serviceLink { float:right; margin:15px 6px 0 0; }
#topArea #serviceLink li { float:left; }

#topArea #serviceLink a { width:100px; height:12px; font-size:12px; font-family:dotum,����,sans-serif; color:#666; }

#content { width:360px;  height:200px;text-align:left;margin:50px 0 0 200px; }
#content h3 {padding:50px 0 0 5px; font-size:18px; font-family:dotum,����,sans-serif; letter-spacing:-1px; color:#333; line-height:25px;}
#content p {  font-size:12px; font-family:dotum,����,sans-serif; color:#666; line-height:18px; }
#content p a { font-weight:bold; color:#576FE6; text-decoration:underline; }


</style>
</head>   

<body>
<h1>HEMS FOS ����������</h1>
<div id="topArea">
		
	<ul id="serviceLink" title="SHSM ù ȭ��">
	<li><a href="<%=mainPageURL %>" title="HEMS FOS ùȭ������ ����" >HEMSFOSù ȭ��</a></li>
	
	</ul>
		
	<div id="content">
		<h3>���� �̿뿡 ������ ��� �˼��մϴ�.<br />
		���Ͻô� �������� ã�� ���� �����ϴ�.</h3>
		<p>ã���÷��� �������� �ּҰ� �߸� �ԷµǾ��ų�,<br /> ������ �ּ��� ���� Ȥ�� ������ ���� ���� ����Ͻ� �� �����ϴ�.</p>
	
		<p>�Է��Ͻ� �������� �ּҰ� ��Ȯ���� �ٽ� �ѹ� Ȯ�� �� �ֽñ� ��Ź�帳�ϴ�.<br />�ش缭�� ùȭ������ �̵��Ͻðų�, <a href="<%=mainPageURL%>" >HEMS FOS ùȭ��</a>���� �̵��Ͽ� �̿��� �ֽñ� �ٶ��ϴ�.</p>
		
	</div>
</div>

<%
	Log4j.log.error(request.getAttribute("exceptionStack"));
%>

</body>
</html>

