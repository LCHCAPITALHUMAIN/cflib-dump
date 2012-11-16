function ListRemoveList(list1,list2)	{
  var delimiters	= ",";
  var removeall = false;
  var listReturn = list1;
  var position = 1;

  // default list delimiter to a comma unless otherwise specified
  if (arrayLen(arguments) gte 3) delimiters=arguments[3];

  // default removal pattern is remove one of each item in list2
  if (arrayLen(arguments) eq 4 and  arguments[4] eq "all") removeall=true;
  
  //checking list1
  for(position = 1; position LTE ListLen(list2,delimiters); position = position + 1) {
    value = ListGetAt(list2, position , delimiters );
	 
	if (removeall) {
   		while (ListFindNoCase(listReturn, value , delimiters ) NEQ 0)
	      	listReturn = ListDeleteAt(listReturn, ListFindNoCase(listReturn, value , delimiters ) , delimiters );
		}
	else {
			if (ListFindNoCase(listReturn, value , delimiters ) NEQ 0)
      		listReturn = ListDeleteAt(listReturn, ListFindNoCase(listReturn, value , delimiters ) , delimiters );
		}
    }
		
  return listReturn;
}