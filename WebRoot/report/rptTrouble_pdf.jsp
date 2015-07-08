<%@page contentType = "text/html; charset=euc-kr" %>
<%@page import="java.lang.*"%>
<%@page import="java.util.Calendar"%>
<%@page import="shms.common.MakeCalendar"%>
<%@page import="com.lsware.utils.DateUtils"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="org.zefer.pd4ml.PD4PageMark"%>
<%@page import="java.awt.Color"%>
<%@page import="java.util.*"%>
<%@page import="shms.action.statManage.*"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<script type="text/javascript" src="../script/ComUtil.js" ></script>
<script type="text/javascript" src="../script/jquery.js" ></script>
<script language="JavaScript" src="../script/FusionCharts.js"></script>
<%

	String dateFr = request.getParameter("fr_prod_dt").toString();
	String dateTo = request.getParameter("to_prod_dt").toString();

	String year1= dateFr.substring(0,4);
	String month1=dateFr.substring(5,6);
	String day1=dateFr.substring(6,8);
	
	
	String year2= dateTo.substring(0,4);
	String month2=dateTo.substring(5,6);
	String day2=dateTo.substring(6,8);
	
	
	
	Calendar day = Calendar.getInstance();

	
	
	out.clear();
	out = pageContext.pushBody();

	
%><%@taglib uri="../WEB-INF/tld/pd4ml.tld" prefix="pd4ml" %>
<%@page contentType="text/html; charset=euc-kr"%>
<pd4ml:transform
	screenWidth="1024"
	pageFormat="A4"
	pageOrientation="Landscape"
	pageInsets="5,5,5,5,points"  
	enableImageSplit="false"><pd4ml:usettf from="C:/Program Files/Apache Software Foundation/Tomcat 6.0/webapps/shms/fonts/"/>

	String password = "JR8900-324444-10728105521C";

	boolean strongEncryption = true;

	int permissions = PD4Constants.AllowPrint | PD4Constants.AllowCopy;
    pd4ml.setPermissions( password, permissions, strongEncryption );

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<title>Health report</title>
<link rel="stylesheet" href="../css/health.css" type="text/css" />
<style>
BODY 
{
overflow-x:hidden;
}
</style>

</head>
<body topmargin="0" leftmargin="0">
<!----------------------------------------------------------------------------------------->
<!--                                     표 지 Begin                                     -->
<!----------------------------------------------------------------------------------------->
<table id="pdfmain" width="860" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td colspan="3">
    <table width="860" height="390" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="700" height="114" id="title"><img src="../images/login_top.gif" width="700" height="100"></td>
        <td colspan="3" align="right" valign="top" style='padding-top:20px;'><img src="../images/valuation/secret.gif" width="82" height="34"></td>
      </tr>
      <tr>
        <td width="860" align="left" height="153" id="title" colspan="3">
        	<font size="5" face="Batang">경보 종합 현황보고<br/><font size="3" face="Batang">(<%=month1%>月<%=day1%>日 - <%=month2%>月<%=day2%>日)</font></font>
        </td>
<%--      	<td width="295" rowspan="2" valign="top" id="content">--%>
<%--				<h1><font face="Batang">목차</font></h1>--%>
<%--					<ul class="list_month">--%>
<%--					<li><font face="Batang">&nbsp;종합현황(전체)</font></li>--%>
<%--					<li><font face="Batang">&nbsp;통계 현황</font></li>--%>
<%--					<li><font face="Batang">&nbsp;상세 현황</font></li>--%>
<%--				</ul>				</td>--%>
<%--        <td width="30" rowspan="2" valign="top" id="content">&nbsp;</td>--%>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td width="40%" height="60" bgcolor="#dfdfdf" id="aa"><font face="Batang"> 구조물 건전성 모니터링 </font></td>
    <td width="57%" align="right" valign="bottom" bgcolor="#ffffff"><img src="../images/lslogo.jpg" width="295" height="67"></td>
    <td width="3%" bgcolor="#ffffff">&nbsp;</td>
  </tr>
  <tr id="copy">
    <td height="130" bgcolor="#ffffff">&nbsp;</td>
    <td height="130" align="right" bgcolor="#ffffff"><font face="Batang">Copyright ⓒ 2010 LSWARE Co. Ltd. All rights reserved | Confidential &#13;</font></td>
    <td height="130" align="right" bgcolor="#ffffff">&nbsp;</td>
  </tr>
