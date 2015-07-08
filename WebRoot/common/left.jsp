<%@ page language="java" import="java.util.*" pageEncoding="EUC-KR"  contentType="text/html; charset=euc-kr"%>
<%@page import="com.lsware.utils.DateUtils"%>
<%@page import="com.lsware.utils.*"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="shms.service.Thumbnail" %>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
String p_menu_id = request.getParameter("num"); if (p_menu_id==null) p_menu_id = "2";
%>
<%@taglib prefix="s" uri="/struts-tags" %>
<s:if test="#session.USER_ID==null">
	<script type="text/javascript">
		top.frames["mainFrame"].location.href = "AccessDenied.jsp";
	</script>
</s:if>
<s:else>

<html>
<head>
<title>SHMS</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link href="../css/common01.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../script/ComUtil.js" ></script>
<script type="text/javascript">
function moveTopMenu(url) {
	top.frames["mainFrame"].location.href = url;
}
</script>
<style type="text/css">
<!--
img {border:0}
-->
</style>


</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onLoad="MM_preloadImages('../images/btn_dashboard_o.gif')">

<s:form id="form1" namespace="/common" action="listLeftMenu" theme="simple" method="get">

<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" background="../images/bg.gif">
<tr>
	<td valign="top" class="sidemenu">
		<table width="205" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td height="10"></td>
		</tr>
		<tr>
			<td>
			<table width="180" border="0" cellspacing="0" cellpadding="0" style="margin:0px 0px 0px 6px;">
				<tr>
					<td height="40">
						<% 
							String top_menu_img_nm = "../images/left_menu_02.gif"; 
							if (p_menu_id.equals("1000")) { top_menu_img_nm = "../images/left_menu_01.gif"; } 
							else if (p_menu_id.equals("2000")) { top_menu_img_nm = "../images/left_menu_02.gif"; } 
							else if (p_menu_id.equals("3000")) { top_menu_img_nm = "../images/left_menu_03.gif"; } 
							else if (p_menu_id.equals("4000")) { top_menu_img_nm = "../images/left_menu_04.gif"; } 
							else if (p_menu_id.equals("5000")) { top_menu_img_nm = "../images/left_menu_05.gif"; } 
							else if (p_menu_id.equals("6000")) { top_menu_img_nm = "../images/left_menu_06.gif"; } 
							else if (p_menu_id.equals("7000")) { top_menu_img_nm = "../images/left_menu_07.gif"; }
						%>
						<img src="<%=top_menu_img_nm%>" width="180" height="35">
					</td>
				</tr>
				<tr>  
					<td valign="top" background="../images/left_menu_bg.gif"> 
						<table width="164" border="0" cellspacing="0" cellpadding="0" style="margin:0px 0px 0px 7px;">
						<s:set name="rsLeftMenuCount" value="0" />
						<s:iterator value="rsLeftMenu" status="stat">
						<s:set name="rsLeftMenuCount" value="stat.count" />
						<s:if test="rnum > 1">
						<tr><td colspan="2"><img src="../images/line_sub.gif" width="164" height="1"></td></tr>
						</s:if>
						<tr><td width="16" valign="bottom"><img src="../images/point_sub.gif" width="16" height="18"></td>
							<td width="148" height="24" class="submenu">
								<a href="javascript:moveTopMenu('../<s:property value="menu_path" />');"><s:property value="menu_nm" /></a>
							</td>
						</tr>
						
						</s:iterator>

						<s:if test="#rsLeftMenuCount == 0">
						<tr>
							<td colspan="2" height="24" class="submenu">
								권한이 없습니다
							</td>
						</tr>
						</s:if>	

						</table>
					</td>
				</tr>
				<tr>
					<td><img src="../images/left_menu_down.gif" width="180" height="5"></td>
				</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td><table width="180" border="0" cellspacing="0" cellpadding="0"style="margin:10px 0px 0px 6px;">
				<tr>
					<td><img src="../images/structure_top.gif" width="180" height="36"></td>
				</tr>
				<tr>
					<td height="25" background="../images/structure_bg.gif">
						<table width="150" border="0" cellspacing="0" cellpadding="0" style="margin:2px 0px 0px 15px;">
							<tr>
								<td width="74" class="dashboard"><s:property value="%{#session.STRUCT_NM}"/></td>
								<td>
									<a href="javascript:MM_openBrWindow('new_dashborad.do','','width=750,height=550, resizable=yes, scrollbars=no');" title="구조물종합현황" onfocus="this.blur();" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image10','','../images/btn_dashboard_o.gif',1)">
										<img src="../images/btn_dashboard_d.gif" name="Image10" width="76" height="18" border="0" align="absmiddle">
									</a>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
             	   <td><img src="../images/structure2_midde.gif" width="180" height="8"></td>
                </tr>
                
                <tr>
                
                <td height="66" background="../images/structure2_bg.gif">
                
               	<table width="90" border="0" cellspacing="0" cellpadding="0" style="margin:5px 0px 0px 80px;">
               	
				<s:if test="listStrsumm==null">
					<tr>
	                   <td height="20" class="dashboard_text"></td>
	                   </tr>
	                  <tr>
	                    <td height="22" class="dashboard_text"></td>
	                  </tr>
	                  <tr>
	                    <td height="21" class="dashboard_text"></td>
	                  </tr>
	              </s:if>
				<s:else>
					<s:push value="listStrsumm">
						<%
							String yy = "";
							String mm = "";
							String dd = "";
							String contYear = DateUtils.getCurrentDateByType("yyyy년MM월dd일");  
							if( request.getAttribute("construct_year") != null )
							{
								contYear = request.getAttribute("construct_year").toString();
								
								yy = contYear.substring(0, 4);
								mm = contYear.substring(4, 6);
								dd = contYear.substring(6, 8);
								
								contYear = yy +"-"+ mm +"-"+ dd; 
							}
							
							String locNm = "";
							
							if( request.getAttribute("loc_nm") != null )
							{
								String varLoc = request.getAttribute("loc_nm").toString();
								
								locNm =	StringUtils.cutStringByBytes(varLoc,12);
								
							}
							
						%>
						
		               	  <tr>
		                    <td height="20" class="dashboard_text"><font color="#0E21A3"><%=contYear%></font></td>
		                   </tr>
		                  <tr>
		                    <td height="22" class="dashboard_text"><font color="#0E21A3"><%=locNm%></font></td>
		                  </tr>
		                  <tr>
		                    <td height="19" class="dashboard_text">
		                    	<font color="#0E21A3">
		                    		<s:if test="sencnt==null">0</s:if>
		                    		<s:else>
			                    		<s:property value="sencnt" />&nbsp;&nbsp;&nbsp;
			                    		<s:a href="javascript:MM_openBrWindow('strSensorInfom.do','','width=310,height=250,resizable=yes,status=yes');" title="센서종류상세보기" onfocus="this.blur();"><img src="../images/btnS_view.gif" border="0" alt="센서종류상세보기" align="absmiddle"/></s:a>
		                    		</s:else>
		                    	</font>
		                    </td>
		                  </tr>
	                  </s:push>
				</s:else>
				
	             </table>
	  			</td>
              </tr>
              <tr>
				<td><img src="../images/structure2_down.gif" width="180" height="10"></td>
			 </tr>
			</table>
            </td>
           </tr>
			</table>
			<table border="0">            
   

				<tr>
			   <script language="Javascript"> 
	
	
	            /****************************************************************************** 
	            * 만든목적: JS 롤링; 
	            * 만든이:허웅 [comefeel]; 
	            * 제작시간:총 7~8시간; 
	            * JS 경력:현재 6개월차 -..-; 초허접; 
	            * last update:2007.01 
	            * igear.co.kr 도와준분 [zeldign] 플머 12년차; 
	            * e-mail : igearmall.co.kr <comefeel@daum.net> comefeel@comefeel.com 도 있지만 현재 안됨 ; 
	            * 이것을 사용할려고 할시에 주석을 지우면 사용할수 없음; 
	            * 허접한 소스를 보고 -_-+ 머라고 하면 쫏아감; 
	            * ** 
	            */ 
	
	            var roll_Class=function(){this.initialize.apply(this,arguments);}
	             
	            roll_Class.prototype={ 
	
	            initialize:function(){ 

	            this.className=arguments[0]?arguments[0]:null; 
	            this.foundit(arguments[1],'',false); 
	            this.contents=new Array('0'); 
	            this.contents_delay=null; 
	            this.nowdelay=null; 
	            this.foundit( 
	            this.roll.childNodes,this.foundvalue , 
	            function(rt,that){ 
			    if(that.constrain_size != null) that.foundit(rt.childNodes,'IMG',function(rt,that){rt.style[(this.moving != 'left' ? 'width' : 'height')] = that.constrain_size;}); 
	            that.contents_delay=that.contents[that.contents.length]=that.contents_delay+-rt[(that.moving=='left'?'offsetWidth':'offsetHeight')];}); 
	
	            { 
		        	this.rollHeight=this.proll.style[(this.moving=='left'?'width':'height')]=Math.abs(this.contents[this.contents.length-1]);
		             
		            this.roll.appendChild(this.roll.cloneNode(true)); 
	            };}, 
	
	
	            foundit:function(tg,n){ 
	
	            var temp=new Array(); 
	
	                for(var v in tg) 
	                    switch(typeof arguments[2]){ 
	                    case 'object':if(arguments[2].initialize(tg[v],n,this)==true) return; else break; 
	                    case 'function':if(tg[v].nodeName==n) arguments[2](tg[v],this); break; 
	                    case 'boolean':this[v]=tg[v]; break; 
	                    default:if(tg[v].nodeName==n) return tg[v]; 
	                } 
	
	            return temp;}, 
	
	            inaction:function(time){ 
	
	            this.roll.style[this.moving]=time=time < 0 ?(this.fall==false && time <= -this.rollHeight?0:time):-this.rollHeight,null; 
	            this.foundit(this.contents,time,{initialize:function(rt,vrt,that){if(Math.abs(rt - vrt) <(that.fast==false?that.tick:that.ftick)){that.roll.style[that.moving]=rt; that.nowdelay=that.fast==true?that.lengthen:that.delay; that.fast=false; return true;} else that.nowdelay=that.lengthen;}}); 
	            {var ticks=this.fast==true?this.ftick:this.tick;} 
	            this.control=setTimeout(this.className+".inaction("+(parseInt(this.roll.style[this.moving])+(this.fall==true?ticks:-ticks))+");",this.nowdelay);}, 
	
	            stop:function(){ 
	
	            this.temp=parseInt(this.roll.style[this.moving]); 
	            clearTimeout(this.control);}    }; 
	
	   		 </script>
    
				 <td width="200" style="padding:0px 0px 0px 20px;" >   
 		
	          			<div  id="parent_rolltable"  name="parent_rolltable" style='overflow:hidden;border:0px ' onmouseover="width_class.stop();" onmouseout="width_class.inaction(width_class.temp);"> 
			                <nobr  id="rolltable" name="rolltable" style="position:relative; top:1px; left:2px;"  >
			                	<s:if test="imageTumbnail_1!=null">
			                	<span>
			                	<s:a href="javascript:MM_openBrWindow('imageView.do?sensor_image_id=%{thImageID_1}','','width=650,height=450,titlebar=yes,resizable=yes, toolbar=no,menubar=no,location=no,status=no ');" onfocus="this.blur();">
									<img src="../upload/<s:property value='imageTumbnail_1' />" class="imgLeft" style="margin:5px 0px 5px 5px;" alt="이미지크게보기" align="absmiddle">
								</s:a>
								</span>
								</s:if>
								<s:if test="imageTumbnail_2!=null">
								<span>
			                	<s:a href="javascript:MM_openBrWindow('imageView.do?sensor_image_id=%{thImageID_2}','','width=650,height=450,titlebar=yes,resizable=yes, toolbar=no,menubar=no,location=no,status=no ');" onfocus="this.blur();">
									<img src="../upload/<s:property value='imageTumbnail_2' />" class="imgLeft" style="margin:5px 0px 5px 5px;" alt="이미지크게보기" align="absmiddle">
								</s:a>
								</span>
								</s:if>
								<s:if test="imageTumbnail_3!=null">
								<span>
			                	<s:a href="javascript:MM_openBrWindow('imageView.do?sensor_image_id=%{thImageID_3}','','width=650,height=450,titlebar=yes,resizable=yes, toolbar=no,menubar=no,location=no,status=no ');" onfocus="this.blur();">
									<img src="../upload/<s:property value='imageTumbnail_3' />" class="imgLeft" style="margin:5px 0px 5px 5px;" alt="이미지크게보기" align="absmiddle">
								</s:a>
								</span>
								</s:if>
			           		</nobr>
			           	</div> 
					</td>		         
				</tr>
			<tr>
				<td colspan="3" style="padding-top:1px">
					<s:iterator value="rsBannerMenu">
						<a href="<s:property value='banner_url' />" target="_blank" onfocus="this.blur();">
							<img src="../images/<s:property value='banner_image_path' />" width="180" border="0" style="margin:0px 0px 10px 5px;" align="absmiddle">
						</a>
					</s:iterator>
				</td>
				
			 </tr>
			</table>
			
		</td>
	</tr>
	</table>
	
<br/>
			<script language="Javascript"> 

            { 

                // 가로롤링 설정키 
                var roll_init=new Array(); 
                roll_init.constrain_size=null;                            // 전체의 높이값 [기본 default] 
                roll_init.tick=1;                                                    // 움직이는 칸수 
                roll_init.ftick=100;                                                // 빠른 움직이는 칸수 
                roll_init.lengthen=100;                                        // 1초당 움직이는 속도 
                roll_init.delay=0;                                            // 잠시멈춤 속도 
                roll_init.fall=true;                                                // 이동 반대로 설정 ~ 
                roll_init.fast=false;                                            // 빠른속도:true 는 on 이며,false 는 off 이다. 
                roll_init.foundvalue =    'SPAN';                                // Nobr 내부엘리멘트 
                roll_init.moving='left';                                         // 상하좌우 움직임 설정 
                roll_init.roll=document.getElementById('rolltable');                                        // roll 
                roll_init.proll=document.getElementById('parent_rolltable');                            // proll 

            }; 

            { 

                // 가롤롤링 선언부분 

                var width_class=new roll_Class('width_class',roll_init); 
                width_class.inaction(); 

            }; 


           

        </script> 
        
</s:form>

</body>
</html>

</s:else>
