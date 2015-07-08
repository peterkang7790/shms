/*******************************************************************
 * File Name:       common.js
 *
 * Date Created:    December 24, 2007

 *
 ******************************************************************/


/*
MM_openBrWindow
*/
function MM_openBrWindow(theURL,winName,features) {
  window.open(theURL,winName,features);
}

/*
팝업창 중앙으로 위치
*/
function center(){ 
    var x,y; 
    if (self.innerHeight) { // IE 외 모든 브라우저 
        x = (screen.availWidth - self.innerWidth) / 2; 
        y = (screen.availHeight - self.innerHeight) / 2; 
    }else if (document.documentElement && document.documentElement.clientHeight) { // Explorer 6 Strict 모드 
        x = (screen.availWidth - document.documentElement.clientWidth) / 2; 
        y = (screen.availHeight - document.documentElement.clientHeight) / 2; 
    }else if (document.body) { // 다른 IE 브라우저( IE < 6) 
        x = (screen.availWidth - document.body.clientWidth) / 2; 
        y = (screen.availHeight - document.body.clientHeight) / 2; 
    } 
    window.moveTo(x,y); 
} 



/*
라디오 버튼 제어
*/ 
/*function toggleDiv(id) {
	var obj = eval("document.all['" + id + "']");
	document.mainFrm.SVCTYPE.value=
	if (obj.style.display == "block") obj.style.display = "none";
	else obj.style.display = "block";
}
*/

function toggleT(_w,_h) {
    if (document.all) { // is IE
    if (_h=='s') eval("document.all."+_w+".style.visibility='visible';");
    if (_h=='h') eval("document.all."+_w+".style.visibility='hidden';");
        } else { 
    if (_h=='s') eval("document.layers['"+_w+"'].visibility='show';");
    if (_h=='h') eval("document.layers['"+_w+"'].visibility='hide';");
    }
}

function dateSplit(date){
    var array = new Array();
    date.substring(0,4);

    var array = date.substring(0,4) + "," + date.substring(4,6) + "," + date.substring(6,8) + "," + date.substring(8,10) + "," + date.substring(10,12) + "," + date.substring(12,14);

    return tempArr= array.split(",");
}
function toggleChange(value,page){

	var MIN_SDT = dateSplit(document.getElementById("5MIN_SDT_SUB").value);
	var MIN_EDT = dateSplit(document.getElementById("5MIN_EDT_SUB").value);	
	var HOUR_SDT = dateSplit(document.getElementById("HOUR_SDT_SUB").value);	
	var HOUR_EDT = dateSplit(document.getElementById("HOUR_EDT_SUB").value);	
	var DAY_SDT = dateSplit(document.getElementById("DAY_SDT_SUB").value);
	var DAY_EDT = dateSplit(document.getElementById("DAY_EDT_SUB").value);
	var WEEK_SDT = dateSplit(document.getElementById("WEEK_SDT_SUB").value);	
	var WEEK_EDT = dateSplit(document.getElementById("WEEK_EDT_SUB").value);	
	var MONTH_SDT = dateSplit(document.getElementById("MONTH_SDT_SUB").value);	
	var MONTH_EDT = dateSplit(document.getElementById("MONTH_EDT_SUB").value);

	var html = "";

	if(value == "5MIN"){
		html = html = "			<font class='se_btn2' >     ";
		html = html + "<input type='text' name='sDateS' value='"+MIN_SDT[0]+"-"+MIN_SDT[1]+"-"+MIN_SDT[2]+"' size='10' maxlength='10' class='calendar' hname='시작일' option='checkDate'  readOnly/>";
		html = html + "			<select name='hour_sdt'>    ";
		for(var i = 0; i < 24; i++){
			if(i < 10){
				i = "0" + i;
			}
			if(i == MIN_SDT[3]){
				html = html + "				<option value="+i+" selected>"+ i +"</option>   ";
			}else{
				html = html + "				<option value="+i+">"+ i +"</option>   ";
			}
		}

		html = html + "			</select>시 ";
		html = html + "			<select name='min_sdt'>";
		for(var i = 0; i < 60; i=eval(i)+5){
			if(i < 10){
				i = "0" + i;
			}
			if(i == MIN_SDT[4]){
				html = html + "				<option value="+i+" selected>"+ i +"</option>   ";
			}else{
				html = html + "				<option value="+i+">"+ i +"</option>   ";
			}
		}

		html = html + "			</select>분 ";
		html = html + "		~ ";
		html = html + "<input type='text' name='sDateE' value='"+MIN_EDT[0]+"-"+MIN_EDT[1]+"-"+MIN_EDT[2]+"' size='10' maxlength='10' class='calendar' hname='종료일' option='checkDate'  readOnly/> ";
		html = html + "			<select name='hour_edt'>    ";
		for(var i = 0; i < 24; i++){
			if(i < 10){
				i = "0" + i;
			}
			if(i == MIN_EDT[3]){
				html = html + "				<option value="+i+" selected>"+ i +"</option>   ";
			}else{
				html = html + "				<option value="+i+">"+ i +"</option>   ";
			}
		}

		html = html + "			</select>시 ";
		html = html + "			<select name='min_edt'>";
		for(var i = 0; i < 60; i=eval(i)+5){
			if(i < 10){
				i = "0" + i;
			}		
			if(i == MIN_EDT[4]){
				html = html + "				<option value="+i+" selected>"+ i +"</option>   ";
			}else{
				html = html + "				<option value="+i+">"+ i +"</option>   ";			
			}
		}

		html = html + "			</select>분 ";
		html = html + "			</font>";
		html = html + "			<a class='button' href='javascript:alm_stat_rtrv(\""+page+"\",\"1\")' ><span>검색</span></a>";
	}else if(value == "HOUR"){
	
		html = html = "			<font class='se_btn2' >     ";
		html = html + "<input type='text' name='sDateS' value='"+HOUR_SDT[0]+"-"+HOUR_SDT[1]+"-"+HOUR_SDT[2]+"' size='10' maxlength='10' class='calendar' hname='시작일' option='checkDate'  readOnly/>";
		html = html + "			<select name='hour_sdt'>                                                                                                                                                                ";
		for(var i = 0; i < 24; i++){
			if(i < 10){
				i = "0" + i;
			}
			if(i == HOUR_SDT[3]){
				html = html + "				<option value="+i+" selected>"+ i +"</option>   ";
			}else{
				html = html + "				<option value="+i+">"+ i +"</option>   ";
			}
		}

		html = html + "			</select>시 ";
		html = html + "		~ ";
		html = html + "<input type='text' name='sDateE' value='"+HOUR_EDT[0]+"-"+HOUR_EDT[1]+"-"+HOUR_EDT[2]+"' size='10' maxlength='10' class='calendar' hname='종료일' option='checkDate'  readOnly/> ";
		html = html + "<select name='hour_edt'> ";
		for(var i = 0; i < 24; i++){
			if(i < 10){
				i = "0" + i;
			}
			if(i == HOUR_EDT[3]){
				html = html + "				<option value="+i+" selected>"+ i +"</option>   ";
			}else{
				html = html + "				<option value="+i+">"+ i +"</option>   ";
			}
		}

		html = html + "			</select>시 ";
		html = html + "			</font>";
		html = html + "			<a class='button' href='javascript:alm_stat_rtrv(\""+page+"\",\"2\")' ><span>검색</span></a>";
	}else if(value == "DAY"){
		html = html = "			<font class='se_btn2' >     ";
		html = html + "<input type='text' name='sDateS' value='"+DAY_SDT[0]+"-"+DAY_SDT[1]+"-"+DAY_SDT[2]+"' size='10' maxlength='10' class='calendar' hname='시작일' option='checkDate' readOnly/>";
		html = html + " ~ ";
		html = html + "<input type='text' name='sDateE' value='"+DAY_EDT[0]+"-"+DAY_EDT[1]+"-"+DAY_EDT[2]+"' size='10' maxlength='10' class='calendar' hname='종료일' option='checkDate' readOnly/>";
		html = html + "			</font>";
		html = html + "			<a class='button' href='javascript:alm_stat_rtrv(\""+page+"\",\"3\")'><span>검색</span></a>";
	}else if(value == "WEEK"){
		html = html = "			<font class='se_btn2' >     ";
		html = html + "<input type='text' name='sDateS' value='"+WEEK_SDT[0]+"-"+WEEK_SDT[1]+"-"+WEEK_SDT[2]+"' size='10' maxlength='10' class='calendar' hname='시작일' option='checkDate' readOnly/>";
		html = html + " ~ ";
		html = html + "<input type='text' name='sDateE' value='"+WEEK_EDT[0]+"-"+WEEK_EDT[1]+"-"+WEEK_EDT[2]+"' size='10' maxlength='10' class='calendar' hname='종료일' option='checkDate' readOnly/>";
		html = html + "			</font>";
		html = html + "			<a class='button' href='javascript:alm_stat_rtrv(\""+page+"\",\"3\")' ><span>검색</span></a>";	
	}else if(value == "MONTH"){
		html = html = "		<font class='se_btn2' >     ";
		html = html + "		<select name='year_sdt'>                                                                                                                                                                ";
		for(var i = 2008; i < 2018; i++){
			if(i == MONTH_SDT[0]){
				html = html + "<option value="+i+" selected>"+ i +"</option>";
			}else{
				html = html + "<option value="+i+">"+ i +"</option>";
			}
		}
		html = html + "			</select>년 ";
		html = html + "		 <select name='month_sdt'>                                                                                                                                                                ";
		for(var i = 1; i < 13; i++){
			if(i < 10){
				i = "0" + i;
			}
			if(i == MONTH_SDT[1]){
				html = html + "<option value="+i+" selected>"+ i +"</option>";
			}else{
				html = html + "<option value="+i+">"+ i +"</option>";			
			}
		}
		html = html + "			</select>월 ";
		html = html + "		~ <select name='year_edt'>                                                                                                                                                                ";
		for(var i = 2008; i < 2018; i++){
			if(i == MONTH_EDT[0]){
				html = html + "<option value="+i+" selected>"+ i +"</option>";
			}else{
				html = html + "<option value="+i+">"+ i +"</option>";
			}
		}
		html = html + "	    </select>년 ";
		html = html + "<select name='month_edt'>                                                                                                                                                                ";
		for(var i = 1; i < 13; i++){
			if(i < 10){
				i = "0" + i;
			}
			if(i == MONTH_EDT[1]){
				html = html + "				<option value="+i+" selected>"+ i +"</option>   ";
			}else{
				html = html + "				<option value="+i+">"+ i +"</option>   ";			
			}
		}
		html = html + "			</select>월 ";
		html = html + "			</font>";
		html = html + "			<a class='button' href='javascript:alm_stat_rtrv(\""+page+"\",\"4\")' ><span>검색</span></a>";
	
	}else{
		html = "";
	}

	toggle.innerHTML = html;
}

