function strXOR(str1,str2) {
	var theXOR="";
	var minLen=min(len(str1),len(str2)); 
	var i=1;
	
	for (; i le minLen; i=i+1 ) {
		theXOR = theXOR & rJustify(formatbaseN(bitXor(asc(mid(str1,i,1)),asc(mid(str2,i,1))),"16"),2);
	}
	
	theXOR=binaryDecode(replaceNoCase(theXOR," ","0","all"),"hex");
	return theXOR;
}