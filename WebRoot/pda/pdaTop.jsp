<%@ page language="java" import="java.util.*" pageEncoding="EUC-KR"  contentType="text/html; charset=euc-kr"%>

<link href="../css/pdaStyle.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../script/ComUtil.js" ></script>
<script type="text/javascript" src="../script/jquery.js" ></script>
<script type="text/javascript">

jQuery(document).ready(function(){
	window.setInterval(realtimeClock, 1000);
});		
	function realtimeClock() {
		document.getElementById('rtcInput').innerHTML = "<font size='1' color='#FFF0B3'><b>"+getTimeStamp()+"</b></font>";
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
<!--  top layout -->

<div id="tabs" >
	<div id="rtcInput" style="position:absolute; left:5px; top:50px; width:200; height:0; z-index:0;">
	</div>
	<ul>
		<!-- CSS Tabs -->
		<li ><a href="../pdaAlarmStatus/listAlarmStatus.do" ><span>경보현황</span></a></li>
		
		<!-- <li ><a href="../pdaMeasureStatus/listStatus.jsp" ><span>계측현황</span></a></li> -->
<%--		<li ><a href="../pdaAlarmHistory/listAlmHisTotal.do" ><span>경보이력</span></a></li>--%>
	</ul>
</div>
<!--  //top layout -->