// 장애발생 알림 check
function instantAlarmWindow(bCheck){
	if(bCheck){
		showMe();
		instantAlarmSound(bCheck);
		//if(document.all.DEF.value == "N"){
		//	if(document.all.s_CRI.value =="Y" || document.all.s_MAJ.value =="Y" || document.all.s_MIN.value =="Y"){
		//		playAlarm(document.all.OAMP_ALARM_CLASS.value, document.all.OAMP_ALARM_REPEAT_CNT.value);
		//	}
		//}
	}
	else{
		hideMe();
		stopAlarm();
	}
}

function AlarmWindow(bCheck){
	if(bCheck){
		if(document.mainFrm.MUTE_YN.value == "N"){
			if(document.mainFrm.s_CRI.value =="Y" || document.mainFrm.s_MAJ.value =="Y" || document.mainFrm.s_MIN.value =="Y"){
				playAlarm(document.mainFrm.OAMP_ALARM_CLASS.value, document.mainFrm.OAMP_ALARM_REPEAT_CNT.value);
			}
		}
	}
	else{
		stopAlarm();
	}
	/*
	if(bCheck){
		//alert("bbb");
		//alert("가청음소거가 설정 되었습니다.");
		stopAlarm();
	}
	else{
		//alert("ccc");
		//alert("가청음소거가 해제 되었습니다.");
		//if(document.all.DEF.value == "N"){
			if(document.all.SOUND_YN=="off" || document.all.s_CRI.value =="Y" || document.all.s_MAJ.value =="Y" || document.all.s_MIN.value =="Y"){
				playAlarm(document.mainFrm.OAMP_ALARM_CLASS.value, document.mainFrm.OAMP_ALARM_REPEAT_CNT.value);
				
			}
		//}
	}
*/
}


// Browser Check - returns 0 for IE
function browserCheck()
{
  if (navigator.appName == "Microsoft Internet Explorer")
    return 0;
  if (navigator.appName != "Microsoft Internet Explorer")
    return 1;
}


  // Checks if the key pressed is enter and if so, returns false.
  function isEnterKey(e)
  {
    var characterCode; //literal character code will be stored in this variable
    if(e && e.which)
    { //if which property of event object is supported (NN4)
      characterCode = e.which; //character code is contained in NN4's which property
    }
    else
    {
      characterCode = e.keyCode; //character code is contained in IE's keyCode property
    }

    //if character code is equal to ascii 13 (if enter key)
    if(characterCode == 13)
    {
      return true;
    }
    else
    {
      return false;
    }
  }



// Fullscreen Scripts
function getWindowHeight()
{

  var windowHeight = 0;
  if( typeof( window.innerWidth ) == 'number' ) {
    //Non-IE
    windowHeight = window.innerHeight;
  } else if( document.documentElement && ( document.documentElement.clientWidth || document.documentElement.clientHeight ) ) {
    //IE 6+ in 'standards compliant mode'
    windowHeight = document.documentElement.clientHeight;
  } else if( document.body && ( document.body.clientWidth || document.body.clientHeight ) ) {
    //IE 4 compatible
    windowHeight = document.body.clientHeight;
  }
	  return windowHeight;
}

function setFooter()
{ 
    var windowHeight = getWindowHeight();
			
    if (windowHeight > 0)
    {
      var navHeight = windowHeight-111;
      if ((windowHeight - 111) >= 0)
      {
        document.getElementById('nav').style.height = (navHeight) + 'px';
      }
    }

}

//노드 삭제
function node_delete(page,node){
  var my_ret;
	my_ret = confirm("삭제하시겠습니까?");
	if (my_ret == true)
	{
	  //location.href="./"+page+".jsp?node="+node;
	  document.mainFrm.NODE.value = node;
	  document.mainFrm.target= "_self";
      document.mainFrm.action = "./"+page+".jsp";
	  document.mainFrm.method = 'post';
	  document.mainFrm.submit();  

	}	else{
	  return;
	}

}
//서비스 삭제
function svc_delete(page,node,svcnm,svctype){
  var my_ret;
	my_ret = confirm("삭제하시겠습니까?");
	if (my_ret == true)
	{
	  //location.href="./"+page+".jsp?node="+node;

	  document.mainFrm.NODE.value = node;
	  document.mainFrm.SVCNM.value = svcnm;
	  document.mainFrm.SVCTYPE.value = svctype;
	  document.mainFrm.target= "_self";
      document.mainFrm.action = "./"+page+".jsp";
	  document.mainFrm.method = 'post';
	  document.mainFrm.submit();  

	}	else{
	  return;
	}

}
//프로세스 수정
function node_modify_process(){
   if(document.mainFrm.IPADDR.value == ""){
	   alert("IP를  입력하세요. ");
	   document.mainFrm.IPADDR.focus();
	   return;
  }else if(document.mainFrm.CARD.value == ""){
	   alert("Card를  입력하세요. ");
	   document.mainFrm.CARD.focus();
	   return;
  }else if(document.mainFrm.RACK.value == ""){
	   alert("Rack를  입력하세요. ");
	   document.mainFrm.RACK.focus();
	   return;
  }else if(document.mainFrm.SHELF.value == ""){
	   alert("Shelf를  입력하세요. ");
	   document.mainFrm.SHELF.focus();
	   return;
  }else if(document.mainFrm.SLOT.value == ""){
	   alert("Slot를  입력하세요. ");
	   document.mainFrm.SLOT.focus();
	   return;
  }else	if(!isValidIP(document.mainFrm.IPADDR.value)){
	   document.mainFrm.IPADDR.value ="";
	   alert("유효하지 않은 IP주소입니다.");
	   return;
  }

  //alert(document.popupForm.chkitem_list.value);
  document.mainFrm.target= "_self";
  document.mainFrm.action = "./node_chg_process.jsp";
  document.mainFrm.method = 'post';
  document.mainFrm.submit();  
  
}
//노드 수정
function node_modify(page,node){
  window.open('about:blank',page,'width=400,height=250');
  document.mainFrm.target= page;
  document.mainFrm.action = "./"+page+".jsp"+"?node="+node;
  document.mainFrm.method = 'post';
  document.mainFrm.submit(); 
}

	
function page_refresh(page){
  document.mainFrm.target= "_self";
  document.mainFrm.action = "./"+page+".jsp";
  document.mainFrm.method = 'post';
  document.mainFrm.submit(); 
}


function svc_modify(page,node,svcnm,svctype,cfgpath,monrate){
	window.open('about:blank',page,'width=400,height=240');

	document.mainFrm.SVCTYPE.value = svctype;
	document.mainFrm.CFGPATH.value = cfgpath;
	document.mainFrm.MONRATE.value = monrate;
	document.mainFrm.target= page;
	document.mainFrm.action = "./"+page+".jsp"+"?node="+node+"&svcnm="+svcnm;
	document.mainFrm.method = 'post';
	document.mainFrm.submit(); 
}

//서비스 수정
function modify_svc_processe(){
   if(document.mainFrm.SVCTYPE.value == "IMS"){
	   if(document.mainFrm.CFGPATH.value == ""){
		   alert("IMS 서비스 설정파일 경로를  입력하세요. ");
		   document.mainFrm.CFGPATH.focus();
		   return;
	  }else if(document.mainFrm.MONRATE.value == ""){
		   alert("서비스 감시율 편차를  입력하세요. ");
		   document.mainFrm.MONRATE.focus();
		   return;
	  }
   }
  //alert(document.popupForm.chkitem_list.value);
  document.mainFrm.target= "_self";
  document.mainFrm.action = "./svc_ims_chg_process.jsp";
  document.mainFrm.method = 'post';
  document.mainFrm.submit();  
  
}




//노드추가 



