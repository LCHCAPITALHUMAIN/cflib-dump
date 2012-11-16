function fadeList(startcolor,endcolor,steps) {
	var outlist=startcolor;
	var decr=0;
	var decg=0;
	var decb=0;
	var newr=0;
	var newg=0;
	var newb=0;
	var ix = 1;

	steps=steps-1;
	decr=(inputbasen(left(startcolor,2),16)-inputbasen(left(endcolor,2),16))/steps;
	decg=(inputbasen(mid(startcolor,3,2),16)-inputbasen(mid(endcolor,3,2),16))/steps;
	decb=(inputbasen(right(startcolor,2),16)-inputbasen(right(endcolor,2),16))/steps;
	for (ix=1;ix lte steps;ix=ix+1) {
		newr=formatbasen(int(inputbasen(left(startcolor,2),16)-(ix*decr)),16);
		if (len(newr) eq 1) {newr="0"&newr;}
		newg=formatbasen(int(inputbasen(mid(startcolor,3,2),16)-(ix*decg)),16);
		if (len(newg) eq 1) {newg="0"&newg;}
		newb=formatbasen(int(inputbasen(right(startcolor,2),16)-(ix*decb)),16);
		if (len(newb) eq 1) {newb="0"&newb;}
		outlist=outlist&","&newr&newg&newb;
	}
	return outlist & "," & endcolor;
}