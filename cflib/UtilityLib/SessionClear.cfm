function sessionClear(){
	var dont_clear = "sessionid,cfid,cftoken,jsessionid,urltoken";
	var key = "";
	for(key in session) {
		if(not listFindNoCase(dont_clear, key)) structDelete(session,key);
	}
}