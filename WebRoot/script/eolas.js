function getFlash(url, wid, hei){
	document.write("<object classid='clsid:D27CDB6E-AE6D-11cf-96B8-444553540000' " +
			"codebase='http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,0,0' " +
			"width="+wid+" height="+hei+"><param name='movie' value='"+url+"'><param name='quality' value='high'>" +
			"<param name='allowScriptAccess' value='sameDomain'><param name='wmode' value=transparent>" +
			"<embed src='"+url+"' quality='high' pluginspage='http://www.macromedia.com/go/getflashplayer' type='application/x-shockwave-flash' width="+wid+" height="+hei+"></embed></object>");
}
