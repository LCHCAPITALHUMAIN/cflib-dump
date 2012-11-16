function FullQualUrl(mytext,RelPage,FQHost) {
	var tmp=rereplacenocase(mytext,"(href\=){1}([""|'| ]*)(/)*(#RelPage#){1}","\1\2#FQHost#/#RelPage#","ALL");
	return tmp;
}