function ArrayContainsNoCase(arrayToSearch,valueToFind){
	var arrayList = "";

	arrayList = ArrayToList(arrayToSearch);
	return ListContainsNoCase(arrayList,valueToFind);				
}