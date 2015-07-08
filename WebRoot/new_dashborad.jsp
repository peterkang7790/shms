<%@ page language="java" import="java.util.*" pageEncoding="EUC-KR"  contentType="text/html; charset=euc-kr"%>
<%@page import="org.apache.struts2.components.Property"%>
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

jQuery(document).ready(function(){

	 var positionTooltip = function (event) {
	     //              alert("이벤트발생");   
         var tPosX = event.pageX - 5;   
         var tPosY = event.pageY + 15;   
         //              alert(tPosX +  "-" +  tPosY);   
         $('#tooltipShow').css({ top: tPosY, left: tPosX });
     };

     var positionTooltip_1 = function (event) {
	     //              alert("이벤트발생");   
         var tPosX = event.pageX - 5;   
         var tPosY = event.pageY + 15;   
         //              alert(tPosX +  "-" +  tPosY);   
         $('#tooltipShow_1').css({ top: tPosY, left: tPosX });
     };

     var positionTooltip_2 = function (event) {
	     //              alert("이벤트발생");   
         var tPosX = event.pageX - 5;   
         var tPosY = event.pageY + 15;   
         //              alert(tPosX +  "-" +  tPosY);   
         $('#tooltipShow_2').css({ top: tPosY, left: tPosX });
     };

     var positionTooltip_3 = function (event) {
	     //              alert("이벤트발생");   
         var tPosX = event.pageX - 5;   
         var tPosY = event.pageY + 15;   
         //              alert(tPosX +  "-" +  tPosY);   
         $('#tooltipShow_3').css({ top: tPosY, left: tPosX });
     };

     var positionTooltip_4 = function (event) {
	     //              alert("이벤트발생");   
         var tPosX = event.pageX - 100 ;   
         var tPosY = event.pageY ;   
         //              alert(tPosX +  "-" +  tPosY);   
         $('#tooltipShow_4').css({ top: tPosY, left: tPosX });
     };   
        
     $('#tooltipShow').hide();
     $('#tooltipShow_1').hide();
     $('#tooltipShow_2').hide();
     $('#tooltipShow_3').hide();
     $('#tooltipShow_4').hide();
  
     $('#tooltip').hover(function () { 
         $('#tooltipShow').show();   
     },   
     function () {   
         $('#tooltipShow').hide();   
     })   
     .mousemove(positionTooltip);  

     $('#tooltip_1').hover(function () { 
         $('#tooltipShow_1').show();   
     },   
     function () {   
         $('#tooltipShow_1').hide();   
     })   
     .mousemove(positionTooltip_1);

     $('#tooltip_2').hover(function () { 
         $('#tooltipShow_2').show();   
     },   
     function () {   
         $('#tooltipShow_2').hide();   
     })   
     .mousemove(positionTooltip_2);

     $('#tooltip_3').hover(function () { 
         $('#tooltipShow_3').show();   
     },   
     function () {   
         $('#tooltipShow_3').hide();   
     })   
     .mousemove(positionTooltip_3);

     $('#tooltip_4').hover(function () { 
         $('#tooltipShow_4').show();   
     },   
     function () {   
         $('#tooltipShow_4').hide();   
     })   
     .mousemove(positionTooltip_4);
     
	});



