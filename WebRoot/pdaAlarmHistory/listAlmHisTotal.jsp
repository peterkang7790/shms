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
<td colspan="3">


<div id="content">
<div id="subTitle"><img src="../pdaImages/sub_title_icon.gif"/>경보이력</div>
<div style="padding-top:5px;">구조물경보상태</div>
<table>
	<tr>
		<td width="110"><img src="../pdaImages/risk.jpg"/>위험(<s:if test="cri_almstate==null">0</s:if><s:else><s:property value="cri_almstate" /></s:else>건)</td>
		<td width="110"><img src="../pdaImages/warning.jpg"/>경고(<s:if test="maj_almstate==null">0</s:if><s:else><s:property value="maj_almstate" /></s:else>건)</td>
	</tr>
	<tr>
		<td><img src="../pdaImages/care.jpg"/>주의(<s:if test="min_almstate">0</s:if><s:else><s:property value="min_almstate" /></s:else>건) </td>
		<td><img src="../pdaImages/safe.jpg"/>안전(<s:if test="saf_almstate==null">0</s:if><s:else><s:property value="saf_almstate" /></s:else>건)</td>
	</tr>
</table>

<div id="tableTitle">
		검색 결과	[<s:property value="totalCount" />]
</div>


<table width="230" border="0" cellspacing="0" cellpadding="0" class="contentTable"  style="table-layout:fixed; word-break:break-all;">
  <tr>
    <th width="30">NO</th>
    <th width="60">센서</th>
    <th width="60">발생일</th>
    <th width="30">건수</th>
  </tr>
  
  <s:iterator value="listalarmhis" status="stat">
  <tr align="center">
    <td id="cenText">
    	<s:property value="rnum" />
    </td>
	<td>
		<s:url id="listalarmhis" action="listalarmhis">
			<s:param name="sensor_id" value="sensor_id"/>
		</s:url>
		<s:a href="listAlmHis.do?sensor_id=%{sensor_id}&sencnt=%{sencnt}&trouble_prod_dt=%{trouble_prod_dt}">
			<s:if test="sensor_id==null">&nbsp;</s:if>
			<s:else><s:property value="sensor_id" />
			</s:else>
		</s:a>
	</td>
	<td id="cenText">
		<s:url id="listalarmhis" action="listalarmhis">
			<s:param name="sensor_id" value="sensor_id"/>
		</s:url>
			<s:a href="listAlmHis.do?sensor_id=%{sensor_id}&sencnt=%{sencnt}&trouble_prod_dt=%{trouble_prod_dt}">
			<s:if test="t_prod_dt==null">&nbsp;</s:if>
			<s:else><s:property value="t_prod_dt" /></s:else>
		</s:a>
	</td>
    <td id="cenText">
    	<s:property value="sencnt" />
    </td>
   </tr> 
  </s:iterator>
  
  
</table>
<table width="235" style="padding-top:50px">
			  <s:if test="resultCount == 0">
				<tr>
					<td colspan="3" class="MSlist02td" align="center">검색된 결과가 없습니다.</td>
				</tr>
				</s:if>	
				<s:else>
					<tr>
						<td align="center" class="MSlist02td" colspan="6">
							<table border="0" cellspacing="0" cellpadding="0" class="page_view">
							<tr align="center">
								<td width="13"><a href="#"><img src="../images/btn_first.gif" width="13" height="13" border="0"></a></td>
								<td width="8">&nbsp;</td>
								<td width="13"><a href="#"><img src="../images/btn_back.gif" width="13" height="13" border="0"></a></td>
								<td width="12">&nbsp;</td>
								<td><s:property value="pagingString" escape="false" /></td>
								<td width="12">&nbsp;</td>
								<td width="13"><a href="#"><img src="../images/btn_next.gif" width="13" height="13" border="0"></a></td>
								<td width="8">&nbsp;</td>
								<td width="13"><a href="#"><img src="../images/btn_end.gif" width="13" height="13" border="0"></a></td>
							</tr>
							</table>
						</td>
					</tr>
				</s:else>
	</table>



</div>
</td>
</tr>


<tr>
<td colspan="3" id="footer">Copyright (c) LSware Inc. </td>
</tr>
</table>



</body>
</html>
