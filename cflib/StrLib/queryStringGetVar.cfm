function queryStringGetVar(querystring, this_var_name){
	var re_found_struct = "";
	querystring = trim(querystring);
	
	re_found_struct = REFindNoCase("(^|[\?|&])#this_var_name#=([^\&]*)", querystring, 1, "true");
	// = re_found_struct.len & re_found_struct.pos
	
	if(arrayLen(re_found_struct.pos) gte 3) {
		if (re_found_struct.pos[3] GT 0) return urlDecode(mid(querystring, re_found_struct.pos[3], re_found_struct.len[3]));
		else return "";
	} else return "";
}