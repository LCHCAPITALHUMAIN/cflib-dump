function ccEscape(ccnum){
	if(len(ccnum) lte 4) return "****";
	return "#RepeatString("*",val(Len(ccnum)-4))##Right(ccnum,4)#";
}