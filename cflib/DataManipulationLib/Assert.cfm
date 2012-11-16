function assert(assertion) {
	var result = 1;
	var loopvar1 = 0;
	var loopvar2 = 0;
	var variableassertion = "";
	var varsection = "";
	var varname = "";
	var varalias = "";
	var assertionsection = "";
	var anassertion = "";
	var assertnow = "";
	var doBreak = false;
	
	for(loopvar1 = 1; loopvar1 LTE listlen(assertion, "!"); loopvar1 = incrementvalue(loopvar1)) {
		variableassertion = listgetat(assertion, loopvar1, "!");
		varsection = trim(gettoken(variableassertion, 1, ":"));
		varname = trim(listfirst(varsection, " "));
		varalias = trim(listlast(varsection, " "));
		assertionsection = trim(gettoken(variableassertion, 2, ":"));
		
		for(loopvar2 = 1; loopvar2 LTE listlen(assertionsection, ";"); loopvar2 = incrementvalue(loopvar2)) {
			anassertion = listgetat(assertionsection, loopvar2, ";");
			
			if(not isdefined(varname)){
				result = 0;
				doBreak = true;
				break;
			} else {
				assertnow = replacenocase(anassertion, "|#varalias#|", varname, "ALL");
				
				if(not(evaluate(trim(assertnow)))){
					result = 0;
					doBreak = true;
					break;
				}
			}
		}
		
		if(doBreak){
			break;
		}
	}
	
	return result;
}