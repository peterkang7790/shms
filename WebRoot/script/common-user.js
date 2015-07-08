// Image Rollover
function ChgImg(name,img){
	var imgUrl = "../img/"
	name.src = imgUrl + img;
}
// 팝업스크립트
   function MM_openBrWindow(theURL,winName,features) { //v2.0
   window.open(theURL,winName,features);
   }

function SwitchMenu(obj){
		if(document.getElementById){
		var el = document.getElementById(obj);
		var ar = document.getElementById("maindiv").getElementsByTagName("div");
				if(el.style.display != "block"){
						for (var i=0; i<ar.length; i++){
								if (ar[i].className=="submenu")
								ar[i].style.display = "none";
						}
						el.style.display = "block";
				}else{
						el.style.display = "none";
				}
		}
}


function detailvalue_b(obj){
	if(document.getElementById){
		var el = document.getElementById(obj);
		var ar = document.getElementById("maindiv").getElementsByTagName("div");
		if(el.style.display != "block"){
				for (var i=0; i<ar.length; i++){
						if (ar[i].className=="detail_b")
						ar[i].style.display = "none";
				}
				el.style.display = "block";
		}else{
				el.style.display = "none";
		}
	}
}


function zoomvalue_c(obj){
		if(document.getElementById){
		var el = document.getElementById(obj);
		var ar = document.getElementById("maindiv").getElementsByTagName("div");
				if(el.style.display != "block"){
						for (var i=0; i<ar.length; i++){
								if (ar[i].className=="zoom_c")
								ar[i].style.display = "none";
						}
						el.style.display = "block";
				}else{
						el.style.display = "none";
				}
		}
}

/* tab */
function Change(flag)
{
	document.all.tb1.style.display="none";
	document.all.tb2.style.display="none";
	document.all.tb3.style.display="none";
	document.all.tb4.style.display="none";
	document.all.tb5.style.display="none";
	document.all.tb6.style.display="none";

	var b=eval("document.all.tb"+flag);
	b.style.display="";
}

/* 스크롤 따라 다니는 top 버튼 */
function initMoving(target, position, topLimit, btmLimit) {
	if (!target)
		return false;
	var obj = target;
	obj.initTop = position;
	obj.topLimit = topLimit;
	obj.bottomLimit = document.documentElement.scrollHeight - btmLimit;

	obj.style.position = "absolute";
	obj.top = obj.initTop;
//	obj.left = obj.initLeft;
//	obj.left = 100;

	if (typeof(window.pageYOffset) == "number") {
		obj.getTop = function() {
			return window.pageYOffset;
		}
	} else if (typeof(document.documentElement.scrollTop) == "number") {
		obj.getTop = function() {
			return document.documentElement.scrollTop;
		}
	} else {
		obj.getTop = function() {
			return 0;
		}
	}

	if (self.innerHeight) {
		obj.getHeight = function() {
			return self.innerHeight;
		}
	} else if(document.documentElement.clientHeight) {
		obj.getHeight = function() {
			return document.documentElement.clientHeight;
		}
	} else {
		obj.getHeight = function() {
			return 500;
		}
	}

	obj.move = setInterval(function() {
		if (obj.initTop > 0) {
			pos = obj.getTop() + obj.initTop;
		} else {
			pos = obj.getTop() + obj.getHeight() + obj.initTop;
			//pos = obj.getTop() + obj.getHeight() / 2 - 15;
		}

		if (pos > obj.bottomLimit)
			pos = obj.bottomLimit;
		if (pos < obj.topLimit)
			pos = obj.topLimit;

		interval = obj.top - pos;
		obj.top = obj.top - interval / 10;
		obj.style.top = obj.top + "px";
	}, 30)
}


