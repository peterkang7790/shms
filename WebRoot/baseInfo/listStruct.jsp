<%@ page language="java" import="java.util.*" pageEncoding="EUC-KR"  contentType="text/html; charset=euc-kr"%>
<%
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
String RootPath = request.getContextPath() + "/";
String ImgPath  = request.getContextPath() + "/images/";

String bg = "";
%>



<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@taglib prefix="s" uri="/struts-tags" %>

<s:if test="#session.USER_ID==null">
	<s:include  value="../common/AccessDenied.jsp"></s:include>
</s:if>
<s:else>

<html>
<head>

<title>구조물리스트</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link href="<%=RootPath%>css/common01.css" rel="stylesheet" type="text/css">
<script  type="text/javascript" src="../script/script.js" ></script>
<script type="text/javascript">
function delStruct (sId,rowNo) 
{
	
    var url = "delStruct.do?struct_id="+sId+"&nowPage="+rowNo;
   if (confirm("정말로 삭제하시겠습니까?\n(하위정보도같이 삭제 됩니다.)"))
	{
	
	// 확인 버튼을 눌렀을 때 실행
		listStruct.method = "post";
		listStruct.target = "_self";
		listStruct.action = url;
		listStruct.submit();
	} else 
	{
	// 취소 버튼을 눌렀을 때 실행
		return false;
	}  
}

function viewImage(img) { 
	imgView = new Image(); 
	imgView.src = (img); 
	
	if ((imgView.width != 0) && (imgView.Height != 0)) { 
		var xloc = imgView.width + 20; 
		var yloc = imgView.Height + 05; 
		var size = "width=" + xloc + ",height=" + yloc + ",left=10, top=10, resizable=yes, scrollbars=yes"; 
		window.open(img,"",size); 
	} 
} 

</script>

<style type="text/css">
<!--
body {
	margin-left: 28px;
	margin-top: 30px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.style3 {
	color: #ffa72a;
	font-weight: bold;
}
-->
</style>

</head>

<body bgproperties="fixed">
<s:form namespace="/baseInfo" action="listStruct" theme="simple" method="get">
  <table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" background="<%=ImgPath%>bg.gif">
    <tr>
      <td valign="top">
	  <table width="750" border="0" cellspacing="0" cellpadding="0">
        
        <tr>
			<td height="32" colspan="2" background="<%=ImgPath%>title_bg.gif">
				<table width="740" border="0" cellspacing="0" cellpadding="0" style="padding:0px 0px 0px 5px;">
				<tr>
					<td width="20" valign="top"><img src="<%=ImgPath%>point_title_01.gif" width="20" height="17"></td>
					<td width="270" class="title_01">구조물</td>
					<td width="450" class="route"><div align="right">홈 &nbsp;&gt;&nbsp; 기준정보 &nbsp;&gt;&nbsp; 구조물</div></td>
				</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td  height="57">
				<table width="750" height="57" border="0" cellpadding="0" cellspacing="0">
		            <tr>
		              <td width="515">
			              <table width="490" height="16" border="0" cellpadding="0" cellspacing="0" style="padding:20px 0px 0px 1px;">
			                <tr>
			                  <td width="12" valign="middle"><img src="<%=ImgPath%>point_title_02.gif" width="5" height="13"></td>
								<td width="682" class="title_02">구조물 현황 [<s:property value="resultCount" />건] </td>
			                </tr>
			              </table>
			           </td>
		              <td width="250" valign="top" style="padding:30px 0px 0px 200px;">
		              	<s:if test='#session.USED_CLASS_CD=="1"'>
		              		<a href="#"><img src="<%=ImgPath%>btn_regist.gif" width="59" height="20" border="0"></a>
		              	</s:if>
		              </td>
		            </tr>
	          	</table>
			</td>
		</tr>
        
       	<tr>
       		<td valign="top">
		  	<table width="750" border="0" cellpadding="0" cellspacing="1" class="MSlinetd">
            <tr>
             <td colspan="4" height="2" class="MS01td"></td>
            </tr>
            <s:iterator value="listStruct" status="stat">
				<tr>
					<td  height="25" class="MS05td">
					<div align="center">
						<s:if test="struct_nm==null">&nbsp;</s:if>
						<s:else><strong><s:property value="struct_nm" /></strong></s:else>
					</div>	
					</td>
					<td class="MS07td" style="padding-left:25px">
							<s:if test="loc_nm==null">&nbsp;</s:if>
							<s:else><s:property value="loc_nm" /></s:else>
					</td>
				</tr>
				<tr>
					<td height="50" align="center" valign="middle" class="MS06td">
						<s:if test="image_path==null">&nbsp;</s:if>
		                  	<s:else>
		                  		<img src="../upload/<s:property value='image_path'/>" width="140" height="73" border="0" style="cursor:default">&nbsp;	
		                  	</s:else>
					</td>
		             <td class="MS06td" style="padding-left:25px">
					  <table width="510" height="75" border="0" cellpadding="0" cellspacing="0">
		                <tr>
			                  <td height="25">
							  <a href="detailStruct.do?struct_id=${struct_id}"><img src="<%=ImgPath%>btnS_view0.gif" width="32" height="17" border="0"></a>&nbsp;
							  <s:if test='#session.USED_CLASS_CD=="1"'>
								  <a href="#" onclick="delStruct( '${struct_id}',${reqMap.nowPage} )" ><img src="<%=ImgPath%>btnS_delet.gif" width="32" height="17" border="0"></a>&nbsp;
								  	<s:url id="editViewStruct" action="editViewStruct">
										<s:param name="struct_id" value="struct_id" />
										<s:param name="user_id" value="user_id" />
									</s:url>
								  <a href="editViewStruct.do"><img src="<%=ImgPath%>btnS_modify.gif" width="32" height="17" border="0"></a>&nbsp;
								  <a href="../baseInfo/addViewImage.do?baseCall=structTyp"><img src="<%=ImgPath%>btnS_image.gif" width="43" height="17" border="0"></a>&nbsp;
								  <a href="../baseInfo/listStructComp.do?baseCall=structTyp"><img src="<%=ImgPath%>btnS_setup .gif" width="32" height="17" border="0"></a>
							  </s:if>
							  </td>
		                </tr>
		                <tr>
		                  <td height="50" valign="bottom" class="TD">
		                  	<s:if test="image_path==null">&nbsp;</s:if>
		                  	<s:else>
		                  		<s:a href="#" onclick="javascript:viewImage('../upload/%{image_path}');">
		                  			<img src="../upload/<s:property value='image_path' />" width="75" height="40" border="0">
		                  		</s:a> &nbsp;	
		                  		
		                  	</s:else>
						  </td>
				        </tr>
		              </table>
		            </td>
				</tr>	
			</s:iterator>
			<tr>
              <td colspan="13" height="2" class="MS01td"></td>
            </tr>
	    <tr>
        </tr>
      </table>
	</td>
    </tr>
  </table>
  </td>
  </tr>
  </table>
</s:form>
</body>
</html>

</s:else>
