function createDestination(destname, channelId){
	var local = structNew();
	
	local.brokerClass = createObject('java','flex.messaging.MessageBroker');
	local.broker = local.brokerClass.getMessageBroker( javacast('null','') );
	local.service = local.broker.getService('message-service');
	local.destinations = local.service.getDestinations();
	
	//check if destination already exists. If it does just return it
	if (structKeyExists(local.destinations,arguments.destname)){ //check if destination already exist
		return local.destinations[arguments.destname];	
	}
	
	// Creates a ServiceAdapter instance and sets its id, sets if destination  is manageable
	local.destination = local.service.createDestination(arguments.destname);
	local.destination.createAdapter('cfgateway');
	
	local.configMap = createObject('java','flex.messaging.config.ConfigMap').init();
	local.configMap.addProperty('gatewayid',application.CFEventGatewayId);
	
	local.ss = createObject("java","flex.messaging.config.ServerSettings");
	local.ss.setAllowSubtopics(true); 
	local.ss.setSubtopicSeparator('.');
	local.ss.setDurable(false);
	
	local.destination.setServerSettings(ss);
	
	local.adapter = local.destination.getAdapter();
	
	//Initializes the adapter with the properties.
	local.adapter.initialize('cfgateway',configMap);
			
	local.destination.addChannel(arguments.channelId);
	
	//Starts the destination if its associated Service is started and if the destination is not already running. 
	local.destination.start();
	
	return local.destination;
}