function countTrueBoolKeysInStruct(strc){
	var x = 0;
	var i = 0;
	for(i in strc) {
		if (isBoolean(strc[i]) && strc[i]){
			x++;
		}
	};
	return x;
};