function create_action(){
 if(document.mainFrm.NODE.value == "") {
      alert("노드를 선택하세요. ");
      document.mainFrm.NODE.focus();
      return;
  }else if(document.mainFrm.IPADDR.value == ""){
	   alert("IP를  입력하세요. ");
	   document.mainFrm.IPADDR.focus();
	   return;
  }else if(document.mainFrm.CARD.value == ""){
	   alert("Card를  입력하세요. ");
	   document.mainFrm.CARD.focus();
	   return;
  }else if(document.mainFrm.RACK.value == ""){
	   alert("Rack를  입력하세요. ");
	   document.mainFrm.RACK.focus();
	   return;
  }else if(document.mainFrm.SHELF.value == ""){
	   alert("Shlef를  입력하세요. ");
	   document.mainFrm.SHELF.focus();
	   return;
  }else if(document.mainFrm.SLOT.value == ""){
	   alert("Slot를  입력하세요. ");
	   document.mainFrm.SLOT.focus();
	   return;
  }else	if(!isValidIP(document.mainFrm.IPADDR.value)){
	   document.mainFrm.IPADDR.value="";
	   alert("유효하지 않은 IP주소입니다.");
	   return;
  }

  //alert(document.popupForm.chkitem_list.value);
  document.mainFrm.target= "_self";
  document.mainFrm.action = "./node_crte_process.jsp";
  document.mainFrm.method = 'post';
  document.mainFrm.submit();  
  
}



//서비스 추가

function svc_create_action(){

 if(document.mainFrm.NODE.value == "") {
      alert("노드를 선택하세요. ");
      document.mainFrm.NODE.focus();
      return;
  }else if(document.mainFrm.SVCNM.value == ""){
	   alert("서비스명을  입력하세요. ");
	   document.mainFrm.SVCNM.focus();
	   return;
  }else if(!document.mainFrm.SVCTYPE[0].checked && !document.mainFrm.SVCTYPE[1].checked){
	   alert("서비스종류를 선택하세요. ");
	   return;
  }else if(document.mainFrm.SVCTYPE[0].checked && document.mainFrm.CFGPATH.value == ""){
	   alert("IMS 서비스 설정파일 경로를  입력하세요. ");
	   document.mainFrm.CFGPATH.focus();
	   return;
  }else if(document.mainFrm.SVCTYPE[0].checked && (document.mainFrm.MONRATE.value >= 100000 || document.mainFrm.MONRATE.value <= 0 )){
	   alert("서비스 감시율 편차  범위를 벗어났습니다. 입력범위는 1~99999 사이입니다.");
	   document.mainFrm.MONRATE.focus();
	   return;
  }


  document.mainFrm.target= "_self";
  document.mainFrm.action = "./svc_crte_process.jsp";
  document.mainFrm.method = 'post';
  document.mainFrm.submit();  
  
}

//서비스 설정 보기
function svc_setup_action(page,node,svcnm){
  window.open('about:blank',page,'width=400,height=440,resizable=yes');
  document.mainFrm.target= page;
  document.mainFrm.action = "./"+page+".jsp"+"?NODE="+node+"&SVCNM="+svcnm;
  document.mainFrm.method = 'post';
  document.mainFrm.submit(); 
}


function dosubmit(){
  document.mainFrm.method = 'post';
  document.mainFrm.submit(); 
}



//서비스 설정 변경
function setup_modify(page,node,svcnm,cfgnm,cfgval){
	
  window.open('about:blank',page,'width=400,height=200');
  document.mainFrm.target= page;
  document.mainFrm.action = "./"+page+".jsp"+"?NODE="+node+"&SVCNM="+svcnm+"&CFGNM="+cfgnm+"&CFGVAL="+cfgval;
  document.mainFrm.method = 'post';
  document.mainFrm.submit(); 
  
}
//서비스 설정 변경 확인
function setup_modify_process(page){
  document.mainFrm.target= "_self";
  document.mainFrm.action = "./"+page+".jsp";
  document.mainFrm.method = 'post';
  document.mainFrm.submit(); 
  
}

//설정항목 추가

function svc_setup_create_action(page){

  window.open('about:blank',page,'width=400,height=210');
  document.mainFrm.target= page;
  document.mainFrm.action = "./"+page+".jsp";
  document.mainFrm.method = 'post';
  document.mainFrm.submit();  
  
}

//설정항목 추가 확인

function svc_setup_create_process(page){
  if(document.mainFrm.CFGNM.value == "") {
      alert("설정명을 입력하세요. ");
      document.mainFrm.CFGNM.focus();
      return;
  }else if(document.mainFrm.CFGVAL.value == ""){
	   alert("설정값을  입력하세요. ");
	   document.mainFrm.CFGVAL.focus();
	   return;
  }
  document.mainFrm.target= "_self";
  document.mainFrm.action = "./"+page+".jsp";
  document.mainFrm.method = 'post';
  document.mainFrm.submit();  
  
}

//서비스 삭제
function svc_cfg_delete(page,node,svcnm,cgfnm){
  var my_ret;
	my_ret = confirm("삭제하시겠습니까?");
	if (my_ret == true)
	{
	  //location.href="./"+page+".jsp?node="+node;
	  document.mainFrm.NODE.value = node;
	  document.mainFrm.SVCNM.value = svcnm;
	  document.mainFrm.CFGNM.value = cgfnm;
	  document.mainFrm.target= "_self";
      document.mainFrm.action = "./"+page+".jsp";
	  document.mainFrm.method = 'post';
	  document.mainFrm.submit();  
	}	else{
	  return;
	}

}

function create_dsk(){
 if(document.mainFrm.NODE.value == "") {
      alert("노드를 선택하세요. ");
      document.mainFrm.NODE.focus();
      return;
  }else if(document.mainFrm.MNT.value == ""){
	   alert("마운트포인트명을 입력하세요. ");
	   document.mainFrm.MNT.focus();
	   return;
  }else if(document.mainFrm.UPLMT.value == ""){
	   alert("임계사용율을 입력하세요. ");
	   document.mainFrm.UPLMT.focus();
	   return;
  }
  //alert(document.popupForm.chkitem_list.value);
  document.mainFrm.target= "_self";
  document.mainFrm.action = "./dsk_crte_process.jsp";
  document.mainFrm.method = 'post';
  document.mainFrm.submit();  
  
}

//디스크 삭제
function dsk_delete(page,node,mnt){
  var my_ret;
	my_ret = confirm("삭제하시겠습니까?");
	if (my_ret == true)
	{
	  //location.href="./"+page+".jsp?node="+node;
	  document.mainFrm.NODE.value = node;
	  document.mainFrm.MNT.value = mnt;
	  document.mainFrm.target= "_self";
      document.mainFrm.action = "./"+page+".jsp";
	  document.mainFrm.method = 'post';
	  document.mainFrm.submit();  
	}	else{
	  return;
	}

}

//서비스 설정 변경
function dsk_modify(page,node,mnt,uplmt){
	
  window.open('about:blank',page,'width=400,height=160');
	document.mainFrm.MNT.value = mnt;
	document.mainFrm.UPLMT.value = uplmt;

  document.mainFrm.target= page;
  document.mainFrm.action = "./"+page+".jsp?NODE="+node;
  document.mainFrm.method = 'post';
  document.mainFrm.submit(); 
  
}

//디스크 변경 확인
function dsk_modify_process(page){
  if(document.mainFrm.UPLMT.value == ""){
	   alert("임계사용율을 입력하세요. ");
	   document.mainFrm.UPLMT.focus();
	   return;
  }
  document.mainFrm.target= "_self";
  document.mainFrm.action = "./"+page+".jsp";
  document.mainFrm.method = 'post';
  document.mainFrm.submit(); 
  
}

function nic_create(){
 if(document.mainFrm.NODE.value == "") {
      alert("노드를 선택하세요. ");
      document.mainFrm.NODE.focus();
      return;
  }else if(document.mainFrm.NIC.value == ""){
	   alert("NIC를 입력하세요. ");
	   document.mainFrm.NIC.focus();
	   return;
  }else if(document.mainFrm.IPADDR.value == ""){
	   alert("IP Address를 입력하세요. ");
	   document.mainFrm.IPADDR.focus();
	   return;
  }else if(document.mainFrm.UPLMT.value == ""){
	   alert("임계사용율을 입력하세요. ");
	   document.mainFrm.UPLMT.focus();
  }
  else if(document.mainFrm.UPLMT.value < 1 || document.mainFrm.UPLMT.value > 10000000 ){	
	  alert("임계사용율은 1~10000000까지의 숫자만 입력해 주세요");
	  document.mainFrm.UPLMT.focus();
	  return;  
  }else	if(!isValidIP(document.mainFrm.IPADDR.value)){
	   alert("유효하지 않은 IP주소입니다.");
	   document.mainFrm.IPADDR.value="";
	   document.mainFrm.IPADDR.focus();
	   return;
  }
  //alert(document.popupForm.chkitem_list.value);
  document.mainFrm.target= "_self";
  document.mainFrm.action = "./nic_crte_process.jsp";
  document.mainFrm.method = 'post';
  document.mainFrm.submit();  
  
}
//서비스 설정 변경
function nic_modify(page,node,nic,ipaddr,uplmt){
	
  window.open('about:blank',page,'width=400,height=195');
	document.mainFrm.NIC.value = nic;
	document.mainFrm.IPADDR.value = ipaddr;
	document.mainFrm.UPLMT.value = uplmt;
	
  document.mainFrm.target= page;
  document.mainFrm.action = "./"+page+".jsp?NODE="+node;
  document.mainFrm.method = 'post';
  document.mainFrm.submit(); 
  
}

//NIC 변경 확인
function nic_modify_process(page){
  if(document.mainFrm.IPADDR.value == ""){
	   alert("IP Address를 입력하세요. ");
	   document.mainFrm.IPADDR.focus();
	   return;
  }else if(document.mainFrm.UPLMT.value == ""){
	   alert("임계사용율을 입력하세요. ");
	   document.mainFrm.UPLMT.focus();
	   return;
  }
  else if(document.mainFrm.UPLMT.value < 1 || document.mainFrm.UPLMT.value > 10000000 ){	
	  alert("임계사용율은 1~10000000까지의 숫자만 입력해 주세요");
	  document.mainFrm.UPLMT.focus();
	  return;  
  }else	if(!isValidIP(document.mainFrm.IPADDR.value)){
	   alert("유효하지 않은 IP주소입니다.");
	   return;
  }


  document.mainFrm.target= "_self";
  document.mainFrm.action = "./"+page+".jsp";
  document.mainFrm.method = 'post';
  document.mainFrm.submit(); 
  
}

