function camelToSpace(str) {
	var rtnStr=lcase(reReplace(arguments.str,"([A-Z])([a-z])","&nbsp;\1\2","ALL"));
	if (arrayLen(arguments) GT 1 AND arguments[2] EQ true) {
		rtnStr=reReplace(arguments.str,"([a-z])([A-Z])","\1&nbsp;\2","ALL");
		rtnStr=uCase(left(rtnStr,1)) & right(rtnStr,len(rtnStr)-1);
	}
return trim(rtnStr);
}