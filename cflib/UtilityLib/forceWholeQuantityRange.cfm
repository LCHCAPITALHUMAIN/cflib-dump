function forceWholeQuantityRange(argNum, argMin){
	var qnty = argNum;

	if(IsNumeric(argNum)){
		qnty = int(argNum);
	} else {
		qnty = argMin;
	}

	if(argNum LT argMin){
		qnty = argMin;
	} else if((arrayLen(arguments) gt 2) and (argNum GT arguments[3])){
		qnty = arguments[3];						
	}
	return qnty;
}