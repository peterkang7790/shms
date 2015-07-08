<%@ page language="java" import="java.util.*" pageEncoding="EUC-KR"  contentType="text/html; charset=euc-kr"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>



<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@taglib prefix="s" uri="/struts-tags" %>


<html>
<head><title>시스템 리스트</title>
<link rel="stylesheet" href="/common/table.css" type="text/css" />
<script language="JavaScript" type="text/JavaScript">
<!--
var isCheckBoxClicked = false;

//SysGubunDesc를 클릭하면 칸이 늘어났다 줄어들었다 하는 function
function clickTR(cName){
	//alert("clickOSCheck(cName)");
	//return;
	if( isCheckBoxClicked ){
		isCheckBoxClicked=false;
		return;
	}

  var coll = document.all.tags("TR");	

	for (i=0; i < coll.length ;i++){
		if ( coll[i].classid == cName ){
			
			if( coll[i].style.display != "none" ) {
				coll[i].style.display="none";
			}else{
				coll[i].style.display="inline";
			}
		}
	}
}

function mOut(objects){
//alert("mOut");
//return;
	objects.style.background="#94C4C7"//"#888888"

}

function mOver(objects){
//alert("mOver");
//return;
	//objects.style.background="orange"
	objects.style.background="#2F9AA1"//"#6386DE"
	
}

function mAOut(objects){
//alert("mAOut");
//return;
	objects.style.background="#D3E9EA"//"#efefef"
	
}

function mAOver(objects){
//alert("mAOver");
//return;
	//objects.style.background="#FCDB9C"
	objects.style.background="#B0D4D6"//"#CED7FF"
}

//-->
</script>


</head>
<body leftmargin="0" topmargin="0">

<table>
 <tr>
		<td>
			<table width="230" border="0" cellpadding="0" cellspacing="1" class="style">
     <!--#888888--> 
       <tr  bgcolor="#94C4C7" id="SGHP" name="SGHP" classid="SGHP" onclick="clickTR('TRHP');" onmouseover="mOver(this);" onmouseout="mOut(this);"> 
          <td>
            <strong>HP</strong>
          </td>
        </tr>
      <!--#efefef-->
        <tr  bgcolor="#D3E9EA" name="SystemList" classid="TRHP" onmouseover="mAOver(this);" onmouseout="mAOut(this);">
  				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  					aardwolf
  				</td>
				</tr>
                 
      <!--#efefef-->
        <tr  bgcolor="#D3E9EA" name="SystemList" classid="TRHP" onmouseover="mAOver(this);" onmouseout="mAOut(this);">
  				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  					amsem1
  				</td>
				</tr>
                 
      <!--#efefef-->
        <tr  bgcolor="#D3E9EA" name="SystemList" classid="TRHP" onmouseover="mAOver(this);" onmouseout="mAOut(this);">
  				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  					amsem2
  				</td>
				</tr>
                 
      <!--#efefef-->
        <tr  bgcolor="#D3E9EA" name="SystemList" classid="TRHP" onmouseover="mAOver(this);" onmouseout="mAOut(this);">
  				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  					amsim1
  				</td>
				</tr>
                 
      <!--#efefef-->
        <tr  bgcolor="#D3E9EA" name="SystemList" classid="TRHP" onmouseover="mAOver(this);" onmouseout="mAOut(this);">
  				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  					amsim2
  				</td>
				</tr>
    
      <!--#efefef-->
        <tr  bgcolor="#D3E9EA" name="SystemList" classid="TRHP" onmouseover="mAOver(this);" onmouseout="mAOut(this);">
  				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  					kgesmap6
  				</td>
				</tr>
      
       
                 
     <!--#888888--> 
       <tr  bgcolor="#94C4C7" id="SGCOMPAQ" name="SGCOMPAQ" classid="SGCOMPAQ" onclick="clickTR('TRCOMPAQ');" onmouseover="mOver(this);" onmouseout="mOut(this);"> 
          <td>
           <strong>COMPAQ</strong>
          </td>
        </tr>
      <!--#efefef-->
        <tr  bgcolor="#D3E9EA" name="SystemList" classid="TRCOMPAQ" onmouseover="mAOver(this);" onmouseout="mAOut(this);">
  				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  					ah10mws
  				</td>
				</tr>
                 
     
                 
      <!--#efefef-->
        <tr  bgcolor="#D3E9EA" name="SystemList" classid="TRCOMPAQ" onmouseover="mAOver(this);" onmouseout="mAOut(this);">
  				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  					k2gpmp
  				</td>
				</tr>
                 
      <!--#efefef-->
        <tr  bgcolor="#D3E9EA" name="SystemList" classid="TRCOMPAQ" onmouseover="mAOver(this);" onmouseout="mAOut(this);">
  				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  					k2gpms
  				</td>
				</tr>
                 
      <!--#efefef-->
        <tr  bgcolor="#D3E9EA" name="SystemList" classid="TRCOMPAQ" onmouseover="mAOver(this);" onmouseout="mAOut(this);">
  				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  					k2test
  				</td>
				</tr>
                 
      <!--#efefef-->
        <tr  bgcolor="#D3E9EA" name="SystemList" classid="TRCOMPAQ" onmouseover="mAOver(this);" onmouseout="mAOut(this);">
  				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  					kgsyslog
  				</td>
				</tr>
                 
      <!--#efefef-->
        <tr  bgcolor="#D3E9EA" name="SystemList" classid="TRCOMPAQ" onmouseover="mAOver(this);" onmouseout="mAOut(this);">
  				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  					kiedfs
  				</td>
				</tr>
                 
    
                 
   </table>
    </td>
  </tr>
</table>

</body>
</html>
