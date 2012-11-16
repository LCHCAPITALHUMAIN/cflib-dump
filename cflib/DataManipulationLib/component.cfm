function component(path){
	var sPath=Arguments.path;var oProxy="";var oFile="";var sType="";
	if( arrayLen(Arguments) gt 1 ) sType = lCase(Arguments[2]);

	// determine a default type	
	if( len(sType) eq 0 ){
		if( (sPath DOES NOT CONTAIN ".") OR ((sPath CONTAINS ".") AND (sPath DOES NOT CONTAIN "/") AND (sPath DOES NOT CONTAIN "\")) ) sType = "component";
		else sType = "relative";
	}
	
	// create the component
	switch( left(sType,1) ){
		case "c":
			return createObject("component", sPath);
		break;

		default:
			if( left(sType, 1) neq "a" ) sPath = expandPath(sPath);
			oProxy = createObject("java", "coldfusion.runtime.TemplateProxy");
			oFile = createObject("java", "java.io.File");
			oFile.init(sPath);
			return oProxy.resolveFile(getPageContext(), oFile);
		break;
	}
}