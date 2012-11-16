function arraySplice(array, index, howMany) {
	var i = 0;
	
	// If negative, will begin that many elements from the end	
	if (index <= 0){
		index = arrayLen(array) + (index + 1);
	}

	// get rid of however many they specify
	for (i=1; i LE howMany; i++){
		if (index LE arrayLen(array)){
			arrayDeleteAt(array, index);
		}
	}

	for (i=4; i LE arrayLen(arguments); i++){
		if (index GE arrayLen(array)){
			arrayAppend(array, arguments[i]);
			index++;
		}else{
			arrayInsertAt(array, index+(i-4), arguments[i]);
		}
	}

	return array;
}