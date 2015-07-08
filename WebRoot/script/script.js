//$.getScript('../script/ui/ui.datepicker.js');
//$.getScript('../script/ui/i18n/ui.datepicker-ko.js');

/*
해상도별 footer 위치 조절 
*/


// Fullscreen Scripts
function getWindowHeight()
{
	
   if (parseInt(navigator.appVersion)>3){ 

     if(navigator.appName=="Netscape"){ //네스케이프, 사파리, 파이어폭스
      //var windowWidth = window.innerWidth-16; 
      var windowHeight = window.innerHeight-16; 
     } 
     if(navigator.appName.indexOf("Microsoft")!=-1) { //인터넷 익스플로러
     // var windowWidth = document.documentElement.offsetWidth-20; 
      var windowHeight =document.documentElement.offsetHeight-20; 
     } 
   } 
  //document.write( "현재창의 너비는 "+windowWidth+"<br>"+"현재창의 높이는 "+windowHeight); 
	return windowHeight;
}

function setFooter(){
	var windowHeight = getWindowHeight();
    
    if (windowHeight > 0)
    {
      var navHeight = windowHeight-124;
      if ((windowHeight - 124) >= 0)
      {
        document.getElementById('lay_leftMenu').style.height = (navHeight) + 'px';
      }
    }

}

//   $(document).ready(function(){
	// datepicker class가 존재할때 달력을 출력하는 js파일을 불러들인다.
//	if($('*').is('.datepicker') == true){
//		$.getScript('../script/ui/ui.datepicker.js');
//		$.getScript('../script/ui/i18n/ui.datepicker-ko.js');
//	}
	
//	// 지침준수항목이 존재하면
//	if($('*').is('#rule_itemsub') == true){
//		var rule_item_id = $('#rule_item_id > option:selected').val();
//		var rule_itemsub_id = $('#rule_itemsub_id').val(); // 지침준수 상세항목 값을 유지시키기 위한 값.
//		
//		$.post('/dcams/agreeDicManage/listDetailRuleItemSub.do',{rule_item_id:rule_item_id,rule_itemsub_id:rule_itemsub_id},function(data){
//			$('#rule_itemsub').html(data);
//		});
//	}
	
//   });

////약관지침준수항목을 클릭하면 약관지침준수상세항목을 보여준다.
//function RuleItem(rule_item_id){
//	$.post('/dcams/agreeDicManage/listDetailRuleItemSub.do',{rule_item_id:rule_item_id},function(data){
////		if(val != ''){
//			$('#rule_itemsub').html(data);
////		}
////		else{
////			$('#rule_itemsub').empty();
////		}
//	});
//}

//페이징
function Paging(url){
	var form = document.getElementsByTagName("form")[0];
	
	form.method = "post";
	form.target = "_self";
	form.action = url;
	form.submit();
}


// JavaScript Document
/* 탑메뉴(드림위버 자동 생성)*/

function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
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

/* 팝업창 뛰움(드림위버 자동 생성)*/

function MM_openBrWindow(theURL,winName,features) { //v2.0
	
  window.open(theURL,winName,features);
}




/*
라운드 table 
*/

function roundTable(objID) {
	var obj = document.getElementById(objID);
	var Parent, objTmp, Table, TBody, TR, TD;
	var bdcolor, bgcolor, Space;
	var trIDX, tdIDX, MAX;
	var styleWidth, styleHeight;

	// get parent node
	Parent = obj.parentNode;
	objTmp = document.createElement('SPAN');
	Parent.insertBefore(objTmp, obj);
	Parent.removeChild(obj);

	// get attribute
	bdcolor = obj.getAttribute('rborder');
	bgcolor = obj.getAttribute('rbgcolor');
	radius = parseInt(obj.getAttribute('radius'));
	if (radius == null || radius < 1) radius = 1;
	else if (radius > 6) radius = 6;

	MAX = radius * 2 + 1;

	/*
	create table {{
	*/
	Table = document.createElement('TABLE');
	TBody = document.createElement('TBODY');

	Table.cellSpacing = 0;
	Table.cellPadding = 0;

	for (trIDX=0; trIDX < MAX; trIDX++) {
	TR = document.createElement('TR');
	Space = Math.abs(trIDX - parseInt(radius));
	for (tdIDX=0; tdIDX < MAX; tdIDX++) {
	TD = document.createElement('TD');

	styleWidth = '1px'; styleHeight = '1px';
	if (tdIDX == 0 || tdIDX == MAX - 1) styleHeight = null;
	else if (trIDX == 0 || trIDX == MAX - 1) styleWidth = null;
	else if (radius > 2) {
	if (Math.abs(tdIDX - radius) == 1) styleWidth = '2px';
	if (Math.abs(trIDX - radius) == 1) styleHeight = '2px';
	}

	if (styleWidth != null) TD.style.width = styleWidth;
	if (styleHeight != null) TD.style.height = styleHeight;

	if (Space == tdIDX || Space == MAX - tdIDX - 1) TD.style.backgroundColor = bdcolor;
	else if (tdIDX > Space && Space < MAX - tdIDX - 1) TD.style.backgroundColor = bgcolor;

	if (Space == 0 && tdIDX == radius) TD.appendChild(obj);
	TR.appendChild(TD);
	}
	TBody.appendChild(TR);
	}

	/*
	}}
	*/

	Table.appendChild(TBody);

	// insert table and remove original table
	Parent.insertBefore(Table, objTmp);
	}


