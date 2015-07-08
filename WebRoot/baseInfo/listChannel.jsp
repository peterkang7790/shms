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

<title>Channel리스트화면</title>
<link href="../css/common01.css" rel="stylesheet" type="text/css">
<script  type="text/javascript" src="../script/ComUtil.js" ></script>
<style type="text/css">
<!--
body { margin-left: 0px; margin-top: 0px; margin-right: 0px; margin-bottom: 0px;}
.style3 { color: #ffa72a; font-weight: bold; }
-->
</style>
<script type="text/javascript">
function moveSensor(ch, de) {
	var url = "addViewSensor.do?detector_id="+de+"&channel_id="+ch;
	top.frames["mainFrame"].location.href = url;
}

	function delChannel(senid,dId) 
	{
	   	
	   var url = "delChannel.do?channel_id="+senid+"&detector_id="+dId;
	   if (confirm("정말로 삭제하시겠습니까?\n(하위정보도같이 삭제 됩니다.)"))
		{
		// 확인 버튼을 눌렀을 때 실행
			listChannel.method = "post";
			listChannel.target = "_self";
			listChannel.action = url;
			listChannel.submit();
		}
		else 
		{
		// 취소 버튼을 눌렀을 때 실행
			return false;
		}  
	}

	function MM_openBrWindow(theURL,winName,features) { //v2.0
		  window.open(theURL,winName,features);
		}
	
</script>


</head>

<body bgproperties="fixed">

<table width="750" border="0" cellspacing="0" cellpadding="0" background="../images/bg.gif">
		<tr>
			<td width="500" height="10">
				<table width="490" height="16" border="0" cellpadding="0" cellspacing="0" style="padding:0px 0px 0px 0px;">
				<tr>
					<td width="12" valign="middle"><img src="../images/point_title_02.gif" width="5" height="13"></td>
					<td width="478" class="title_02">채널 현황 [<s:property value="resultCountP" />건]</td>
				</tr>
				</table>
			</td>
			<td width="250" valign="top" style="padding:0px 0px 0px 200px;">
				<a href="javascript:MM_openBrWindow('addViewChannel.do','','width=400,height=250,resizable=yes');" onfocus="this.blur();">
				<img src="../images/btn_regist.gif" width="59" height="20" border="0">
				</a>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<table width="750" border="0" cellspacing="1" bgcolor="#CCCCCC" cellpadding="2">
					<tr>
						<td colspan="5" height="2" class="MS01td"></td>
					</tr>
					<tr>
						<td width="40" height="25" align="center" class="MS05td">NO</td>
					<td width="200" align="center" class="MS05td">DETECTOR ID</td>
					<td width="200" align="center" class="MS05td">CHANNEL ID</td>
					<td width="250" align="center" class="MS05td">CHANNEL 명</td>
					<td width="150" align="center" class="MS05td" id="dt_view">관리</td>
					</tr>
					<s:form id="form1" namespace="/baseInfo" action="listChannel" theme="simple" method="get"></s:form>
					<s:iterator value="listChannel" status="stat">
					<s:if test="rnum%2==0"> <% bg = "MSlist03td"; %> </s:if><s:else> <% bg = "MSlist02td"; %> </s:else>
					<tr>
						<td height="22" align="center" class="<%=bg%>"><s:if test="rnum==null">&nbsp;</s:if><s:else><s:property value="rnum" /></s:else></td>
						<td align="center" class="<%=bg%>"><s:if test="detector_id==null">&nbsp;</s:if><s:else><s:property value="detector_id" /></s:else></td>
						<td align="center" class="<%=bg%>"><s:if test="channel_id==null">&nbsp;</s:if><s:else><s:property value="channel_id" /></s:else></td>
						<td align="center" class="<%=bg%>"><s:if test="channel_nm==null">&nbsp;</s:if><s:else><s:property value="channel_nm" /></s:else></td>
						<td align="center" class="<%=bg%>">
							<s:url id="delChannel" action="delChannel">
							<s:param name="channel_id" value="channel_id"/>
							</s:url>
							<s:a href="#" onclick="delChannel( '%{channel_id}','%{detector_id}' )" onfocus="this.blur();">
					        <img src="../images/btnS_delet.gif" width="32" height="17" border="0">
					        </s:a>
					        <s:a href="#" onclick="moveSensor( '%{channel_id}','%{detector_id}' )" onfocus="this.blur();">
					        <img src="../images/btnS_sensor_regist.gif" width="50" height="17" border="0">
					        </s:a>
					    </td>
					</tr>
					
					</s:iterator>
					<table align="center" style="padding-top:50px" >
						<s:if test="resultCountP == 0">
						<tr>
							<td colspan="5" class="MSlist02td" align="center">검색된 결과가 없습니다.</td>
						</tr>
						</s:if>	
						<s:else>
							<tr>
							<td align="center" class="MSlist02td" colspan="6">
								<table border="0" cellspacing="0" cellpadding="0" class="page_view">
								<tr align="center">
<%--									<td width="13"><a href="#"><img src="../images/btn_first.gif" width="13" height="13" border="0"></a></td>--%>
<%--									<td width="8">&nbsp;</td>--%>
<%--									<td width="13"><a href="#"><img src="../images/btn_back.gif" width="13" height="13" border="0"></a></td>--%>
									<td width="12">&nbsp;</td>
									<td><s:property value="pagingString" escape="false" /></td>
									<td width="12">&nbsp;</td>
<%--									<td width="13"><a href="#"><img src="../images/btn_next.gif" width="13" height="13" border="0"></a></td>--%>
<%--									<td width="8">&nbsp;</td>--%>
<%--									<td width="13"><a href="#"><img src="../images/btn_end.gif" width="13" height="13" border="0"></a></td>--%>
								</tr>
								</table>
							</td>
						</tr>
						</s:else>
					</table>
				</table>
			</td>
		</tr>
</table>
</body>
</html>