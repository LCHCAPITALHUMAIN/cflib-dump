function RESplit(str,regex) {
	var results = arrayNew(1);
	var test = REFind(regex,str,1,1);
	var pos = test.pos[1];
	var oldpos = 1;
	if(not pos) results[1] = str;
	while(pos gt 0) {
		arrayAppend(results,mid(str,oldpos,pos-oldpos));
		oldpos = pos+test.len[1];
		test = REFind(regex,str,oldpos+1,1);
		pos = test.pos[1];
	}
        //Thanks to Thomas Muck
        if(len(str) GT oldpos) arrayappend(results,right(str,len(str)-oldpos + 1));
	return results;
}