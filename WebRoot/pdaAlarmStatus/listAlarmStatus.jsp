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
<script type="text/javascript">

function newReload () 
{
  window.location.reload();
}
</script>
</head>

<body>
<table width="240px" border="0" cellspacing="0" cellpadding="0" class="cTable"  style="table-layout:fixed; word-break:break-all;">
<tr>
<th width="107px"><img src="../pdaImages/pda_top_logo.jpg" width="107"/></th>
<th width="7px" background="../pdaImages/pda_bg.jpg">&nbsp;</th>
<th width="126px"><img src="../pdaImages/pda_top_right.jpg" width="126"/></th>
</tr>
<tr>
	<td colspan="3" id="tabsBg">			
	<%@ include file = "../pda/pdaTop.jsp" %>
	</td>
</tr>

<tr>
<td colspan="3">
<div id="content">

	<div id="subTitle"><img src="../pdaImages/sub_title_icon.gif"/>경보현황 </div>
	<div style="padding-top:5px;"></div>
		<table>
			<tr>
				<td width="80"><img src="../pdaImages/risk.jpg"/>위험(<s:if test="cri_almstate==null">0</s:if><s:else><s:property value="cri_almstate" /></s:else>건)</td>
				<td width="70"><img src="../pdaImages/warning.jpg"/>경고(<s:if test="maj_almstate==null">0</s:if><s:else><s:property value="maj_almstate" /></s:else>건)</td>
				<td width="70"><img src="../pdaImages/safe.jpg"/>안전(<s:if test="saf_almstate==null">0</s:if><s:else><s:property value="saf_almstate" /></s:else>건)</td>
			</tr>
		</table>
	
	<div id="tableTitle">
		<table width="235">
			<tr>
	    		<td width="230" colspan="2" valign="leftr">
	    			<marquee direction="left" scrollamount="8" width="300" behavior="slide" ><font color="#FC8BA5" size="1"><b> * 현재시점에서  한달전 까지 정보입니다.</b></font></marquee>
	    	    </td>
			</tr>
			<tr>
				<td style="vertical-align:bottom;"><b>검색 결과	[<s:property value="totalCount" />]</b> </td>
		        <!-- 새로고침으로 리스트를 다시 가져온다.  -->
				<td style="width:60px;text-align:right;">
					<a href="javascript:newReload();"><img src="../pdaImages/btn_new.gif" align="absmiddle" /></a>
				</td>
			</tr>
		</table>
	</div>
		
	<table width="235" border="0" cellspacing="0" cellpadding="0" class="contentTable"  style="table-layout:fixed; word-break:break-all;">
		  
		  <tr>
		    <th width="90">센서위치</th>
		    <th width="60">장애<br/>발생시간</th>
		    <th width="50">위험<br/>상태</th>
		  </tr>
		  <s:iterator value="listalarmstat" status="stat">
		  <s:if test="rnum%2==0"> <% bg = "MSlist03td"; %> </s:if><s:else> <% bg = "MSlist02td"; %> </s:else>
		 <s:if test="sensor_id == sel_sensor_id"><% bg = "MSlist04td"; %></s:if>
		  <tr>
		    <td class="<%=bg%>" >
		   		<a href="detailAlarmStatus.do?sensor_id=${sensor_id}&trouble_class_nm=${trouble_class_nm}&struct_id=${struct_id}">
			   		<s:if test="loc_nm==null">&nbsp;</s:if>
			   		<s:else>
			   			<s:property value="loc_nm" />
			   		</s:else>
		   		</a>
		   	</td>
		    <td class="<%=bg%>">
		    	<s:if test="trouble_prod_dt==null">&nbsp;</s:if>
		    	<s:else>
		    		<s:property value="trouble_prod_dt" />
		    	</s:else>
		    </td>
			<td id="cenText">
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
		  </s:iterator>
	</table>
<%--	<table width="235" style="padding-top:50px">--%>
<%--			  <s:if test="resultCount == 0">--%>
<%--				<tr>--%>
<%--					<td colspan="3" class="MSlist02td" align="center">검색된 결과가 없습니다.</td>--%>
<%--				</tr>--%>
<%--				</s:if>	--%>
<%--				<s:else>--%>
<%--					<tr>--%>
<%--						<td align="center" class="MSlist02td" colspan="6">--%>
<%--							<table border="0" cellspacing="0" cellpadding="0" class="page_view">--%>
<%--						<tr align="center">--%>
<%--							<td width="13"><a href="#"><img src="../images/btn_first.gif" width="13" height="13" border="0"></a></td>--%>
<%--							<td width="8">&nbsp;</td>--%>
<%--							<td width="13"><a href="#"><img src="../images/btn_back.gif" width="13" height="13" border="0"></a></td>--%>
<%--							<td width="12">&nbsp;</td>--%>
<%--							<td><s:property value="pagingString" escape="false" /></td>--%>
<%--							<td width="12">&nbsp;</td>--%>
<%--							<td width="13"><a href="#"><img src="../images/btn_next.gif" width="13" height="13" border="0"></a></td>--%>
<%--							<td width="8">&nbsp;</td>--%>
<%--							<td width="13"><a href="#"><img src="../images/btn_end.gif" width="13" height="13" border="0"></a></td>--%>
<%--						</tr>--%>
<%--						</table>--%>
<%--						</td>--%>
<%--					</tr>--%>
<%--				</s:else>--%>
<%--	</table>--%>
<%--</div>--%>
<%--</td>--%>
</tr>
<tr>
<td colspan="3" align="center" id="footer">Copyright (c) LSware Inc. </td>
</tr>
</table>



</body>
</html>
