function toggleValue(variable,value1,value2){
	//make a struct in which the value is the opposite of the key
	var toggler = structNew();
	toggler[value1] = value2;
	toggler[value2] = value1;
	//return whichever value is not the current value
	return toggler[variable];
}