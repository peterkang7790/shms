<%@ page language="java" import="java.util.*" pageEncoding="EUC-KR"%>
<%@ page import="com.lsware.utils.*" %>
<%
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
	String RootPath = request.getContextPath() + "/";
	String ImgPath  = request.getContextPath() + "/images/";
	String bg = "";
	String icon = "sensor_G_01.gif";
	
%>
<%@taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
<title>SHMS</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<script type="text/javascript" src="../script/ComUtil.js" ></script>
<script type="text/javascript" src="../script/ajax.js" ></script>
<script type="text/javascript" src="../script/jquery.js" ></script>
<script type="text/javascript" src="../script/script.js" ></script>
<script type="text/javascript" src="../script/common.js" ></script>
<link href="css/common01.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
<!--
function moveLeftMenu(num,url) {
	top.frames["leftFrame"].location.href = "leftMenu.do?num=" + num;
	top.frames["mainFrame"].location.href = url;
}

function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}
//-->
</script>
</head>
<body bgproperties="fixed" onLoad="MM_preloadImages('../images/panel_menu_01o.gif','../images/panel_menu_02o.gif','../images/panel_menu_03o.gif')">

  <table width="95" height="100%" border="0" cellpadding="0" cellspacing="0" background="../images/bg.gif">
    <tr>
      <td valign="top">
	  <table width="95" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td>
	          <table width="95" border="0" cellspacing="0" cellpadding="0">
	              <tr>
	                <td><img src="../images/panel_title01.gif" width="95" height="27"></td>
	              </tr>
	              <tr>
	                <td height="34" background="../images/panel_bg.gif">
	               		<img id="changeGif" name="changeGif" src="../images/panel_check_default.gif" width="71" height="27" style="margin:3px 0px 0px 12px;">
<%--	               		아래 BGSOUND는 IE에서만 가능하다 그리하여 OS를 판단하여 처리하는 기능을 추가 해야 할것이다.--%>
	               		<bgsound ID="hems_alm" src="#" autostart="true" loop='3' />
	               	</td>
	              </tr>
<%--	              <tr>--%>
<%--					<td height="17" background="../images/panel_menu_bg.gif" >--%>
<%--						<span class="quick1" >--%>
<%--							<a href="javascript:MM_openBrWindow( '../common/otherStruct.do','','width=400,height=300, resizable=yes, scrollbars=no');" title="타구조물상태조회" onfocus="this.blur();" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image10','','../images/menu_04o.gif',1)" >--%>
<%--							(타)구조물--%>
<%--							</a>--%>
<%--						</span>--%>
<%--					</td>--%>
<%--				  </tr>--%>
	              <tr>
	                <td><img src="../images/panel_down.gif" width="95" height="12"></td>
	              </tr>
	          </table>
          </td>
        </tr>
        <tr>
          <td height="5"></td>
        </tr>
        <tr>
          <td>
			<table width="95" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td><img src="../images/panel_title02.gif" width="95" height="27"></td>
				</tr>
				<tr>
					<td height="6" background="../images/panel_bg.gif"></td>
				</tr>
				<tr>
					<td height="17" background="../images/panel_menu_bg.gif"><span class="quick">
						<a href="javascript:moveLeftMenu(2000,'<%=basePath %>instManage/rptRtStat.do');" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image3','','../images/menu_01o.gif',1)" onfocus="this.blur();">실시간계측</a></span></td>
				</tr>
				<tr>
					<td height="3" background="../images/panel_menu_line.gif"></td>
				</tr>
				<tr>
					<td height="17" background="../images/panel_menu_bg.gif"><span class="quick">
						<a href="javascript:moveLeftMenu(2000,'<%=basePath %>instManage/rptRtStatsensors.do');" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image3','','../images/menu_01o.gif',1)" onfocus="this.blur();">복합계측</a></span></td>
				</tr>
				<tr>
					<td height="3" background="../images/panel_menu_line.gif"></td>
				</tr>
				<tr>
					<td height="17" background="../images/panel_menu_bg.gif"><span class="quick">
						<a href="javascript:moveLeftMenu(3000,'<%=basePath %>sensorManage/senSensorList.do');" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image4','','../images/menu_02o.gif',1)" onfocus="this.blur();">센서현황</a></span></td>
				</tr>
				<tr>
					<td height="3" background="../images/panel_menu_line.gif"></td>
				</tr>
				<tr>
					<td height="17" background="../images/panel_menu_bg.gif"><span class="quick">
						<a href="javascript:moveLeftMenu(4000,'<%=basePath %>alarmManage/listTrouble.do');") onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image5','','../images/menu_03o.gif',1)" onfocus="this.blur();">경보관리</a></span></td>
				</tr>
				<tr>
					<td height="3" background="../images/panel_menu_line.gif"></td>
				</tr>
				<tr>
					<td height="17" background="../images/panel_menu_bg.gif"><span class="quick">
						<a href="javascript:moveLeftMenu(5000,'<%=basePath %>statManage/statTrouble.do');"  onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image6','','../images/menu_04o.gif',1)" onfocus="this.blur();">통계</a></span></td>
				</tr>
				<tr>
					<td><img src="../images/panel_down.gif" width="95" height="12"></td>
				</tr>
			</table>
          </td>
        </tr>
        <tr>
          <td height="5"></td>
        </tr>
        <tr>
          <td><table width="95" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td><img src="../images/panel_title03.gif" width="95" height="27"></td>
            </tr>
            <tr>
            	<td height="35" valign="top" background="../images/panel_hotline_bg2.gif">
				    <table width="80" border="0" cellspacing="0" cellpadding="0" style="margin:3px 0px 0px 10px;">
		                <tr>
		                  <td height="20" class="hotline_name" id="hotline_user_nm"></td>
		                </tr>
		                <tr>
		                  <td class="hotline_tel" style="padding-top:3px; padding-left:3px; padding-bottom:3px;" id="telNosub"><br/>
		                  </td>
		                </tr>
	              </table>
               </td>
            </tr>
            <tr>
              <td height="3" background="../images/panel_menu_line.gif" ></td>
            </tr>
            <tr>
              <td height="42" valign="top" background="../images/panel_hotline_bg2.gif">
				    <table width="80" border="0" cellspacing="0" cellpadding="0" style="margin:3px 0px 0px 10px;">
		                <tr>
		                  <td height="20" class="hotline_name" id="hotline_user_nm_1"></td>
		                </tr>
		                <tr>
		                  <td class="hotline_tel" style="padding-top:3px; padding-left:3px; padding-bottom:3px;" id="telNosub_1"><br></td>
		                </tr>
	              </table>
               </td>
            </tr>
            <tr>
              <td><img src="../images/panel_down.gif" width="95" height="12"></td>
            </tr>
          </table>
          </td>
