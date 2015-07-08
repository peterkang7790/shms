<%@ page language="java" import="java.util.*" pageEncoding="EUC-KR"%>
<%
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
String bg = "";
String ImgPath  = request.getContextPath() + "/images/";

%>
<%@taglib prefix="s" uri="/struts-tags" %>
<s:if test="#session.USER_ID==null">
	<s:include  value="../common/AccessDenied.jsp"></s:include>
</s:if>
<s:else>

<html>
<head>
<title>SHMS</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link href="../css/common01.css" rel="stylesheet" type="text/css">
<link href="../css/dtree.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../script/ComUtil.js" ></script>
<script type="text/javascript" src="../script/dtree.js"></script>
<style type="text/css">
<!--
body { margin-left: 10px; margin-top: 10px; margin-right: 0px; margin-bottom: 0px;}
.style3 { color: #ffa72a; font-weight: bold; }
#floater {position:absolute; visibility:visible; }
-->
</style>
<script type="text/javascript">
	function delStructComp(senid,compId) {
		if (senid==null || senid=="") {
			alert("선택된 '구조물 구성ID'가 없습니다. \n\n선택 후 삭제가 가능합니다.");
			return false;
		}
		
		var url = "delStructComp.do?struct_comp_id=" + senid + "&p_struct_comp_id=" + compId;
		if (confirm("정말로 삭제하시겠습니까?\n(하위정보도 같이 삭제 됩니다.)")) {
			// 확인 버튼을 눌렀을 때 실행
			listStructCompTree.method = "post";
			listStructCompTree.target = "_self";
			listStructCompTree.action = url;
			listStructCompTree.submit();
		}
		else {
			// 취소 버튼을 눌렀을 때 실행
			return false;
		}  
	}
</script>
<script language="JavaScript"> 
<!-- 
self.onError=null; 
currentX = currentY = 0; 
whichIt = null; 
lastScrollX = 0; lastScrollY = 0; 
NS = (document.layers) ? 1 : 0; 
IE = (document.all) ? 1: 0; 
 
function heartBeat() { 
	if(IE) { 
		if( document.body == null || document.body == undefined || document.body == "" )
		{
			diffY = 0;
		}
		else
		{
			diffY = document.body.scrollTop;
		}
		diffX = 0; 
	} 
	if(NS) { diffY = self.pageYOffset; diffX = self.pageXOffset; } 
	if(diffY != lastScrollY) { 
		percent = .1 * (diffY - lastScrollY); 
		if(percent > 0) percent = Math.ceil(percent); 
		else percent = Math.floor(percent); 
		if(IE) document.all.floater.style.pixelTop += percent; 
		if(NS) document.floater.top += percent; 
		lastScrollY = lastScrollY + percent; 
	} 
	if(diffX != lastScrollX) { 
		percent = .1 * (diffX - lastScrollX); 
		if(percent > 0) percent = Math.ceil(percent); 
		else percent = Math.floor(percent); 
		if(IE) document.all.floater.style.pixelLeft += percent; 
		if(NS) document.floater.top += percent; 
		lastScrollY = lastScrollY + percent; 
	} 
} 
if(NS || IE) action = window.setInterval("heartBeat()",1);
-->
</script>
</head>

<body bgproperties="fixed">

<table width="750" height="100%" border="0" cellpadding="0" cellspacing="0" background="../images/bg.gif">
    <tr>
      <td valign="top">
	  <table width="750" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="32" colspan="2" background="../images/title_bg.gif">
		  <table width="740" border="0" cellspacing="0" cellpadding="0" style="padding:0px 0px 0px 5px;">
            <tr>
              <td width="20" valign="top"><img src="../images/point_title_01.gif" width="20" height="17"></td>
              <td width="270" class="title_01">구조물 구성</td>
              <td width="450" class="route"><div align="right">홈 &nbsp;&gt;&nbsp; 기준정보 &nbsp;&gt;&nbsp; 구조물구성</div></td>
            </tr>
          </table></td>
        </tr>
        <tr>
          <td height="10" colspan="2"></td>
        </tr>
      </table>
	  <div id="layer1" style="overflow:auto; width:250px; height:570px; position:absolute; left:5px; top:45px; z-index:1;">
	  <s:form id="form1" namespace="/baseInfo" action="listStructCompTree" theme="simple" method="get">
		<table width="200" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="200" rowspan="2" class="dtree">
				<table width="200" height="100%" border="0" cellpadding="0" cellspacing="0" >
				<p><a href="javascript: d.openAll();"><img src="../images/openAll.bmp" border="0" alt="open all"/><font size="1">&nbsp;펼치기</font></a>
				   <a href="javascript: d.closeAll();"><img src="../images/closeAll.bmp" border="0" alt="close all"/><font size="1">&nbsp;접기</font></a>
				</p>
				<tr>
					<td bgcolor="#FFFFFF">
						<script type="text/javascript">
							d = new dTree('d');
							
							<s:iterator value="listStructCompTree" status="stat">

							d.add('<s:property value="key" />', 
								  '<s:property value="p_key" />', 
								  '<s:property value="key_nm" />',
								  '<s:if test="p_key==-1">javascript:void(0);</s:if><s:else>listStructComp.do?struct_comp_id=<s:property value="key" />&p_struct_comp_id=<s:property value="p_key" />&struct_comp_nm=<s:property value="key_nm" />&basecall=<s:property value="basecall" />&formType=edit</s:else> ');
<%--							--%>

							
<%--							d.add('<s:property value="key" />', --%>
<%--								  '<s:property value="p_key" />', --%>
<%--								  '<s:property value="key_nm" />',--%>
<%--								  '<s:if test="p_key==-1"></s:if><s:else>listStructComp.do?struct_comp_id=<s:property value="key" />&p_struct_comp_id=<s:property value="p_key" />&struct_comp_nm=<s:property value="key_nm" />&basecall=<s:property value="basecall" />&formType=edit</s:else> ');--%>
<%--							--%>

							</s:iterator>			
							document.write(d);
					</script>
					</td>
				</tr>
				</table>
			</td>
		</tr>	
	    <tr>
          <td height="15"></td>
        </tr>
        
      </table>	 
       </s:form>
	</div>
	<div id="layer2" style="width:500px; height:300px; position:absolute; left:235px; top:45px; z-index:1;">
	
	<table width="470" border="0" cellspacing="0" cellpadding="0">
        <tr height="30" valgin="top">
            <td width="12" valign="middle"><img src="../images/point_title_02.gif" width="5" height="13"></td>
            <td class="title_02" style="padding-top:1px;" >구조물구성 현황</td>
            <td align="right">
            	<a href="javascript:MM_openBrWindow('addViewStructCompPop.do','','width=500,height=350,resizable=yes');">
            		<img src="<%=ImgPath%>btn_regist.gif" width="59" height="20" border="0">
            	</a>
            	<s:if test="formType==null"></s:if>
            	<s:else>
	           		<s:a href="javascript:MM_openBrWindow( 'editViewStructCompPop.do?struct_comp_id=%{struct_comp_id}','','width=500,height=350,resizable=yes');">
	           			<img src="../images/btn_modify.gif" width="59" height="20" border="0" />
	           		</s:a>
            	</s:else>
            	<a href="#" onclick="delStructComp( '<s:property value="struct_comp_id" />','<s:property value="p_struct_comp_id" />' )" ><img src="<%=ImgPath%>btn_delet.gif" width="59" height="20" border="0"></a>
            </td>
        </tr>
        <tr width="470">
          <td colspan="3">
          <s:if test="listStructComp==null">
          	<table width="470"  border="0" cellpadding="0" cellspacing="1" class="MSlinetd" >
			<tr>
				<td colspan="2" height="1" class="MS01td"></td>
			</tr>
            <tr>
              <td  width="100" height="10" class="MS05td" style="padding-left:10px"><div align="left">구조물 구성ID</div></td>
			  <td class="MS06td" style="padding-left:5px">
				<s:if test="struct_comp_id==null">&nbsp;</s:if>
				<s:else><s:property value="struct_comp_id" /></s:else> 
			 </td>
            </tr>
            <tr>
              <td height="10" class="MS05td" style="padding-left:10px"><div align="left">구성명</div></td>
			  <td class="MS06td" style="padding-left:5px">
				<s:if test="struct_comp_nm==null">&nbsp;</s:if>
				<s:else><s:property value="struct_comp_nm" /></s:else> 
			  </td>
            </tr>
            <tr>
              <td height="10" class="MS05td" style="padding-left:10px"><div align="left">상위ID</div></td>
			  <td class="MS06td" style="padding-left:5px">
				<s:if test="p_struct_comp_id==null">&nbsp;</s:if>
				<s:else><s:property value="p_struct_comp_id" /></s:else> 
			  </td>
            </tr>
            <tr>
              <td height="10" class="MS05td" style="padding-left:10px"><div align="left">비고</div></td>
			  <td class="MS06td" style="padding-left:5px">
				<s:if test="descr==null">&nbsp;</s:if>
				<s:else><s:property value="descr" /></s:else> 
			  </td>
            </tr>
            </table>
            <table width="470" border="0">
              <tr>
				<td colspan="2" height="2" class="MS03td"></td>
			  </tr>
			  <tr>
               	<td>
            		<img src="../upload/jindo_04.gif"  width="230" height="230"/>
            	</td>
            	<td>
            		<img src="../upload/jindo_03.gif"  width="230" height="230"/>
            	</td>
             </tr>
            </table>
          </s:if>
          <s:else>
         	 <s:push value="listStructComp" >
         	 	<table width="470"  border="0" cellpadding="0" cellspacing="1" class="MSlinetd" >
				<tr>
					<td colspan="2" height="1" class="MS01td"></td>
				</tr>
	            <tr>
	              <td  width="100" height="10" class="MS05td" style="padding-left:10px"><div align="left">구조물 구성ID</div></td>
				  <td class="MS06td" style="padding-left:5px">
					<s:if test="struct_comp_id==null">&nbsp;</s:if>
					<s:else><s:property value="struct_comp_id" /></s:else> 
				 </td>
	            </tr>
	            <tr>
	              <td height="10" class="MS05td" style="padding-left:10px"><div align="left">구성명</div></td>
				  <td class="MS06td" style="padding-left:5px">
					<s:if test="struct_comp_nm==null">&nbsp;</s:if>
					<s:else><s:property value="struct_comp_nm" /></s:else> 
				  </td>
	            </tr>
	            <tr>
	              <td height="10" class="MS05td" style="padding-left:10px"><div align="left">상위ID</div></td>
				  <td class="MS06td" style="padding-left:5px">
					<s:if test="p_struct_comp_id==null">&nbsp;</s:if>
					<s:else><s:property value="p_struct_comp_id" /></s:else> 
				  </td>
	            </tr>
	            <tr>
	              <td height="10" class="MS05td" style="padding-left:10px"><div align="left">비고</div></td>
				  <td class="MS06td" style="padding-left:5px">
					<s:if test="descr==null">&nbsp;</s:if>
					<s:else><s:property value="descr" /></s:else> 
				  </td>
	            </tr>
	       </table>
	       <table width="470">
              <tr>
				<td colspan="2" height="2" class="MS03td"></td>
			  </tr>
          	  <tr>
               	<td>
            		<img src="../upload/jindo_04.gif"  width="230" height="230"/>
            	</td>
            	<td>
            		<img src="../upload/jindo_03.gif"  width="230" height="230"/>
            	</td>
             </tr>
            </table>
         	 </s:push>
          </s:else>
       </td>
       </tr>
      </table>	 
      <table width="470"  border="0" cellpadding="0" cellspacing="1" >
   		<tr>
      	<td colspan="2" height="10" ></td>
      </tr>   
      </table>
     <table width="470" border="0" cellspacing="0" cellpadding="0" >
 	  	<s:if test="basecall==null"></s:if>
	        <s:else>
	        	<tr>
		       		<s:a href="../baseInfo/listStruct.do" ><img src="../images/btn_list.gif" width="60" height="20" border="0" /></s:a>
		    	</tr>
	        </s:else>
 	  </table>	
	</div>
	
	</td>
    </tr>
  </table>
  <td valign="top">
	<!-- 퀵메뉴 -->
	<div id="floater" style="left:780px; top:0px; width:100; height:0; z-index:10">
		<table width="80" border="0" bordercolor="red" cellspacing="0" cellpadding="0"style="margin:10px 0px 0px 14px;">
			<tr>
				<s:include value="../common/quickmenu.jsp"></s:include>
			</tr>
		</table>
	</div>
</td>
</body>
</html>

</s:else>
