function GetMetaHeaders(str) {
	var matchStruct = structNew();
	var name = "";
	var content = "";
	var results = arrayNew(1);
	var pos = 1;
	var regex = "<meta[[:space:]]*(name|http-equiv)[[:space:]]*=[[:space:]]*(""|')([^""]*)(""|')[[:space:]]*content=(""|')([^""]*)(""|')[[:space:]]*/{0,1}>"; 	
	
	matchStruct = REFindNoCase(regex,str,pos,1);
	while(matchStruct.pos[1]) {
		results[arrayLen(results)+1] = structNew();
		results[arrayLen(results)][ Mid(str,matchStruct.pos[2],matchStruct.len[2])] = Mid(str,matchStruct.pos[4],matchStruct.len[4]);
		results[arrayLen(results)].content = Mid(str,matchStruct.pos[7],matchStruct.len[7]);
		pos = matchStruct.pos[6] + matchStruct.len[6] + 1;
		matchStruct = REFindNoCase(regex,str,pos,1);
	}
	return results;
}