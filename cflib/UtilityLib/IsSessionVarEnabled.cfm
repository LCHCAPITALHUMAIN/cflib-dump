function IsSessionVarEnabled() {
	var foo = "";
	try {
		foo = session.urltoken;
		return true;
	} catch("Any" e) {
		return false;
	}
}