function getDSNs() {
	var factory = createObject("java","coldfusion.server.ServiceFactory");
	return factory.getDataSourceService().getNames();
}