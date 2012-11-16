function isManipulated(){
	if (CGI.HTTP_REFERER eq "") return true;
	else if (REReplaceNoCase(REReplaceNoCase(CGI.HTTP_REFERER, ".*//", "","all"), "/.*", "","all")  neq CGI.HTTP_HOST) return true;
	else return false;
}