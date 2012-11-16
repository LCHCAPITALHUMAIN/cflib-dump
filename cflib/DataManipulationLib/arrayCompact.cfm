function arrayCompact(arr) {
	var delim="|";
	if(arraylen(arguments) gt 1) {delim=arguments[2];}
	return listtoarray(arraytolist(arr,delim),delim);
}