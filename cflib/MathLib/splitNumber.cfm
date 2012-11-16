public struct function splitNumber(required numeric number){
	var result = {};
	result.integer = listFirst(number, ".");
	if (listLen(number, ".") > 1){
		result.decimal = listRest(number, ".");
	}else{
		result.decimal = 0;
	}
	return result;
}