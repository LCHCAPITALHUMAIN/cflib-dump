function GetRootPath() {
	var cNested = listLen(getBaseTemplatePath(),"\") - listLen(getCurrentTemplatePath(),"\");
	var	appRootDir = cgi.script_name;
	var i = 0;
	
	for (i=0;i lte cNested;i=incrementValue(i)) {
		appRootDir = listDeleteAt(appRootDir,listLen(appRootDir, "/"),"/");
	}
	appRootDir = appRootDir & "/";
	return appRootDir;
}