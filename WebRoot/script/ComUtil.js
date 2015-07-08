String.prototype.int = function() {
	return parseInt(this, 10);
}

onerror = handleErr;
function handleErr(msg, url, l) {
	var txt = "";
	txt = "There was an error on this page.\n\n";
	txt += "Error: " + msg + "\n";
	txt += "URL: " + url + "\n";
	txt += "Line: " + l + "\n\n";
	txt += "Click OK to continue.\n\n";
	alert(txt);
	return true;
}

function winOpen(url) {
	var properties = "dialogwidth:820px;dialogHeight:465px;status:no;help:no";
	var returnValue = window.showModalDialog(url, "", properties);
}

function MM_openBrWindow(theURL, winName, features) { // v2.0
	window.open(theURL, winName, features);
}

function toUpper(obj) {
	obj.value = obj.value.toUpperCase();
}

function popup(url) {
	var nm = "win";
	// var properties = "width=400,height=250,left=0,top=0,toolbar=no,menubar=no,location=no,scollbars=no,status=no,resizable=no,fullscreen=no,channelmode=no";
	var properties = "width=400,height=250";
	window.open(url, nm, properties);
}

function MM_preloadImages() { // v3.0
	var d = document;
	if (d.images) {
		if (!d.MM_p)
			d.MM_p = new Array();
		var i, j = d.MM_p.length, a = MM_preloadImages.arguments;
		for (i = 0; i < a.length; i++)
			if (a[i].indexOf("#") != 0) {
				d.MM_p[j] = new Image;
				d.MM_p[j++].src = a[i];
			}
	}
}

function MM_swapImgRestore() { // v3.0
	var i, x, a = document.MM_sr;
	for (i = 0; a && i < a.length && (x = a[i]) && x.oSrc; i++)
		x.src = x.oSrc;
}

function MM_findObj(n, d) { // v4.01
	var p, i, x;
	if (!d)
		d = document;
	if ((p = n.indexOf("?")) > 0 && parent.frames.length) {
		d = parent.frames[n.substring(p + 1)].document;
		n = n.substring(0, p);
	}
	if (!(x = d[n]) && d.all)
		x = d.all[n];
	for (i = 0; !x && i < d.forms.length; i++)
		x = d.forms[i][n];
	for (i = 0; !x && d.layers && i < d.layers.length; i++)
		x = MM_findObj(n, d.layers[i].document);
	if (!x && d.getElementById)
		x = d.getElementById(n);
	return x;
}

function MM_swapImage() { // v3.0
	var i, j = 0, x, a = MM_swapImage.arguments;
	document.MM_sr = new Array;
	for (i = 0; i < (a.length - 2); i += 3)
		if ((x = MM_findObj(a[i])) != null) {
			document.MM_sr[j++] = x;
			if (!x.oSrc)
				x.oSrc = x.src;
			x.src = a[i + 2];
		}
}

function trim(s)
{
	var l=0; var r=s.length -1;
	while(l < s.length && s[l] == ' ')
	{	l++; }
	while(r > l && s[r] == ' ')
	{	r-=1;	}
	return s.substring(l, r+1);
}

function ltrim(s)
{
	var l=0;
	while(l < s.length && s[l] == ' ')
	{	l++; }
	return s.substring(l, s.length);
}

function rtrim(s)
{
	var r=s.length -1;
	while(r > 0 && s[r] == ' ')
	{	r-=1;	}
	return s.substring(0, r+1);
}

function containsCharsOnly(val,chars) {
    for (var inx = 0; inx < val.length; inx++) {
       if (chars.indexOf(val.charAt(inx)) == -1) {
           return false;
       }
    }
    return true;
}

function isNumber(val) {
    var chars = "0123456789.-";
    return containsCharsOnly(val,chars);
}

function replaceStr(str, find, replace)
{
    var pos = 0;
    pos = str.indexOf(find);

    while(pos != -1)
    {
        pre_str = str.substring(0, pos);
        post_str = str.substring(pos + find.length, str.length);
        str = pre_str + replace + post_str;
        pos = str.indexOf(find);
    } // end while
    return str;
}



/**
 * 40. HashMap
 */
var HashMap = function()
{

    var mapVal  = {};    // private
    var pos     = new Array();

    this.get = function( key )
    {
        return mapVal[ key ];
    }

    this.getPos = function( n )
    {
        return mapVal[ pos[n] ];
    }

    this.remove = function( n )
    {
        var ary = new Array();
        for( var i=0; i<map.size(); i++ )
        {
            if( i != n )
            {
                ary.push( pos[i] );
            }
        }
        pos = ary;
    }

    this.put = function( key, val )
    {
        mapVal[key] = val;
        pos.push( key );
    }

    this.size = function()
    {
        return pos.length;
    }
}

