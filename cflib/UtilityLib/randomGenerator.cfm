function randomGenerator(count,start,end) {
	var myArray = arrayNew(1);
	var i = 0;
	var ran = 0;
			
	if((arguments.end-arguments.start+1) lt arguments.count) arguments.count = arguments.end-arguments.start+1;
	for(;arrayLen(myArray) lt arguments.count; i=i+1) {
		ran=randRange(arguments.start,arguments.end);
		//before appending random number to array,check the number in array
		if(not listFind(arrayToList(myArray),ran)) 
			arrayAppend(myArray,ran);
	}
	return myArray;
}