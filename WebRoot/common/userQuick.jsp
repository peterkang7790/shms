<%--
 ********************************************************************************
 * 화 일 명 : userQuick.jsp
 * 설    명 : userQuick
 * 작 성 자 : 강평희
 * 수정이력 : 2010-03-05
 ********************************************************************************
--%>
<%@ page language="java" contentType="text/html; charset=euc-kr" pageEncoding="euc-kr"%>
<script type="text/javascript" src="../script/common-user.js" ></script>
<!-- QuickLink -->
<div id="quickMenu"> <!--  style="position:absolute; top:190px; left:880px; width:74px; z-index:2"> -->
	<div><img src="" alt="Quick Link" /></div>
	<div id="quick" class="quick">
		<ol>
			<li><a href=""><img src="" alt="이용안내" /></a></li>
			<li><a href=""><img src="" alt="오픈소스 저작권상담 / 상담시간:10:00~17:00" /></a></li>
			<li><img src="" alt="상담문의 / 02-2660-0132" /></li>
			<li><a href=""><img src="" alt="방문교육신청" /></a></li>
		</ol>
	</div>
	 <div><img src="" alt="Quick Link" /></div>
	 
	 <a href=""><img src="" width="100%" alt="RSS 서비스" /></a>
	   <a href=""><img src="" width="100%" alt="검색 유틸" /></a>
	   <a href=""><img src="" width="100%" alt="컨퍼런스 동영상" /></a>
</div>
<span id="idSurveyNum" style="display:none;">
</span>
<input type="hidden" name="answerYnCheckYn" value="N">
<!-- //QuickLink -->
<script type="text/javascript">
	initMoving(document.getElementById("quickMenu"), 10, 0, 10);
</script>

