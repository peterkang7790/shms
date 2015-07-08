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

<title>구조물건전성모니터링</title>


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

#topArea #serviceLink a { width:100px; height:12px; font-size:12px; font-family:dotum,돋움,sans-serif; color:#666; }

#content { width:360px;  height:200px;text-align:left;margin:50px 0 0 200px; }
#content h3 {padding:50px 0 0 5px; font-size:18px; font-family:dotum,돋움,sans-serif; letter-spacing:-1px; color:#333; line-height:25px;}
#content p {  font-size:12px; font-family:dotum,돋움,sans-serif; color:#666; line-height:18px; }
#content p a { font-weight:bold; color:#576FE6; text-decoration:underline; }


</style>
</head>   

<body>
<h1>HEMS FOS 에러페이지</h1>
<div id="topArea">
		
	<ul id="serviceLink" title="SHSM 첫 화면">
	<li><a href="<%=mainPageURL %>" title="HEMS FOS 첫화면으로 가기" >HEMSFOS첫 화면</a></li>
	
	</ul>
		
	<div id="content">
		<h3>서비스 이용에 불편을 드려 죄송합니다.<br />
		원하시는 페이지를 찾을 수가 없습니다.</h3>
		<p>찾으시려는 페이지의 주소가 잘못 입력되었거나,<br /> 페이지 주소의 변경 혹은 삭제로 인해 현재 사용하실 수 없습니다.</p>
	
		<p>입력하신 페이지의 주소가 정확한지 다시 한번 확인 해 주시길 부탁드립니다.<br />해당서비스 첫화면으로 이동하시거나, <a href="<%=mainPageURL%>" >HEMS FOS 첫화면</a>으로 이동하여 이용해 주시길 바랍니다.</p>
		
	</div>
</div>

<%
	Log4j.log.error(request.getAttribute("exceptionStack"));
%>

</body>
</html>

