function getSessionList(appname){
	var obj = CreateObject("java","coldfusion.runtime.SessionTracker");
	return obj.getSessionCollection(appname);
}