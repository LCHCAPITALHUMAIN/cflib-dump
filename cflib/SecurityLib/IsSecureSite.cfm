function IsSecureSite() {
	if(arrayLen(arguments)) localServers = arguments[1]; 
	if(cgi.server_port_secure OR listFindNoCase(localServers, cgi.server_name)) return true;
	else return false;
}