<%--          <td>--%>
<%--          	<s:a href="javascript:beepM(1,null);" >음소거</s:a>--%>
<%--          </td>--%>
<%--           <td>--%>
<%--          	<s:a href="javascript:beepM(3,null);" >음재생</s:a>--%>
<%--          </td>--%>
          
        </tr>
      </table></td>
    </tr>
  </table>
  
<%--  <s:a onclick="test2()">test</s:a>--%>
<%--<embed src="../sound/Critical.wav" width=300 hight=200 autostart="false" width="0" height="0" id="alarmsound" enablejavascript="true" showstatusbar="true" showcontrols="true" loop="3"></embed>--%>
<script type="text/javascript">

function moveLeftMenu(num,url) {
	top.frames["leftFrame"].location.href = "leftMenu.do?num=" + num;
	top.frames["mainFrame"].location.href = url;
}

var tid = "";
var ansOk = false;
var tmp_user_nm, tmp_tel_no, tmp_user_nm_1, tmp_tel_no_1, telNosub, telNosub_b, telNosub_1, telNosub_b_1 

$(document).ready(function () {

	var url = "quickmenuHotLine.do";
	var param = "";
	jQuery.getJSON(url, param, function(resultJSon)
			{
				tmp_user_nm = resultJSon.user_nm;
				tmp_tel_no = resultJSon.tel_no;

				var tmpTelArr = tmp_tel_no.split("-");

				telNosub = tmp_tel_no;
//				telNosub   = tmpTelArr[0] + "-" + tmpTelArr[1] + "<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-" + tmpTelArr[2];
				telNosub_b = tmpTelArr[2];



				jQuery("#hotline_user_nm").html(tmp_user_nm=="null"?"":"담당:"+tmp_user_nm);
				jQuery("#hotline_tel_no").html(tmp_tel_no=="null"?"":tmp_tel_no);
				jQuery("#telNosub").html(telNosub=="null"?"":telNosub);
				jQuery("#telNosub_b").html(telNosub_b=="null"?"":telNosub_b);
				
				if( resultJSon.user_nm_1 != null && resultJSon.user_nm_1 != "" && resultJSon.user_nm_1 != undefined )
				{
					tmp_user_nm_1 = resultJSon.user_nm_1;

					jQuery("#hotline_user_nm_1").html(tmp_user_nm=="null"?"":"담당:"+tmp_user_nm_1);
				}			

				if( resultJSon.tel_no_1 != null && resultJSon.tel_no_1 != "" && resultJSon.tel_no_1 != undefined )
				{
					tmp_tel_no_1 = resultJSon.tel_no_1;

					var tmpTelArr_1 = tmp_tel_no_1.split("-");

					telNosub_1   = tmp_tel_no_1;
//					telNosub_1   = tmpTelArr_1[0] + "-" + tmpTelArr_1[1] + "<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-" + tmpTelArr_1[2];
					telNosub_b_1 = tmpTelArr_1[2];

					
					jQuery("#hotline_tel_no_1").html(tmp_tel_no=="null"?"":tmp_tel_no_1);
					jQuery("#telNosub_1").html(telNosub_1=="null"?"":telNosub_1);
					jQuery("#telNosub_b_1").html(telNosub_b_1=="null"?"":telNosub_b_1);
				}
				
				

				

				
				
				
				
			
			});

	quickP();
	quickOth();
    window.setInterval(quickP, 5000);
    tid = window.setInterval(quickOth, 5000);	
    
});


