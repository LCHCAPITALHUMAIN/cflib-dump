function isIPInRange(sIP,sIPREList) {
	var i = 1;
	var nREListCount=ListLen(sIPREList);
	
	for (i = 1; i LTE nREListCount; i = i+1) {
		if (REFind(ListGetAt(sIPREList,i),sIP)) return true;
	}
	return false;
}