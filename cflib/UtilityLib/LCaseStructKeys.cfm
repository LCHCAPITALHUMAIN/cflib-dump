function LCaseStructKeys(str){
	var i = "";
	var tmp = {};
	for(i in str){
		if(isStruct(str[i])){
			str[i] = LCaseStructKeys(str[i]);
		}
		tmp[LCase(i)] = duplicate(str[i]);
	}
	return tmp;
}