function quickP()
{ 
	$.ajax({ 
		url: "quickmenu.do", 
		cache: false, 
		success: function(html){

			var ans = "";
			
			if( html == 1 )
			{
				jQuery("#changeGif").attr('src','../images/panel_check_red_ani_0.gif');

				//아래 BGSOUND는 IE에서만 가능하다 그리하여 OS를 판단하여 처리하는 기능을 추가 해야 할것이다.
				
//				beepM(2,html);
				jQuery("#hems_alm").attr('src','../sound/wav33.wav');
		//		jQuery("#hems_alm").attr('src','');
			}
			else if( html == 2 )
			{
				
				jQuery("#changeGif").attr('src','../images/panel_check_yellow_ani_0.gif');
				jQuery("#hems_alm").attr('src','../sound/Major.wav');
		//		beepM(2,html);
			}
			else
			{
				jQuery("#changeGif").attr('src','../images/panel_check_green.gif');
				jQuery("#alarmsound").attr('src','');
			}
			
		} 
	});	

	
	
}
a=0;
function quickOth()
{ 
  
$.getJSON("http://hemsfos.lsware.co.kr/shms/otherStructPop.do",
       function(data){
			for(i=0; i<data.list.length; i++)
			{
				
				if( data.list[i].tr == "1" )
				{
					
					if(a<3)
					{
						window.showModalDialog('../common/otherStruct.do?trclass='+data.list[i].tr+'&struct_id='+data.list[i].id+'&struct_nm='+data.list[i].nm,'','dialogHeight:150px; dialogWidth:50px; status:no;scroll:no; help:no;edge:sunken;resizable=yes'); 
//						MM_openBrWindow( '../common/otherStruct.do?trclass='+data.list[i].tr+'&struct_id='+data.list[i].id+'&struct_nm='+data.list[i].nm,'','dialogHeight:150px; dialogWidth:50px; status:no;scroll:no; help:no;edge:sunken;resizable=no');
						jQuery("#hems_alm").attr('src','../sound/wav33.wav');
					}
					a = a+1;
				}

				if( data.list[i].tr == "2" )
				{
					if(a<3)
					{
						window.showModalDialog('../common/otherStruct.do?trclass='+data.list[i].tr+'&struct_id='+data.list[i].id+'&struct_nm='+data.list[i].nm,'','dialogHeight:150px; dialogWidth:50px; status:no;scroll:no; help:no;edge:sunken;resizable=yes');
//						MM_openBrWindow( '../common/otherStruct.do?trclass='+data.list[i].tr+'&struct_id='+data.list[i].id+'&struct_nm='+data.list[i].nm,'','dialogHeight:150px; dialogWidth:50px; status:no;scroll:no; help:no;edge:sunken;resizable=no');
						jQuery("#hems_alm").attr('src','../sound/Major.wav');
					}
					
					a = a+1;	
				}

//				window.showModalDialog('../common/otherStruct.do?trclass='+data.list[i].tr+'&struct_id='+data.list[i].id+'&struct_nm='+data.list[i].nm,'','dialogHeight:150px; dialogWidth:1ex; status:no;scroll:no; help:no;edge:sunken;resizable=yes');
				
			}
        });

}
</script>
</body>
</html>