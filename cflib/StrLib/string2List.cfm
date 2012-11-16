function string2List(s){
	var i=0;
	var l="";
	var delim=",";
	
	if(arrayLen(arguments) gt 2) delim = arguments[3];
	
	for(i=1;i lte Len(s);i=i+1) l = listAppend(l,mid(s,i,1),delim);

	return l;
}