//디스크 삭제
function nic_delete(page,node,nic){

  var my_ret;
	my_ret = confirm("삭제하시겠습니까?");
	if (my_ret == true)
	{
	  //location.href="./"+page+".jsp?node="+node;
	  document.mainFrm.NODE.value = node;
	  document.mainFrm.NIC.value = nic;
	  document.mainFrm.target= "_self";
      document.mainFrm.action = "./"+page+".jsp";
	  document.mainFrm.method = 'post';
	  document.mainFrm.submit();  
	}	else{
	  return;
	}

}
function svc_prs_create_ims(){

 if(document.mainFrm.NODE.value == "") {
      alert("노드를 선택하세요. ");
      document.mainFrm.NODE.focus();
      return;
  }else if(document.mainFrm.SVCNM.value == ""){
	   alert("서비스를 입력하세요. ");
	   document.mainFrm.SVCNM.focus();
	   return;
  }else if(document.mainFrm.PRSNM.value == ""){
	   alert("프로세스명을 입력하세요. ");
	   document.mainFrm.PRSNM.focus();
	   return;
  }else if(document.mainFrm.PRSUID.value == ""){
	   alert("프로세스 ID를 입력하세요. ");
	   document.mainFrm.PRSUID.focus();
	   return;
  }else if(document.mainFrm.CTRLPATH.value == ""){
	   alert("제어스크립트 경로를 입력하세요. ");
	   document.mainFrm.CTRLPATH.focus();
	   return;
  }else if(document.mainFrm.PRSPARM.value == ""){
	   alert("실행 파라미터를 입력하세요. ");
	   document.mainFrm.PRSPARM.focus();
	   return;
  }
  //alert(document.popupForm.chkitem_list.value);
  if(document.mainFrm.AUTOSTART.checked){
	  document.mainFrm.AUTOSTART.value = "Y";
  }else{
	  document.mainFrm.AUTOSTART.value = "N";
  }
  document.mainFrm.target= "_self";
  document.mainFrm.action = "./svc_prs_crte_process.jsp";
  document.mainFrm.method = 'post';
  document.mainFrm.submit();  
  
}
function svc_prs_create_sup(){
 if(document.mainFrm.NODE.value == "") {
      alert("노드를 선택하세요. ");
      document.mainFrm.NODE.focus();
      return;
  }else if(document.mainFrm.SVCNM.value == ""){
	   alert("서비스를 입력하세요. ");
	   document.mainFrm.SVCNM.focus();
	   return;
  }else if(document.mainFrm.PRSNM.value == ""){
	   alert("프로세스명을 입력하세요. ");
	   document.mainFrm.PRSNM.focus();
	   return;
  }
  //alert(document.popupForm.chkitem_list.value);
  document.mainFrm.target= "_self";
  document.mainFrm.action = "./svc_prs_crte_process.jsp";
  document.mainFrm.method = 'post';
  document.mainFrm.submit();  
  
}
//서비스 프로세스 삭제
function svc_prs_delete(page,node,svcnm,prsnm,prsuid){
  var my_ret;
	my_ret = confirm("삭제하시겠습니까?");
	if (my_ret == true)
	{
	  //location.href="./"+page+".jsp?node="+node;

	  document.mainFrm.NODE.value = node;
	  document.mainFrm.SVCNM.value = svcnm;
	  document.mainFrm.PRSNM.value = prsnm;
	  document.mainFrm.PRSUID.value = prsuid;
	  document.mainFrm.target= "_self";
      document.mainFrm.action = "./"+page+".jsp";
	  document.mainFrm.method = 'post';
	  document.mainFrm.submit();  

	}	else{
	  return;
	}

}
//서비스 설정 변경
function svc_prs_modify(page,node,svcnm,prsnm,prsuid){
 if(prsuid != null){	
	window.open('about:blank',page,'width=500,height=340');
 }else{
	window.open('about:blank',page,'width=500,height=250');
 }
  document.mainFrm.NODE.value = node;
  document.mainFrm.SVCNM.value = svcnm;
  document.mainFrm.PRSNM.value = prsnm;
  document.mainFrm.PRSUID.value = prsuid;
  document.mainFrm.target= page;
  document.mainFrm.action = "./"+page+".jsp";
  document.mainFrm.method = 'post';
  document.mainFrm.submit(); 
  
}

//서비스 프로세스 변경 확인
function svc_prs_chg_process(page){

  

  if(document.mainFrm.CTRLPATH.value == ""){
	   alert("프로세스 제어스크립트를 입력하세요. ");
	   document.mainFrm.CTRLPATH.focus();
	   return;
  }else if(document.mainFrm.PRSPARM.value == ""){
	   alert("프로세스 실행 파라미터를 입력하세요. ");
	   document.mainFrm.PRSPARM.focus();
	   return;

  }
  
  document.mainFrm.target= "_self";
  document.mainFrm.action = "./"+page+".jsp";
  document.mainFrm.method = 'post';
  document.mainFrm.submit(); 
  
}
//로그인 히스토리 검색
function login_hist_rtrv(page){
	if(document.mainFrm.sDateS.value > document.mainFrm.sDateE.value){
		alert("날짜 선택이 잘못 되었습니다.");
		return;
	}
	  document.mainFrm.target= "_self";
      document.mainFrm.action = "./"+page+".jsp";
	  document.mainFrm.method = 'post';
	  document.mainFrm.submit();  
}
//명령 이력 검색
function cmd_hist_rtrv(page){
	if(document.mainFrm.sDateS.value > document.mainFrm.sDateE.value){
		alert("날짜 선택이 잘못 되었습니다.");
		return;
	}
      document.mainFrm.target= "_self";
      document.mainFrm.action = "./"+page+".jsp";
	  document.mainFrm.method = 'post';
	  document.mainFrm.submit();  
}

//IP ADDRESS 추가
function acc_ctrl_crte(){
 if(document.mainFrm.IP.value == "") {
      alert("IP Address를 입력하세요. ");
      document.mainFrm.IP.focus();
      return;
  }else if(document.mainFrm.IP_DESC.value == ""){
	   alert("설명을 입력하세요. ");
	   document.mainFrm.IP_DESC.focus();
	   return;
  }else	if(!CIDRChecker(document.mainFrm.IP.value)){
	   document.mainFrm.IP.value="";
	   return;
  }
	  
      document.mainFrm.action = "./acc_ctrl_crte_process.jsp";
	  document.mainFrm.method = 'post';
	  document.mainFrm.submit();  
}
//IP ADDRESS 삭제
function acc_ctrl_dlt(page,ip){
  var my_ret;
	my_ret = confirm("삭제하시겠습니까?");
	if (my_ret == true)
	{
	  //location.href="./"+page+".jsp?node="+node;

	  document.mainFrm.IP.value = ip;
	  document.mainFrm.target= "_self";
      document.mainFrm.action = "./"+page+".jsp";
	  document.mainFrm.method = 'post';
	  document.mainFrm.submit();  

	}	else{
	  return;
	}

}
//명령 이력 검색
function acc_ctrl_rtrv(page){
	document.mainFrm.target= "_self";
      document.mainFrm.action = "./"+page+".jsp";
	  document.mainFrm.method = 'post';
	  document.mainFrm.submit();  
}
//서비스 설정 변경
function acc_ctrl_chg(page,ip,ipdesc){
  document.mainFrm.IP.value = ip;
  document.mainFrm.IP_DESC.value = ipdesc;
  window.open('about:blank',page,'width=400,height=140');
  document.mainFrm.target= page;
  document.mainFrm.action = "./"+page+".jsp";
  document.mainFrm.method = 'post';
  document.mainFrm.submit(); 
  
}
//NIC 변경 확인
function acc_ctrl_chg_process(page){
  if(document.mainFrm.IP_DESC.value == ""){
	   alert("IP 설명을 입력하세요. ");
	   document.mainFrm.IP_DESC.focus();
	   return;
  }
  document.mainFrm.target= "_self";
  document.mainFrm.action = "./"+page+".jsp";
  document.mainFrm.method = 'post';
  document.mainFrm.submit(); 
  
}
//계정 검색
function user_rtrv(page){
	  document.mainFrm.target= "_self";
      document.mainFrm.action = "./"+page+".jsp";
	  document.mainFrm.method = 'post';
	  document.mainFrm.submit();  
}
//경보등급 삭제
function alm_code_dlt(page,almcd){
  var my_ret;
	my_ret = confirm("삭제하시겠습니까?");
	if (my_ret == true)
	{
	  //location.href="./"+page+".jsp?node="+node;

	  document.mainFrm.ALMCD.value = almcd;
	  document.mainFrm.target= "_self";
      document.mainFrm.action = "./"+page+".jsp";
	  document.mainFrm.method = 'post';
	  document.mainFrm.submit();  

	}	else{
	  return;
	}

}
//경보등급 검색
function alm_code_rtrv(page){
	  document.mainFrm.target= "_self";
      document.mainFrm.action = "./"+page+".jsp";
	  document.mainFrm.method = 'post';
	  document.mainFrm.submit();  
}
//서비스 프로세스 변경 확인
function alm_code_crte_process(page){

  
  if(document.createfrm.ALMCD.value == ""){
	   alert("장애코드를 입력하세요. ");
	   document.createfrm.ALMCD.focus();
	   return;
  }else if(document.createfrm.ALMDESC.value == ""){
	   alert("장애 설명을 입력하세요. ");
	   document.createfrm.ALMDESC.focus();
	   return;
  }
  document.createfrm.target= "_self";
  document.createfrm.action = "./"+page+".jsp";
  document.createfrm.method = 'post';
  document.createfrm.submit(); 
  
}

