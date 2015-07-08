<%@ page language="java" import="java.util.*" pageEncoding="EUC-KR"  contentType="text/html; charset=euc-kr"%>
<%
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
String RootPath = request.getContextPath() + "/";
String ImgPath  = request.getContextPath() + "/images/";
%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@taglib prefix="s" uri="/struts-tags" %>

<html>
<head>
<title>도시건전성모니터링</title>
<meta http-equiv="refresh" content="10">
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link href="../css/common01.css" rel="stylesheet" type="text/css">
<script  type="text/javascript" src="../script/ComUtil.js" ></script>
<script  type="text/javascript" src="../script/script.js" ></script>
<script  type="text/javascript" src="../script/jquery.js" ></script>
<script type="text/javascript" src="../script/ComUtil.js" ></script>
<script type="text/JavaScript">
<!--



function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}


//-->
</script>
<script type="text/javascript">
//setTimeout("location.reload()", 10000); 
function realtimeClock() {
		document.getElementById('rtcInput').innerHTML = "<font color='white'>"+getTimeStamp()+"</font>";
	    setTimeout("realtimeClock()", 1000);
	}


	function getTimeStamp() { // 24시간제
	  var d = new Date();

	  var s =
	    leadingZeros(d.getFullYear(), 4) + '년' +
	    leadingZeros(d.getMonth() + 1, 2) + '월' +
	    leadingZeros(d.getDate(), 2) + '일 ' +

	    leadingZeros(d.getHours(), 2) + ':' +
	    leadingZeros(d.getMinutes(), 2) + ':' +
	    leadingZeros(d.getSeconds(), 2);

	  return s;
	}


	function leadingZeros(n, digits) {
	  var zero = '';
	  n = n.toString();

	  if (n.length < digits) {
	    for (i = 0; i < digits - n.length; i++)
	      zero += '0';
	  }
	  return zero + n;
	}

</script>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
-->
</style>


</head>

<body bgproperties="fixed" onload="realtimeClock();">


 <table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" background="../images/bg.gif">
      <td valign="top">
	  <table width="925" height="465" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td width="250" height="40" background="../images/dash_title_text21.gif">
	          <div id="timer" style="position:absolute; left:220px; top:18px; width:200; height:10; z-index:0;">
				<table border="0" cellpading="0" cellspacing="0" >
					<td id="rtcInput" style="font-size:11px">
					</td>
				</table>
			</div>
          </td>
        </tr>
        <tr>
          <td height="6" bgcolor="#d7edf9"></td>
        </tr>
        <tr>
          <td height="419" valign="top" bgcolor="#FFFFFF" style="padding:20px 0px 0px 0px;">
		  <table width="890" border="0" cellspacing="0" cellpadding="0" >
		   <tr>
              <td height="35">&nbsp;</td>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
      	    <tr>
			    <td width="300" colspan="3" valign="left" class="main_text">
			    	<marquee direction="left" scrollamount="8" width="300" behavior="slide" > * 10초에 한번씩 자체 Refresh 합니다.</marquee>   
			    </td>
			</tr>
		     <tr>
              <s:iterator value="listDashboard" status="stat">
               <td width="290"> 
	              <table width="290" border="0" cellspacing="0" cellpadding="0">
	                  <tr>
	                    <td height="33" align="center" background="../images/dash_box_top0.gif" class="dash_title01" style="padding-top:10px;">
	                    	<s:if test="struct_nm==null">&nbsp;</s:if>
	                    	<s:else>
	                    		<s:a href="../common/goToStruct.do?struct_id=%{struct_id}&struct_nm=%{struct_nm}&loc_nm=%{loc_nm}&image_path=%{image_path}"  >
	                    			<s:property value="struct_nm" />
	                    		</s:a>
	                    	</s:else>
	                    </td>
	                  </tr>
	                  <tr>
	                    <td height="29" align="center" background="<%=ImgPath%>dash_box_bg1.gif" class="dash_title02">
	                    	<s:a href="../common/goToStruct.do?struct_id=%{struct_id}&struct_nm=%{struct_nm}&loc_nm=%{loc_nm}&image_path=%{image_path}"  >
	                   		 	<s:if test="loc_nm==null">&nbsp;</s:if><s:else><s:property value="loc_nm" /></s:else>
	                   		</s:a> 
	                    </td>
	                  </tr>
	                  <tr>
	                  <td background="../images/dash_box_bg1.gif">
		                  <table width="290" height="80" border="0" cellpadding="0" cellspacing="0">
		                      <tr>
		                        <td width="165">
			                        <table width="165" border="0" cellspacing="0" cellpadding="0">
			                            <tr>
			                              <td height="4"><img src="../images/dash_box_middle.gif" width="165" height="4"></td>
			                            </tr>
			                            <tr>
			                              <td height="120" background="../images/dash_box_bg2.gif" style="padding:0px 0px 0px 14px;">
			                              	<s:a href="../common/goToStruct.do?struct_id=%{struct_id}&struct_nm=%{struct_nm}&loc_nm=%{loc_nm}&image_path=%{image_path}"  >
			                              		<img src="../upload/<s:property value='image_path' />" width="140" height="90" border="0">
			                              	</s:a>
			                              </td>
			                            </tr>
			                        </table>
		                        </td>
		                        <td width="125" valign="top">
			                        <table width="115" border="0" cellspacing="0" cellpadding="0"style="margin:3px 0px 0px 0px;">
			                        	  <tr>
				                            <td height="30" class="dashboard_text">건립연월:&nbsp;<s:property value="construct_year" /><br>
									                              구조물유형:&nbsp;<font color="#7D31FD"><s:property value="struct_type_nm" /></font> <br>
									                              센서수량:&nbsp;<s:property value="sencnt" />&nbsp;개 <br>
									                              구조물 상태:
									            <s:if test="trclass==1"><font color="red">위험</font></s:if>
								             	<s:elseif test="trclass==2"><font color="orange">경고</font></s:elseif>
								             	<s:else><font color="green">안전</font></s:else><br>
								             	위험:<s:if test="trouble_cri_count==null">0</s:if><s:else><s:if test="trouble_cri_count>0"><font color="red"><s:property value="trouble_cri_count" /></font></s:if><s:else><s:property value="trouble_cri_count" /></s:else></s:else>
												경고:<s:if test="trouble_maj_count==null">0</s:if><s:else><s:if test="trouble_maj_count>0"><font color="orange"><s:property value="trouble_maj_count" /></font></s:if><s:else><s:property value="trouble_maj_count" /></s:else></s:else>
									        </td>
					                      </tr>
