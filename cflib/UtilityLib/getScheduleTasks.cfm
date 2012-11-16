function getScheduledTasks(){
	var i = "";
	var j = "";
	var retquery = "";
	var alltasks = createobject("java","coldfusion.server.ServiceFactory").getCronService().listall();
	if (arraylen(alltasks )) {
		retquery = querynew(structkeylist(alltasks[1]));
		queryaddrow(retquery, arraylen(alltasks));
		for (i=1; i lte arraylen(alltasks); i = i+1){
			for (j in alltasks[i])
				querysetcell(retquery, j, alltasks[i][j]);
		}
	}
	else retquery = querynew( 'nothing' );
	return retquery;
}