//경보 설정 변경
function alm_code_chg(page,almcls,almtype,almcd,almdesc,mask,sms){

  document.mainFrm.CLS.value = almcls;
  document.mainFrm.TYPE.value = almtype;
  document.mainFrm.ALMDESC.value = almdesc;
  document.mainFrm.MASK.value = mask;
  document.mainFrm.SMS.value = sms;

  window.open('about:blank',page,'width=500,height=215');
  document.mainFrm.target= page;
  document.mainFrm.action = "./"+page+".jsp?CD="+almcd;
  document.mainFrm.method = 'post';
  document.mainFrm.submit(); 
  
}
//경보 설정 변경
function alm_code_chg_process(page){
	if(document.chgFrm.ALMDESC.value == ""){
	   alert("장애설명을  입력하세요. ");
	   document.chgFrm.ALMDESC.focus();
	   return;
  	}
	document.chgFrm.target = "_self";	
	document.chgFrm.action = "./"+page+".jsp";
	document.chgFrm.method = 'post';
	document.chgFrm.submit(); 
  
}

function test(){
alert('test');
}
//CPU 임계치 설정 변경
function node_cpu_chg(page,node){


  window.open('about:blank',page,'width=500,height=250');
  document.mainFrm.target= page;
  document.mainFrm.action = "./"+page+".jsp?node="+node;
  document.mainFrm.method = 'post';
  document.mainFrm.submit(); 
  
}
//CPU 임계치 변경
function node_cpu_chg_process(page){
  if(document.chgFrm.CCU.value == ""){
	   alert("Critical 부하율의 발생 임계치를 입력하세요. ");
	   return;
  }else if(document.chgFrm.CMU.value == ""){
	   alert("Major 부하율의 발생 임계치를 입력하세요. ");
	   return;
  }else if(document.chgFrm.CNU.value == ""){
	   alert("Minor 부하율의 발생 임계치를 입력하세요. ");
	   return;
  }else if(document.chgFrm.CCD.value == ""){
	   alert("Critical 부하율의 해제 임계치를 입력하세요. ");
	   return;
  }else if(document.chgFrm.CMD.value == ""){
	   alert("Major 부하율의 해제 임계치를 입력하세요. ");
	   return;
  }else if(document.chgFrm.CND.value == ""){
	   alert("Minor 부하율의 해제 임계치를 입력하세요. ");
	   return;
  }

  if(parseInt(document.chgFrm.CCU.value) <= parseInt(document.chgFrm.CCD.value)){
	  alert("Critical 부하율의 발생 임계치가 해제 임계치보다 작거나 같습니다. 다시 입력해 주세요. ");
	  return;
  }
  
  if(parseInt(document.chgFrm.CCD.value) <= parseInt(document.chgFrm.CMU.value)){
	  alert("Critical 부하율의 해제 임계치가 Major 부하율의 발생 임계치보다 작거나 같습니다. 다시 입력해 주세요. ");
	  return;
  }

  if(parseInt(document.chgFrm.CMU.value) <= parseInt(document.chgFrm.CMD.value)){
	  alert("Major 부하율의 발생 임계치가 해제 임계치보다 작거나 같습니다. 다시 입력해 주세요. ");
	  return;
  }

  if(parseInt(document.chgFrm.CMD.value) <= parseInt(document.chgFrm.CNU.value)){
	  alert("Major 부하율의 해제 임계치가 Minor 부하율의 발생 임계치보다 작거나 같습니다. 다시 입력해 주세요. ");
	  return;
  }
  if(parseInt(document.chgFrm.CNU.value) <= parseInt(document.chgFrm.CND.value)){
	  alert("Minor 부하율의 발생 임계치가 해제 임계치보다 작거나 같습니다. 다시 입력해 주세요. ");
	  return;
  } 
  document.chgFrm.target= "_self";
  document.chgFrm.action = "./"+page+".jsp";
  document.chgFrm.method = 'post';
  document.chgFrm.submit(); 
  
}
//mem 임계치 설정 변경
function node_mem_chg(page,node){


  window.open('about:blank',page,'width=500,height=165');
  document.mainFrm.target= page;
  document.mainFrm.action = "./"+page+".jsp?node="+node;
  document.mainFrm.method = 'post';
  document.mainFrm.submit(); 
  
}

function node_mem_chg_process(page){
  if(document.chgFrm.MAU.value == ""){
	   alert("임계 발생 사용율을 입력하세요. ");
	   return;
  }
  if(document.chgFrm.MAD.value == ""){
	   alert("임계 해제 사용율을 입력하세요. ");
	   return;
  }
  if(parseInt(document.chgFrm.MAU.value) <= parseInt(document.chgFrm.MAD.value)){
	  alert("Momory 임계 발생 사용율이 임계 해제 사용율보다 작거나 같습니다. 다시 입력해 주세요. ");
	  return;
  }
  document.chgFrm.target= "_self";
  document.chgFrm.action = "./"+page+".jsp";
  document.chgFrm.method = 'post';
  document.chgFrm.submit(); 
  
}
function mon_timer_chg(page,kind,val){

  document.mainFrm.KIND.value= kind;
  document.mainFrm.VAL.value= val;

  window.open('about:blank',page,'width=500,height=115');
  document.mainFrm.target= page;
  document.mainFrm.action = "./"+page+".jsp";
  document.mainFrm.method = 'post';
  document.mainFrm.submit(); 
  
}
function mon_timer_chg_process(page){

  if(document.chgFrm.VAL.value == ""){
	   alert("모니터링 주기를  입력하세요. ");
	   document.chgFrm.VAL.focus();
	   return;
  }
  document.chgFrm.target= "_self";
  document.chgFrm.action = "./"+page+".jsp";
  document.chgFrm.method = 'post';
  document.chgFrm.submit(); 
  
}


function svc_ctrl(page,node,svcnm,svcmenu,ctrl){

	var paramObject = new Object();
	paramObject.value01 = node;
	paramObject.value02 = svcnm;
	paramObject.value03 = svcmenu;
	paramObject.value04 = ctrl;

	objPopup = window.showModalDialog("svc_modal.jsp?NODE="+node+"&PRSCTRL="+ctrl,paramObject,"dialogWidth:350px;dialogHeight:124px;scroll:0;help:0;status:0");			
	document.mainFrm.target= "_self";
	document.mainFrm.action = "./svc_rtrv.jsp";
	document.mainFrm.method = 'post';
	document.mainFrm.submit(); 


}
function svc_prs_ctrl(page,node,svcnm,prsnm,prsuid,svcmenu,ctrl){

	var paramObject = new Object();
	paramObject.value01 = node;
	paramObject.value02 = svcnm;
	paramObject.value03 = prsnm;
	paramObject.value04 = prsuid;
	paramObject.value05 = svcmenu;
	paramObject.value06 = ctrl;

	objPopup = window.showModalDialog("svc_prs_modal.jsp?NODE="+node+"&PRSCTRL="+ctrl,paramObject,"dialogWidth:350px;dialogHeight:124px;scroll:0;help:0;status:0");			
	document.mainFrm.target= "_self";
	document.mainFrm.action = "./svc_prs_rtrv.jsp";
	document.mainFrm.method = 'post';
	document.mainFrm.submit(); 
  
}

function closePopup(){
	if(objPopup!=null){
		//objPopup.destroy();
		objPopup.close();
	}
}

function alm_code_dlt(page,ac){

  document.mainFrm.AC.value = ac;
  document.mainFrm.target= "_self";
  document.mainFrm.action = "./"+page+".jsp";
  document.mainFrm.method = 'post';
  document.mainFrm.submit(); 
  
}


function sms_list_dlt(page,hp){
var my_ret;
	my_ret = confirm("삭제하시겠습니까?");
	if (my_ret == true)
	{
  document.mainFrm.HP.value = hp;
  document.mainFrm.target= "_self";
  document.mainFrm.action = "./"+page+".jsp";
  document.mainFrm.method = 'post';
  document.mainFrm.submit(); 

	}	else{
	  return;
	}

  
}

function event_monitor(page,node){
	document.mainFrm.NODE.value = node;

	window.open('about:blank',page,'width=700,height=400');
	document.mainFrm.target= page;
	document.mainFrm.action = "./"+page+".jsp";
	document.mainFrm.method = 'post';
	document.mainFrm.submit(); 
  
}

function login_checked(){

  if(document.mainFrm.ID.value == ""){
	   alert("ID를 입력하세요. ");
	   document.mainFrm.ID.focus();
	   return;
  }else if(document.mainFrm.PASSWD.value == ""){
	   alert("PASSWD를 입력하세요. ");
	   document.mainFrm.PASSWD.focus();
	   return;
  }    
  
  document.mainFrm.HASH_PASSWD.value = hex_md5(document.mainFrm.PASSWD.value); 
  document.mainFrm.target= "_self";
  document.mainFrm.action = "./login_process.jsp";  
  document.mainFrm.method = 'post';

  //document.mainFrm.submit(); onSubmit시 수행되는 function이므로 submit을 수행하면 중복하여 submit되는 문제발생
}

