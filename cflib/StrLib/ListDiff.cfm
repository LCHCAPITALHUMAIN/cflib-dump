function ListDiff(list1,list2)	{
  var delimiters	= ",";
  var listReturn = "";
  var position = 1;

  // default list delimiter to a comma unless otherwise specified	
  if (arrayLen(arguments) gte 3){
    delimiters	= arguments[3];
  }
		
  //checking list1
  for(position = 1; position LTE ListLen(list1,delimiters); position = position + 1) {
    value = ListGetAt(list1, position , delimiters );
    if (ListFindNoCase(list2, value , delimiters ) EQ 0)
      listReturn = ListAppend(listReturn, value , delimiters );
    }
		
    //checking list2
    for(position = 1; position LTE ListLen(list2,delimiters); position = position + 1)	{
      value = ListGetAt(list2, position , delimiters );
      if (ListFindNoCase(list1, value , delimiters ) EQ 0)
        listReturn = ListAppend(listReturn, value , delimiters );
  }
  return listReturn;
}