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
<title>���ð���������͸��ý���</title>
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
<div id="subTitle"><img src="../pdaImages/sub_title_icon.gif"/>�溸�̷�</div>


<!-- content -->
<div id="ct"> 
	<div class="chh">
		<h1>
			<a href="/main.nhn?action=GetMonthlySchedule&date=2009-09-01" onClick="nclk(this, 'mon.prev', '', '')" class="bt5 bt5pv"><img src="http://static.naver.com/www/m/im/bl.gif" alt="������" /><span class="hc2">����</span></a>
		 	<span>2009.10</span>
		 	<a href="/main.nhn?action=GetMonthlySchedule&date=2009-11-01" onClick="nclk(this, 'mon.next', '', '')" class="bt5 bt5nx"><img src="http://static.naver.com/www/m/im/bl.gif" alt="������" /><span class="hc2">������</span></a>
		</h1>
		
	</div>
	<table class="month" width="230px"  cellspacing="0" cellpadding="0" >
	<colgroup span="7" width="14%"></colgroup>
	<thead>
	<tr>
	<th scope="col">��</th>
	<th scope="col">��</th>
	<th scope="col">ȭ</th>
	<th scope="col">��</th>
	<th scope="col">��</th>
	<th scope="col">��</th>
	<th scope="col">��</th>
	</tr>
	</thead>
	<tbody>
		<tr>	
			<td class="dim ">&nbsp;</td>
			<td class="dim ">&nbsp;</td>
			<td class="dim ">&nbsp;</td>
			<td class="dim ">&nbsp;</td>
			<td class=" "><a href="listAlmHis.jsp">1</a></td>
			<td class=" "><a href="listAlmHis.jsp">2</a></td>
			<td class=" "><a href="listAlmHis.jsp">3</a></td>
		</tr>
		<tr>	
			<td class=" "><a href="listAlmHis.jsp">4</a></td>
			<td class=" "><a href="listAlmHis.jsp">5</a></td>
			<td class=" "><a href="#">6</a></td>
			<td class=" "><a href="#">7</a></td>
			<td class=" "><a href="#">8</a></td>
			<td class=" "><a href="#">9</a></td>
			<td class=" "><a href="#">10</a></td>
		</tr>
		<tr>	
			<td class=" "><a href="#">11</a></td>
			<td class=" "><a href="#">12</a></td>
			<td class=" "><a href="#">13</a></td>
			<td class=" "><a href="#">14</a></td>
			<td class=" "><a href="#">15</a></td>
			<td class=" "><a href="#">16</a></td>
			<td class=" "><a href="#">17</a></td>
		</tr>
		<tr>	
			<td class=" "><a href="#">18</a></td>
			<td class=" "><a href="#">19</a></td>
			<td class=" "><a href="#">20</a></td>
			<td class=" "><a href="#">21</a></td>
			<td class=" "><a href="#">22</a></td>
			<td class=" "><a href="#">23</a></td>
			<td class=" "><a href="#">24</a></td>
		</tr>
		<tr>	
			<td class=" "><a href="#">25</a></td>
			<td class=" "><a href="#">26</a></td>
			<td class=" "><a href="#">27</a></td>
			<td class=" "><a href="#">28</a></td>
			<td class=" "><a href="#">29</a></td>
			<td class=" "><a href="#">30</a></td>
			<td class=" "><a href="#">31</a></td>
		</tr>
		<tr>	
			<td class="dim ">&nbsp;</td>
			<td class="dim ">&nbsp;</td>
			<td class="dim ">&nbsp;</td>
			<td class="dim ">&nbsp;</td>
			<td class="dim ">&nbsp;</td>
			<td class="dim ">&nbsp;</td>
			<td class="dim ">&nbsp;</td>
		</tr>

	<!-- 6�ְ� �ȵǴ� ���� ��� �����߰� -->
	</tbody>
	</table>
	
</div>
<!-- //content -->
</td>
</tr>


<tr>
<td colspan="3" id="footer">Copyright (c) LSware Inc. </td>
</tr>
</table>



</body>
</html>