function sso_login_checked(sso_url){

  if(document.mainFrm.ID.value == ""){
	   alert("아이디를 입력하세요. ");
	   document.mainFrm.ID.focus();
	   return;
  }else if(document.mainFrm.PASSWORD.value == ""){
	   alert("패스워드를 입력하세요. ");
	   document.mainFrm.PASSWORD.focus();
	   return;
  } 

  document.mainFrm.target= "_self";
  document.mainFrm.action = sso_url;  
  document.mainFrm.method = 'post';
  //document.mainFrm.submit(); onSubmit시 수행되는 function이므로 submit을 수행하면 중복하여 submit되는 문제발생
}


function sms_list_crte(page){
  window.open('about:blank',page,'width=400,height=150');
  document.mainFrm.target= page;
  document.mainFrm.action = "./"+page+".jsp";
  document.mainFrm.method = 'post';
  document.mainFrm.submit();  
  
}


function sms_list_crte_process(page){

  
  if(document.mainFrm.NAME.value == ""){
	   alert("이름을 입력하세요. ");
	   document.mainFrm.NAME.focus();
	   return;
  }else if(document.mainFrm.HP.value == ""){
	   alert("HP번호를 입력하세요. ");
	   document.mainFrm.HP.focus();
	   return;
  }
  document.mainFrm.target= "_self";
  document.mainFrm.action = "./"+page+".jsp";
  document.mainFrm.method = 'post';
  document.mainFrm.submit(); 
  
}

function res_stat_rtrv(page){

 if(document.mainFrm.NODE.value == ""){
	   alert("노드를 선택하세요. ");
	   document.mainFrm.NODE.focus();
	   return;
  }

  var r_l = document.mainFrm.RTYPE.length;
		for(i =0; i <r_l; i++){
		  if(document.mainFrm.RTYPE[i].checked == true){
			var check_R= true;
		  }
	}

  if(!check_R){
   alert("자원을 선택하세요. ");
   return;
  }	


  var s_l = document.mainFrm.STYPE.length;
		for(i =0; i <s_l; i++){
		  if(document.mainFrm.STYPE[i].checked == true){
			var check_S= true;
		  }
	}

  if(!check_S){
   alert("통계를 선택하세요. ");
   return;
  }	


  var sdate_l = document.mainFrm.sDateE.length;
		for(i =0; i <sdate_l; i++){
		  if(document.mainFrm.sDateE[i].checked == true){
			var check_Sdate= true;
		  }
	}

  if(!check_Sdate){
   alert("기간을 선택하세요. ");
   return;
  }	
  document.mainFrm.target= "_self";
  document.mainFrm.action = "./"+page+".jsp";
  document.mainFrm.method = 'post';
  document.mainFrm.submit(); 
  
}


function initInstantAlarmSound(bCheck){
	instantAlarmSound(bCheck);	
}


function userInstantAlarmSound(bCheck){

	
	if(bCheck){
		document.all.MUTE_YN.value = "Y";
	}
	else{
		document.all.MUTE_YN.value = "N";
	}

	instantAlarmSound(bCheck);

}

// 장애발생 알림 check
function instantAlarmSound(bCheck){	
	if(bCheck){
		//alert("가청음소거가 설정 되었습니다.");
		//document.all.MUTE_YN.value = "Y";
		stopAlarm();
	}
	else{
		//alert("가청음소거가 해제 되었습니다.");
		if(document.all.MUTE_YN.value == "N"){
			if(document.all.s_CRI.value =="Y" || document.all.s_MAJ.value =="Y" || document.all.s_MIN.value =="Y"){					
				playAlarm(document.mainFrm.OAMP_ALARM_CLASS.value, document.mainFrm.OAMP_ALARM_REPEAT_CNT.value);
			}
		}
		
	}
}


function event_graph_cpu(page,node){
	
  document.mainFrm.NODE.value = node;
  window.open('about:blank',page,'width=580,height=420');
  
  document.mainFrm.target= page;
  document.mainFrm.action = "./"+page+".jsp";
  document.mainFrm.method = 'post';
  document.mainFrm.submit();  
  
}
function event_graph_nic(page,node,nic){
	
  document.mainFrm.NODE.value = node;
  document.mainFrm.NIC.value = nic;
  window.open('about:blank',page,'width=800,height=420');
  
  document.mainFrm.target= page;
  document.mainFrm.action = "./"+page+".jsp";
  document.mainFrm.method = 'post';
  document.mainFrm.submit();  
  
}
//SMS전송이력 검색
function sms_list_hist_rtrv(page){

	if(document.mainFrm.sDateS.value > document.mainFrm.sDateE.value){
	alert("날짜 선택이 잘못 되었습니다. 다시 선택하세요.");
	}
  document.mainFrm.sDateS.value = document.mainFrm.sDateS.value.replace("-","").replace("-","");
  document.mainFrm.sDateE.value = document.mainFrm.sDateE.value.replace("-","").replace("-","");
  document.mainFrm.target= "_self";
  document.mainFrm.action = "./"+page+".jsp";
  document.mainFrm.method = 'post';
  document.mainFrm.submit();  
}

function alm_dn_chg(page,node,svcnm,ac){

  document.mainFrm.NODE.value = node;
  document.mainFrm.SVCNM.value = svcnm;
  document.mainFrm.AC.value = ac;
  
  document.mainFrm.target= "_self";
  document.mainFrm.action = "./"+page+".jsp";
  document.mainFrm.method = 'post';
  document.mainFrm.submit();  
  
}

function alm_v_stat_chg(page,num){

	if(num==1){
		if(document.mainFrm.V_CRI.checked == true){
			document.mainFrm.V_CRI.value = "Y";
		}
		if(document.mainFrm.V_MAJ.checked == true){
			document.mainFrm.V_MAJ.value = "Y";
		}
		if(document.mainFrm.V_MIN.checked == true){
			document.mainFrm.V_MIN.value = "Y";
		}
	}else if(num==2){
		if(document.mainFrm.S_CRI.checked == true){
			document.mainFrm.S_CRI.value = "Y";
		}
		if(document.mainFrm.S_MAJ.checked == true){
			document.mainFrm.S_MAJ.value = "Y";
		}
		if(document.mainFrm.S_MIN.checked == true){
			document.mainFrm.S_MIN.value = "Y";
		}
		if(document.mainFrm.DEF_YN.checked == true){
			document.mainFrm.DEF_YN.value = "Y";
		}
		if(document.mainFrm.REP_YN.checked == true){
			document.mainFrm.REP_YN.value = "Y";
		}



	}

  document.mainFrm.target= "_self";
  document.mainFrm.action = "./"+page+".jsp?NUM="+num;
  document.mainFrm.method = 'post';
  document.mainFrm.submit();   
}

function alm_s_stat_rtrv(page){
  document.mainFrm.S_CRI.value = document.mainFrm.S_CRI.value;
  document.mainFrm.S_MAJ.value = document.mainFrm.S_MAJ.value;
  document.mainFrm.S_MIN.value = document.mainFrm.S_MIN.value;
  //document.mainFrm.FR_CNT.value = document.mainFrm.R_CNT.value;

  document.mainFrm.DEF_YN.value = document.mainFrm.DEF_YN.value;
  document.mainFrm.REP_YN.value = document.mainFrm.REP_YN.value;

   var mainFrm = document.mainFrm;
    //var ret = document.mainFrm.FS_TYPE.value;
    for (i=0; i< mainFrm.S_TYPE.length; i++)
    {
        if (mainFrm.S_TYPE[i].checked == true)
        {
            document.mainFrm.S_TYPE.value = mainFrm.S_TYPE[i].value;
			//alert(mainFrm.S_TYPE[i].value + i);
        }
    }
  window.open('about:blank',page,'width=400,height=345');
  document.mainFrm.target= page;
  document.mainFrm.action = "./"+page+".jsp";
  document.mainFrm.method = 'post';
  document.mainFrm.submit(); 
}

function alm_v_stat_rtrv(page){
  document.mainFrm.V_CRI.value = document.mainFrm.V_CRI.value;
  document.mainFrm.V_MAJ.value = document.mainFrm.V_MAJ.value;
  document.mainFrm.V_MIN.value = document.mainFrm.V_MIN.value;
  window.open('about:blank',page,'width=400,height=220');
  document.mainFrm.target= page;
  document.mainFrm.action = "./"+page+".jsp";
  document.mainFrm.method = 'post';
  document.mainFrm.submit(); 
}

function sms_user_crte(page){

  window.open('about:blank',page,'width=400,height=145');
	
  document.mainFrm.target= page;
  document.mainFrm.action = "./"+page+".jsp";
  document.mainFrm.method = 'post';
  document.mainFrm.submit(); 
  
}

function sms_user_crte_process(page){
var HP = document.getElementsByName("HP");

  if(document.mainFrm.NAME.value == ""){
	   alert("이름을 입력하세요. ");
	   document.mainFrm.NAME.focus();
	   return;
  }
  for(var i=0;i<HP.length;i++){
	  
  	if(HP[i].value == ""){
 		alert(HP[i].id + " HP번호를 입력하세요. ");
	   	HP[i].focus();
	   	return;
  	}
	var numPattern = /([^1-9-0])/;
	numPattern = HP[i].value.match(numPattern);

	if(numPattern != null){
		alert("숫자만 입력할 수 있습니다.");
		for(var j=0;j<HP.length;j++){
		HP[j].value="";
		}
		HP[0].focus();
		return;
	}
    if(HP[0].value.length < 3 || HP[1].value.length < 4){
    	alert("HP번호 형식이 맞지 않습니다.");
    	HP[0].value="";
    	HP[1].value="";
    	HP[0].focus();
    	return;
  }

  }
  document.mainFrm.target= "_self";
  document.mainFrm.action = "./"+page+".jsp";
  document.mainFrm.method = 'post';
  document.mainFrm.submit(); 
  
}

