function createOrderedList(st,end) {
	var theList="";
	var delim=",";
	var step=1;

	// 3rd argument sets the step increment
	if(arraylen(arguments) gte 3) step=arguments[3];

	//4th argument sets the delim
	if(arraylen(arguments) eq 4) delim=arguments[4];

	if(st gte end) for(i = st;i gte end;i=i-step) theList=listappend(theList,i,delim);		
	else for(i = st;i lte end;i=i+step) theList=listappend(theList,i,delim);		

	return theList;
}