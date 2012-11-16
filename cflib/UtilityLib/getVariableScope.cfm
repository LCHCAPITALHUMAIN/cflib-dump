function getVariableScope(locVar) {
	var scopeList = "VARIABLES,CGI,FILE,URL,FORM,COOKIE,CLIENT,APPLICATION,SESSION,SERVER,REQUEST,CFHTTP,CALLER,ATTRIBUTES,ERROR,CFCATCH,CFFTP";
	var listEle = "";
	var cnt = 1;

	while (cnt LTE ListLen(scopeList)) {
		// Get current list element
		listEle = ListGetAt(scopeList, cnt);

		// Check for existence within current scope.  CGI is a special case
		if (listEle is "CGI" AND structKeyExists(cgi, locVar)) {
				return listEle;
		} else if (not listEle is "CGI" AND IsDefined("#listEle#.#locVar#")) {
				return listEle;
		}

		// Increment counter
		cnt = cnt + 1;
	}

}