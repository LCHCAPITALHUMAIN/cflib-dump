function getApplicationName() {
	var name = "";
	var appScopeTracker = createObject("java", "coldfusion.runtime.ApplicationScopeTracker");
	var keys = appScopeTracker.getApplicationKeys();
	var app = 0;
	var appName = 0;
	
	while(keys.hasNext()) {
		appName = keys.next();
		app = appScopeTracker.getApplicationScope(appName);
		if(app.equals( application ) ) return app.getName();
	}
	return "";
}