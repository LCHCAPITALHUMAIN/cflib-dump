function ListDiffDup(list1,list2)	{
  var delimiters	= ",";
  var listReturn = "";
  
  // Use two temporary lists.
  var temp1 = list1;
  var temp2 = list2;
  
  var i = 1;
  var pos = 1;

  // default list delimiter to a comma unless otherwise specified
  if (arrayLen(arguments) gte 3){
    delimiters	= arguments[3];
  }


	// Loop over the first list, eliminate all duplicate elements from the temp2 list.
  for (i=1; i lte ListLen(list1,delimiters); i=i+1) {
  	pos = ListFindNoCase(temp2,ListGetAt(list1,i,delimiters),delimiters);
	if (pos neq 0) {
		temp2 = ListDeleteAt(temp2,pos,delimiters);
	}
  }

	// Loop over the second list, eliminate all duplicate elements from the temp1 list.
  for (i=1; i lte ListLen(list2,delimiters); i=i+1) {
  	pos = ListFindNoCase(temp1,ListGetAt(list2,i,delimiters),delimiters);
	if (pos neq 0) {
		temp1 = ListDeleteAt(temp1,pos,delimiters);
	}
  }

  // Append all distinct elements from the first list to the return list
  for (i=1; i lte ListLen(temp1,delimiters); i=i+1) {
  	listReturn = ListAppend(listReturn,ListGetAt(temp1,i,delimiters),delimiters);
  }
		
  // Append all distinct elements from the second list to the return list.
  for (i=1; i lte ListLen(temp2,delimiters); i=i+1) {
  	listReturn = ListAppend(listReturn,ListGetAt(temp2,i,delimiters),delimiters);
  }

  return listReturn;
}