function isDatasource(nameToCheck) {
	//grab the datasourceService object
	var dsObj = createObject("Java","coldfusion.server.ServiceFactory");
	//check if the name is one of the datasources
	return structKeyExists(dsObj.datasourceService.getDatasources(),nameToCheck);
}