</table>
<!----------------------------------------------------------------------------------------->
<!--                                     표 지 End                                       -->
<!----------------------------------------------------------------------------------------->
<pd4ml:page.break/>
<br/><br/></br><br/>
<div class="subtab">
<div id="secret"></div>
<table width="950"  height="25" border="0" cellspacing="0" cellpadding="0" id="top">
	<tr> 
   		<td height="25">
   		<img src="../images/point_title_02.gif">&nbsp;<font face="Batang">종합현황(경보 조치율 :<font face="Batang" color="red" ><s:property value="totPer_1Str"/></font>)</font> 
   	</td>
  </tr>
</table>
</div>
<div class="month">
<table width="900" border="0" cellspacing="0" cellpadding="0" id="group1">
	<tr>
		<td height="25" align="center" colspan="2" rowspan="2"><font face="Batang">구분</font></td>
		<td width="200" align="center" colspan="2" ><font face="Batang">발생</font></td>
		<td width="300" align="center" colspan="4"><font face="Batang">조치</font></td>
	</tr>
	<tr>	
		<td width="200" align="center" ><font face="Batang">발생(건)</font></td>
		<td align="center"  ><font face="Batang">%</font></td>
		<td width="200" align="center" ><font face="Batang">조치(건)</font></td>
		<td align="center" ><font face="Batang">%</font></td>
		<td width="200" align="center" ><font face="Batang">미조치(건)</font></td>
		<td align="center" ><font face="Batang">%</font></td>
	</tr>
	<tr>
		<td width="60" align="center" rowspan="3" ><font face="Batang">경보</font></td>
		<td width="100" align="center" ><font face="Batang" color="blue">합계</font></td>
		<td align="center" ><font face="Batang" color="blue"><s:property value="totCri_maj"/></font></td>
		<td align="center" ><font face="Batang" color="blue">&nbsp;</font></td>
		<td align="center" ><font face="Batang" color="blue"><s:property value="tot_Y"/></font></td>
		<td align="center" ><font face="Batang" color="red"><s:property value="totPer_YStr"/></font></td>
		<td align="center" ><font face="Batang" color="blue"><s:property value="tot_N"/></font></td>
		<td align="center" ><font face="Batang" color="red"><s:property value="totPer_NStr"/></font></td>
   </tr>
   <tr>
    	<td align="center" ><font face="Batang">위험</font></td>
		<td width="100" align="center" ><font face="Batang"><s:property value="cri"/></font></td>
		<td align="center" ><font face="Batang"><s:property value="criper"/></font></td>
		<td align="center" ><font face="Batang"><s:property value="trY_1"/></font></td>
		<td align="center" ><font face="Batang"><s:property value="totPer_1Str"/></font></td>
		<td align="center" ><font face="Batang"><s:property value="trN_1"/></font></td>
		<td align="center" ><font face="Batang"><s:property value="totPer_3Str"/></font></td>
    </tr>
    <tr>
		<td width="100" align="center" ><font face="Batang">경고</font></td>
		<td align="center" ><font face="Batang"><s:property value="maj"/></font></td>
		<td align="center" ><font face="Batang"><s:property value="majper"/></font></td>
		<td align="center" ><font face="Batang"><s:property value="trY_2"/></font></td>
		<td align="center" ><font face="Batang"><s:property value="totPer_2Str"/></font></td>
		<td align="center" ><font face="Batang"><s:property value="trN_2"/></font></td>
		<td align="center" ><font face="Batang"><s:property value="totPer_4Str"/></font></td>
	</tr>
	
