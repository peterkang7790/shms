<%--
 ********************************************************************************
 * ȭ �� �� : userQuick.jsp
 * ��    �� : userQuick
 * �� �� �� : ������
 * �����̷� : 2010-03-05
 ********************************************************************************
--%>
<%@ page language="java" contentType="text/html; charset=euc-kr" pageEncoding="euc-kr"%>
<script type="text/javascript" src="../script/common-user.js" ></script>
<!-- QuickLink -->
<div id="quickMenu"> <!--  style="position:absolute; top:190px; left:880px; width:74px; z-index:2"> -->
	<div><img src="" alt="Quick Link" /></div>
	<div id="quick" class="quick">
		<ol>
			<li><a href=""><img src="" alt="�̿�ȳ�" /></a></li>
			<li><a href=""><img src="" alt="���¼ҽ� ���۱ǻ�� / ���ð�:10:00~17:00" /></a></li>
			<li><img src="" alt="��㹮�� / 02-2660-0132" /></li>
			<li><a href=""><img src="" alt="�湮������û" /></a></li>
		</ol>
	</div>
	 <div><img src="" alt="Quick Link" /></div>
	 
	 <a href=""><img src="" width="100%" alt="RSS ����" /></a>
	   <a href=""><img src="" width="100%" alt="�˻� ��ƿ" /></a>
	   <a href=""><img src="" width="100%" alt="���۷��� ������" /></a>
</div>
<span id="idSurveyNum" style="display:none;">
</span>
<input type="hidden" name="answerYnCheckYn" value="N">
<!-- //QuickLink -->
<script type="text/javascript">
	initMoving(document.getElementById("quickMenu"), 10, 0, 10);
</script>

