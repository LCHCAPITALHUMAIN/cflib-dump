function stripAnchors(str) {
	var temp = reReplaceNoCase(str,"<[[:space:]]*a[[:space:]]+[^>]*>","","all");
	return reReplaceNoCase(temp,"<[[:space:]]*/a[[:space:]]*>","","all");
}