function sms_user_crte_event(){
var HP = document.getElementsByName("HP");

	  if(HP[0].value.length == 4){
		HP[1].focus();
	  }
	 
	 
}

function alm_sms_user_crte_event(){
var SMS_USER_HP = document.getElementsByName("SMS_USER_HP");

	  if(SMS_USER_HP[0].value.length == 4){
		SMS_USER_HP[1].focus();
	  }

}

function svc_stat_rtrv(page){

 if(document.mainFrm.NODE.value == ""){
	   alert("노드를 선택하세요. ");
	   document.mainFrm.NODE.focus();
	   return;
  }
  var s_l = document.mainFrm.STYPE.length;
		for(i =0; i <s_l; i++){
		  if(document.mainFrm.STYPE[i].checked == true){
			var check_S= true;
		  }
	}

  if(!check_S){
   alert("통계를 선택하세요. ");
   return;
  }	


  var sdate_l = document.mainFrm.sDateE.length;
		for(i =0; i <sdate_l; i++){
		  if(document.mainFrm.sDateE[i].checked == true){
			var check_Sdate= true;
		  }
	}

  if(!check_Sdate){
   alert("기간을 선택하세요. ");
   return;
  }	
  document.mainFrm.target= "_self";
  document.mainFrm.action = "./"+page+".jsp";
  document.mainFrm.method = 'post';
  document.mainFrm.submit(); 
  
}

function toTimeObject(time) { //parseTime(time)
   var year  = time.substr(0,4);
   var month = time.substr(4,2) - 1; // 1월=0,12월=11
   var day   = time.substr(6,2);
   var hour  = time.substr(8,2);
   var min   = time.substr(10,2);

   return new Date(year,month,day,hour,min);
}


function alm_stat_rtrv(page,num){

if(page == "alm_stat_rtrv" || page == "res_stat_rtrv"){
 if(document.mainFrm.NODE.value == ""){
	   alert("노드를 선택하세요. ");
	   document.mainFrm.NODE.focus();
	   return;
  }
}

if(page == "res_stat_rtrv"){

    var s_l = document.mainFrm.RTYPE.length;
		for(i =0; i <s_l; i++){
		  if(document.mainFrm.RTYPE[i].checked == true){
			var check_S= true;
		  }
	}

  if(!check_S){
   alert("자원을 선택하세요. ");
   return;
  }	

}


if(num==1){
	var sdate =0;
	var edate =0;
 sdate = document.mainFrm.sDateS.value+document.mainFrm.hour_sdt.value+document.mainFrm.min_sdt.value;
 edate = document.mainFrm.sDateE.value+document.mainFrm.hour_edt.value+document.mainFrm.min_edt.value;
 sdate = sdate.replace("-","");
 sdate = sdate.replace("-","");
 edate = edate.replace("-","");
 edate = edate.replace("-","");

 var fromDate = toTimeObject(sdate);
 var toDate   = toTimeObject(edate);

 if(fromDate.getTime() >= toDate.getTime()){
	 alert("기간선택이 잘못되었습니다. 종료조건은 시작조건보다 커야합니다. 다시 선택하세요.");
	 return;
 }

 if((toDate.getTime()/1000 - fromDate.getTime()/1000) > 3600 || (toDate.getTime()/1000 - fromDate.getTime()/1000) < 0 ){
	   alert("5분 통계 검색 구간은 1시간 입니다. 날짜와 시간을 다시 선택하세요.");
	   return;
 }

}


if(num==2){
 if(document.mainFrm.sDateS.value == ""){
	   alert("날짜를 선택하세요. ");
	   return;
  }
 if(document.mainFrm.sDateE.value == ""){
	   alert("날짜를 선택하세요. ");
	   return;
  } 

 if(document.mainFrm.sDateS.value+document.mainFrm.hour_sdt.value >= document.mainFrm.sDateE.value+document.mainFrm.hour_edt.value){
	   //alert("날짜 선택이 잘못 되었습니다. 다시 선택하세요. ");
	   alert("기간선택이 잘못되었습니다. 종료조건은 시작조건보다 커야합니다. 다시 선택하세요.");
	   return;
  }

}


if(num==3){
 if(document.mainFrm.sDateS.value >= document.mainFrm.sDateE.value){
	   alert("기간선택이 잘못되었습니다. 종료조건은 시작조건보다 커야합니다. 다시 선택하세요.");
	   return;
  }
}

if(num==4){
 if(document.mainFrm.year_sdt.value + document.mainFrm.month_sdt.value >= document.mainFrm.year_edt.value + document.mainFrm.month_edt.value){
	   alert("기간선택이 잘못되었습니다. 종료조건은 시작조건보다 커야합니다. 다시 선택하세요.");
	   return;
  }
}
 /* var s_l = document.mainFrm.STYPE.length;
		for(i =0; i <s_l; i++){
		  if(document.mainFrm.STYPE[i].checked == true){
			var check_S= true;
		  }
	}

  if(!check_S){
   alert("통계를 선택하세요. ");
   return;
  }	


  var sdate_l = document.mainFrm.sDateE.length;
		for(i =0; i <sdate_l; i++){
		  if(document.mainFrm.sDateE[i].checked == true){
			var check_Sdate= true;
		  }
	}

  if(!check_Sdate){
   alert("기간을 선택하세요. ");
   return;
  }	
*/




  document.mainFrm.target = "_self";
  document.mainFrm.action = "./"+page+".jsp";
  document.mainFrm.method = 'post';
  document.mainFrm.submit(); 
  
}

function graph(page,node,rtype,stype,usercommand,sdt,edt){

	window.open('about:blank',page,'width=650,height=400');
	document.mainFrm.NODE.value = node;
	document.mainFrm.RT.value = rtype;
	document.mainFrm.ET.value = stype;
	document.mainFrm.SDT.value = sdt;
	document.mainFrm.EDT.value = edt;
	document.mainFrm.USERCOMMAND.value = usercommand;

	document.mainFrm.target= page;
	document.mainFrm.action = "./"+page+".jsp";
	document.mainFrm.method = 'post';
	document.mainFrm.submit();
}


function alm_his_rtrv(page){
if(document.mainFrm.sDateS.value > document.mainFrm.sDateE.value){
	alert("날짜 선택이 잘못 되었습니다.");
	return;
}
  document.mainFrm.target= "_self";
  document.mainFrm.action = "./"+page+".jsp";
  document.mainFrm.method = 'post';
  document.mainFrm.submit(); 
  
}

function excel(page,node,usercommand){
	document.mainFrm.NODE.value = node;
	document.mainFrm.USERCOMMAND.value = usercommand;
	document.mainFrm.action = "./"+page+".jsp";
	document.mainFrm.method = 'post';
	document.mainFrm.submit(); 
  
}

function excel_res(page,node,rtype,stype,usercommand,sdt,edt){


	document.mainFrm.NODE.value = node;
	document.mainFrm.RT.value = rtype;
	document.mainFrm.ET.value = stype;
	document.mainFrm.SDT.value = sdt;
	document.mainFrm.EDT.value = edt;
	document.mainFrm.USERCOMMAND.value = usercommand;
	document.mainFrm.action = "./"+page+".jsp";
	document.mainFrm.method = 'post';
	document.mainFrm.submit(); 
  
}

function excel_cmd(page){
	document.mainFrm.action = "./"+page+".jsp";
	document.mainFrm.method = 'post';
	document.mainFrm.submit();  	
}

function excel_pro(page){
	document.mainFrm.action = "./"+page+".jsp";
	document.mainFrm.method = 'post';
	document.mainFrm.submit();  	
}

function logout(){
	
	document.mainFrm.target = "_self";
	document.mainFrm.action = "../login/logout.jsp";
	document.mainFrm.method = 'post';
	document.mainFrm.submit(); 

}

function max_user_chg_process(page){

 if(document.mainFrm.EMS_MAX_USER.value > 100 || document.mainFrm.EMS_MAX_USER.value <= 0 ){
	   alert("최대 사용자수 입력 범위를 벗어났습니다. 입력범위는 1~100 사이입니다.");
	   document.mainFrm.EMS_MAX_USER.focus();
	   return;
  }
    document.mainFrm.target= "_self";
	document.mainFrm.action = "./"+page+".jsp";
	document.mainFrm.method = 'post';
	document.mainFrm.submit(); 
  
}

function max_cInt_chg_process(page){
 if(document.mainFrm.MAX_SESSION.value > 10){
	   alert("최대 세션수를 초과하였습니다.");
	   document.mainFrm.MAX_SESSION.focus();
	   return;
  }
    document.mainFrm.target= "_self";
	document.mainFrm.action = "./"+page+".jsp";
	document.mainFrm.method = 'post';
	document.mainFrm.submit(); 
  
}
function user_dlt(page,userid){
	 var my_ret;
	my_ret = confirm("삭제하시겠습니까?");
	if (my_ret == true)
	{
	  //location.href="./"+page+".jsp?node="+node;

	  document.mainFrm.USERID.value = userid;
      document.mainFrm.target= "_self";
      document.mainFrm.action = "./"+page+".jsp";
	  document.mainFrm.method = 'post';
	  document.mainFrm.submit();  

	}	else{
	  return;
	}
  
}