function SwitchMenu(obj){
		if(document.getElementById){
		var el = document.getElementById(obj);
		var ar = document.getElementById("maindiv").getElementsByTagName("div");
				if(el.style.display != "block"){
						for (var i=0; i<ar.length; i++){
								if (ar[i].className=="submenu")
								ar[i].style.display = "none";
						}
						el.style.display = "block";
				}else{
						el.style.display = "none";
				}
		}
}
/* 마우스오버시 내용 보이기 */
var tab_layers1 = new Array( "layer1","layer2","layer3","layer4","layer5" )
	var tab_objs1 = new Array( tab_layers1.length );

	function tab_getObjs1() {
	var nObjMax = tab_layers1.length;
	for( nCount = 0; nCount < nObjMax; nCount++ ) {
	tab_objs1[nCount] = document.getElementById( tab_layers1[nCount] );
	}
	}

	function MenuChange1( layerID ) {
	// layer 객체들을 얻어옴!
	tab_objs1[0] != null ? "" : tab_getObjs1();

	if ( layerID == tab_objs1[0].id ) {
	tab_objs1[0].style.display = "";
	tab_objs1[1].style.display = "none";
	tab_objs1[2].style.display = "none";

	tabMenu1.src = "../img/tap_total01_on.gif";
	tabMenu2.src = "http://images.joins.com/ui_joins/news06/common/tap_se01_off.gif";
	tabMenu3.src = "http://images.joins.com/ui_joins/news06/common/tap_life01_off.gif";
	}

	else if ( layerID == tab_objs1[1].id ) {
	tab_objs1[0].style.display = "none";
	tab_objs1[1].style.display = "";
	tab_objs1[2].style.display = "none";

	tabMenu1.src = "http://images.joins.com/ui_joins/news06/common/tap_total01_off.gif";
	tabMenu2.src = "http://images.joins.com/ui_joins/news06/common/tap_se01_on.gif";
	tabMenu3.src = "http://images.joins.com/ui_joins/news06/common/tap_life01_off.gif";
	}

	else if ( layerID == tab_objs1[2].id ) {
	tab_objs1[0].style.display = "none";
	tab_objs1[1].style.display = "none";
	tab_objs1[2].style.display = "";

	tabMenu1.src = "http://images.joins.com/ui_joins/news06/common/tap_total01_off.gif";
	tabMenu2.src = "http://images.joins.com/ui_joins/news06/common/tap_se01_off.gif";
	tabMenu3.src = "http://images.joins.com/ui_joins/news06/common/tap_life01_on.gif";
	}

	}
// 마우스오버시
function view1(opt) {
  if(opt) {
     spec1.style.display = "block";
  }
  else {
     spec1.style.display = "none";
  }
}
function view2(opt) {
  if(opt) {
     spec2.style.display = "block";
  }
  else {
     spec2.style.display = "none";
  }
}
function view3(opt) {
  if(opt) {
     spec3.style.display = "block";
  }
  else {
     spec3.style.display = "none";
  }
}
function view4(opt) {
  if(opt) {
     spec4.style.display = "block";
  }
  else {
     spec4.style.display = "none";
  }
}
function view5(opt) {
  if(opt) {
     spec5.style.display = "block";
  }
  else {
     spec5.style.display = "none";
  }
}
function view6(opt) {
  if(opt) {
     spec6.style.display = "block";
  }
  else {
     spec6.style.display = "none";
  }
}
function view7(opt) {
  if(opt) {
     spec7.style.display = "block";
  }
  else {
     spec7.style.display = "none";
  }
}
function view8(opt) {
  if(opt) {
     spec8.style.display = "block";
  }
  else {
     spec8.style.display = "none";
  }
}
function view9(opt) {
  if(opt) {
     spec9.style.display = "block";
  }
  else {
     spec9.style.display = "none";
  }
}
function view10(opt) {
  if(opt) {
     spec10.style.display = "block";
  }
  else {
     spec10.style.display = "none";
  }
}
function view11(opt) {
  if(opt) {
     spec11.style.display = "block";
  }
  else {
     spec11.style.display = "none";
  }
}
function view12(opt) {
  if(opt) {
     spec12.style.display = "block";
  }
  else {
     spec12.style.display = "none";
  }
}
function view13(opt) {
  if(opt) {
     spec13.style.display = "block";
  }
  else {
     spec13.style.display = "none";
  }
}
function view14(opt) {
  if(opt) {
     spec14.style.display = "block";
  }
  else {
     spec14.style.display = "none";
  }
}
function view15(opt) {
  if(opt) {
     spec15.style.display = "block";
  }
  else {
     spec15.style.display = "none";
  }
}
function view16(opt) {
  if(opt) {
     spec16.style.display = "block";
  }
  else {
     spec16.style.display = "none";
  }
}
function view17(opt) {
  if(opt) {
     spec17.style.display = "block";
  }
  else {
     spec17.style.display = "none";
  }
}
// 마우스오버시 내용 보이게 하는 스크립트 //
function SFun_SHlayer1()                 // 마우스오버시 (tab_menu1)
{
	layer_main1.style.visibility = "visible";
	layer_main2.style.visibility = "hidden";
	layer_main3.style.visibility = "hidden";
	layer_main4.style.visibility = "hidden";
	layer_main5.style.visibility = "hidden";
	layer_main6.style.visibility = "hidden";
}
function SFun_SHlayer2()                // 마우스오버시 (tab_menu2)
{
	layer_main1.style.visibility = "hidden";
	layer_main2.style.visibility = "visible";
	layer_main3.style.visibility = "hidden";
	layer_main4.style.visibility = "hidden";
	layer_main5.style.visibility = "hidden";
	layer_main6.style.visibility = "hidden";
}
function SFun_SHlayer3()                // 마우스오버시 (tab_menu3)
{
	layer_main1.style.visibility = "hidden";
	layer_main2.style.visibility = "hidden";
	layer_main3.style.visibility = "visible";
	layer_main4.style.visibility = "hidden";
	layer_main5.style.visibility = "hidden";
	layer_main6.style.visibility = "hidden";
}
function SFun_SHlayer4()                // 마우스오버시 (tab_menu3)
{
	layer_main1.style.visibility = "hidden";
	layer_main2.style.visibility = "hidden";
	layer_main3.style.visibility = "hidden";
	layer_main4.style.visibility = "visible";
	layer_main5.style.visibility = "hidden";
	layer_main6.style.visibility = "hidden";
}
function SFun_SHlayer5()                // 마우스오버시 (tab_menu3)
{
	layer_main1.style.visibility = "hidden";
	layer_main2.style.visibility = "hidden";
	layer_main3.style.visibility = "hidden";
	layer_main4.style.visibility = "hidden";
	layer_main5.style.visibility = "visible";
	layer_main6.style.visibility = "hidden";
}
function SFun_SHlayer6()                // 마우스오버시 (tab_menu3)
{
	layer_main1.style.visibility = "hidden";
	layer_main2.style.visibility = "hidden";
	layer_main3.style.visibility = "hidden";
	layer_main4.style.visibility = "hidden";
	layer_main5.style.visibility = "hidden";
	layer_main6.style.visibility = "visible";
}


