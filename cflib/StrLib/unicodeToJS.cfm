function unicodeToJS(str){
	str = JSStringFormat(str);
	return ReReplaceNoCase(str,"&##([a-z0-9]{3});","\\1","all");
}