</table>
<br/><br/>
</div>
<div class="subtab">
<div id="secret"></div>
<table width="950"  height="25" border="0" cellspacing="0" cellpadding="0" id="top">
	<tr> 
   	<td height="25">
   		<img src="../images/point_title_02.gif">&nbsp;<font face="Batang">센서별경보통계</font> 
   	</td>
  </tr>
</table>
</div>
<div class="month">
<table width="900" border="0" cellspacing="0" cellpadding="0" id="group1">
	<tr>
		<td height="25" align="center" rowspan="2" ><font face="Batang">순위</font></td>
		<td width="80" align="center" rowspan="2" ><font face="Batang">센서</font></td>
		<td width="80" align="center" rowspan="2" ><font face="Batang">설치<br>위치</font></td>
		<td width="100" align="center" rowspan="2" ><font face="Batang">계측<br>항목</font></td>
		<td width="100" align="center" rowspan="2" ><font face="Batang">센서<br>종류</font></td>
		<td width="300" align="center" colspan="4" ><font face="Batang">경보발생</font></td>
		<td width="300" align="center" colspan="4" ><font face="Batang">조치율</font></td>
	</tr>
	<tr>
		<td align="center" ><font face="Batang">위험<br/>(총:<s:property value="cri" />건)</font></td>
		<td align="center" ><font face="Batang">%</font></td>
		<td align="center" ><font face="Batang">경고<br/>(총:<s:property value="maj" />건)</font></td>
		<td align="center" ><font face="Batang">%</font></td>
		<td align="center" ><font face="Batang">조치</font></td>
		<td align="center" ><font face="Batang">%</font></td>
		<td align="center" ><font face="Batang">미조치</font></td>
		<td align="center" ><font face="Batang">%</font></td>
	</tr>
	<s:iterator value="listSensor" status="stat">
   			<%
  							String criVal = request.getAttribute("cri")==null?"0":request.getAttribute("cri").toString();
								String majVal = request.getAttribute("maj")==null?"0":request.getAttribute("maj").toString();
								String yVal = request.getAttribute("vY")==null?"0":request.getAttribute("vY").toString();
								String nVal = request.getAttribute("vN")==null?"0":request.getAttribute("vN").toString();
								
								
								String trCri = request.getAttribute("trouble_cri_count")==null?"0":request.getAttribute("trouble_cri_count").toString();
								String trMaj = request.getAttribute("trouble_maj_count")==null?"0":request.getAttribute("trouble_maj_count").toString();
								String trY = request.getAttribute("trouble_y_count")==null?"0":request.getAttribute("trouble_y_count").toString();
								String trN = request.getAttribute("trouble_n_count")==null?"0":request.getAttribute("trouble_n_count").toString();
								
								int intcri = Integer.parseInt(criVal);
								int intmaj = Integer.parseInt(majVal);
								
								
								int intTrcri =  Integer.parseInt(trCri);
								int intTrmaj =  Integer.parseInt(trMaj);
					
								int markinYn = intTrcri + intTrmaj;
								
								int intY =  Integer.parseInt(yVal);
								int intN =  Integer.parseInt(nVal);
								
								int intTrY =  Integer.parseInt(trY);
								int intTrN =  Integer.parseInt(trN);
								
								int totErr = intcri + intmaj;
								
								double deValCri = 0D;
								double deValMaj = 0D;
								double deValY = 0D;
								double deValN = 0D;
								double markYper = 0D;
								
								if( intcri == 0 )
								{
									deValCri = 0;
								}
								else
								{
									deValCri = ((double)intTrcri/(double)intcri );
								}
								
								if( intmaj == 0 )
								{
									deValMaj = 0;
								}
								else
								{
									deValMaj = ((double)intTrmaj/(double)intmaj );
								}
								
								if( markinYn == 0 )
								{
									deValY = 0;
								}
								else
								{
									deValY = ((double)intTrY /(double)markinYn );
									
								}
								
								if( markinYn == 0 )
								{
									deValN = 0;
								}
								else
								{
									deValN = ((double)intTrN /(double)markinYn );
								}
								
								
								NumberFormat nf = NumberFormat.getPercentInstance();
								
								String criF = nf.format(deValCri);
								String majF = nf.format(deValMaj);
								String yF = nf.format(deValY);
								String nF = nf.format(deValN);
				%>
	         <tr>
              <td height="22" align="center" ><font face="Batang"><s:if test="rnum==null">&nbsp;</s:if><s:else><s:property value="rnum" /></s:else></font></td>	
              <td align="center" ><font face="Batang"><s:if test="sensor_id==null">&nbsp;</s:if><s:else><s:property value="sensor_id" /></s:else></font></td>
              <td align="center" ><font face="Batang"><s:if test="loc_nm==null">&nbsp;</s:if><s:else><s:property value="loc_nm" /></s:else></font></td>
              <td align="left" ><font face="Batang"><s:if test="inst_item_nm==null">&nbsp;</s:if><s:else><s:property value="inst_item_nm" /></s:else></font></td>
              <td align="left" ><font face="Batang"><s:if test="sensor_type_nm==null">&nbsp;</s:if><s:else><s:property value="sensor_type_nm" /></s:else></font></td>
              <td align="center" ><font face="Batang">
						<s:if test="trouble_cri_count==null">0</s:if>
						<s:else>
							<s:if test="trouble_cri_count>0"><font color="red">
							<s:property value="trouble_cri_count" /></font></s:if>
							<s:else><s:property value="trouble_cri_count" /></s:else>
						</s:else></font>
					</td>
					<td align="center"><font face="Batang">
						<s:if test="trouble_cri_count==null">0</s:if>
						<s:else>
							<s:if test="trouble_cri_count>0">
							<%=criF %>
							</s:if>
							<s:else>0</s:else>
						</s:else></font>
					</td>
					<td align="center" ><font face="Batang">
						<s:if test="trouble_maj_count==null">0</s:if>
						<s:else>
							<s:if test="trouble_maj_count>0"><font color="orange"><s:property value="trouble_maj_count" /></font></s:if>
							<s:else><s:property value="trouble_maj_count" /></s:else>
						</s:else></font>
					</td>
					<td align="center" ><font face="Batang">
						<s:if test="trouble_cri_count==null">0</s:if>
						<s:else>
							<s:if test="trouble_maj_count>0">
							<%=majF %>
							</s:if>
							<s:else>0</s:else>
						</s:else></font>
					</td>
					<td align="center" ><font face="Batang">
						<s:if test="trouble_y_count==null">0</s:if>
						<s:else>
							<s:if test="trouble_y_count>0"><font color="blue"><s:property value="trouble_y_count" /></font></s:if>
							<s:else><s:property value="trouble_y_count" /></s:else>
						</s:else></font>
					</td>
					<td align="center" ><font face="Batang">
						<s:if test="trouble_y_count==null">0</s:if>
						<s:else>
							<s:if test="trouble_y_count>0">
							<%=yF %>
							</s:if>
							<s:else>0</s:else>
						</s:else></font>
					</td>
					<td align="center" ><font face="Batang">
						<s:if test="trouble_n_count==null">0</s:if>
						<s:else>
							<s:if test="trouble_n_count>0"><font color="red"><s:property value="trouble_n_count" /></font></s:if>
							<s:else><s:property value="trouble_n_count" /></s:else>
						</s:else></font>
					</td>
					<td align="center" ><font face="Batang">
						<s:if test="trouble_n_count==null">0</s:if>
						<s:else>
							<s:if test="trouble_n_count>0">
							<%=nF %>
							</s:if>
							<s:else>0</s:else>
						</s:else></font>
					</td>
             </tr>
            </s:iterator>
