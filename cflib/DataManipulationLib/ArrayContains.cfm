function ArrayContains(arrayToSearch,valueToFind){
	var arrayList = "";

	arrayList = ArrayToList(arrayToSearch);
	return ListContains(arrayList,valueToFind);				
}