<%@ page language="java" import="java.util.*" pageEncoding="EUC-KR"%>
<%
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
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
<script type="text/javascript" src="../script/ComUtil.js" ></script>
<script type="text/javascript" src="../script/script.js" ></script>
<script type="text/javascript" src="../script/jquery.js" ></script>
<style type="text/css">
<!--
body { margin-left: 10px; margin-top: 10px; margin-right: 0px; margin-bottom: 0px;}
#floater {position:absolute; visibility:visible; }
#tooltipShow   
        {   
            position: absolute;   
            background: #FDF8B3;   
            border: 1px solid #fcc;   
            padding: 3px;   
            width: 150px;  
            font-size: 11px; 
            color: #726CDD;
            font-family: "돋움"
        }  
-->
</style>
<script type="text/javascript" language="javascript">   
        $(document).ready(function () {   
            var positionTooltip = function (event) {   
                //              alert("이벤트발생");   
                var tPosX = event.pageX - 5;   
                var tPosY = event.pageY + 15;   
                //              alert(tPosX +  "-" +  tPosY);   
                $('#tooltipShow').css({ top: tPosY, left: tPosX });   
            };   
               
            $('#tooltipShow').hide();   
  
            $('#tooltip').hover(function () {   
                $('#tooltipShow').show();   
            },   
            function () {   
                $('#tooltipShow').hide();   
            }).mousemove(positionTooltip);   
           
        });

        function hotCnt( val, val2 )
        {
            
        	if( val == 'Y' )
        	{
            	if( val2 >= 2 )
            	{
					alert("HotLine은 2명까지 선택 가능하며 현재 2명 모두 선택 하셨습니다.");
					history.back();
            	}
            	else if( $('#tel_no').value == null || $('#tel_no').value == '')
        		{
        			alert("HotLine을 Y선택 하시면 연락처가 반드시 입력되어야 합니다.");	
        			 $('#tel_no').focus();
        		} 
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

<s:form id="form1" namespace="/admin" action="editUser" theme="simple" method="get">
<s:push value="rsOneUser">

<div id="tooltipShow">*  Hot Line은 2명 까지만 <br>가능합니다.</div>
<table width="750" height="100%" border="0" cellpadding="0" cellspacing="0" background="../images/bg.gif">
<tr>
	<td valign="top">
		<table width="750" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td height="32" background="../images/title_bg.gif">
				<table width="740" border="0" cellspacing="0" cellpadding="0" style="padding:0px 0px 0px 5px;">
				<tr>
					<td width="20" valign="top"><img src="../images/point_title_01.gif" width="20" height="17"></td>
					<td width="270" class="title_01">사용자수정 </td>
					<td width="450" class="route"><div align="right">홈 &nbsp;&gt;&nbsp; Admin &nbsp;&gt;&nbsp; 사용자</div></td>
				</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td height="30" valign="top">
				<table width="740" height="16" border="0" cellpadding="0" cellspacing="0" style="padding:10px 0px 0px 1px;">
				<tr>
					<td width="12" valign="middle"><img src="../images/point_title_02.gif" width="5" height="13"></td>
					<td width="682" class="title_02">사용자정보</td>
				</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td><table width="750" border="0" cellpadding="0" cellspacing="1" class="MSlinetd">
				<tr>
					<td colspan="6" height="2" class="MS01td"></td>
				</tr>
				<tr>
					<td width="120" height="25" class="MS05td" style="padding-left:10px"><div align="left">사용자ID</div></td>
					<td width="200" class="MS06td" style="padding-left:5px">
						<input type="text" name="user_id" value="${user_id}" class="m_box" style="width:150" readOnly />
					</td>
					<td width="100"  class="MS05td" style="padding-left:10px"><div align="left">사용자명</div></td>
					<td width="300" class="MS06td" style="padding-left:5px" colspan="3">
						<input type="text" name="user_nm" value="${user_nm}" class="box" style="width:150" />
					</td>
				</tr>
				<tr>
					<td class="MS05td" style="padding-left:10px"><div align="left">비밀번호</div></td>
					<td class="MS07td" style="padding-left:5px">
						<s:a href="javascript:MM_openBrWindow('../admin/editPassWordView.do?user_id=%{user_id}','','width=400,height=300, resizable=yes, scrollbars=no');" title="비밀번호수정하기" onfocus="this.blur();" >
<%--							<input type="password" name="password" value="${password}" class="box" style="width:150" />--%>
							<img src="../images/Password.gif" border="1" alt="비밀번호수정하기" align="absmiddle"/> <font color="#787878" size="1">수정</font>
						</s:a>
					</td>
					<td class="MS05td" style="padding-left:10px"><div align="left">그룹</div></td>
					<td class="MS07td" style="padding-left:5px" colspan="3">
						<s:select name="group_id" id="group_id" list="group_list" listKey="group_id" listValue="group_nm" headerKey="" headerValue="선택" cssStyle="width:150px"></s:select>
					</td>
				</tr>
				<tr>
					<td height="25" class="MS05td" style="padding-left:10px"><div align="left">이메일</div></td>
					<td colspan="5" class="MS06td" style="padding-left:5px">
						<input type="text" name="email" value="${email}" class="box" style="width:500" />
					</td>
				</tr>
				<tr>
					<td height="25" class="MS05td" style="padding-left:10px"><div align="left">핸드폰</div></td>
					<td class="MS07td" style="padding-left:5px">
						<input type="text" name="mobile_no" value="${mobile_no}" class="box" style="width:150" />
					</td>
					<td class="MS05td" style="padding-left:10px"><div align="left">전화번호</div></td>
					<td class="MS07td" style="padding-left:5px" colspan="3">
						<input type="text" id="tel_no" name="tel_no" value="${tel_no}" class="box" style="width:150" />
					</td>
				</tr>
				<tr>
					<td class="MS05td" style="padding-left:10px"><div align="left">팩스번호</div></td>
					<td class="MS06td" style="padding-left:5px">
						<input type="text" name="fax_no" value="${fax_no}" class="box" style="width:150" />
					</td>
					<td class="MS05td" style="padding-left:10px"><div align="left">SMS수신여부</div></td>
					<td class="MS06td" style="padding-left:5px" colspan="3">
						<s:select name="sms_recv_yn" id="cd" list="sms_recv_yn_list" listKey="cd" listValue="nm" headerKey="" headerValue="선택" cssStyle="width:150px"></s:select>
					</td>
				</tr>
				<tr>
					<td class="MS05td" style="padding-left:10px"><div align="left">사용등급</div></td>
					<td class="MS07td" style="padding-left:5px">
						<s:select name="used_class_cd" id="used_class_cd" list="usedclass_list" listKey="used_class_cd" listValue="used_class_nm" headerKey="" headerValue="선택" cssStyle="width:150px"></s:select>
					</td>
					<td class="MS05td" style="padding-left:10px"><div align="left">삭제여부</div></td>
					<td width="150" class="MS07td" style="padding-left:5px">
						<input type="text" name="del_yn" value="${del_yn}" class="graybox" style="width:50" readOnly />
						<s:if test="del_yn=='Y'"><font size="1" color="red">삭제된 사용자</font></s:if><s:else><font size="1" >사용중인 사용자</font></s:else>
					</td>
					<td width="80" class="MS05td" style="padding-left:10px">
						<s:if test="hotcnt>=2"><div align="left"><span id="tooltip">HOT Line</span></div></s:if>
						<s:else><div align="left">HOT Line</div></s:else>
					</td>
					<td width="100" class="MS07td" style="padding-left:5px">
<%--						<s:if test="hotcnt>=2"><input type="text" name="hot_line_woker_yn_1" value="${hot_line_woker_yn}" class="graybox" style="width:50" readOnly /></s:if>--%>
<%--						<s:else>--%>
						<s:select name="hot_line_woker_yn" id="cd" list="yn_list" listKey="cd" listValue="nm" headerKey="" headerValue="선택" cssStyle="width:60px" onchange="hotCnt(this.value,%{hotcnt});" ></s:select>
<%--						</s:else>--%>
					</td>
					
				</tr>
				<tr>
					<td height="25" class="MS05td" style="padding-left:10px"><div align="left">최종접속일시</div></td>
					<td class="MS06td" style="padding-left:5px">
						<input type="text" name="last_access_dt" value="${last_access_dt}" class="graybox" style="width:150" readOnly />
					</td>
					<td class="MS05td" style="padding-left:10px"><div align="left">최종접속 구조물</div></td>
					<td class="MS06td" style="padding-left:5px" colspan="3">
						<input type="text" name="last_struct_id" value="${last_struct_id}" class="graybox" style="width:80" readOnly />
						<input type="text" name="last_struct_nm" value="${last_struct_nm}" class="graybox" style="width:150" readOnly />
					</td>
				</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td><table width="750" border="0" cellspacing="0" cellpadding="0">
				<tr><td height="20"></td></tr>
				<tr>
					<td align="center">
						<div class="text-align:center" >
						<s:submit type="image" src="../images/btn_save.gif"></s:submit>
						<s:a href="listUser.do"><img src="../images/btn_list.gif" border="0"></s:a>
						</div>
					 </td>
				</tr>
				</table>
			</td>
		</tr>
		</table>
		
		<br><br>
	</td>
</tr>
</table>

</s:push>
</s:form>
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
