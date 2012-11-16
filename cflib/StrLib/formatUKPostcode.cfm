function formatUKPostcode(str){
	var strPostcode = ucase(trim(replaceNoCase(str,' ','','all')));
	return left(strPostcode,len(strPostcode)-3) & ' ' & right(strPostcode,3);
}