function averageWithoutZeros(data) {
	var counter = arrayLen(data);
	
	//remove zeros
	for(;counter gte 1;counter=counter-1) {
		if(data[counter] lt 1) arrayDeleteAt(data,counter);
	} 

	if(arrayLen(data)) return arrayAvg(data);
	else return 0;
}