function realtimeClock() {

	    MM_preloadImages('../images/dashboard/img_apt_o.gif','../images/dashboard/img_hospital_o.gif','../images/dashboard/img_building_o.gif','../images/dashboard/img_bridge_o.gif','../images/dashboard/img_department_o.gif');
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
#tooltipShow   
        {   
            position: absolute;   
            background: #FDF8B3;   
            border: 1px solid #fcc;   
            padding: 3px;   
            width: 200px;  
            font-size: 11px; 
            color: #726CDD;
            font-family: "돋움"
        } 
#tooltipShow_1   
        {   
            position: absolute;   
            background: #FDF8B3;   
            border: 1px solid #fcc;   
            padding: 3px;   
            width: 200px;  
            font-size: 11px; 
            color: #726CDD;
            font-family: "돋움"
        }   
        
#tooltipShow_2   
        {   
            position: absolute;   
            background: #FDF8B3;   
            border: 1px solid #fcc;   
            padding: 3px;   
            width: 200px;  
            font-size: 11px; 
            color: #726CDD;
            font-family: "돋움"
        }     

#tooltipShow_3   
        {   
            position: absolute;   
            background: #FDF8B3;   
            border: 1px solid #fcc;   
            padding: 3px;   
            width: 200px;  
            font-size: 11px; 
            color: #726CDD;
            font-family: "돋움"
        }
        
#tooltipShow_4   
        {   
            position: absolute;   
            background: #FDF8B3;   
            border: 1px solid #fcc;   
            padding: 3px;   
            width: 200px;  
            font-size: 11px; 
            color: #726CDD;
            font-family: "돋움"
        }                              
-->
</style>


</head>

<body bgproperties="fixed" onLoad="realtimeClock();">
<%

	List listStruct = (List)request.getAttribute("listDashboard");

    Map lstMap = null;
    String stYY = "";
    String stTyp = "";  
    String sensorCnt = "0";
    String Trclass = "";
    String statU = ""; 
    int criCnt = 0;
    String ccn = "0";
    int majCnt = 0;
    String man = "0";
    String strId = "";
    String locNm = "";
    String imgPath = ""; 
    String strNm = "";
    
    String stYY_1 = "";
    String stTyp_1 = "";  
    String sensorCnt_1 = "0";
    String Trclass_1 = "";
    String statU_1 = ""; 
    int criCnt_1 = 0;
    String ccn_1 = "0";
    int majCnt_1 = 0;
    String man_1 = "0";
    String strId_1 = "";
    String locNm_1 = "";
    String imgPath_1 = ""; 
    String strNm_1 = "";
    
    String stYY_2 = "";
    String stTyp_2 = "";  
    String sensorCnt_2 = "0";
    String Trclass_2 = "";
    String statU_2 = ""; 
    int criCnt_2 = 0;
    String ccn_2 = "0";
    int majCnt_2 = 0;
    String man_2 = "0";
    String strId_2 = "";
    String locNm_2 = "";
    String imgPath_2 = ""; 
    String strNm_2 = "";
    
    
    String stYY_3 = "";
    String stTyp_3 = "";  
    String sensorCnt_3 = "0";
    String Trclass_3 = "";
    String statU_3 = ""; 
    int criCnt_3 = 0;
    String ccn_3 = "0";
    int majCnt_3 = 0;
    String man_3 = "0";
    String strId_3 = "";
    String locNm_3 = "";
    String imgPath_3 = ""; 
    String strNm_3 = "";
    
    String stYY_4 = "";
    String stTyp_4 = "";  
    String sensorCnt_4 = "0";
    String Trclass_4 = "";
    String statU_4 = ""; 
    int criCnt_4 = 0;
    String ccn_4 = "0";
    int majCnt_4 = 0;
    String man_4 = "0";
    String strId_4 = "";
    String locNm_4 = "";
    String imgPath_4 = ""; 
    String strNm_4 = "";
    for( int i=0; i<listStruct.size(); i++ )
    {
    	
    	lstMap = (Map)listStruct.get(i);
    	if( "ST001".equals( lstMap.get("struct_id") ) )
    	{
    		strId = lstMap.get("struct_id")==null?"":lstMap.get("struct_id").toString();
    		locNm = lstMap.get("loc_nm")==null?"":lstMap.get("loc_nm").toString();
    		imgPath = lstMap.get("image_path")==null?"":lstMap.get("image_path").toString();
    		strNm = lstMap.get("struct_nm")==null?"":lstMap.get("struct_nm").toString();
    		stYY = lstMap.get("construct_year")==null?"":lstMap.get("construct_year").toString();
    		stTyp = lstMap.get("struct_type_nm")==null?"":lstMap.get("struct_type_nm").toString();
    		sensorCnt = lstMap.get("sencnt")==null?"":lstMap.get("sencnt").toString();
    		Trclass = lstMap.get("trclass")==null?"":lstMap.get("trclass").toString();
    		criCnt = lstMap.get("trouble_cri_count")==null?0:Integer.parseInt(lstMap.get("trouble_cri_count").toString());
    		majCnt = lstMap.get("trouble_maj_count")==null?0:Integer.parseInt(lstMap.get("trouble_maj_count").toString());
    		
    		if( "1".equals(Trclass) )
    		{
    			statU = "<font color='red'><b>위험</b></font>";
    		}
    		else if( "2".equals(Trclass) )
    		{
    			statU = "<font color='orange'><b>경고</b></font>" ;
    		}
    		else
    		{
    			statU = "<font color='green'><b>안전</b></font>" ;
    		}
    		
    		if( criCnt > 0 )
    		{
    			ccn = "<font color='red'><b>"+criCnt+"</b></font>";
    		}
    		
    		if( majCnt > 0 )
    		{
    			man = "<font color='orange'><b>"+majCnt+"</b></font>";
    		}
    		
    		
    	}
    	
    	if( "ST005".equals( lstMap.get("struct_id") ) )
    	{
    		strId_1 = lstMap.get("struct_id")==null?"":lstMap.get("struct_id").toString();
    		locNm_1 = lstMap.get("loc_nm")==null?"":lstMap.get("loc_nm").toString();
    		imgPath_1 = lstMap.get("image_path")==null?"":lstMap.get("image_path").toString();
    		strNm_1 = lstMap.get("struct_nm")==null?"":lstMap.get("struct_nm").toString();
    		stYY_1 = lstMap.get("construct_year")==null?"":lstMap.get("construct_year").toString();
    		stTyp_1 = lstMap.get("struct_type_nm")==null?"":lstMap.get("struct_type_nm").toString();
    		sensorCnt_1 = lstMap.get("sencnt")==null?"":lstMap.get("sencnt").toString();
    		Trclass_1 = lstMap.get("trclass")==null?"":lstMap.get("trclass").toString();
    		criCnt_1 = lstMap.get("trouble_cri_count")==null?0:Integer.parseInt(lstMap.get("trouble_cri_count").toString());
    		majCnt_1 = lstMap.get("trouble_maj_count")==null?0:Integer.parseInt(lstMap.get("trouble_maj_count").toString());
    		
    		if( "1".equals(Trclass_1) )
    		{
    			statU_1 = "<font color='red'><b>위험</b></font>";
    		}
    		else if( "2".equals(Trclass_1) )
    		{
    			statU_1 = "<font color='orange'><b>경고</b></font>" ;
    		}
    		else
    		{
    			statU_1 = "<font color='green'><b>안전</b></font>" ;
    		}
    		
    		if( criCnt_1 > 0 )
    		{
    			ccn_1 = "<font color='red'><b>"+criCnt_1+"</b></font>";
    		}
    		
    		if( majCnt_1 > 0 )
    		{
    			man_1 = "<font color='orange'><b>"+majCnt_1+"</b></font>";
    		}
    	}
    	
    	if( "ST006".equals( lstMap.get("struct_id") ) )
    	{
    		strId_2 = lstMap.get("struct_id")==null?"":lstMap.get("struct_id").toString();
    		locNm_2 = lstMap.get("loc_nm")==null?"":lstMap.get("loc_nm").toString();
    		imgPath_2 = lstMap.get("image_path")==null?"":lstMap.get("image_path").toString();
    		strNm_2 = lstMap.get("struct_nm")==null?"":lstMap.get("struct_nm").toString();
    		stYY_2 = lstMap.get("construct_year")==null?"":lstMap.get("construct_year").toString();
    		stTyp_2 = lstMap.get("struct_type_nm")==null?"":lstMap.get("struct_type_nm").toString();
    		sensorCnt_2 = lstMap.get("sencnt")==null?"":lstMap.get("sencnt").toString();
    		Trclass_2 = lstMap.get("trclass")==null?"":lstMap.get("trclass").toString();
    		criCnt_2 = lstMap.get("trouble_cri_count")==null?0:Integer.parseInt(lstMap.get("trouble_cri_count").toString());
    		majCnt_2 = lstMap.get("trouble_maj_count")==null?0:Integer.parseInt(lstMap.get("trouble_maj_count").toString());
    		
    		if( "1".equals(Trclass_2) )
    		{
    			statU_2 = "<font color='red'><b>위험</b></font>";
    		}
    		else if( "2".equals(Trclass_2) )
    		{
    			statU_2 = "<font color='orange'><b>경고</b></font>" ;
    		}
    		else
    		{
    			statU_2 = "<font color='green'><b>안전</b></font>" ;
    		}
    		
    		if( criCnt_2 > 0 )
    		{
    			ccn_2 = "<font color='red'><b>"+criCnt_2+"</b></font>";
    		}
    		
    		if( majCnt_2 > 0 )
    		{
    			man_2 = "<font color='orange'><b>"+majCnt_2+"</b></font>";
    		}
    	}
    	
    	if( "ST007".equals( lstMap.get("struct_id") ) )
    	{
    		strId_3 = lstMap.get("struct_id")==null?"":lstMap.get("struct_id").toString();
    		locNm_3 = lstMap.get("loc_nm")==null?"":lstMap.get("loc_nm").toString();
    		imgPath_3 = lstMap.get("image_path")==null?"":lstMap.get("image_path").toString();
    		strNm_3 = lstMap.get("struct_nm")==null?"":lstMap.get("struct_nm").toString();
    		stYY_3 = lstMap.get("construct_year")==null?"":lstMap.get("construct_year").toString();
    		stTyp_3 = lstMap.get("struct_type_nm")==null?"":lstMap.get("struct_type_nm").toString();
    		sensorCnt_3 = lstMap.get("sencnt")==null?"":lstMap.get("sencnt").toString();
    		Trclass_3 = lstMap.get("trclass")==null?"":lstMap.get("trclass").toString();
    		criCnt_3 = lstMap.get("trouble_cri_count")==null?0:Integer.parseInt(lstMap.get("trouble_cri_count").toString());
    		majCnt_3 = lstMap.get("trouble_maj_count")==null?0:Integer.parseInt(lstMap.get("trouble_maj_count").toString());
    		
    		if( "1".equals(Trclass_3) )
    		{
    			statU_3 = "<font color='red'><b>위험</b></font>";
    		}
    		else if( "2".equals(Trclass_3) )
    		{
    			statU_3 = "<font color='orange'><b>경고</b></font>" ;
    		}
    		else
    		{
    			statU_3 = "<font color='green'><b>안전</b></font>" ;
    		}
    		
    		if( criCnt_3 > 0 )
    		{
    			ccn_3 = "<font color='red'><b>"+criCnt_3+"</b></font>";
    		}
    		
    		if( majCnt_3 > 0 )
    		{
    			man_3 = "<font color='orange'><b>"+majCnt_3+"</b></font>";
    		}
    	}
    	
    	if( "ST008".equals( lstMap.get("struct_id") ) )
    	{
    		strId_4 = lstMap.get("struct_id")==null?"":lstMap.get("struct_id").toString();
    		locNm_4 = lstMap.get("loc_nm")==null?"":lstMap.get("loc_nm").toString();
    		imgPath_4 = lstMap.get("image_path")==null?"":lstMap.get("image_path").toString();
    		strNm_4 = lstMap.get("struct_nm")==null?"":lstMap.get("struct_nm").toString();
    		stYY_4 = lstMap.get("construct_year")==null?"":lstMap.get("construct_year").toString();
    		stTyp_4 = lstMap.get("struct_type_nm")==null?"":lstMap.get("struct_type_nm").toString();
    		sensorCnt_4 = lstMap.get("sencnt")==null?"":lstMap.get("sencnt").toString();
    		Trclass_4 = lstMap.get("trclass")==null?"":lstMap.get("trclass").toString();
    		criCnt_4 = lstMap.get("trouble_cri_count")==null?0:Integer.parseInt(lstMap.get("trouble_cri_count").toString());
    		majCnt_4 = lstMap.get("trouble_maj_count")==null?0:Integer.parseInt(lstMap.get("trouble_maj_count").toString());
    		
    		if( "1".equals(Trclass_4) )
    		{
    			statU_4 = "<font color='red'><b>위험</b></font>";
    		}
    		else if( "2".equals(Trclass_4) )
    		{
    			statU_4 = "<font color='orange'><b>경고</b></font>" ;
    		}
    		else
    		{
    			statU_4 = "<font color='green'><b>안전</b></font>" ;
    		}
    		
    		if( criCnt_4 > 0 )
    		{
    			ccn_4 = "<font color='red'><b>"+criCnt_4+"</b></font>";
    		}
    		
    		if( majCnt_4 > 0 )
    		{
    			man_4 = "<font color='orange'><b>"+majCnt_4+"</b></font>";
    		}
    	}
    }

%>

<div id="tooltipShow">************  <font color="#7D31FD" size='2'><%=strNm %></font>  ************<br/>
					  * 건립연월&nbsp;&nbsp;&nbsp;&nbsp; :<%=stYY %> <br/>
                      * 구조물 유형  : <font color="#7D31FD"><%=stTyp %></font><br/> 
                      * 센서수량 &nbsp;&nbsp;&nbsp;&nbsp;:<%=sensorCnt %><br/>
                      * 구조물 상태 : <%=statU %> 상태입니다.<br/>
                      * 위험&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<%=ccn %> <br/>
                      * 경고&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<%=man %>
                       
                      </div>
<div id="tooltipShow_1">********  <font color="#7D31FD" size='2'><%=strNm_1 %></font>  ********<br/>
					  * 건립연월&nbsp;&nbsp;&nbsp;&nbsp; :<%=stYY_1 %> <br/>
                      * 구조물 유형  : <font color="#7D31FD"><%=stTyp_1 %></font><br/> 
                      * 센서수량 &nbsp;&nbsp;&nbsp;&nbsp;:<%=sensorCnt_1 %><br/>
                      * 구조물 상태 : <%=statU_1 %> 상태입니다.<br/>
                      * 위험&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<%=ccn_1 %> <br/>
                      * 경고&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<%=man_1 %>
                       
                      </div> 
                      
<div id="tooltipShow_2">********  <font color="#7D31FD" size='2'><%=strNm_2 %></font>  ********<br/>
					  * 건립연월&nbsp;&nbsp;&nbsp;&nbsp; :<%=stYY_2 %> <br/>
                      * 구조물 유형  : <font color="#7D31FD"><%=stTyp_2 %></font><br/> 
                      * 센서수량 &nbsp;&nbsp;&nbsp;&nbsp;:<%=sensorCnt_2 %><br/>
                      * 구조물 상태 : <%=statU_2 %> 상태입니다.<br/>
                      * 위험&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<%=ccn_2 %> <br/>
                      * 경고&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<%=man_2 %>
                       
                      </div>                                            

<div id="tooltipShow_3">********  <font color="#7D31FD" size='2'><%=strNm_3 %></font>  ********<br/>
					  * 건립연월&nbsp;&nbsp;&nbsp;&nbsp; :<%=stYY_3 %> <br/>
                      * 구조물 유형  : <font color="#7D31FD"><%=stTyp_3 %></font><br/> 
                      * 센서수량 &nbsp;&nbsp;&nbsp;&nbsp;:<%=sensorCnt_3 %><br/>
                      * 구조물 상태 : <%=statU_3 %> 상태입니다.<br/>
                      * 위험&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<%=ccn_3 %> <br/>
                      * 경고&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<%=man_3 %>
                       
                      </div>
                        
<div id="tooltipShow_4">********  <font color="#7D31FD" size='2'><%=strNm_4 %></font>  ********<br/>
					  * 건립연월&nbsp;&nbsp;&nbsp;&nbsp; :<%=stYY_4 %> <br/>
                      * 구조물 유형  : <font color="#7D31FD"><%=stTyp_4 %></font><br/> 
                      * 센서수량 &nbsp;&nbsp;&nbsp;&nbsp;:<%=sensorCnt_4 %><br/>
                      * 구조물 상태 : <%=statU_4 %> 상태입니다.<br/>
                      * 위험&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<%=ccn_4 %> <br/>
                      * 경고&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<%=man_4 %>
                       
                      </div>                                                                 


  <table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" background="../images/bg.gif">
    <tr>
      <td valign="top">
	  <table width="750" height="550" border="0" cellpadding="0" cellspacing="0">
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
<%--        <tr>--%>
<%--          <td height="50" background="../images/dash_title_text21.gif">&nbsp;</td>--%>
<%--        </tr>--%>
        <tr>
          <td width="250" height="6" bgcolor="#d7edf9"></td>
        </tr>
        <tr>
          <td height="450" valign="top" bgcolor="#FFFFFF" style="padding:50px 0px 0px 40px;">
	          <table width="674" height="300" border="1" cellpadding="0" cellspacing="0">
	            <tr>
	              <td>
		              <table width="674" height="300" border="0" cellpadding="0" cellspacing="0">
		                <tr>
		                  <td width="136" height="112"><img src="../images/dashboard/img_01.gif" width="136" height="112"></td>
		                  <td width="111" height="112"><img src="../images/dashboard/img_02.gif" width="111" height="112"></td>
		                  <td width="149" height="112"><img src="../images/dashboard/img_03.gif" width="149" height="112"></td>
		                  <td width="133"><img src="../images/dashboard/img_04.gif" width="133" height="112"></td>
		                  <td width="145"><img src="../images/dashboard/img_05.gif" width="145" height="112"></td>
		                </tr>
		                <tr>
		                  <td width="136" height="25">
			                  <table width="136" height="124" border="0" cellpadding="0" cellspacing="0">
			                      <tr>
			                        <td width="46" rowspan="2"><img src="../images/dashboard/img_11.gif" width="46" height="124"></td>
			                        <td height="44"><img src="../images/dashboard/img_12.gif" width="90" height="44"></td>
			                      </tr>
			                      <tr>
			                        <td width="90" height="80"><a href="#" onMouseOut="MM_swapImgRestore()" onMouseOver=""><img src="../images/dashboard/img_apt.gif" name="Image25" width="90" height="80" border="0"></a></td>
			                      </tr>
			                  </table>
		                  </td>
		                  <td>
			                  <table width="111" border="0" cellspacing="0" cellpadding="0">
			                      <tr>
			                        <td width="18" rowspan="3"><img src="../images/dashboard/img_13.gif" width="18" height="124"></td>
			                        <td width="85" height="20"><img src="../images/dashboard/img_14a.gif" width="85" height="20"></td>
			                        <td width="8" rowspan="3"><img src="../images/dashboard/img_16.gif" width="8" height="124"></td>
			                      </tr>
			                      <tr>
			                        <td height="70">
			                        <span id="tooltip_1">
			                        	<a href="../common/goToStruct.do?struct_id=<%=strId_1 %>&struct_nm=<%=strNm_1 %>&loc_nm=<%=locNm_1 %>&image_path=<%=imgPath_1 %>" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image26','','../images/dashboard/img_hospital_o.gif',1)">
			                        		<img src="../images/dashboard/img_hospital.gif" name="Image26" width="85" height="70" border="0">
			                        	</a>
			                        </span>	
			                        </td>
			                      </tr>
			                      <tr>
			                        <td height="34"><img src="../images/dashboard/img_14b.gif" width="85" height="34"></td>
			                      </tr>
			                  </table>
		                  </td>
		                  <td>
			                  <table width="149" height="124" border="0" cellpadding="0" cellspacing="0">
			                      <tr>
			                        <td width="115" height="90">
			                        <span id="tooltip_2">
			                        	<a href="../common/goToStruct.do?struct_id=<%=strId_2 %>&struct_nm=<%=strNm_2 %>&loc_nm=<%=locNm_2 %>&image_path=<%=imgPath_2 %>" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image27','','../images/dashboard/img_building_o.gif',1)">
			                        		<img src="../images/dashboard/img_building.gif" name="Image27" width="115" height="90" border="0">
			                        	</a>
			                        </span>
			                        </td>
			                        <td width="34" rowspan="2"><img src="../images/dashboard/img_17.gif" width="34" height="124"></td>
			                      </tr>
			                      <tr>
			                        <td height="34"><img src="../images/dashboard/img_15.gif" width="115" height="34"></td>
			                      </tr>
			                  </table>
		                  </td>
		                  <td>
			                  <table width="133" height="124" border="0" cellpadding="0" cellspacing="0">
			                      <tr>
			                        <td width="44"><img src="../images/dashboard/img_18a.gif" width="120" height="44"></td>
			                        <td width="13" rowspan="3"><img src="../images/dashboard/img_19.gif" width="13" height="124"></td>
			                      </tr>
			                      <tr>
			                        <td height="70">
			                         <span id="tooltip">
			                        	<a href="../common/goToStruct.do?struct_id=<%=strId %>&struct_nm=<%=strNm %>&loc_nm=<%=locNm %>&image_path=<%=imgPath %>" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image28','','../images/dashboard/img_bridge_o.gif',1)">
			                        		<img src="../images/dashboard/img_bridge.gif" name="Image28" width="120" height="70" border="0">
			                        	</a>
			                        </span>
			                        </td>
			                      </tr>
			                      <tr>
			                        <td height="10"><img src="../images/dashboard/img_18b.gif" width="120" height="10"></td>
			                      </tr>
			                  </table>
		                  </td>
		                  <td>
			                  <table width="145" height="124" border="0" cellpadding="0" cellspacing="0">
			                      <tr>
			                        <td width="60" height="34"><img src="../images/dashboard/img_20a.gif" width="60" height="34"></td>
			                        <td rowspan="3"><img src="../images/dashboard/img_21.gif" width="85" height="124"></td>
			                      </tr>
			                      <tr>
			                        <td height="80">
			                        <span id="tooltip_3">
			                        	<a href="../common/goToStruct.do?struct_id=<%=strId_3 %>&struct_nm=<%=strNm_3 %>&loc_nm=<%=locNm_3 %>&image_path=<%=imgPath_3 %>" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image29','','../images/dashboard/img_department_o.gif',1)">
			                        		<img src="../images/dashboard/img_department.gif" name="Image29" width="60" height="80" border="0">
			                        	</a>
			                        </span>
			                        </td>
			                      </tr>
			                      <tr>
			                        <td height="10"><img src="../images/dashboard/img_20b.gif" width="60" height="10"></td>
			                      </tr>
			                  </table>
		                  </td>
		                </tr>
		                <tr>
		                  <td height="171"><img src="../images/dashboard/img_06.gif" width="136" height="171"></td>
		                  <td width="111"><img src="../images/dashboard/img_07.gif" width="111" height="171"></td>
		                  <td width="149"><img src="../images/dashboard/img_08.gif" width="149" height="171"></td>
		                  <td><img src="../images/dashboard/img_09.gif" width="133" height="171"></td>
		                  <td>
							<table width="145" height="171" border="0" cellpadding="0" cellspacing="0">
			                  <tr>
			                    <td width="45" rowspan="3"><img src="../images/dashboard/img_22.gif" width="45" height="171"></td>
			                    <td width="100" height="51"><img src="../images/dashboard/img_23a.gif" width="100" height="51"></td>
			                  </tr>
			                  <tr>
			                    <td height="80">
			                    <span id="tooltip_4">
			                    	<a href="../common/goToStruct.do?struct_id=<%=strId_4 %>&struct_nm=<%=strNm_4 %>&loc_nm=<%=locNm_4 %>&image_path=<%=imgPath_4 %>" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image33','','../images/dashboard/img_testbed_o.gif',1)">
			                    		<img src="../images/dashboard/img_testbed.gif" name="Image33" width="100" height="80" border="0">
			                    	</a>
			                    </span>
			                    </td>
			                  </tr>
			                  <tr>
			                    <td height="40"><img src="../images/dashboard/img_23b.gif" width="100" height="40"></td>
			                  </tr>
							 </table>
						  </td>
<%--		                  <td><img src="../images/dashboard/img_10.gif" width="145" height="171"></td>--%>
		                </tr>
		              </table>
	              </td>
	              </tr>
	<%--            <tr>--%>
	<%--              <td height="40" align="right" valign="bottom">--%>
	<%--              	<a href="#">--%>
	<%--              		<img src="../images/btn_dashboard_d.gif" width="90" height="20" border="0" style="padding:10px 0px 0px 0px;">--%>
	<%--              	</a>--%>
	<%--              </td>--%>
	<%--             </tr>--%>
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
	  </td>
    </tr>
  </table>
</body>
</html>

