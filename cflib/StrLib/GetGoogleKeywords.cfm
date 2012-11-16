function getGoogleKeywords(referer) {
	
	var Keywords='';
	var StartPos=0;
	var EndString='';
	
	if (referer contains 'google.com') {
		StartPos=ReFindNoCase('q=.',referer);
	
		if (StartPos GT 0) {
			EndString=mid(referer,StartPos+2,Len(referer));
			Keywords=ReReplaceNoCase(EndString,'&.*','','ALL');
			Keywords=URLDecode(Keywords);
			}
		
		return Keywords;
	}
	else {
		return '';
	}
	
	
	
}