<%--				                          <tr>--%>
<%--				                            <td height="10" class="dashboard_text">건립연월:&nbsp;<s:property value="construct_year" /></td>--%>
<%--				                          </tr>--%>
<%--				                          <tr>--%>
<%--				                            <td height="22" class="dashboard_text">구조물유형:&nbsp;<font color="#7D31FD"><s:property value="struct_type_nm" /></font></td>--%>
<%--				                          </tr>--%>
<%--				                          <tr>--%>
<%--				                            <td height="22" class="dashboard_text">센서수량:&nbsp;<s:property value="sencnt" />&nbsp; 개</td>--%>
<%--				                          </tr>--%>
<%--				                          <tr>--%>
<%--								             <td height="22" class="dashboard_text">구조물 상태:&nbsp;--%>
<%--								             	<s:if test="trclass==1"><font color="red">위험</font></s:if>--%>
<%--								             	<s:elseif test="trclass==2"><font color="orange">경고</font></s:elseif>--%>
<%--								             	<s:else><font color="green">안전</font></s:else>--%>
<%--								             </td>	--%>
<%--							              </tr>--%>
<%--							              <tr>--%>
<%--							              	<td height="22" class="dashboard_text">--%>
<%--												위험:<s:if test="trouble_cri_count==null">0</s:if><s:else><s:if test="trouble_cri_count>0"><font color="red"><s:property value="trouble_cri_count" /></font></s:if><s:else><s:property value="trouble_cri_count" /></s:else></s:else>--%>
<%--												경고:<s:if test="trouble_maj_count==null">0</s:if><s:else><s:if test="trouble_maj_count>0"><font color="orange"><s:property value="trouble_maj_count" /></font></s:if><s:else><s:property value="trouble_maj_count" /></s:else></s:else>--%>
<%--											</td>--%>
<%--										</tr>--%>
								     </table>
		                        </td>
		                      </tr>
		                  </table>
	                  </td>
	                </tr>
	                <tr>
	                    <td height="16"><img src="<%=ImgPath%>dash_box_down.gif" width="290" height="16"></td>
	                 </tr>
	              </table>
	              <br/>
              </td>
              
              </s:iterator> 
             </tr>
        </table>
          </td>
        </tr>
        <tr>
			<td align="center">
				<div class="text-align:right" >
					<s:a href="#"><img src="../images/btn_close.gif" onclick="self.close();" border="0"></s:a>
				</div>
			</td>
		</tr>
      </table>	
	  <p>&nbsp;</p>
	  <p>&nbsp;</p>
	  <p>&nbsp;</p>
	  <p>&nbsp;</p>
	  <p>&nbsp;</p></td>
 </table>
</body>
</html>
