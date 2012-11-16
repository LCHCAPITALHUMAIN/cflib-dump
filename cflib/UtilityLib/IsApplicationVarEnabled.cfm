function IsApplicationVarEnabled() {
	var foo = "";
	try {
		foo = application.applicationName;
		return true;
	} catch("Any" e) {
		return false;
	}
}