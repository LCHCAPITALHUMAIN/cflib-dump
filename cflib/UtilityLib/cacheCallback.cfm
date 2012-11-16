function cacheCallback(cacheKey, duration, callback) {
	var data = "";
	//optional argument: forceRefresh
	if (arrayLen(arguments) eq 4){arguments.forceRefresh=arguments[4];}else{arguments.forceRefresh=false;}
	//clean cachekey of periods that will cause errors
	arguments.cacheKey = replace(arguments.cacheKey, ".", "_", "ALL");
	//ensure cache structure is setup
	if (not structKeyExists(application, "CCBCache")){application.CCBCache = StructNew();}
	if (not structKeyExists(application.CCBCache, arguments.cacheKey)){application.CCBCache[arguments.cacheKey] = StructNew();}
	if (not structKeyExists(application.CCBCache[arguments.cacheKey], "timeout")){application.CCBCache[arguments.cacheKey].timeout = dateAdd('yyyy',-10,now());}
	if (not structKeyExists(application.CCBCache[arguments.cacheKey], "data")){application.CCBCache[arguments.cacheKey].data = '';}
	//update cache if expired
	if (arguments.forceRefresh or dateCompare(now(), application.CCBCache[arguments.cacheKey].timeout) eq 1){
		data = arguments.callback();
		application.CCBCache[arguments.cacheKey].data = data;
		application.CCBCache[arguments.cacheKey].timeout = arguments.duration;
	}
	return application.CCBCache[arguments.cacheKey].data;
}