</table>
</div>
<pd4ml:page.break/>
<br/><br/>
<div class="subtab">
<div id="secret"></div>
<table width="950"  height="25" border="0" cellspacing="0" cellpadding="0" id="top">
	<tr> 
   	<td height="25">
   		<img src="../images/point_title_02.gif">&nbsp;<font face="Batang">상세정보</font> 
   	</td>
  </tr>
</table>
</div>
<div class="month">
<table width="900" border="0" cellspacing="0" cellpadding="0" id="group1">
	<tr>
		<td height="25" align="center" rowspan="2" ><font face="Batang">NO</font></td>
		<td width="100" align="center" rowspan="2" ><font face="Batang">발생일자</font></td>
		<td width="80" align="center" rowspan="2" ><font face="Batang">센서<br>종류</font></td>
		<td width="100" align="center" rowspan="2" ><font face="Batang">구조물<br>구성</font></td>
		<td width="300" align="center" colspan="4" ><font face="Batang">경보발생</font></td>
		<td width="300" align="center" colspan="4" ><font face="Batang">조치율<font color="red">(조치율:<s:property value="mYper" />)</font></font></td>
	</tr>
	<tr>
		<td align="center" ><font face="Batang">위험<br/>(총:<s:property value="cri" />건)</font></td>
		<td align="center" ><font face="Batang">%</font></td>
		<td align="center" ><font face="Batang">경고<br/>(총:<s:property value="maj" />건)</font></td>
		<td align="center" ><font face="Batang">%</font></td>
		<td align="center" ><font face="Batang">조치</font></td>
		<td align="center" ><font face="Batang">%</font></td>
		<td align="center" ><font face="Batang">미조치</font></td>
		<td align="center" ><font face="Batang">%</font></td>
	</tr>
	<s:iterator value="rsStatTotal_tro" status="stat1">
				<%
					String statdt = request.getAttribute("stat_dt")==null?"":request.getAttribute("stat_dt").toString();
					String dt = DateUtils.getStrDateVer(statdt);    
				
				%>
				<%
							
								String criVal = request.getAttribute("cri")==null?"0":request.getAttribute("cri").toString();
								String majVal = request.getAttribute("maj")==null?"0":request.getAttribute("maj").toString();
								String yVal = request.getAttribute("vY")==null?"0":request.getAttribute("vY").toString();
								String nVal = request.getAttribute("vN")==null?"0":request.getAttribute("vN").toString();
								
								
								String trCri = request.getAttribute("trouble_cri_count")==null?"0":request.getAttribute("trouble_cri_count").toString();
								String trMaj = request.getAttribute("trouble_maj_count")==null?"0":request.getAttribute("trouble_maj_count").toString();
								String trY = request.getAttribute("trouble_y_count")==null?"0":request.getAttribute("trouble_y_count").toString();
								String trN = request.getAttribute("trouble_n_count")==null?"0":request.getAttribute("trouble_n_count").toString();
								
								int intcri = Integer.parseInt(criVal);
								int intmaj = Integer.parseInt(majVal);
								
								
								int intTrcri =  Integer.parseInt(trCri);
								int intTrmaj =  Integer.parseInt(trMaj);
					
								int markinYn = intTrcri + intTrmaj;
								
								int intY =  Integer.parseInt(yVal);
								int intN =  Integer.parseInt(nVal);
								
								int intTrY =  Integer.parseInt(trY);
								int intTrN =  Integer.parseInt(trN);
								
								int totErr = intcri + intmaj;
								
								double deValCri = 0D;
								double deValMaj = 0D;
								double deValY = 0D;
								double deValN = 0D;
								double markYper = 0D;
								
								if( intcri == 0 )
								{
									deValCri = 0;
								}
								else
								{
									deValCri = ((double)intTrcri/(double)intcri );
								}
								
								if( intmaj == 0 )
								{
									deValMaj = 0;
								}
								else
								{
									deValMaj = ((double)intTrmaj/(double)intmaj );
								}
								
								if( markinYn == 0 )
								{
									deValY = 0;
								}
								else
								{
									deValY = ((double)intTrY /(double)markinYn );
									
								}
								
								if( markinYn == 0 )
								{
									deValN = 0;
								}
								else
								{
									deValN = ((double)intTrN /(double)markinYn );
								}
								
								
								NumberFormat nf = NumberFormat.getPercentInstance();
								
								String criF = nf.format(deValCri);
								String majF = nf.format(deValMaj);
								String yF = nf.format(deValY);
								String nF = nf.format(deValN);
				%>
				<tr>
					<td height="22" align="center" ><font face="Batang">
					  <s:if test="rnum==null"><s:property value="rnum" /></s:if>
						<s:else>
							<s:property value="rnum" /></s:else></font></td>
					<td align="center"><font face="Batang"><s:if test="stat_dt==null">&nbsp;</s:if><s:else><%=dt %></s:else></font></td>
					<td align="left" ><font face="Batang"><s:if test="sensor_type_nm==null">&nbsp;</s:if><s:else><s:property value="sensor_type_nm" /></s:else></font></td>
					<td align="left" ><font face="Batang"><s:if test="struct_comp_nm==null">&nbsp;</s:if><s:else><s:property value="struct_comp_nm" /></s:else></font></td>
					<td align="center"><font face="Batang">
						<s:if test="trouble_cri_count==null">0</s:if>
						<s:else>
							<s:if test="trouble_cri_count>0"><font color="red">
							<s:property value="trouble_cri_count" /></font></s:if>
							<s:else><s:property value="trouble_cri_count" /></s:else>
						</s:else></font>
					</td>
					<td align="center" ><font face="Batang">
						<s:if test="trouble_cri_count==null">0</s:if>
						<s:else>
							<s:if test="trouble_cri_count>0">
							<%=criF %>
							</s:if>
							<s:else>0</s:else>
						</s:else></font>
					</td>
					<td align="center" ><font face="Batang">
						<s:if test="trouble_maj_count==null">0</s:if>
						<s:else>
							<s:if test="trouble_maj_count>0"><font color="orange"><s:property value="trouble_maj_count" /></font></s:if>
							<s:else><s:property value="trouble_maj_count" /></s:else>
						</s:else></font>
					</td>
					<td align="center" ><font face="Batang">
						<s:if test="trouble_cri_count==null">0</s:if>
						<s:else>
							<s:if test="trouble_maj_count>0">
							<%=majF %>
							</s:if>
							<s:else>0</s:else>
						</s:else></font>
					</td>
					<td align="center" ><font face="Batang">
						<s:if test="trouble_y_count==null">0</s:if>
						<s:else>
							<s:if test="trouble_y_count>0"><font color="blue"><s:property value="trouble_y_count" /></font></s:if>
							<s:else><s:property value="trouble_y_count" /></s:else>
						</s:else></font>
					</td>
					<td align="center" ><font face="Batang">
						<s:if test="trouble_y_count==null">0</s:if>
						<s:else>
							<s:if test="trouble_y_count>0">
							<%=yF %>
							</s:if>
							<s:else>0</s:else>
						</s:else></font>
					</td>
					<td align="center" ><font face="Batang">
						<s:if test="trouble_n_count==null">0</s:if>
						<s:else>
							<s:if test="trouble_n_count>0"><font color="red"><s:property value="trouble_n_count" /></font></s:if>
							<s:else><s:property value="trouble_n_count" /></s:else>
						</s:else></font>
					</td>
					<td align="center" ><font face="Batang">
						<s:if test="trouble_n_count==null">0</s:if>
						<s:else>
							<s:if test="trouble_n_count>0">
							<%=nF %>
							</s:if>
							<s:else>0</s:else>
						</s:else></font>
					</td>
					
				</tr>
				
				</s:iterator>
				
</table>
</div>
</body>
</html>

 </pd4ml:transform>