function passwd_chg_process(page,passwd1,passwd2){
  
  if(document.mainFrm.PASSWD1.value == ""){
	   alert("패스워드를 입력하세요. ");
	   document.mainFrm.PASSWD1.focus();
	   return;
  }else if(document.mainFrm.PASSWD2.value == ""){
	   alert("패스워드 확인을 입력하세요. ");
	   document.mainFrm.PASSWD2.focus();
	   return;
  }else if(document.mainFrm.PASSWD1.value != document.mainFrm.PASSWD2.value){
	   alert("패스워드 동일하지 않습니다.");
	   return;
  }
    document.mainFrm.target= "_self";
	document.mainFrm.action = "./"+page+".jsp";
	document.mainFrm.method = 'post';
	document.mainFrm.submit(); 
  
}


function user_crte_process(page){
 if(document.mainFrm.USERID.value == ""){
	   alert("사용자를 입력하세요. ");
	   document.mainFrm.USERID.focus();
	   return;
  }else if(document.mainFrm.USERID.value.length <4 || document.mainFrm.USERID.value.length >12){
	   alert("사용자ID를 다시 입력해주세요. 사용자ID 입력 범위는 4~12자 입니다.");
	   document.mainFrm.USERID.focus();
	   return;
  }else if(document.mainFrm.USERGRP.value == ""){
	   alert("사용자 그룹을 선택하세요.");
	   document.mainFrm.USERGRP.focus();
	   return;
  }else if(document.mainFrm.SESSION.value > 10){
	   alert("최대 세션수를 초과하였습니다.");
	   document.mainFrm.SESSION.focus();
	   return;
  }else if(document.mainFrm.EDT.value == "" && !document.mainFrm.MAXEDT.checked){
	   alert("만료일을 선택하세요.");

	   return;
  }
  if(document.mainFrm.EDT.value != ""){
	document.mainFrm.CAL_EDT.value = document.mainFrm.EDT.value;
  }
    document.mainFrm.target= "_self";
	document.mainFrm.action = "./"+page+".jsp";
	document.mainFrm.method = 'post';
	document.mainFrm.submit(); 
  
}


function user_chg_process(page){
	if(document.mainFrm.USERGRP.value == ""){
	   alert("사용자 그룹을 선택하세요.");
	   document.mainFrm.USERGRP.focus();
	   return;
	}
	else if(document.mainFrm.SESSION.value > 10){
	   alert("최대 세션수를 초과하였습니다.");
	   document.mainFrm.SESSION.focus();
	   return;
	}
	else if((document.mainFrm.EDT.value == "")
		&& (document.mainFrm.MAXEDT.checked == false)){	
		alert("패스워드 만료일을 선택하세요.");
		document.mainFrm.EDT.focus();
		return;
	}
    document.mainFrm.target= "_self";
	document.mainFrm.action = "./"+page+".jsp";
	document.mainFrm.method = 'post';
	document.mainFrm.submit(); 
  
}



function excel_alm(page, node,usercommand,sdt,edt){
	document.mainFrm.NODE.value = node;
	
	document.mainFrm.SDT.value = sdt;
	document.mainFrm.EDT.value = edt;
	document.mainFrm.USERCOMMAND.value = usercommand;
	document.mainFrm.action = "./"+page+".jsp";
	document.mainFrm.method = 'post';
	document.mainFrm.submit(); 
  
}
function excel_svc(page, svcnm,usercommand,sdt,edt){


	document.mainFrm.SVCNM.value = svcnm;
	document.mainFrm.SDT.value = sdt;
	document.mainFrm.EDT.value = edt;
	document.mainFrm.USERCOMMAND.value = usercommand;
	document.mainFrm.action = "./"+page+".jsp";
	document.mainFrm.method = 'post';
	document.mainFrm.submit(); 
  
}


function calHid(){
	var MAXEDT = document.getElementById("MAXEDT");
	var calHid = document.getElementById("calHid");
	
	if(MAXEDT.checked == true){
			calHid.style.display = "none";
	}else{
		calHid.style.display = "inline-block";
	}
}

function alm_sms_list_dlt(page,almcd,hp){
  var my_ret;
	my_ret = confirm("삭제하시겠습니까?");
	if (my_ret == true)
	{


	  document.crteFrm.ALM_CD.value = almcd;
	  document.crteFrm.SMS_USER_HP.value = hp;

      document.crteFrm.target= "_self";
      document.crteFrm.action = "./"+page+".jsp";
	  document.crteFrm.method = 'post';
	  document.crteFrm.submit();
	  
	  


	}	else{
	  return;
	}

}

function alm_sms_list_crte_process(page){

  var SMS = document.crteFrm.SMS.value;
  var SMS_Split = SMS.split(",");
	if(SMS == ""){
		alert("SMS수신자를 선택해주세요.");
		return;
	}
  document.crteFrm.SMS_USER_HP.value = SMS_Split[0];
  document.crteFrm.SMS_USER_NM.value = SMS_Split[1];

  document.crteFrm.action = "./"+page+".jsp";
  document.crteFrm.target = '_self';
  document.crteFrm.method = 'post';
  document.crteFrm.submit();
 

}

function alm_sms_list_process(page){

  document.crteFrm.action = "./"+page+".jsp";
  //document.crteFrm.target = '_self';
  document.crteFrm.method = 'post';
  document.crteFrm.submit(); 
}

function alm_sms_list_pro(page){


var SMS_USER_HP = document.getElementsByName("SMS_USER_HP");
  if(document.crteFrm.SMS_USER_NM.value == ""){
	   alert("이름을 입력하세요. ");
	   document.crteFrm.SMS_USER_NM.focus();
	   return;
  }
  for(var i=0;i<SMS_USER_HP.length;i++){
	  if(SMS_USER_HP[i].value == ""){
		   alert(SMS_USER_HP[i].id + " HP번호를 입력하세요. ");
		   SMS_USER_HP[i].focus();
		   return;
	  }
	var numPattern = /([^1-9-0])/;
	numPattern = SMS_USER_HP[i].value.match(numPattern);
	
	if(numPattern != null){
		alert("숫자만 입력할 수 있습니다.");
		for(var j=0;j<SMS_USER_HP.length;j++){
			SMS_USER_HP[j].value="";
		}
		SMS_USER_HP[0].focus();
		return;
	}
	
	if(SMS_USER_HP[0].value.length < 3 || SMS_USER_HP[1].value.length < 4){
    	alert("HP번호 형식이 맞지 않습니다.");
    	SMS_USER_HP[0].value="";
    	SMS_USER_HP[1].value="";
    	SMS_USER_HP[0].focus();
    	return;
  }
	
	
  }


  document.crteFrm.action = "./"+page+".jsp";
  document.crteFrm.target = '_self';
  document.crteFrm.method = 'post';
  document.crteFrm.submit(); 
}


function alm_sms_list_rtrv(page){
  window.open('about:blank',page,'width=500,height=300,scrollbars=yes,resizable=yes');
  document.chgFrm.target= page;
  document.chgFrm.action = "./"+page+".jsp";
  document.chgFrm.method = 'post';
  document.chgFrm.submit();  
  
}

function alm_sms_list_rtrv_crte(page){
  window.open('','alm_sms_list_rtrv','width=500,height=200');
  document.crteFrm.target= 'alm_sms_list_rtrv';
  document.crteFrm.action = "./"+page+".jsp";
  document.crteFrm.method = 'post';
  document.crteFrm.submit(); 
}

	function createAlarm(){
		
	    if (ver == "Microsoft Internet Explorer") {
			document.write('<bgsound ID="OAMP_ALARM" src="#" autostart=true/>');
        } else {
			document.write('<embed name="OAMP_ALARM" src="alarm.wav" autostart=false hidden=true MASTERSOUND></embed>');
		}
	}

	function playAlarm(alarmClass, alarmRepeatCount) {		
		setSoundLoop(document.all.OAMP_ALARM, alarmRepeatCount);		
		playSound(document.all.OAMP_ALARM, getAlarmSound(alarmClass));
	}
		
	function stopAlarm(){
		stopSound(document.all.OAMP_ALARM);
	}

	function muteOnAlarm(){
		muteOnSound(document.all.OAMP_ALARM);
	}

	function muteOffAlarm(){
		muteOffSound(document.all.OAMP_ALARM);
	}

	function getAlarmSound(alarmClass){
		var alarmSoundPath = ""

		switch(alarmClass){
			case "1": //Critical Sound Path
				alarmSoundPath = "../sound/Critical.wav";
				break;

			case "2": //Major Sound Path
				alarmSoundPath = "../sound/Major.wav";
				break;

			case "3": //Minor Sound Path
				alarmSoundPath = "../sound/Minor.wav";
				break;

			default:
				break;
		}

		return alarmSoundPath;
	}


	function setSoundLoop(soundObj, alarmRepeatCount){
		// finite Repeat(alarmRepeatCount > 0)
		if(alarmRepeatCount > 0){			
			soundObj.loop=alarmRepeatCount;
		}
		// infinite Repeat(alarmRepeatCount <= 0)
		else{		
			soundObj.loop=-1;
		}
	}

	function playSound(soundObj, src){	

		if (ver == "Microsoft Internet Explorer") {
			soundObj.src=src;
			//soundObj.play();
			//alert("play");
		}
		else{
			soundObj.src=src;
			alert(soundObj.src);
			soundObj.play();
			
		}
	}


	function stopSound(soundObj) { 
		soundObj.src="";
		//obj.stop();
		//alert("stop");
	}

	function muteOffSound(soundObj) {
		if(soundObj.volume == muteVolume){
			soundObj.volume = oldVolme;
		}		
	}

	function muteOnSound(soundObj) { 
		if(soundObj.volume != muteVolume){
			oldVolme = soundObj.volume;
			soundObj.volume = muteVolume;				
		}
	}