// asp 여부
function isOlisAsp() {
	if (getCookie("EZWEL_ASP_CODE") != "") {
		return true;
	}
	else {
		return false;
	}
}

// 키워드 정보
function keywordInfo(keyword, keywordUrl) {
	this.keyword = keyword;
	this.keywordUrl = keywordUrl;
}

// 배너정보
function bannerInfo(bannerTitle, imgPath, bannerUrl, bannerType) {
	this.bannerTitle = bannerTitle;
	this.imgPath = imgPath;
	this.bannerUrl = bannerUrl;
	this.bannerType = bannerType;
}

//우편번호
function addressHow(){
	var howPop = window.open('/post/popup/postSearch.do','how','scrollbars=No,width=363,height=376,top=50,left=50');
	howPop.focus();
}


//////////////////////////////// 화면 확대 축소 ///////////////////////////////////////////////////////
var mFirst=[8,15];
var mFont;
var mZoom;
var cFont;
var moFirst, mClass;
var initFlag = false;

function chgWindow(d,v) {
 
  if(v == "1.0") {    /* 초기화 */
      mZoom = readCookie("cZoom");
      d.body.style.zoom = mZoom;
  } else if(d.body.style.zoom == '' ){
   if (v > 1) {
    d.body.style.zoom = v ;
   }
  } else {
   var fSize = parseFloat(d.body.style.zoom);

   if (fSize > 2.0 ) {
    if (v < 1) {
     d.body.style.zoom *= v;
    }
//    d.body.style.zoom = 2.0; // 이이상은 작동 않하게
   } else if ( fSize < 1 ) {
    if (v > 1) {
     d.body.style.zoom = 1 ;
    }
//    d.body.style.zoom = 1;  // 이이하는 작동 않하게
   } else {
    d.body.style.zoom *= v;
   }
 
  }
 

}

function zoom_parent(n) {
 var mFont=readCookie("cFont");
 try {
  if(mFont == undefined)
   mFont=12;
  mFont=parseInt(mFont);
 } catch(e) {mFont=12;}
 n=parseInt(n);
 mFont+=n;

 var class_name="main01";

 if (mFont<mFirst[0]) mFont=mFirst[0];
 if (mFont>mFirst[1]) mFont=mFirst[1];


 moFirst=parent.document.getElementsByTagName("td");

 mClass=class_name ? class_name : "Sfont";
 
 objs=moFirst;
 for (i=0;i<objs.length;i++) {
  try {

   objs[i].style.fontSize=mFont+'pt';

   if (initFlag) moFirst[i]=objs[i];
  } catch(e) {}
 }


 moFirst=parent.document.getElementsByTagName("a");

 mClass=class_name ? class_name : "Sfont";

 objs=moFirst;
 for (i=0;i<objs.length;i++) {
  try {
   objs[i].style.fontSize=mFont+'pt';
   if (initFlag) moFirst[i]=objs[i];
  } catch(e) {}
 }

}


// 여기서부터 포털 UI