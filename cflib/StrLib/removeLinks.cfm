function removeLinks(str) {
	str = reReplace(str, "<[[:space:]]*[aA].*?>(.*?)<[[:space:]]*/[[:space:]]*a[[:space:]]*>","\1","all");
	return str;	
}