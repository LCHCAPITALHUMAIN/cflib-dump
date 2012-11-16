function midstring(string,from) {
	var start="";
	var end="";
	var lenstart="";
	var to=from;
	
	if(arrayLen(arguments) gte 3) to = arguments[3];
	
	start = refind(from,string);
	end = refind(to,string,len(from)+start);
	lenstart = len(from);
	return mid(string,start+lenstart,max(end-start-lenstart,0));
	
}